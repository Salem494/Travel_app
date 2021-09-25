// ignore: import_of_legacy_library_into_null_safe
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled/models/app_data.dart';
import 'package:untitled/models/translate.dart';
import 'package:untitled/models/trip.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/view/screen/categories_trip.dart';
import 'package:untitled/view/screen/home.dart';
import 'package:untitled/view/screen/tabs_screen.dart';
import 'package:untitled/view/screen/trip_details.dart';

// @dart=2.9
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Trip> _favoriteTrips = [];

  void _manageFavorite(String tripId) {
    final existingIndex =
    _favoriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteTrips.add(
          Trips_data.firstWhere((trip) => trip.id == tripId),
        );
      });
    }
  }

  bool _isFovarite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  ConnectivityResult? _connectivityResult;

  Future<void> _checkConnectivityState() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.wifi) {
      print('Connected to a Wi-Fi network');
    } else if (result == ConnectivityResult.mobile) {
      print('Connected to a mobile network');
    } else {
      print('Not connected to any network');
    }

    setState(() {
      _connectivityResult = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel app',
      translations: Traslation(),
      fallbackLocale: Locale('ar'),
      locale: Locale('ar'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(context)=>TabScreen(_favoriteTrips),
        '/home':(context)=>Home(),
        '/categories_trip':(context)=>CategoriesTrip(),
        '/trip_details':(context)=>TripDetails(_manageFavorite,_isFovarite)
      },
    );
  }
}


