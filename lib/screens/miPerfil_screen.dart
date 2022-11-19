import 'package:flutter/material.dart';
import 'package:sesion9/preferences/preferences.dart';

import '../widgets/index.dart';

class MiPerfilScreen extends StatelessWidget {
  const MiPerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        centerTitle: true,
      ),
      drawer: const CustomeDrawerSaraWidget(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                (Preferences.img == '')
                    ? CircleAvatar(
                        radius: 80,
                        child: Icon(Icons.photo),
                      )
                    : CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(Preferences.img),
                      ),
                Text('Nombre: ${Preferences.nombre}'),
                Text('Apellido: ${Preferences.apellidos}'),
                Text('Ciudad: ${Preferences.ciudad}'),
                Text('Pais: ${Preferences.pais}'),
                (Preferences.genero == 2)
                    ? Text('Genero: Femenino')
                    : Text('genenro: Masculino'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
