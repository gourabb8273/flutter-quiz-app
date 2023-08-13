import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/user.dart';
import './login_page.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }

      // Regular expression to validate email address
      final emailRegExp =
          RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

      if (!emailRegExp.hasMatch(value)) {
        return 'Invalid email address';
      }

      return null;
    }

    String? validateMobile(String? value) {
      if (value == null || value.isEmpty) {
        return 'Mobile number is required';
      }

      // Regular expression to validate mobile number
      final mobileRegExp = RegExp(r'^\+?[0-9]{8,}$');

      if (!mobileRegExp.hasMatch(value)) {
        return 'Invalid mobile number';
      }

      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: validateEmail,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: mobileController,
              decoration: InputDecoration(
                labelText: 'Mobile',
              ),
              validator: validateMobile,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                String email = emailController.text;
                String mobile = mobileController.text;
                String password = passwordController.text;

                if (validateEmail(email) == null &&
                    validateMobile(mobile) == null) {
                  userStore.register(name, email, mobile, password);

                  // Clear the text fields
                  nameController.clear();
                  emailController.clear();
                  mobileController.clear();
                  passwordController.clear();

                  // Show success popup
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Registration Successful'),
                        content: Text(
                            'Your account has been successfully registered. Please login now'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigate to login page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Show an error message for invalid email or mobile
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Invalid Input'),
                        content:
                            Text('Please enter valid email and mobile number.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
