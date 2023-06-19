import 'package:android_app/components/add_post.dart';
import 'package:android_app/components/custom_card.dart';
import 'package:android_app/components/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDnGgDYSVMQMVU9S21ozcybFZ3QW2_gvcg",
        appId: "1:338599702948:android:50c34bf91589e347d05131",
        messagingSenderId: "338599702948",
        projectId: 'android-app-69050',
        storageBucket: 'android-app-69050.appspot.com'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const SplashScreen(),
    );
  }
}
