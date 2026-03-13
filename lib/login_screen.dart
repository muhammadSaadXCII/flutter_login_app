import 'home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obsureField = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                _buildLogoContainer(),
                Expanded(child: _buildLoginContainer()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoContainer() {
    return Container(
      width: 75,
      height: 75,
      margin: EdgeInsets.only(top: 80, bottom: 80),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildLoginContainer() {
    return Form(
      key: _formKey,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Text("Login", style: textStyle(size: 35.7, bold: true)),
                    SizedBox(height: 5),
                    Text(
                      "Sign in to continue.",
                      style: textStyle(
                        size: 10.5,
                        bold: false,
                        cc: const Color.fromARGB(255, 102, 100, 100),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "USERNAME",
                      style: textStyle(
                        size: 11.3,
                        bold: false,
                        cc: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 270,
                    height: 55,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _usernameController,
                      style: textStyle(
                        cc: const Color.fromARGB(255, 241, 241, 241),
                        bold: false,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        suffixIcon: Icon(Icons.mail),
                        hintStyle: textStyle(
                          size: 12.1,
                          bold: false,
                        ).copyWith(letterSpacing: 2, fontSize: 13.1),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 175, 172, 172),
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle,
                        errorBorder: borderStyle,
                        focusedErrorBorder: borderStyle,
                      ),
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Please enter Email";
                        }
                        final emailRegex = RegExp(
                          r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                        );
                        if (!emailRegex.hasMatch(v)) {
                          return "Please enter a valid Email";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "PASSWORD",
                      style: textStyle(
                        size: 11.3,
                        bold: false,
                        cc: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 270,
                    height: 55,
                    child: TextFormField(
                      obscureText: _obsureField,
                      controller: _passwordController,
                      style: textStyle(
                        cc: const Color.fromARGB(255, 241, 241, 241),
                        bold: false,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obsureField = !_obsureField;
                            });
                          },
                          icon: Icon(
                            (_obsureField)
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        hintStyle: textStyle(
                          size: 12.1,
                          bold: false,
                        ).copyWith(letterSpacing: 2, fontSize: 13.1),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 175, 172, 172),
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle,
                        errorBorder: borderStyle,
                        focusedErrorBorder: borderStyle,
                      ),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Please enter Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: 270,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: textStyle(cc: Colors.white, bold: true),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      "Forgot Password?",
                      style: textStyle(
                        size: 10.5,
                        bold: false,
                        cc: const Color.fromARGB(255, 102, 100, 100),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle({
    double? size,
    bool bold = true,
    Color cc = Colors.black,
  }) {
    return TextStyle(
      color: cc,
      fontSize: (size != null) ? size : null,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  }

  final borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
  );
}
