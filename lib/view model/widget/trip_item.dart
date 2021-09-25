import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/models/trip.dart';
import 'package:untitled/view/screen/trip_details.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;

  TripItem({
    required this.id,required this.title,required this.imageUrl,required this.duration,required this.season, required this.tripType});

  String get seasonText {
  switch(season){
    case Season.Summer:
      return 'صيف';
      break;
    case Season.Winter:
      return "شتاء";
      break;
    case Season.Autumn:
      return 'خريف';
      break;
    case Season.Spring:
      return 'ربيع';
      break;
    default:
      return 'غير معروف';
  }
  }

  String get typeText {
    switch(tripType){
      case TripType.Exploration:
        return 'أكتشاف';
        break;
      case TripType.Activities:
        return "أنشطة";
        break;
      case TripType.Recovery:
        return 'نقاء';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return 'غير معروف';
    }
  }


  void selectTrip(context){
    Navigator.pushNamed(context, TripDetails.routeName,arguments: id );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectTrip(context),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 9,
        margin: EdgeInsets.all(9.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                    child: Image.network(imageUrl,fit: BoxFit.cover,height: 250,width: double.infinity,)),
                Container(
                  height: 250,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    title,
                      style: GoogleFonts.cairo(
                        fontSize: 18,
                        color: Colors.white
                      ),
                    overflow: TextOverflow.fade,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                       Colors.black.withOpacity(0.0),
                       Colors.black.withOpacity(0.8)
                     ]

                    )
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.today,color: Theme.of(context).accentColor,),
                      SizedBox(width: 2,),
                      Text('${duration}  أيام ',style: GoogleFonts.cairo(),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.wb_sunny,color: Theme.of(context).accentColor,),
                      SizedBox(width: 2,),
                      Text('${seasonText}',style: GoogleFonts.cairo(),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.family_restroom,color: Theme.of(context).accentColor),
                      SizedBox(width: 2,),
                      Text('${typeText}',style: GoogleFonts.cairo(),)
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
