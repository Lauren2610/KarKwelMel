import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/Providers/credential_provider.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/Loginpage.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:karkwelmel_fullstack_flutter/Screens/logister_parent.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CredentialProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthCheck());
  }
}

class AuthCheck extends StatefulWidget {
  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  bool isLoading = true;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkUserSession();
  }

  Future<void> checkUserSession() async {
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      setState(() => isLoggedIn = true);
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return isLoggedIn ? Navbar() : LogisterParent();
  }
}
