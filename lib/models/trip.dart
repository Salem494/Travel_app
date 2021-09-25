import 'package:flutter/material.dart';

enum Season {
  Summer,
  Winter,
  Spring,
  Autumn
}

enum TripType{
  Exploration,
  Recovery,
  Activities,
  Therapy
}

class Trip {
   final String id;
   final String  title;
   final String  imageUrl;
   final int duration;
   final List<String> categories;
   final List<String> activities;
   final List<String> program;
   final bool isInSummer;
   final bool isForFamilies;
   final bool isInWinter;
   final Season season;
   final TripType tripType;

  const Trip({
   required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required   this.categories,
    required  this.activities,
    required this.program,
    required this.isInSummer,
    required  this.isForFamilies,
    required this.isInWinter,
    required this.season,
    required  this.tripType
  });
}