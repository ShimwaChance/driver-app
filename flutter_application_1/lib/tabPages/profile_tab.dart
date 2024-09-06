import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/global.dart';
import 'package:flutter_application_1/splashScreen/splash_screen.dart';



class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}



class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(40.0), // Add padding to all sides
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://web.html.support/images/html-codes/links/boracay-white-beach-sunset-300x225.jpg'),   
          ),
          SizedBox(height: 20),
          Text(
          
           
          
          // FirebaseAuth.instance.currentUser!.email.toString(),
           FirebaseAuth.instance.currentUser!.displayName.toString(),

            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Edit Profile'),
          ),
          ElevatedButton(
        child:const  Text(
          "Sign Out"
        ),
        onPressed: ()
        {
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
        },
      )
        ],
      ),
    );
    // return Text(FirebaseAuth.instance.currentUser!.email.toString());
}
}