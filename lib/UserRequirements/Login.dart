import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      final isValid = _validateEmail(_emailController.text);
      setState(() {
        _isEmailValid = isValid;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9]+([.-]?[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})+$');
    return emailRegex.hasMatch(email);
  }

  void _handleLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog('Please fill in all fields.');
    } else if (!_isEmailValid) {
      _showErrorDialog('Invalid email address.');
    } else {
      // Successful login logic
      Navigator.pushReplacementNamed(context, '/profile'); // Navigate to ProfileScreen
    }
  }


  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('LOGIN', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        automaticallyImplyLeading: false, // Removes the back button
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signup'); // Navigate to Sign Up screen
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Email Input
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: UnderlineInputBorder(),
                  suffixIcon: _isEmailValid
                      ? Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                      : null,
                ),
              ),
              SizedBox(height: 20),
              // Password Input
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              // Login Button
              ElevatedButton(
                onPressed: _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // No rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Vertical padding for button height
                ),
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20),
              // Forgot Password
              Center(
                child: TextButton(
                  onPressed: () {
                    // Add forgot password functionality
                  },
                  child: Text('Forgotten your password?', style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(height: 30),
              // Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Facebook Button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add Facebook login functionality
                    },
                    icon: Icon(Icons.facebook, color: Colors.white),
                    label: Text('Facebook', style: TextStyle(color: Colors.white)), // Text color set to white
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3b5998), // Facebook color
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                  ),
                  // Google Button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add Google login functionality
                    },
                    icon: Icon(Icons.g_translate, color: Colors.red),
                    label: Text('Google', style: TextStyle(color: Colors.black)), // Text color set to black
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // White background
                      side: BorderSide(color: Colors.grey), // Border color
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
