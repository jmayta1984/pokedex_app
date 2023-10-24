import 'package:pokedex_app/databases/pokemon_database.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:sqflite/sqflite.dart';

class PokemonRepository {
  Future insert(Pokemon pokemon) async {
    Database db = await PokemonDatabase().openDb();
    db.insert(PokemonDatabase().tableName, pokemon.toMap());
  }

  Future delete(Pokemon pokemon) async {
    Database db = await PokemonDatabase().openDb();
    db.delete(PokemonDatabase().tableName,
        where: "id=?", whereArgs: [pokemon.id]);
  }

  Future<bool> isFavorite(Pokemon pokemon) async {
    Database db = await PokemonDatabase().openDb();
    final maps = await db.query(PokemonDatabase().tableName,
        where: "id=?", whereArgs: [pokemon.id]);
    return maps.isNotEmpty;
  }

  Future<List<Pokemon>> getAll() async {
    Database db = await PokemonDatabase().openDb();
    final maps = await db.query(PokemonDatabase().tableName);
    return maps.map((map) => Pokemon.fromMap(map)).toList();
  }
}
