import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/models/app_data.dart';
import 'package:untitled/view%20model/widget/categories_item.dart';


class Home extends StatelessWidget {
  static const  routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0
      ),
        children: Categories_data.map((e)=> CategoriesItem(
          e.id,
          e.title,
          e.imageUrl
        ) ).toList(),
        padding: EdgeInsets.all(8.0),
      ),
    );
  }
}
