import 'dart:async';
import 'package:flutter_application_1/authentication/login_screen.dart';
import 'package:flutter_application_1/global/global.dart';
import 'package:flutter_application_1/mainScreens/main_screen.dart';
import 'package:flutter/material.dart';


class MySplashScreen  extends StatefulWidget
{
  const MySplashScreen ({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{

  startTimer()
  {
    Timer( const Duration(seconds: 3), () async
    {
      if(await fAuth.currentUser != null)
      {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));

      }
      else
      { 
        Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
      }
      
    });
  }
  @override
  void initState() {
    super.initState();

    startTimer();
  }
  @override
  Widget build(BuildContext context)
  {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      
              Image.asset("images/logo1.jpg"),
      
              const SizedBox(height: 10 ,),
      
              const Text(
                "Uber & inDriver Clone App",
                style:TextStyle(
                  fontSize: 24,
                  color:  Colors.white,
                  fontWeight: FontWeight.bold
                ) ,
              ),
      
            ],
          ),
        ) ,
      ),
    );

  }
}
