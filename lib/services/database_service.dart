import 'package:my_todo_app/model_data/task_list_model.dart';
import 'package:my_todo_app/model_data/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  //Table name & its respective column names:
  final String _tasksTableName = 'tasks';
  final String _tasksIdColoumName = 'id';
  final String _tasksContentColoumName = 'content';
  final String _tasksStatusColoumName = 'status';

  //private constructor:
  DatabaseService._constructor();

  //Singleton Object of our class:
  static final DatabaseService instance = DatabaseService._constructor();

  //making variable of type database to hold our database reference:
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await getDatabase();
      return _db!;
    }
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    //Full database path = databaseDirPath + name of our database:
    final databasePath = join(databaseDirPath, "master_db.db");
    //Now Creating a database:
    final database = await openDatabase(
      version: 1,
      databasePath,
      onCreate: (db, version) {
        db.execute('''
        Create table $_tasksTableName (
        $_tasksIdColoumName INTEGER PRIMARY KEY autoincrement , 
        $_tasksContentColoumName TEXT NOT NULL, 
        $_tasksStatusColoumName INTEGER NOT NULL )
        ''');
      },
    );
    return database;
  }

  void addTask(String taskContent) async {
    final db = await database;
    await db.insert(
      _tasksTableName,
      {
        _tasksContentColoumName: taskContent,
        _tasksStatusColoumName: 0,
      },
    );
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final data = await db.query(_tasksTableName);
    List<Task> ToDOs = data
        .map(
          (e) => Task(
              content: e["content"] as String,
              id: e["id"] as int,
              status: e["status"] as int),
        )
        .toList();
    return ToDOs;
  }
}
