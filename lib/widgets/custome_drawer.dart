import 'package:flutter/material.dart';

import '../screens/index.dart';

class CustomeDrawerWidget extends StatelessWidget {
  const CustomeDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2022/10/28/11/14/leaves-7552915__340.png'),
                  fit: BoxFit.fill),
            ),
            child: Center(
              child: Text(
                'Hola',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Config'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConfigScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MiPerfilScreen()));
            },
          ),
        ],
      ),
    );
  }
}
