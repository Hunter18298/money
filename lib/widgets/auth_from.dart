import 'dart:io';

import 'package:moneyexchange_app/pickers/user_image_picker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key, required this.submitFn, this.isLoading})
      : super(key: key);
  final isLoading;
  final void Function(
    String email,
    String usename,
    String password,
    File imageFile,
    bool isLogin,
  ) submitFn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isLogin = false;
  var _userImage;
  void _pickImage(File image) {
    _userImage = image;
  }

  void _trySubmit() {
    if (_userImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please Choose valid Image"),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!_isLogin)
                      UserImagePicker(
                        imagePickFn: _pickImage,
                      ),
                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return "Please use valid email address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _username,
                      decoration: InputDecoration(
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'Please enter your username';
                        } else {
                          return null;
                        }
                      },
                    ),
                    if (!_isLogin)
                      TextFormField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty || (value.length < 8)) {
                            return 'Please enter a validate password';
                          } else {
                            return null;
                          }
                        },
                      ),
                    SizedBox(height: 12.0),
                    if (widget.isLoading) CircularProgressIndicator(),
                    if (!widget.isLoading)
                      ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate() &&
                                _userImage != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                            if (_userImage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please Choose valid Image"),
                                  backgroundColor: Theme.of(context).errorColor,
                                ),
                              );
                            } else {
                              widget.submitFn(
                                _email.text.trim(),
                                _username.text.trim(),
                                _password.text.trim(),
                                _userImage,
                                _isLogin,
                              );
                            }
                          },
                          child: Text(_isLogin ? "Login" : "Sign up")),
                    if (!widget.isLoading)
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(_isLogin
                              ? "Create New Account"
                              : "I already have an account"))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
