import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/Providers/credential_provider.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/logister_parent.dart';
import 'package:karkwelmel_fullstack_flutter/TolyMoly/Constants.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback togglePage;

  const RegisterScreen({Key? key, required this.togglePage}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool? _isChecked = false;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CredentialProvider>(
      builder:
          (context, credentialProvider, child) => Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.only(top: 0.0, bottom: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(child: Image.asset('assets/images/logup.jpeg')),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: double.infinity, height: 10.0),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text("SignUp", style: klogintitle),
                          ),
                          SizedBox(width: double.infinity, height: 20.0),
                          Container(
                            child: Text(
                              "Sign up no matter what email you use just remember!",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          SizedBox(width: double.infinity, height: 30.0),
                          Container(
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(bottom: 5.0),
                          ),
                          TextField(
                            controller: _emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black54),
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            decoration: kinputdecoration.copyWith(
                              hintText: 'everyname@gmail.com',
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            child: Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(bottom: 5.0),
                          ),
                          TextField(
                            controller: _passwordcontroller,
                            textAlign: TextAlign.start,
                            obscureText: true,
                            style: TextStyle(color: Colors.black54),
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            decoration: kinputdecoration.copyWith(
                              hintText: 'min 8 chracters',
                            ),
                          ),
                          SizedBox(height: 30.0),
                          CheckboxListTile(
                            title: Text("Keep me login"),
                            value: _isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                          ),
                          SizedBox(height: 40.0),
                          GestureDetector(
                            child: Container(
                              width: 320.0,
                              height: 55.0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child:
                                    (credentialProvider.isLoading)
                                        ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                        : Text(
                                          "SingUp",
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: mainpinkcolor,
                              ),
                            ),
                            onTap: () {
                              credentialProvider.signUpUser(
                                _emailcontroller.text,
                                _passwordcontroller.text,
                                context,
                              );
                            },
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Forget password?",
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 50.0, top: 20.0),
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Already a member?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: widget.togglePage,
                                  child: Text(
                                    "Log IN!",
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late Timer _timer;
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _startCheckingEmailVerification();
  }

  void _startCheckingEmailVerification() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      await supabase.auth.refreshSession(); // Refresh user session
      final user = supabase.auth.currentUser;

      if (user != null && user.emailConfirmedAt != null) {
        _timer.cancel(); // Stop checking
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogisterParent()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: 250,
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Verify Your Email",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Please confirm your email. This page will redirect once your email is verified.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
