import 'package:flutter/material.dart';

String imagePath = "assets/images/";

List<Map<String, dynamic>> allCharacters = [
  {
    'name': "Iron man",
    'color': Colors.red,
    'image': "${imagePath}ironman.png",
  },
  {
    'name': "Captain America",
    'color': Colors.blue,
    'image': "${imagePath}ca.png",
  },
  {
    'name': "Thor",
    'color': Colors.indigo,
    'image': "${imagePath}thor.png",
  },
  {
    'name': "Hulk",
    'color': Colors.green,
    'image': "${imagePath}hulk.png",
  },
];

List<Map<String, dynamic>> favCharacters = [];
