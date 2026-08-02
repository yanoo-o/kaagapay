import 'package:flutter/material.dart';
import 'package:kaagapay/Profile/JuanProfile.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    final user = Profiles.JuanProfile;

    return Scaffold(
      appBar: AppBar(title: Text('PROFILE')),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 30),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.displayPhoto),
          ),
          SizedBox(height: 16),
          Text(
            '${user.firstName} ${user.lastName}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            user.emailAdd,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}