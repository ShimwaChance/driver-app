
import 'package:flutter/material.dart';

class ProgressDialog extends StatefulWidget
{
  String? message;
  ProgressDialog({this.message});


  @override
  State<ProgressDialog> createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialog> {
  get message => null;

  @override
  Widget build(BuildContext context)
  {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        margin:const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const SizedBox(width: 6.0,),
               const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),

              const SizedBox(width: 26.0,),

              Text(
                message?? 'Processing,Please wait', // Provide a fallback value if `message` is null
                style:  const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}
