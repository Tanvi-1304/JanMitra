import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import 'manual_ward_selection_screen.dart';

class TravelerChoiceScreen extends StatelessWidget {
  const TravelerChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.flight_takeoff,
                    size: 64,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Are you traveling?',
                  style: theme.textTheme.headlineLarge?.copyWith(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'We noticed your location differs from your registered details. Please select your active status.',
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                PrimaryButton(
                  text: 'I am a Traveler right now',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Switched to Traveler Mode UX'),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManualWardSelectionScreen(),
                      ),
                    );
                  },
                  child: const Text('No, update my Default Ward manually'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
