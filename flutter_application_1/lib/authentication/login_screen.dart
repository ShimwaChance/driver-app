import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/authentication/signup_screen.dart';
import 'package:flutter_application_1/global/global.dart';
import 'package:flutter_application_1/splashScreen/splash_screen.dart';
import 'package:flutter_application_1/tabPages/earnings_tab.dart';
import 'package:flutter_application_1/mainScreens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/progress_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatefulWidget
{


  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen>
{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  validateForm()
 {
    
     if(!emailTextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg: "Email address is not Valid.");
    }
    else if(passwordTextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Password is required.");
    }
    else
    {
      loginDriverNow();
     
    }
  }

  loginDriverNow()async
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
      await fAuth.signInWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      ).catchError((msg){
        Navigator.pop(context) ;
        Fluttertoast.showToast(msg: "Error: " + msg.toString());

      })

     ).user; 
     if (firebaseUser != null)
     {
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: " Login Successful.");
      Navigator.push(context, MaterialPageRoute(builder: (c)=> MySplashScreen()));

     }
     else
     {
      Navigator.pop(context) ;
      Fluttertoast.showToast(msg: "Error Occured During Login .");
    }
       
}
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.black ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("zimages/logo1.jpg"),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Login as a Driver",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,

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
                  "Login ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),


                ) ,
              ),
              
              TextButton(
                child: const Text(
                  "Do not have an Account? SignUp Here",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed:()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>  SignUpScreen()));

                } ,
              ),


            ],

          ),
        ),

      ),

    );
  }
}
