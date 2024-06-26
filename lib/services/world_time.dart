import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

   String? location; // location name for the UI
   String? time ; // the time in that location
   String? flag ; // url to an asset flag icon
   String? url ; // loction url for api endpoint
   bool? isDaytime; //true or false if day time or not 

   WorldTime({this.location,this.flag, this.url});


    Future<void> getTime() async {

      try {
        print('function called');
    //making the request
    Response response = await get(Uri.parse('https://www.worldtimeapi.org/api/timezone/$url'));
    print('Getting DAta');
    Map data = jsonDecode(response.body); 
    //print(data);

    // get properties from data 
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(datetime);
    //print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    
    isDaytime=now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
      }

      catch (e){
          print('Caught error : $e');
          time= 'Could not get time data';
      }
    

  }
}
 
