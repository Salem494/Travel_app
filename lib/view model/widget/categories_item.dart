import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/view/screen/categories_trip.dart';

class CategoriesItem extends StatelessWidget {
  static const  routeName = '/categories_item';
  String id;
  String title;
  String imgUrl;
  CategoriesItem(this.id, this.title, this.imgUrl);

  selectCat(BuildContext context){
    Navigator.pushNamed(context, CategoriesTrip.routeName,arguments: {
      'id':id,
      'title':title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCat(context),
      splashColor: Colors.green,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(imgUrl,fit: BoxFit.cover,height: 250,)),
          Container(
            alignment: Alignment.center,
            child: Text(title,style: GoogleFonts.cairo(
              fontSize: 25,
              color: Colors.white,
            ),),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.3),

            ),

          ),

        ],
      ),
    );
  }
}
