import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/user.dart';
import './login_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isPasswordVisible = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserStore userStore = Provider.of<UserStore>(context);

    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Email is required';
      }

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

      final mobileRegExp = RegExp(r'^\+?[0-9]{8,}$');

      if (!mobileRegExp.hasMatch(value)) {
        return 'Invalid mobile number';
      }

      return null;
    }

    String? validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Password is required';
      }

      if (value.length < 6) {
        return 'Password must be 6 characters or more';
      }

      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
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
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: !isPasswordVisible,
              validator: validatePassword,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                String email = emailController.text;
                String mobile = mobileController.text;
                String password = passwordController.text;

                if (validatePassword(email) != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Invalid email Id'),
                        content: Text('Please enter a valid email'),
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
                } else if (validatePassword(mobile) != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Invalid mobile number'),
                        content: Text('Please enter a valid mobile number'),
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
                } else if (validatePassword(password) != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Password is weak'),
                        content: Text(
                            'Please enter a valid strong 6 or more char password'),
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
                } else if (validateEmail(email) == null &&
                    validateMobile(mobile) == null &&
                    validatePassword(password) == null) {
                  userStore.register(name, email, mobile, password);

                  // Clear the text fields
                  nameController.clear();
                  emailController.clear();
                  mobileController.clear();
                  passwordController.clear();

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
