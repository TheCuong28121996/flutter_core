import 'package:flutter/material.dart';
import 'common/constants/constants.dart';
import 'main.dart';

void main() async {
  Widget app = await initializeApp(Constants.prodEnvironment);
  runApp(app);
}
