import 'package:flutter/material.dart';
import '../core/enums.dart';
import '../widgets/auth_widgets.dart';
import 'ward_detection_screen.dart';

enum LoginUiState { idle, loading, error, interactionRequired }

class LoginScreen extends StatefulWidget {
  final UserRole role;

  const LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginUiState _currentState = LoginUiState.idle;

  void _onPrimaryAction() async {
    setState(() {
      _currentState = LoginUiState.loading;
    });

    // Mock an event delay for visual confirmation of "processing"
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      if (widget.role == UserRole.citizen) {
        // Event Success: Transition to interaction required for OTP
        setState(() {
          _currentState = LoginUiState.interactionRequired;
        });
      } else {
        // Event Success for Official: proceed identically since OTP is not scoped
        _navigateToWardDetection();
      }
    }
  }

  void _simulateError() {
    setState(() {
      _currentState = LoginUiState.error;
    });
  }

  void _navigateToWardDetection() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WardDetectionScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isCitizen = widget.role == UserRole.citizen;
    final theme = Theme.of(context);

    // Map the explicitly decoupled UI matrix variations
    final isLoading = _currentState == LoginUiState.loading;
    final isError = _currentState == LoginUiState.error;
    final isInteractionRequired =
        _currentState == LoginUiState.interactionRequired;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: theme.colorScheme.primary),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const JanMitraLogo(),
                const SizedBox(height: 48),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Error Block
                        if (isError) ...[
                          StatusMessage(
                            message: isCitizen
                                ? 'Invalid mobile number format. Please check your constraints.'
                                : 'Invalid credentials. Server rejects layout authentication.',
                            isError: true,
                          ),
                        ],

                        // Form Input Block
                        if (isCitizen) ...[
                          CustomTextField(
                            label: 'Mobile Number',
                            prefixIcon: Icons.phone_android,
                            prefixText: '+91 ',
                            keyboardType: TextInputType.phone,
                            enabled: !isLoading && !isInteractionRequired,
                          ),
                        ] else ...[
                          CustomTextField(
                            label: 'Official ID',
                            prefixIcon: Icons.badge_outlined,
                            enabled: !isLoading,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            label: 'Password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: true,
                            enabled: !isLoading,
                          ),
                        ],

                        const SizedBox(height: 24),

                        // Primary Actions Matrix Switcher
                        if (isLoading)
                          const LoadingButton()
                        else if (!isInteractionRequired)
                          PrimaryButton(
                            text: isCitizen ? 'Send OTP' : 'Login',
                            onPressed: _onPrimaryAction,
                          )
                        else if (isCitizen && isInteractionRequired) ...[
                          const Divider(),
                          const SizedBox(height: 24),
                          Text(
                            'Enter Verification Code',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          const OtpInputRow(),
                          const SizedBox(height: 24),
                          PrimaryButton(
                            text: 'Verify OTP',
                            onPressed: _navigateToWardDetection,
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () {
                              setState(() => _currentState = LoginUiState.idle);
                            },
                            child: const Text('Change Number'),
                          ),
                        ],

                        // Mock Testing Control (Dev Options Visual)
                        if (!isInteractionRequired && !isLoading) ...[
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: _simulateError,
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  theme.textTheme.bodyMedium?.color,
                            ),
                            child: const Text('Dev: Simulate Error Event'),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
