import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/models/app_data.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/view%20model/widget/trip_item.dart';

class CategoriesTrip extends StatelessWidget {
  static const  routeName = '/categories_trip';

  // String tripId;
  // String tripTitle;
  //
  // CategoriesTrip(this.tripId, this.tripTitle);

  @override
  Widget build(BuildContext context) {
    final tripModel = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final tripmId = tripModel['id'];
    final tripmITitle= tripModel['title'];
    final filterTrip = Trips_data.where((trip) {
     return trip.categories.contains(tripmId);
    }).toList();
        
        
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TextColor2.withOpacity(0.5),
        centerTitle: true,
        title: Text(tripmITitle!,style: GoogleFonts.cairo(
          fontSize: 20,
        ),),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          return TripItem(
             id:  filterTrip[index].id,
              title:   filterTrip[index].title,
             imageUrl:  filterTrip[index].imageUrl,
             duration:  filterTrip[index].duration,
             season:  filterTrip[index].season,
             tripType:  filterTrip[index].tripType,
          );
        },
      itemCount: filterTrip.length,
      ),
    );
  }
}
