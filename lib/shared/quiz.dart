//Flutter
import 'package:flutter/material.dart';

//Services
import '../services/services.dart';

//Shared Data
class QuizState extends ChangeNotifier {
  double _progress = 0;
  Option _selected;

  final PageController controller = PageController();

  get progress => _progress;
  get selected => _selected;

  //Rerender automatically when progress is changed
  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  //Share functionaity if different buttons nav to a diff page
  set selected(Option newValue) {
    _selected = newValue;
    notifyListeners();
  }

  //Tap to next screen
  void nextPage() async {
    await controller.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }
}
