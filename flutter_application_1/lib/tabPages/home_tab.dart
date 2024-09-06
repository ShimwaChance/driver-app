import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


// class HomeTabPage extends StatefulWidget {
//   const HomeTabPage({ Key? key}): super(key: key);

//   @override
//   _HomeTabPageState createState() => _HomeTabPageState();
// }

// class _HomeTabPageState extends State<HomeTabPage> {
//   @override
//   Widget build(BuildContext context) {
//     return  Center(
//       child: Text(
//           "Home"
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({ Key? key}): super(key: key);

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  late GoogleMapController _mapController;
  late CameraPosition _initialCameraPosition;
  List<Trip> _trips = [
    Trip('Trip 1', 'Pickup: 123 Main St, Dropoff: 456 Elm St'),
    Trip('Trip 2', 'Pickup: 789 Oak St, Dropoff: 321 Maple St'),
    Trip('Trip 3', 'Pickup: 901 Pine St, Dropoff: 234 Cedar St'),
  ];


  
  @override
  void initState() {
    super.initState();
    _initialCameraPosition = CameraPosition(
      target: LatLng(37.7749, -122.4194),
      zoom: 12,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Home Page'),
        leading: IconButton(
          icon: SvgPicture.asset('assets/menu.svg'),
          onPressed: () {
            // Open navigation drawer
          },
        ),
      ),
      body: Column(
        children: [
          // Driver profile section
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(width: 16),
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          // Map section
          Container(
            height: 200,
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              markers: {
                Marker(
                  markerId: MarkerId('driver_location'),
                  position: LatLng(37.7749, -122.4194),
                  icon: BitmapDescriptor.defaultMarker,
                ),
              },
            ),
          ),
          // Trips list section
          Expanded(
            child: ListView.builder(
              itemCount: _trips.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_trips[index].title),
                  subtitle: Text(_trips[index].description),
                  trailing: IconButton(
                    icon: Icon(Icons.directions),
                    onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Let Go'),
          content: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Text('Trip ID'),
                  ),
                  TableCell(
                    child: Text('12345'),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Text('Pickup Location'),
                  ),
                  TableCell(
                    child: Text('123 Main St'),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Text('Dropoff Location'),
                  ),
                  TableCell(
                    child: Text('456 Elm St'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Let Go'),
              onPressed: () {
                // Let go trip logic
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  },
                  ),
                );
              },
            ),
          ),
          // Start trip button
          Container(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              child: Text('Start Trip'),
              onPressed: () {
                // Start trip logic
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Trip {
  String title;
  String description;

  Trip(this.title, this.description);
}