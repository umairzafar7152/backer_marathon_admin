import 'package:backer_marathon_admin/providers/price_table_provider.dart';
import 'package:backer_marathon_admin/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<PriceTableProvider>(
              create: (_) => PriceTableProvider()),
        ],
        child: MaterialApp(
          title: 'Backer Marathon',
          theme: ThemeData(
            fontFamily: 'Montserrat',
            backgroundColor: const Color(0xFFE5E5E5),
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ));
  }
}
