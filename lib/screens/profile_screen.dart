import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sesion9/preferences/index.dart';
import 'package:sesion9/screens/config_screen.dart';
import 'package:sesion9/screens/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      //extendBodyBehindAppBar: false,
      //appBar: AppBar(),
      // drawer: const CustomeDrawerWidget(),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 280,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          bottomRight: Radius.circular(2)),
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2020/03/07/11/54/the-fog-4909513__340.jpg',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()));
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Colors.white,
                                )),
                            Text(
                              'Profile',
                              style: Styles.title,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ConfigScreen()));
                                },
                                icon: const Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            RawMaterialButton(
                              onPressed: () {},
                              fillColor: Colors.white,
                              padding: const EdgeInsets.all(5.0),
                              shape: const CircleBorder(),
                              child: (Preferences.img == '')
                                  ? CircleAvatar(
                                      radius: 45,
                                      child: Icon(Icons.photo),
                                    )
                                  : CircleAvatar(
                                      radius: 45,
                                      backgroundImage:
                                          NetworkImage(Preferences.img),
                                    ),
                            ),
                            Text(
                              '${Preferences.nombre} ${Preferences.apellidos}',
                              style: Styles.title,
                            ),
                            Text(
                              'Junior Flutter Developer',
                              style: Styles.subtitle,
                            )
                          ],
                        ),
                        IntrinsicHeight(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        '1000',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '  Followers',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                  const VerticalDivider(
                                    thickness: 1,
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        '1200',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        '  Following',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ItemWidget(
                        icono: FontAwesomeIcons.mapLocation,
                        title: 'Ubicacion',
                        content: '${Preferences.ciudad}, ${Preferences.pais}',
                      ),
                      ItemWidget(
                        icono: FontAwesomeIcons.mobile,
                        title: 'Pais',
                        content: Preferences.pais,
                      ),
                      ItemWidget(
                        icono: FontAwesomeIcons.twitter,
                        title: 'Genero',
                        content: (Preferences.genero == 2)
                            ? 'Femenino'
                            : 'Masculino',
                      ),
                      ItemWidget(
                        icono: FontAwesomeIcons.github,
                        title: 'GitHub',
                        content: 'sarariverosc',
                      ),
                      ItemWidget(
                        icono: FontAwesomeIcons.facebook,
                        title: 'Facebook',
                        content: 'algobonito.paraver',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final IconData? icono;
  final String? title;
  final String? content;

  const ItemWidget({super.key, this.icono, this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FaIcon(
          icono,
          color: Colors.blueGrey,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title',
                style: TextStyle(
                    fontSize: 13, color: Color.fromARGB(255, 97, 95, 95)),
              ),
              Text(
                '$content',
                style: TextStyle(fontSize: 14, color: Colors.black),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
