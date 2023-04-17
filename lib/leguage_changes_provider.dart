import 'package:flutter/material.dart';

class LenguageChangeProvider with ChangeNotifier {

  Locale _currentLocale = const Locale("es");

  Locale get currentLocale => _currentLocale;

  void changeLocale(String _locale){
    _currentLocale = Locale(_locale);
    notifyListeners();
  }

}
