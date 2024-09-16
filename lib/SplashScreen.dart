import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Authentication BLoC/auth_bloc.dart';
import 'Authentication BLoC/auth_state.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushReplacementNamed(context, '/slider');
        }
      },
      child: Scaffold(
        body: Container(
          color: Colors.white, // Background color
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TRENDY',
                  style: TextStyle(
                    fontSize: 48, // Large font size
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8, // Add letter spacing to match the style
                  ),
                ),
                SizedBox(height: 8), // Spacing between texts
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'MODERN IN STYLE',
                      style: TextStyle(
                        fontSize: 14, // Smaller font size
                        letterSpacing: 2, // Spacing to match style
                      ),
                    ),
                    SizedBox(width: 10), // Spacing between English and Japanese texts
                    Text(
                      'モダンなスタイル', // Japanese text
                      style: TextStyle(
                        fontSize: 14, // Same smaller font size
                        letterSpacing: 2, // Same spacing
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
