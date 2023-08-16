import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text("Ana Sayfa")
        ],
      ),
      body: const Center(
        child: Text("Merhaba :)" ,style: TextStyle(fontSize: 26),),
      ),
    );
  }
}