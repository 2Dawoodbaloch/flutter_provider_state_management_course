import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 5;

  int get count => _count;

 void setValue(){
    _count++;
    notifyListeners();
  }

}