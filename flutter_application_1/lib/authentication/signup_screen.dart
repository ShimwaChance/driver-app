import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/authentication/car_info_screen.dart';
import 'package:flutter_application_1/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/global.dart';
import 'package:flutter_application_1/widget/progress_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
 @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
{
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm()
 {
    if(nameTextEditingController.text.length<3)
    {
      Fluttertoast.showToast(msg: "name must be at least 3 chracters.");
    }
    else if(!emailTextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg: "Email address is not Valid.");
    }
    else if(phoneTextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Phone number is required.");
    }
    else if(passwordTextEditingController.text.length<6)
    {
      Fluttertoast.showToast(msg: "Password must be at least 6 chracters.");
    }
    else
    {
      saveDriverInfoNow();
     
    }
  }
  saveDriverInfoNow()async
  {
     showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing,Please wait...",);
        }
     );
     final User? firebaseUser = (
      await fAuth.createUserWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      ).catchError((msg){
        Navigator.pop(context) ;
        Fluttertoast.showToast(msg: "Error: " + msg.toString());

      })

     ).user; 
     if (firebaseUser != null)
     {
      Map driverMap=
      {
        "id":firebaseUser.uid,
        "name":nameTextEditingController.text.trim(),
        "email":emailTextEditingController.text.trim(),
        "phone":phoneTextEditingController.text.trim(),
     };
      DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
      driversRef . child(firebaseUser.uid).set(driverMap);

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Account has been created.");
      Navigator.push(context, MaterialPageRoute(builder: (c)=>  CarInfoScreen()));

     }
     else
     {
      Navigator.pop(context) ;
      Fluttertoast.showToast(msg: "Account has not been created.");
    }
       
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           children: [

             const SizedBox(height: 10,),

             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Image.asset("images/logo1.jpg"),
             ),

             const SizedBox(height: 10,),
              const Text(
               "Register as a Driver",
               style: TextStyle(
                 fontSize: 26,
                 color: Colors.grey,
                 fontWeight: FontWeight.bold,

               ),
             ),
             TextField(
               controller: nameTextEditingController,
               keyboardType: TextInputType.text,
               style: const TextStyle(
                 color: Colors.grey
               ) ,
               decoration:const  InputDecoration(
                 labelText: "Name",
                 hintText: "Name",

                 enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                 hintStyle: TextStyle(
                   color: Colors.grey,
                   fontSize: 14 ,
                 ),

               ),
               ),

             TextField(
               controller: emailTextEditingController,
               keyboardType: TextInputType.emailAddress,
               style: const TextStyle(
                   color: Colors.grey
               ) ,
               decoration:const  InputDecoration(
                 labelText: "email",
                 hintText: "email",

                 enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                 hintStyle: TextStyle(
                   color: Colors.grey,
                   fontSize: 14 ,
                 ),

               ),
             ),

             TextField(
               controller: phoneTextEditingController,
               keyboardType: TextInputType.phone,
               style: const TextStyle(
                   color: Colors.grey
               ) ,
               decoration:const  InputDecoration(
                 labelText: "Phone",
                 hintText: "07........",

                 enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                 hintStyle: TextStyle(
                   color: Colors.grey,
                   fontSize: 14 ,
                 ),

               ),
             ),

             TextField(
               controller: passwordTextEditingController,
               obscureText: true,
               style: const TextStyle(
                   color: Colors.grey
               ) ,
               decoration:const  InputDecoration(
                 labelText: "password",
                 hintText: "password",

                 enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                 hintStyle: TextStyle(
                   color: Colors.grey,
                   fontSize: 14 ,
                 ),

               ),
             ),
             const SizedBox(height: 20,),

             ElevatedButton(
               onPressed:()
               {
               
                validateForm();

               },
               style: ElevatedButton.styleFrom(
               ),
               child: const Text(
                 "Create Account",
                 style: TextStyle(
                 color: Colors.grey,
                   fontSize: 18,
                 ),


               ) ,
               ),

             TextButton(
               child: const Text(
                 "Already have an  Account?Login Here",
                 style: TextStyle(color: Colors.grey),
               ),
               onPressed:()
               {
                 Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));

               } ,
             ),


           ],
         ),
       ), 
      ),

    );
  }
}
