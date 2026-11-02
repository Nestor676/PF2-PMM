import 'package:flutter/material.dart';


class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  List<String> tareas = ["Proyecto 1","Proyecto 2","Proyecto 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget Showcase"),),
      body: ListView(
        children:  [
          const Padding(padding: EdgeInsets.all(16), child: Text("Lista de tareas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          ListView.builder(
            shrinkWrap: true, // se adapta a la altura del contenido
            physics: NeverScrollableScrollPhysics(), // desactiva el movimiento independiente de la lista
            itemCount: tareas.length, 
            itemBuilder: (context, index){
              return Dismissible(
                key: ValueKey(tareas[index]), 
                onDismissed: (direction){
                  setState(() {
                    tareas.removeAt(index);
                  });
                }, 
              child: ListTile(title: Text(tareas[index]),));
            }),
          const Padding(padding: EdgeInsets.all(16), child: Text("Lenguajes de programacion", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          ExpansionTile(title: Text("Java"), children: [Text("Orientado a objetos")],),
          ExpansionTile(title: Text("Dart"), children: [Text("Se usa junto flutter")],),
        ],
      ),
    );
  }
}