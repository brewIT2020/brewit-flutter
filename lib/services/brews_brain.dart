import 'dart:convert';
import 'dart:io';

import 'package:brewit/dtos/brew_dto.dart';

import 'package:http/http.dart' as http;

import '../models/brew.dart';

class BrewsBrain {
//  List<Brew> fetchBrews = [
//    Brew(coffee: "Arabica", temperature: 78, time: 3, weight: 25, description: "Morbi et aliquet nunc. Vivamus porttitor venenatis egestas. Morbi at metus ut dui interdum tristique. Etiam vel urna dolor. Fusce porttitor, metus non ultrices mollis, nisi purus bibendum tortor, in auctor mi nunc sit amet tortor. Duis facilisis tortor non elit lobortis commodo. Pellentesque at quam libero."),
//    Brew(coffee: "Indica", temperature: 73, time: 4, weight: 12, description: "Morbi et aliquet nunc. Vivamus porttitor venenatis egestas. Morbi at metus ut dui interdum tristique. Etiam vel urna dolor. Fusce porttitor, metus non ultrices mollis, nisi purus bibendum tortor, in auctor mi nunc sit amet tortor. Duis facilisis tortor non elit lobortis commodo. Pellentesque at quam libero."),
//    Brew(coffee: "Africa", temperature: 91, time: 1, weight: 31, description: "Morbi et aliquet nunc. Vivamus porttitor venenatis egestas. Morbi at metus ut dui interdum tristique. Etiam vel urna dolor. Fusce porttitor, metus non ultrices mollis, nisi purus bibendum tortor, in auctor mi nunc sit amet tortor. Duis facilisis tortor non elit lobortis commodo. Pellentesque at quam libero."),
//    Brew(coffee: "Tropica", temperature: 96, time: 5, weight: 33, description: "Morbi et aliquet nunc. Vivamus porttitor venenatis egestas. Morbi at metus ut dui interdum tristique. Etiam vel urna dolor. Fusce porttitor, metus non ultrices mollis, nisi purus bibendum tortor, in auctor mi nunc sit amet tortor. Duis facilisis tortor non elit lobortis commodo. Pellentesque at quam libero."),
//    Brew(coffee: "Malysia", temperature: 85, time: 8, weight: 42, description: "Morbi et aliquet nunc. Vivamus porttitor venenatis egestas. Morbi at metus ut dui interdum tristique. Etiam vel urna dolor. Fusce porttitor, metus non ultrices mollis, nisi purus bibendum tortor, in auctor mi nunc sit amet tortor. Duis facilisis tortor non elit lobortis commodo. Pellentesque at quam libero."),
//    Brew(coffee: "Tunesia", temperature: 88, time: 5, weight: 31, description: "Morbi et aliquet nunc. Vivamus porttitor venenatis egestas. Morbi at metus ut dui interdum tristique. Etiam vel urna dolor. Fusce porttitor, metus non ultrices mollis, nisi purus bibendum tortor, in auctor mi nunc sit amet tortor. Duis facilisis tortor non elit lobortis commodo. Pellentesque at quam libero."),
//    Brew(coffee: "Java", temperature: 102, time: 3, weight: 22, description: "Morbi et aliquet nunc. Vivamus porttitor venenatis egestas. Morbi at metus ut dui interdum tristique. Etiam vel urna dolor. Fusce porttitor, metus non ultrices mollis, nisi purus bibendum tortor, in auctor mi nunc sit amet tortor. Duis facilisis tortor non elit lobortis commodo. Pellentesque at quam libero."),
//    Brew(coffee: "Guantao", temperature: 90, time: 2, weight: 15, description: "Morbi et aliquet nunc. Vivamus porttitor venenatis egestas. Morbi at metus ut dui interdum tristique. Etiam vel urna dolor. Fusce porttitor, metus non ultrices mollis, nisi purus bibendum tortor, in auctor mi nunc sit amet tortor. Duis facilisis tortor non elit lobortis commodo. Pellentesque at quam libero."),
//  ];

  Future<List<Brew>> fetchBrews() async {
    final response = await http.get(
      'http://10.0.2.2:7000/brews/brewSimple?userId=055397e0-fd00-4b05-9fbd-70e7ee3d5bc6',
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader:
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyIkaW50X3Blcm1zIjpbXSwic3ViIjoib3JnLnBhYzRqLmNvcmUucHJvZmlsZS5Db21tb25Qcm9maWxlI2I0NDg5OGM0LWVkN2YtNGQzOC1hMTExLTFjN2ZlZjAyOTE1NCIsIiRpbnRfcm9sZXMiOlsiVVNFUiJdLCJleHAiOjE1OTUxNjkwNTgsImlhdCI6MTU5MjU3NzYxNywiZW1haWwiOiJrYW1pbHRlc3R1amUxQGthbWlsLnBsIiwidXNlcm5hbWUiOiJrYW1pbHRlc3R1amUxIn0.7pdgALw6S_EWUrV263eWEuxTqB0P16a-4dbQpynj8gQ"
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final List t = json.decode(response.body);
      final List<BrewDto> brewDtoList =
          t.map((item) => BrewDto.fromJson(item)).toList();

      List<Brew> brews = brewDtoList.map((item) => Brew.fromDto(item)).toList();

      return brews;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
