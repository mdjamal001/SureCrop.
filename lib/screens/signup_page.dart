import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sure_crop/screens/terms_conditions.dart';

Color primaryCol = const Color(0xFF33A864);

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phoneno = '';
  String _password = '';
  String _role = 'Buyer';
  bool _isLoading = false;

  bool isChecked = false;

  Future<void> _signUp() async {
    final url = Uri.parse(
        'https://f544-2401-4900-6751-f32d-d35-fd4-1214-8c09.ngrok-free.app/signup'); // Replace with your server URL

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': _name,
          'phoneno': _phoneno,
          'password': _password,
          'role': _role,
        }),
      );

      if (response.statusCode == 201) {
        // Handle success
        final responseData = json.decode(response.body);
        print('User signed up successfully: $responseData');

        if (_role == 'Buyer') {
          Navigator.pushNamed(context, '/buyerHome');
        } else {
          Navigator.pushNamed(context, '/sellerHome');
        }
      } else {
        // Handle failure
        print('Failed to sign up: ${response.body}');
      }
    } catch (error) {
      print('Error during sign up: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF33A864)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone no.',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF33A864)),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phoneno = value!;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF33A864)),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF33A864)),
                    ),
                  ),
                  value: _role,
                  items: ['Buyer', 'Seller'].map((String role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _role = newValue!;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor:
                            Colors.green,
                        checkboxTheme: CheckboxThemeData(
                          fillColor: WidgetStateProperty.all(
                              primaryCol),
                        ),
                      ),
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Text(
                            "I agree to the",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
                              );
                            },
                            child: Text(
                              " Terms and Conditions",
                              style: TextStyle(
                                fontSize: 16,
                                color: primaryCol,

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                 ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() && isChecked) {
                            if (_role == 'Buyer') {
                              Navigator.pushNamed(context, '/buyerHome');
                            } else {
                              Navigator.pushNamed(context, '/sellerHome');
                            }
                          } else {
                            print("Fields not filled or checkbox not checked");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryCol,
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
