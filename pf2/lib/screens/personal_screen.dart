import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';

class PersonalScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController birthController;
  late Persona persona;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    persona = ModalRoute.of(context)!.settings.arguments as Persona;

    nameController = TextEditingController(
      text: persona.getFullName,
    );

    emailController = TextEditingController(
      text: persona.getEmail,
    );

    birthController = TextEditingController(
      text: "${persona.getBirth.day}/${persona.getBirth.month}/${persona.getBirth.year}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camps - Edit Profile'),),
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Modificar Perfil: ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                const SizedBox(height: 16),
                  TextFormField(controller: nameController, decoration: const InputDecoration(labelText: 'Nombre Completo', border: OutlineInputBorder()),),

                const SizedBox(height: 16),
                  TextFormField(controller: emailController, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),),
                
                const SizedBox(height: 16),
                  TextFormField(controller: birthController, decoration: const InputDecoration(labelText: 'Fecha de nacimiento', border: OutlineInputBorder()),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}