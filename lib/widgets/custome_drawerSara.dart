import 'package:flutter/material.dart';
import 'package:sesion9/widgets/index.dart';
import '../screens/index.dart';

class CustomeDrawerSaraWidget extends StatelessWidget {
  const CustomeDrawerSaraWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: DrawerHeader(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                          Text('Junior Flutter Developer',
                              style: Styles.subtitle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ListTileCustomized(
                    height: 50,
                    title: 'All Inboxes',
                    icon: Icons.drafts,
                    trailing: Text('15', style: TextStyle(fontSize: 12)),
                    onTap: HomeScreen(),
                  ),
                  Divider(),
                  ListTileCustomized(
                    height: 35,
                    title: 'Primary',
                    icon: Icons.dashboard,
                    trailing: Text('15', style: TextStyle(fontSize: 12)),
                    onTap: HomeScreen(),
                  ),
                  ListTileCustomized(
                    height: 35,
                    title: 'Social',
                    icon: Icons.people,
                    trailing: ChipWidget(
                      text: '14 new',
                      color: Colors.lightBlue,
                    ),
                    onTap: HomeScreen(),
                  ),
                  ListTileCustomized(
                    height: 38,
                    title: 'Promotions',
                    icon: Icons.label,
                    trailing: ChipWidget(
                      text: '99+ new',
                      color: Colors.greenAccent,
                    ),
                    onTap: HomeScreen(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(),
                  ),
                  ///////////////////////////////////////////////
                  Text(
                    'All Labels',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  //////////////////////////////////////////////
                  ListTileCustomized(
                    height: 35,
                    title: 'Starred',
                    icon: Icons.star,
                    trailing: Text(''),
                    onTap: HomeScreen(),
                  ),
                  ListTileCustomized(
                    height: 35,
                    title: 'Important',
                    icon: Icons.label_important,
                    trailing: Text('1', style: TextStyle(fontSize: 12)),
                    onTap: HomeScreen(),
                  ),
                  ListTileCustomized(
                    height: 35,
                    title: 'Sent',
                    icon: Icons.share,
                    trailing: Text('1', style: TextStyle(fontSize: 12)),
                    onTap: HomeScreen(),
                  ),
                  ListTileCustomized(
                    height: 35,
                    title: 'Outbox',
                    icon: Icons.outbox,
                    trailing: Text(''),
                    onTap: HomeScreen(),
                  ),
                  ListTileCustomized(
                    height: 35,
                    title: 'Draft',
                    icon: Icons.file_copy,
                    trailing: Text(''),
                    onTap: HomeScreen(),
                  ),
                  ListTileCustomized(
                    height: 35,
                    title: 'Spam',
                    icon: Icons.warning_amber,
                    trailing: Text(''),
                    onTap: HomeScreen(),
                  ),
                  ListTileCustomized(
                    height: 35,
                    title: 'Others',
                    icon: Icons.question_mark,
                    trailing: Text(''),
                    onTap: HomeScreen(),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final Color? color;
  final String? text;

  const ChipWidget({super.key, this.color, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Chip(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: color,
        label: Text(
          '$text',
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}

class ListTileCustomized extends StatelessWidget {
  final String? title;
  final Widget? trailing;
  final Widget? onTap;
  final IconData? icon;
  final double? height;

  const ListTileCustomized(
      {super.key,
      this.title,
      this.trailing,
      this.onTap,
      this.icon,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        leading: Icon(icon),
        title: Text(
          '$title',
          style: TextStyle(fontSize: 13),
        ),
        horizontalTitleGap: 3,
        trailing: trailing,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => onTap!));
        },
      ),
    );
  }
}
