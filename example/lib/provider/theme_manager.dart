import 'package:flutter/services.dart';
import 'package:locus/locus.dart';

class ThemeProvider extends ChangeNotifier {
  Brightness brightness = Brightness.light;

  void toggle() {
    brightness =
        brightness == Brightness.light ? Brightness.dark : Brightness.light;
    notifyListeners();
  }
}
