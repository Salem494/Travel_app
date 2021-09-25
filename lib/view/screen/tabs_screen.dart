import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/constant.dart';
import 'package:untitled/models/trip.dart';
import 'package:untitled/view/screen/favorite_screen.dart';
import 'package:untitled/view/screen/filter_screen.dart';
import 'package:untitled/view/screen/home.dart';
import 'package:untitled/view/screen/switch_languages.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tab-screen';

  final List<Trip> favTrip;
  TabScreen(this.favTrip);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectPage = 0;

  void _selectPage(int index) {
     setState(() {
       selectPage = index;
     });
  }

  late List<Map<String,dynamic>>_screen ;

@override
  void initState() {
   _screen = [
     {
       'Screen':Home(),
       'Title':'تصنيفات الرحلات'
     },
     {
       'Screen':FavouriteScreen(widget.favTrip),
       'Title':'الرحلات المفضلة'
     }
   ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TextColor2.withOpacity(0.5),
        title: Text(_screen[selectPage]['Title'],style: GoogleFonts.cairo(
          fontSize: 20,
        ),),
        centerTitle: true,
      ),
      drawer: Drawer(
        elevation: 0.5,
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(7.0),
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              child: Text('التصنيفات',style: GoogleFonts.cairo(
                  fontSize: 20,
                  color: Colors.white
              ),),
              decoration: BoxDecoration(
                color: TextColor2.withOpacity(0.5),
                borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(25),bottomRight:  Radius.circular(25)),
              ),
            ),
            // Text(),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TabScreen(widget.favTrip)));
              },
              leading: Icon(Icons.card_travel,size: 28,),
              title: Text('الرحلات',style: GoogleFonts.cairo()),
            ),
            Divider(color: Colors.grey,),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterScreen()));
              },
              leading: Icon(Icons.filter_list,size: 28,),
              title: Text('الفلترة',style: GoogleFonts.cairo(),),
            ),
            Divider(color: Colors.grey,),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SwitchLanguage()));
              },
              leading: Icon(Icons.language,size: 28,),
              title: Text('اللغة',style: GoogleFonts.cairo(),),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 3,
          backgroundColor: TextColor2.withOpacity(0.5),
          onTap: _selectPage,
          selectedItemColor: TextColor,
          unselectedItemColor: Colors.white,
          currentIndex:selectPage ,
          items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard,size: 25,),
               label: 'التصفيات',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star_outline_sharp,size: 25,),
          label: 'المفضلة',
          ),
          ],
        ),
        body: _screen[selectPage]["Screen"],
    );
  }
}
