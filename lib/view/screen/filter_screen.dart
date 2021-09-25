import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/constant.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var summer = false;
  var winter = false;
  var family = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: TextColor2.withOpacity(0.5),
        title: Text('الفلترة',style: GoogleFonts.cairo(),),
      ),
      body: Column(
        children: [
          SizedBox(),
          buildSwitch('الرحلات الصيفية','إظهار الرحلات في فصل الصيف فقط ',summer, (newValue){
            setState(() {
              summer =newValue;
            });
          }),
          Divider(),
          buildSwitch('الرحلات الشتوية','إظهار الرحلات في فصل الشتاء فقط ',winter,(newValue){
            setState(() {
              winter = newValue;
            });
          }),
          Divider(),
          buildSwitch(
              'الرحلات العائلات',
              'إظهار الرحلات العائلية فقط ',
              family,
                  (newValue){
                   setState(() {
                    family = newValue;
                       });
                   print(newValue);
              }),
          Image.asset('assets/icons/travel.png')
        ],
      ),
    );
  }
  Widget buildSwitch(String title,String subtitle,var value,var update){
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value:value,
        onChanged: update,
    );
  }
}
