import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';
import 'package:pf2/screens/personal_screen.dart';

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
        child: Card(
          margin: EdgeInsets.all(16),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Perfil personal', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                const SizedBox(height: 16),
                  Text('Nombre completo: ' + persona.getFullName),
                const SizedBox(height: 8),
                Text('Email: ' + persona.getEmail),  
                const SizedBox(height: 9),
                  Text('Fecha de nacimiento: ' + persona.birth.day.toString() + '/' + persona.birth.month.toString() + '/' + persona.birth.year.toString()),

                const SizedBox(height: 20,),
                  ElevatedButton(onPressed: () {Navigator.pushNamed(context, "/personal", arguments: persona); }, child: Text('Editar perfil')),
              ],
            ),
          ),
        ),
      )
    );
  }
}