import 'package:pokedex_app/utils/functions.dart';

class Pokemon {
  final String name;
  final String id;

  const Pokemon({required this.name, required this.id});

  Pokemon.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        id = getId(json["url"]);
}

class PokemonInfo {
  final String name;
  final int height;
  final int weight;
  final List<String> types;
  final List<Stat> stats;

  const PokemonInfo(
      {required this.name,
      required this.height,
      required this.weight,
      required this.types,
      required this.stats});

  PokemonInfo.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        height = json["height"],
        weight = json["weight"],
        types = json["types"]
            .map<String>((type) => type["type"]["name"].toString())
            .toList(),
        stats = json["stats"]
            .map<Stat>((stat) => Stat.fromJson(stat))
            .toList()
            .cast<Stat>();
}

class Stat {
  final String name;
  final int value;

  const Stat({required this.name, required this.value});

  Stat.fromJson(Map<String, dynamic> json)
      : name = json["stat"]["name"],
        value = json["base_stat"];
}
