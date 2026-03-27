import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import 'onboarding_screen.dart';

class ManualWardSelectionScreen extends StatelessWidget {
  const ManualWardSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Select Ward'), elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Manual Selection',
                style: theme.textTheme.headlineLarge?.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                'Search or select your ward from the designated drop down list manually.',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              CustomTextField(label: 'Search Ward', prefixIcon: Icons.search),
              const SizedBox(height: 24),

              // Mocking a predefined dropdown/list choice explicitly
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: theme.colorScheme.primary,
                  ),
                  title: const Text('Ward 42 - Andheri East'),
                  subtitle: const Text('Mumbai District'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: theme.colorScheme.primary,
                  ),
                  title: const Text('Ward 45 - Bandra West'),
                  subtitle: const Text('Mumbai District'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
