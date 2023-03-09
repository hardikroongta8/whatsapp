import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
          ),
          title: const Text('WhatsApp'),
        ),
        body: const Center(child: Text('Hello there'),)
    );
  }
}