import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Persona persona = Persona(fullName: "Nestor Schierse Galey", email: "nestor@gmail.com", birth: DateTime(2007, 08, 14));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DevProfile M3'),),
      body: Center(
        child: Card(),
      )
    );
  }
}