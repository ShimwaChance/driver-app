import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seat Booking'),
        ),
        body: Center(
          child: FlightBookingForm(),
        ),
      ),
    );
  }
}

class FlightBookingForm extends StatefulWidget {
  @override
  _FlightBookingFormState createState() => _FlightBookingFormState();
}

class _FlightBookingFormState extends State<FlightBookingForm> {
  final _formKey = GlobalKey<FormState>();

  String? _amount;
  String? _departureTime;
  String? _arrivalTime;
  String? _location;
  String? _pay;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the amount';
                }
                return null;
              },
              onSaved: (value) {
                _amount = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Departure Time',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the departure time';
                }
                return null;
              },
              onSaved: (value) {
                _departureTime = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Arrival Time',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the arrival time';
                }
                return null;
              },
              onSaved: (value) {
                _arrivalTime = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Location',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the location';
                }
                return null;
              },
              onSaved: (value) {
                _location = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Pay',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the payment method';
                }
                return null;
              },
              onSaved: (value) {
                _pay = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Process data
                  print('Amount: $_amount');
                  print('Departure Time: $_departureTime');
                  print('Arrival Time: $_arrivalTime');
                  print('Location: $_location');
                  print('Pay: $_pay');
                }
              },
              child: Text('Book A SEAT'),
            ),
          ),
        ],
      ),
    );
  }
}