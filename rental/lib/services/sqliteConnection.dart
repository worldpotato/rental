import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// A class to represent the connection to a sqlite database.
class SqliteConnection{

  Database _db;

  set db(Database value) {
    _db = value;
  }

  SqliteConnection();

  /// Tries to open the database if it does not exist, create it.
  Future open() async {
    //specify a path where the database should be stored
    var databasePath = await getDatabasesPath(); //system specific! (automatically)
    var path = join(databasePath, 'rental.db');
    //try to open the database, if it does not exist create it
    _db = await openDatabase(path, version: 1,
        onCreate: (Database _db, int version) async {
          await _db.execute(
              '''
            create table items ( 
              itemId integer primary key, 
              itemName text not null,
              itemDescription text not null,
              itemStatus text not null,
              itemOwner text not null)
          '''
          ); //just as a note $variableName is the same like "String " + variableName.toString() + " other String"
        }
    );
  }
}