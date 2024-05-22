import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mytagcall/screens/messagetype/message_type_screen_provider.dart';
import 'package:provider/provider.dart';

import 'calllog/call_log_screen_provider.dart';
import 'firebase_options.dart';
import 'screens/activationcode/activation_code_provider.dart';
import 'screens/backupcontacts/back_up_provider.dart';
import 'screens/messagealert/message_alert_screen_provider.dart';
import 'screens/register/register_provider.dart';
import 'splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProfileScreenProvider>(
              create: (context) => ProfileScreenProvider()),
          ChangeNotifierProvider<CallLogScreenProvider>(
              create: (context) => CallLogScreenProvider(context)),
          ChangeNotifierProvider<MessageAlertScreenProvider>(
              create: (context) => MessageAlertScreenProvider(context)),
          ChangeNotifierProvider<MessageTypeScreenProvider>(
              create: (context) => MessageTypeScreenProvider()),
          ChangeNotifierProvider<BackUpContactsScreenProvider>(
              create: (context) => BackUpContactsScreenProvider()),
          ChangeNotifierProvider<ActivationScreenProvider>(
              create: (context) => ActivationScreenProvider()),
        ],
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFFFECD42),
              ),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            title: 'MyTag Call',
            home: const SplashScreen(),
          );
        });
  }
}
