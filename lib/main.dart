import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liveasy_flutter_assignment/pages/enter_language_page.dart';
import 'package:liveasy_flutter_assignment/pages/profile_selection_page.dart';

import 'controllers/auth_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Liveasy Flutter Assignment (Phone Auth)',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E3B62)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const CheckUserLoggedInOrNot());
  }
}

class CheckUserLoggedInOrNot extends StatefulWidget {
  const CheckUserLoggedInOrNot({super.key});

  @override
  State<CheckUserLoggedInOrNot> createState() => _CheckUserLoggedInOrNotState();
}

class _CheckUserLoggedInOrNotState extends State<CheckUserLoggedInOrNot> {
  @override
  void initState() {
    AuthService.isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileSelectionPage(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const EnterLanguagePage(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
