import 'package:flutter/material.dart';
import 'package:sesion9/widgets/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      drawer: const CustomeDrawerSaraWidget(),
      body: Center(
        child: Text(
          'Bienvenido',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
