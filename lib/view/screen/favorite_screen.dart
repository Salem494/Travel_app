import 'package:flutter/material.dart';
import 'package:untitled/models/trip.dart';
import 'package:untitled/view%20model/widget/trip_item.dart';

class FavouriteScreen extends StatelessWidget {

  final List<Trip> favTrip;
  FavouriteScreen(this.favTrip);
  @override
  Widget build(BuildContext context) {
    if (favTrip.isEmpty) {
      return Center(
        child: Text('ليس لديك أي رحلة في قائمة المفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favTrip[index].id,
            title: favTrip[index].title,
            imageUrl: favTrip[index].imageUrl,
            duration: favTrip[index].duration,
            tripType: favTrip[index].tripType,
            season: favTrip[index].season,
          );
        },
        itemCount: favTrip.length,
      );
    }
  }
}
