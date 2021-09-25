import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/models/app_data.dart';
import 'package:untitled/constant.dart';

class TripDetails extends StatelessWidget {
  static const routeName = '/trip_details';
  final Function manageFavorite;
  final Function isFavorite;

   TripDetails(this.manageFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
   final tripID = ModalRoute.of(context)!.settings.arguments;
    final  filterTRIP = Trips_data.firstWhere((element) => element.id == tripID) ;
    return Scaffold(
      appBar: AppBar(
        title: Text(filterTRIP.title,style: GoogleFonts.cairo(
          fontSize: 20
        ),),
        backgroundColor: TextColor2.withOpacity(0.5),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(filterTRIP.imageUrl,width: double.infinity,height: 250,fit: BoxFit.cover,),
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 8),
              child: Align(
                alignment: Alignment.topRight,
                child: Text('الأنشطة',style: GoogleFonts.cairo(
                  fontSize: 20,color: TextColor2
                ),),
              ),
            ),
            Container(
              height: 200,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)
              ),
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: filterTRIP.activities.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 0.3,
                    margin: EdgeInsets.only(right: 10.0,left: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(filterTRIP.activities[index],style: GoogleFonts.cairo(),),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 8),
              child: Align(
                alignment: Alignment.topRight,
                child: Text('البرنامج اليومي',style: GoogleFonts.cairo(
                    fontSize: 20,color: TextColor2
                ),),
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)
              ),
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: filterTRIP.program.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title:Text(filterTRIP.program[index],
                      style: GoogleFonts.cairo(),),
                    leading:CircleAvatar(
                      backgroundColor: TextColor2,
                      child: Text('${index + 1}'),
                    ),
                  );
                },
              ),
            ),
            Text('..We wish you a happy journey..',style: GoogleFonts.cairo(
              color: TextColor2,
              fontSize: 20
            ),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        backgroundColor: TextColor2.withOpacity(0.5),
        child: Icon(isFavorite(tripID) ? Icons.star : Icons.star_border),
        onPressed: () => manageFavorite(tripID),
      ),
    );
  }
}
