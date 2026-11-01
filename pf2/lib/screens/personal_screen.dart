import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';

class PersonalScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  
  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController birthController;
  late TextEditingController passwordController;
  late Persona persona;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    persona = ModalRoute.of(context)!.settings.arguments as Persona;

    nameController = TextEditingController(
      text: persona.getName,
    );

    lastNameController = TextEditingController(
      text: persona.getLastName,
    );

    emailController = TextEditingController(
      text: persona.getEmail,
    );

    birthController = TextEditingController(
      text: "${persona.getBirth.day}/${persona.getBirth.month}/${persona.getBirth.year}",
    );

    passwordController = TextEditingController(
      text: persona.getPassword,
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
                  TextFormField(controller: nameController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Nombre Completo', border: OutlineInputBorder()),),

                const SizedBox(height: 16),
                  TextFormField(controller: lastNameController, decoration: const InputDecoration(labelText: 'Apellidos', border: OutlineInputBorder()),),

                const SizedBox(height: 16),
                  TextFormField(controller: emailController, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),),
                
                const SizedBox(height: 16),
                  TextFormField(controller: passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),),

                const SizedBox(height: 16),
                TextFormField(controller: birthController, 
                  readOnly: true, 
                  decoration: 
                  const InputDecoration(
                    labelText: 'Fecha de nacimiento', 
                    border: OutlineInputBorder(), 
                    suffixIcon: Icon(Icons.calendar_month)
                  ), 
                  onTap: () {
                    showDatePicker(context: context, initialDate: persona.getBirth, firstDate: DateTime(1900), lastDate: DateTime.now());
                  },
                ),

                const SizedBox(height: 20),
                  ElevatedButton(onPressed: () {Navigator.popAndPushNamed(context, "/");}, child: Text("Guardar y salir")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validarName(){
    if(nameController.text != null){
      return true;
    }
  }
}