import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/authentication/login_screen.dart';
import 'package:flutter_application_1/global/global.dart';
import 'package:flutter_application_1/splashScreen/splash_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatefulWidget
{

  @override
  _CarInfoScreen createState() => _CarInfoScreen();
}

class _CarInfoScreen extends State<CarInfoScreen>
{
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  List<String>carTypesList = ["Taxi","Rava4","Bike"];
  String? selectedCarType;

  
  saveCarInfo()
  {
     Map driverCarInfoMap=
      {
        "car_color":carColorTextEditingController.text.trim(),
        "car_number":carNumberTextEditingController.text.trim(),
        "car_model":carModelTextEditingController.text.trim(),
        "type":selectedCarType,
     };
      DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
      driversRef . child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfoMap);
      Fluttertoast.showToast(msg: "Car Details has been Saved.Congratulations.");
      Navigator.push(context, MaterialPageRoute(builder: (c)=>  const MySplashScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 24,),


              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/logo1.jpg"),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Write Car Details",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,

                ),
              ),
              TextField(
                controller: carModelTextEditingController,
                style: const TextStyle(
                    color: Colors.grey
                ) ,
                decoration:const  InputDecoration(
                  labelText: "Car Model",
                  hintText: "Car Model",

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
                controller:carNumberTextEditingController ,
                style: const TextStyle(
                    color: Colors.grey
                ) ,
                decoration:const  InputDecoration(
                  labelText: "Car Number",
                  hintText: "Car Number",

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
                controller: carColorTextEditingController,
                style: const TextStyle(
                    color: Colors.grey
                ) ,
                decoration:const  InputDecoration(
                  labelText: "Car Color",
                  hintText: "Car Color",

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

              const SizedBox(height: 10,),
              
              DropdownButton(
                iconSize: 20,

                dropdownColor: Colors.black,
                hint: const Text(
                  "Please Choose Car Type",
                  style:TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ) ,
               ),
                value: selectedCarType,
                onChanged: (newValue)
                {
                  setState(() {
                    selectedCarType = newValue.toString();

                  });
                },
                items: carTypesList.map((car){
                  return DropdownMenuItem(
                    child: Text(
                      car,
                      style:TextStyle(color: Colors.greenAccent),
                    ),
                    value: car,

                  );

                }).toList(),

              ),

              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed:()
                {
                  if(carColorTextEditingController.text.isNotEmpty
                  &&carNumberTextEditingController.text.isNotEmpty
                  &&carModelTextEditingController.text.isNotEmpty && selectedCarType != null)
                  {
                    saveCarInfo();
                  }
                 

                },
                style: ElevatedButton.styleFrom(
                  ),
                child: const Text(
                  "Save Now",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),


                ) ,
              ),


            ],
          ),
        ),

      ),


    );

  }
}



