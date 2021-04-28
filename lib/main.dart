import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:isuzu/dashboard/personel.dart';
import 'package:isuzu/utils/splash.dart';

void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new MyApp());
  });
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: Personel(),
      
    );
  }
}