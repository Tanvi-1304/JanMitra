import 'package:flutter/material.dart';
import '../core/enums.dart';
import '../widgets/auth_widgets.dart';
import 'login_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const JanMitraLogo(),
                const SizedBox(height: 48),
                Text(
                  'Continue as',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                RoleCard(
                  icon: Icons.person_outline,
                  title: 'Citizen',
                  subtitle: 'Login with Mobile Number',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen(role: UserRole.citizen),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),
                RoleCard(
                  icon: Icons.admin_panel_settings_outlined,
                  title: 'Official',
                  subtitle: 'Login with Official ID',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen(role: UserRole.official),
                      ),
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
