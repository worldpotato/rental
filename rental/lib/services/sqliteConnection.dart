import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class SqliteConnection{

  Database db;
  //open a new database connection
  Future open() async {
    //specify a path where the database should be stored
    var databasePath = await getDatabasesPath(); //system specific! (automatically)
    var path = join(databasePath, 'rental.db');
    //try to open the database, if it does not exist create it
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
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