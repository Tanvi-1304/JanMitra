import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import 'onboarding_screen.dart';
import 'traveler_choice_screen.dart';
import 'manual_ward_selection_screen.dart';
import 'out_of_service_screen.dart';

class WardDetectionScreen extends StatefulWidget {
  const WardDetectionScreen({super.key});

  @override
  State<WardDetectionScreen> createState() => _WardDetectionScreenState();
}

class _WardDetectionScreenState extends State<WardDetectionScreen> {
  bool _isDetecting = true;

  @override
  void initState() {
    super.initState();
    // Simulate detecting boundaries for 2 seconds before showing Developer Options
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _isDetecting = false);
    });
  }

  void _routeTo(Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isDetecting) ...[
                  const CircularProgressIndicator(),
                  const SizedBox(height: 24),
                  Text(
                    'Detecting your Ward Location...',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Please wait while we cross-reference your geolocation boundaries.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                ] else ...[
                  Icon(
                    Icons.developer_board,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Ward Detection Matrix',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Dev Environment: Select an explicit simulation route to verify frontend architecture.',
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  PrimaryButton(
                    text: '1. Simulate Success (Onboarding)',
                    onPressed: () => _routeTo(const OnboardingScreen()),
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: '2. Simulate Traveler Profile',
                    backgroundColor: theme.colorScheme.secondary,
                    onPressed: () => _routeTo(const TravelerChoiceScreen()),
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: '3. Simulate Manual Selection',
                    backgroundColor: Colors.orange.shade700,
                    onPressed: () =>
                        _routeTo(const ManualWardSelectionScreen()),
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    text: '4. Simulate Out of Service',
                    backgroundColor: theme.colorScheme.error,
                    onPressed: () => _routeTo(const OutOfServiceScreen()),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
