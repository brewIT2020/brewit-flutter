import 'dart:core';

import 'package:brewit/dtos/brew_dto.dart';
import 'package:flutter/material.dart';

class Brew {
  String coffee;
  int temperature;
  int time;
  int volume;
  int weight;
  String description;

  Brew({@required this.coffee, this.temperature, this.time, this.volume, this.weight, this.description});

  factory Brew.fromDto(BrewDto dto) {
    return Brew(
      coffee: dto.productName,
      description: dto.description,
      weight: dto.weight,
      time: dto.time,
      volume: dto.volume,
      temperature: dto.temp,
    );
  }
}
