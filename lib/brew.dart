import 'dart:core';

import 'package:flutter/material.dart';

class Brew {
  final String coffee;
  int temperature;
  int time;
  int weight;
  String description;

  Brew({@required this.coffee, this.temperature, this.time, this.weight, this.description});

}