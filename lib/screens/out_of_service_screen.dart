import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import 'role_selection_screen.dart';

class OutOfServiceScreen extends StatelessWidget {
  const OutOfServiceScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.wrong_location_outlined,
                  size: 80,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(height: 32),
                Text(
                  'Out of Service Area',
                  style: theme.textTheme.headlineLarge?.copyWith(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'JanMitra is currently not active in your geological boundary. We are expanding rapidly to include more districts soon!',
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                PrimaryButton(
                  text: 'Return to Start',
                  backgroundColor: theme.colorScheme.primary,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoleSelectionScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
