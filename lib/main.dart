import 'package:flutter/material.dart';
import 'package:flutter_chat_phone_number/features/app/splash/splash_screen.dart';
import 'package:flutter_chat_phone_number/features/app/theme/styles.dart';
import 'package:flutter_chat_phone_number/routes/on_generate_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Color.fromARGB(255, 17, 4, 4),
          dialogBackgroundColor: Colors.blue,
          appBarTheme: const AppBarTheme(color: Colors.blue),
        ),
        initialRoute: "/",
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) => SplashScreen(),
        });
  }
}
