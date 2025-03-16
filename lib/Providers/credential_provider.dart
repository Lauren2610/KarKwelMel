import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/HomeScreen.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/Navbar.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/RegisterPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CredentialProvider extends ChangeNotifier {
  bool isDisposed = false;
  bool isLoading = false;
  bool resend = false;
  Future<void> signUpUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    isLoading = true;
    final supabase = Supabase.instance.client;
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      print(response);
      isLoading = false;
      safeChangeNotifier();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Thanks! Check your email to confirm your account."),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => VerifyEmailPage()),
      );
      safeChangeNotifier();
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: check your password or connection")),
      );
      isLoading = false;
      resend = true;
      safeChangeNotifier();
    }
  }

  Future<void> loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    print(email);
    print(password);
    isLoading = true;
    safeChangeNotifier();
    final supabase = Supabase.instance.client;
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      print(response);
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Navbar()),
      );

      safeChangeNotifier();
    } on AuthException catch (e) {
      print(e);
      handleEmailNotConfirmed(e, email, context);
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: check your password or connection")),
      );
      safeChangeNotifier();
    }
  }

  Future<void> signOutUser() async {
    isLoading = true;
    safeChangeNotifier();
    final supabase = Supabase.instance.client;
    try {
      await Supabase.instance.client.auth.signOut();
      print("User signed out");

      isLoading = false;
    } catch (e) {
      print(e);
    }
  }

  /// Resend confirmation email if user is not confirmed
  Future<void> resendConfirmationEmail(
    String email,
    BuildContext context,
  ) async {
    final supabase = Supabase.instance.client;
    try {
      await supabase.auth.resend(type: OtpType.signup, email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Confirmation email resent to $email. Check your inbox.",
          ),
        ),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Unable to resend confirmation email")),
      );
    }
  }

  /// Handles "email_not_confirmed" error
  void handleEmailNotConfirmed(
    AuthException e,
    String email,
    BuildContext context,
  ) {
    if (e.message.contains("Email not confirmed")) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Your email is not confirmed. Resending confirmation email...",
          ),
        ),
      );
      resendConfirmationEmail(email, context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: check your password or connection")),
      );
    }
  }

  void safeChangeNotifier() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
