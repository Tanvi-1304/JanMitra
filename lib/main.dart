import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/role_selection_screen.dart';

void main() {
  runApp(const JanMitraApp());
}

class JanMitraApp extends StatelessWidget {
  const JanMitraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JanMitra',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode
          .system, // Dynamically inherits system brightness explicitly leveraging AppTheme
      home: const RoleSelectionScreen(),
    );
  }
}
