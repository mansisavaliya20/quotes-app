import 'package:path/path.dart';
import 'package:qutoes_app/views/modals/modal_class.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  DBhelper._();
  static final DBhelper dBhelper = DBhelper._();
  Database? db;
  Future<void> initdb() async {
    var directory = await getDatabasesPath();
    String path = join(directory, 'qoutes.db');
    db = await openDatabase(path, version: 1,
        onCreate: (Database database, int ver) {
      String Query = "CREATE TABLE IF NOT EXISTS  Quotes( image BLOB NOT NULL)";
      database.execute(Query);
    });
  }

  Future<int> Insertdata() async {
    await initdb();

    String Query = "INSERT INTO Quotes(quote) VALUES(?)";
    List args = [global.quote.length];
    return await db!.rawInsert(Query, args);
  }

  Future<List> Featchdata() async {
    await initdb();
    String Query = "SELECT * FROM Quotes ;";
    List allquote = await db!.rawQuery(Query);
    List image = global.quote;

    return image;
  }

  Future<List> Fetchbg() async {
    String Query = "SELECT * FROM Quotes;";
    List q = await db!.rawQuery(Query);
    List bg = global.background;
    return bg;
  }
}
