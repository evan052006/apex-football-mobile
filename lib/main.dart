import 'package:apex_football/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:apex_football/providers/uid_provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            CookieRequest request = CookieRequest();
            return request;
          },
        ),
        Provider(create: (_) {return UserProvider();})
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color.fromRGBO(33, 37, 41, 1),
            onPrimary: Colors.green,
            secondary: Colors.black,
            onSecondary: Colors.green,
            surface: Color.fromRGBO(33, 37, 41, 1),
            onSurface: Color(0xFF99A1A7),
            error: Colors.red,
            onError: Colors.redAccent,
          ),
          scaffoldBackgroundColor: Colors.white
        ),
        home: const LoginPage(),
      ),
    );


  }
}

