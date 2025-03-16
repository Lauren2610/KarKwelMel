import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/Providers/credential_provider.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/HomeScreen.dart';
import 'package:karkwelmel_fullstack_flutter/TolyMoly/Constants.dart';
import 'package:provider/provider.dart';

import 'Navbar.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback togglePage;

  const LoginScreen({Key? key, required this.togglePage}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? _isChecked = false;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _checkIfUserLoggedIn();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  Future<void> _checkIfUserLoggedIn() async {
    final supabase = Supabase.instance.client;
    final session = supabase.auth.currentSession;

    if (session != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Navbar()),
      );
    }
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
                            child: Text("LogIn", style: klogintitle),
                          ),
                          SizedBox(width: double.infinity, height: 20.0),
                          Container(
                            child: Text(
                              "Sign in with your data to enter!",
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
                              child:
                                  (credentialProvider.isLoading)
                                      ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                      : Padding(
                                        padding: EdgeInsets.only(top: 20.0),
                                        child: Text(
                                          "Log In",
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
                              (_passwordcontroller.text.length < 8)
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Password Must Be more than 8 Chracters",
                                      ),
                                    ),
                                  )
                                  : credentialProvider.loginUser(
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
                                  "Not a member?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: widget.togglePage,
                                  child: Text(
                                    "Sign In!",
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
