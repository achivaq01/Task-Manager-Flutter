
import '../constants.dart';

class Task {
  String name;
  bool status = !statusFinished;

  Task({required this.name});
}