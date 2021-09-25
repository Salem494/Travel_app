import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchLanguage extends StatefulWidget {
  const SwitchLanguage({Key? key}) : super(key: key);

  @override
  _SwitchLanguageState createState() => _SwitchLanguageState();
}

class _SwitchLanguageState extends State<SwitchLanguage> {
  // var valueee = false;
  String valueee = 'ar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أختر اللغة '.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // SwitchListTile(
          //   value: valueee ,
          //   title: Text('اللغة العربية'),
          //   onChanged: (newValue){
          //     setState(() {
          //       newValue = valueee;
          //     });
          //   },
          // ),
          // SwitchListTile(
          //   value: valueee ,
          //   title: Text('اللغة الانجليزية '),
          //   onChanged: (newValue){
          //     setState(() {
          //       newValue = valueee;
          //     });
          //   },
          // ),
          DropdownButton<String>(

            icon: Icon(Icons.language),
            items: [
              DropdownMenuItem(
                child: Text('اللغة العربية'),
                value: 'ar',
              ),
              DropdownMenuItem(
                child: Text('اللغة الانجليزية'),
                value: 'en',
              ),
            ],
            value: valueee ,
            onChanged: (value){
              setState(() {
                valueee = value as String;
              });
              Get.updateLocale(Locale('valueee'));
            },
          )

        ],
      ),
    );
  }
}
