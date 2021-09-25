
import 'package:get/get.dart';
import 'package:untitled/languages/ar.dart';
import 'package:untitled/languages/en.dart';

class Traslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
     'en': en,
     'ar': ar,
  };
}