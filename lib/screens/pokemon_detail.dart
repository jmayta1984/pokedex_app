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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30))),
                  width: width,
                  height: width * 0.7,
                  child: Image(image: image)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                _pokemonInfo?.name ?? "",
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _pokemonInfo?.types
                          .map((e) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(e),
                                ),
                              ))
                          .toList() ??
                      []),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        _pokemonInfo?.weight.toString() ?? "",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Weight",
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  Column(children: [
                    Text(
                      _pokemonInfo?.height.toString() ?? "",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Height",
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ]),
                ],
              ),
            ),
            Column(
              children:
                  _pokemonInfo?.stats.map((e) => Text(e.name)).toList() ?? [],
            )
          ],
        ),
      ),
    );
  }
}
