import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  //private constructor:
  DatabaseService._constructor();

  //Singleton Object of this class:
  static final DatabaseService instance = DatabaseService._constructor();

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    //Full database path = databaseDirPath + name of our database:
    final databasePath = join(databaseDirPath, "master_db.db");
    //Now Creating a database:
    final database = await openDatabase(
      databasePath,
      onCreate: (db, version) {
        db.execute('''
        ''');
      },
    );
  }
}
