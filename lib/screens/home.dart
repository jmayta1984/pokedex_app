import 'package:flutter/material.dart';
import 'package:pokedex_app/screens/pokemon_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const PokemonList(),
    );
  }
}