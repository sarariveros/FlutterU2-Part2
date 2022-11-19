import 'package:flutter/material.dart';
import 'package:sesion9/preferences/preferences.dart';

import '../widgets/index.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuracion'),
        centerTitle: true,
      ),
      drawer: const CustomeDrawerSaraWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeTextFieldWidget(
              initialValue: Preferences.img,
              keyboard: TextInputType.text,
              hintText: 'Imagen',
              prefixIcon: Icon(Icons.photo),
              onChange: (value) {
                Preferences.img = value;
                setState(() {});
              },
            ),
            CustomeTextFieldWidget(
              initialValue: Preferences.nombre,
              keyboard: TextInputType.text,
              hintText: 'Nombre',
              prefixIcon: Icon(Icons.person),
              onChange: (value) {
                Preferences.nombre = value;
                setState(() {});
              },
            ),
            CustomeTextFieldWidget(
              initialValue: Preferences.apellidos,
              keyboard: TextInputType.text,
              hintText: 'Apellidos',
              prefixIcon: Icon(Icons.person),
              onChange: (value) {
                Preferences.apellidos = value;
                setState(() {});
              },
            ),
            CustomeTextFieldWidget(
              initialValue: Preferences.ciudad,
              keyboard: TextInputType.text,
              hintText: 'Ciudad',
              prefixIcon: Icon(Icons.location_city),
              onChange: (value) {
                Preferences.ciudad = value;
                setState(() {});
              },
            ),
            CustomeTextFieldWidget(
              initialValue: Preferences.pais,
              keyboard: TextInputType.text,
              hintText: 'Pais',
              prefixIcon: Icon(Icons.local_airport_outlined),
              onChange: (value) {
                Preferences.pais = value;
                setState(() {});
              },
            ),
            RadioListTile(
              activeColor: Colors.green,
              value: 1,
              groupValue: Preferences.genero,
              title: Text('Masculino'),
              onChanged: (value) {
                Preferences.genero = value ?? 1;
                setState(() {});
              },
            ),
            RadioListTile(
              activeColor: Colors.green,
              value: 2,
              groupValue: Preferences.genero,
              title: Text('Femenino'),
              onChanged: (value) {
                Preferences.genero = value ?? 2;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
