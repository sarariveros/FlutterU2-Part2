import 'package:flutter/material.dart';
import 'package:sesion9/routes/route.dart';

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
          DrawerHeader(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2020/03/07/11/54/the-fog-4909513__340.jpg'),
                  fit: BoxFit.fitWidth),
            ),
            child: Row(
              children: [
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()!));
                  },
                  elevation: 1.0,
                  fillColor: Colors.white,
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2022/10/28/11/14/leaves-7552915__340.png'),
                  ),
                  padding: EdgeInsets.all(5.0),
                  shape: CircleBorder(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sara Riveros',
                        style: Styles.title,
                      ),
                      Text('Junior Flutter Developer', style: Styles.subtitle)
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.rHome);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Config'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.rAjustes);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyRoutes.rPerfil);
            },
          ),
        ],
      ),
    );
  }
}
