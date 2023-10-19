import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PokemonDatabase {
  final int version = 1;
  final String databaseName = "pokedex.db";
  final String tableName = "pokemons";

  Database? db;

  Future<Database> openDb() async {
    db ??= await openDatabase(join(await getDatabasesPath(), databaseName),
        onCreate: (database, version) {
      database.execute("create table $tableName (id integer primary key)");
    }, version: version);
    return db as Database;
  }
}
