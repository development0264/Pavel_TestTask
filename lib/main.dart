import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task/screens/reservation_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Important!
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Task Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: ReservationScreen(),
    );
  }
}