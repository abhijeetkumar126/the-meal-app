import 'package:flutter/material.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            title: Text('Version'),
            subtitle: Text('v0.1.1'),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        ListTile(
          leading: Icon(Icons.notifications_sharp),
          title: Text('Notifications'),
          subtitle: Text('You have 1 notification'),
        ),
        ListTile(
          leading: Icon(Icons.security),
          title: Text('Security'),
          subtitle: Text('Configure password, pin etc'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('About Us'),
          subtitle: Text('Find Out More'),
        ),
      ],
    );
  }
}
