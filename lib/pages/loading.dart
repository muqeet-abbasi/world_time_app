import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  

 void setupWorldTime() async {
  WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
  await instance.getTime();
  print (instance);
  
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDaytime':instance.isDaytime,
  });
 
 } 

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // print('init called');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child:   SpinKitDancingSquare(
          color: Colors.white,
          size: 50.0,
),
      )
            
    );
  }
}