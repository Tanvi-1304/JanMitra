import 'package:flutter/material.dart';
import '../widgets/post_login_widgets.dart';
import '../widgets/auth_widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to JanMitra'),
        centerTitle: true,
        automaticallyImplyLeading:
            false, // Ensures users do not backtrack during onboarding execution
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Your Profile is Active',
                style: theme.textTheme.headlineLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'You have been successfully mapped to your civic ward based on system parameters.',
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Explicit WardCard rendering data correctly out-of-carousel
              const WardCard(
                nagarSevakName: 'Rajesh Patil',
                wardId: 'Ward 42 - Andheri East',
                phone: '+91 98765 43210',
              ),

              const Spacer(),

              PrimaryButton(
                text: 'Continue to Dashboard',
                onPressed: () {
                  // Mocks the concluding step routing to the core application ecosystem
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Dashboard Navigation Triggered!'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
