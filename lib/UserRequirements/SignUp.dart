import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobilePhoneController = TextEditingController();

  bool _acceptPrivacyPolicy = false;
  bool _receiveNewsletter = false;

  // This function will be called when the user clicks the "Apply" button
  void _onApply() {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _mobilePhoneController.text.isEmpty) {
      _showErrorMessage("Please fill in all fields.");
      return;
    }

    if (!_acceptPrivacyPolicy) {
      _showErrorMessage("You must accept the privacy policy.");
      return;
    }

    // All validations pass, you can proceed with the signup logic here
    _showSuccessMessage("Signup successful!");
  }

  // Show an error message in a Snackbar
  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Show a success message in a Snackbar
  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'REGISTER',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true, // Enables the back button
        iconTheme: IconThemeData(color: Colors.black), // Makes the back icon black
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                  border: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black),
                  border: UnderlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.black),
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(color: Colors.black),
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _mobilePhoneController,
                decoration: InputDecoration(
                  labelText: 'Mobile Phone',
                  labelStyle: TextStyle(color: Colors.black),
                  border: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Checkbox(
                    value: _receiveNewsletter,
                    onChanged: (bool? value) {
                      setState(() {
                        _receiveNewsletter = value ?? false;
                      });
                    },
                  ),
                  Expanded(child: Text('I would like to receive the latest news from TRENDY by email')),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _acceptPrivacyPolicy,
                    onChanged: (bool? value) {
                      setState(() {
                        _acceptPrivacyPolicy = value ?? false;
                      });
                    },
                  ),
                  Expanded(child: Text('I have understood the information on the use of my personal data explained in the Privacy Policy')),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _onApply,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners like in the image
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Vertical padding for button height
                ),
                child: Center(
                  child: Text('Apply', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
