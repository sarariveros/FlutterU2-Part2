import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion9/preferences/preferences.dart';
import 'package:sesion9/providers/theme_provider.dart';

import '../widgets/index.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final imgController = TextEditingController(text: Preferences.img);
  final nombreController = TextEditingController(text: Preferences.nombre);
  final apellidosController =
      TextEditingController(text: Preferences.apellidos);
  final ciudadController = TextEditingController(text: Preferences.ciudad);
  final paisController = TextEditingController(text: Preferences.pais);

  @override
  Widget build(BuildContext context) {
    void guardar() {
      Preferences.img = imgController.text;
      Preferences.nombre = nombreController.text;
      Preferences.apellidos = apellidosController.text;
      Preferences.ciudad = ciudadController.text;
      Preferences.pais = paisController.text;
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              value: Preferences.theme,
              onChanged: (value) {
                Preferences.theme = value;
                final themeP =
                    Provider.of<ThemeProvider>(context, listen: false);
                value ? themeP.setObscuro() : themeP.setClaro();
                setState(() {});
              }),
        ],
        title: const Text('Configuracion'),
        centerTitle: true,
      ),
      drawer: const CustomeDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeTextFieldWidget(
              controller: imgController,
              keyboard: TextInputType.text,
              hintText: 'Imagen',
              prefixIcon: Icon(Icons.photo),
            ),
            CustomeTextFieldWidget(
              controller: nombreController,
              keyboard: TextInputType.text,
              hintText: 'Nombre',
              prefixIcon: Icon(Icons.person),
            ),
            CustomeTextFieldWidget(
              controller: apellidosController,
              keyboard: TextInputType.text,
              hintText: 'Apellidos',
              prefixIcon: Icon(Icons.person),
            ),
            CustomeTextFieldWidget(
              controller: ciudadController,
              keyboard: TextInputType.text,
              hintText: 'Ciudad',
              prefixIcon: Icon(
                Icons.location_city,
                color: Colors.grey,
              ),
            ),
            CustomeTextFieldWidget(
              controller: paisController,
              keyboard: TextInputType.text,
              hintText: 'Pais',
              prefixIcon: Icon(Icons.local_airport_outlined),
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
            MaterialButton(
                color: Colors.blueGrey,
                child: const Text(
                  'Guardar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => guardar()),
          ],
        ),
      ),
    );
  }
}
