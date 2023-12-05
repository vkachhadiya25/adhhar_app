import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier
{
    bool isOnline = false;

    void changeStatus(bool status)
    {
      isOnline = status;
      notifyListeners();
    }
}