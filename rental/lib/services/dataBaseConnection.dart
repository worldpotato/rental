import 'package:rental/services/sqliteConnection.dart';

/// Wrapper class for a connection to a data base.
/// For example a sqlite data base.
class DataBaseConnection {

  SqliteConnection sqliteConnection;
  DataBaseConnection(){
    sqliteConnection = SqliteConnection();
  }

  Future open() async {
    sqliteConnection.open();
  }
}