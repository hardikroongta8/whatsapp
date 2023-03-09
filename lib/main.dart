import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _){
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'WhatsApp-Clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            colorSchemeSeed: Colors.red.shade300,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.red.shade300,
          ),
          themeMode: themeProvider.themeMode,
          home: const Home(),
        );
      },
    );
  }
}
