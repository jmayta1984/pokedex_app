import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/utils/functions.dart';

class PokemonDetail extends StatefulWidget {
  const PokemonDetail({super.key, required this.id});
  final String id;

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  PokemonService? _pokemonService;
  PokemonInfo? _pokemonInfo;

  @override
  void initState() {
    _pokemonService = PokemonService();
    initialize();
    super.initState();
  }

  Future initialize() async {
    _pokemonInfo = await _pokemonService!.getById(widget.id);
    setState(() {
      _pokemonInfo = _pokemonInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final image = getImage(widget.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(_pokemonInfo?.name ?? ""),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Image(image: image)),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _pokemonInfo?.types
                      .map((e) => Container(
                            decoration: BoxDecoration(
                              color: Colors.green[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(e),
                            ),
                          ))
                      .toList() ??
                  []),
          Column(
            children:
                _pokemonInfo?.stats.map((e) => Text(e.name)).toList() ?? [],
          )
        ],
      ),
    );
  }
}
