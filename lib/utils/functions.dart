import 'package:flutter/material.dart';

String getId(String url) {
  String id = RegExp(r'https://pokeapi.co/api/v2/pokemon/([^]*?)/')
      .firstMatch(url)?[1] as String;
  return id;
}

ImageProvider getImage(String id){
  NetworkImage image = NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png");
  return image;
}