import 'package:flutter/material.dart';
import 'package:pf2/models/Persona.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  
  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController birthController;
  late DateTime selectedBirth;
  late TextEditingController passwordController;
  late Persona persona;
  final _fromKey = GlobalKey<FormState>();
  bool inicializado = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if(inicializado) return;

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

    selectedBirth = persona.getBirth;

    inicializado = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camps - Edit Profile'),),
      body: Center(
        child: Form(
          key: _fromKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Modificar Perfil: ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                const SizedBox(height: 16),
                  TextFormField(controller: nameController,validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return 'El nombre es obligatorio';
                    }

                    return null;
                  } ,textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Nombre Completo', border: OutlineInputBorder()),),

                const SizedBox(height: 16),
                  TextFormField(controller: lastNameController,validator: (value) {
                    if(value == null || value.trim().isEmpty){
                      return 'Los apellidos son obligatorios';
                    }

                    return null;
                  } ,decoration: const InputDecoration(labelText: 'Apellidos', border: OutlineInputBorder()),),

                const SizedBox(height: 16),
                  TextFormField(controller: emailController,validator: (value) {
                    if(value == null || value.trim().isEmpty){
                      return 'El email es obligatorio';
                    }

                    return null;
                  }, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),),
                
                const SizedBox(height: 16),
                  TextFormField(controller: passwordController, validator: (value) {
                    if(value == null || value.trim().isEmpty){
                      return 'La constraseña es obligatoria';
                    }

                    return null;
                  }, obscureText: true, decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),),

                const SizedBox(height: 16),
                TextFormField(controller: birthController,
                  readOnly: true, 
                  decoration: 
                  const InputDecoration(
                    labelText: 'Fecha de nacimiento', 
                    border: OutlineInputBorder(), 
                    suffixIcon: Icon(Icons.calendar_month)
                  ), 
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(context: context, initialDate: selectedBirth, firstDate: DateTime(1900), lastDate: DateTime.now());

                    if(newDate != null){
                      setState(() {
                        selectedBirth = newDate;

                        birthController.text = "${newDate.day}/${newDate.month}/${newDate.year}";
                      });
                    }
                  },
                ),

                const SizedBox(height: 20),
                  ElevatedButton(onPressed: () {
                    if(_fromKey.currentState!.validate()){
                      persona.name = nameController.text;
                      persona.lastName = lastNameController.text;
                      persona.email = emailController.text;
                      persona.birth = selectedBirth;

                      Navigator.pop(context, persona);
                    }
                  }, child: Text("Guardar y salir")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}