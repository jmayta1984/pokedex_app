import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/screens/pokemon_detail.dart';
import 'package:pokedex_app/services/pokemon_service.dart';
import 'package:pokedex_app/utils/functions.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  List<Pokemon>? _pokemons;
  PokemonService? _pokemonService;

  @override
  void initState() {
    _pokemonService = PokemonService();
    initialize();
    super.initState();
  }

  Future initialize() async {
    _pokemons = await _pokemonService?.getAll();
    setState(() {
      _pokemons = _pokemons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _pokemons?.length ?? 0,
      itemBuilder: (context, index) => PokemonItem(pokemon: _pokemons?[index]),
    );
  }
}

class PokemonItem extends StatefulWidget {
  const PokemonItem({super.key, required this.pokemon});
  final Pokemon? pokemon;

  @override
  State<PokemonItem> createState() => _PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final image = getImage(widget.pokemon?.id ?? "");
    final icon =
        Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.grey);
    final pokemon = widget.pokemon;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PokemonDetail(id: pokemon?.id ?? "1"))),
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: Image(image: image),
          title: Text(pokemon?.name ?? ""),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: icon,
          ),
        ),
      ),
    );
  }
}
