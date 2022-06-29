import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:thirty_days_workout/modals/gym_diet_modal.dart';
import 'package:thirty_days_workout/modals/gym_exercises_modal.dart';
import 'package:thirty_days_workout/modals/home_screen_modals.dart';
import 'package:thirty_days_workout/modals/weight_gain_plan_modal.dart';
import 'package:thirty_days_workout/modals/weight_loss_plan_modal.dart';

// class DbHelper {
//   Future initDb() async {
//     final dbpath = await getDatabasesPath();
//     final path = join(dbpath, "gymdb.db");

//     /// db file name

//     final exist = await databaseExists(path);
//     if (exist) {
//       // database already exists
//       // print('database already exists');
//       await openDatabase(path);
//     } else {
//       // print('creating a copy from assets');

//       try {
//         await Directory(dirname(path)).create(recursive: true);
//       } catch (_) {}
//       ByteData data = await rootBundle.load(join("assets", "gymdb.db"));
//       List<int> bytes =
//           data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//       await File(path).writeAsBytes(bytes, flush: true);
//       print('db copied');
//     }
//     await openDatabase(path, version: 1);
//   }
// }

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "gymdb.db");
    bool dbExists = await io.File(path).exists();

    if (!dbExists) {
      if (kDebugMode) {
        print('Read Db File');
      }
      ByteData data = await rootBundle.load(join("assets", "gymdb.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(path).writeAsBytes(bytes, flush: true);
    }
    var theDb = await openDatabase(path, version: 1);
    return theDb;
  }

  /// Diet Screens Functions ///
  ///
  /// Gym Diet Plan Days List Get
  Future<List<gymDietPlanModal>> getGymDietPlan() async {
    var dbClient = await db;
    List<Map> list =
        await dbClient!.rawQuery('select * from seven_day_gym_diet_plan');
    List<gymDietPlanModal> listOfGymDietPlan = [];
    for (int i = 0; i < list.length; i++) {
      listOfGymDietPlan.add(gymDietPlanModal(
        list[i]["Day"],
      ));
    }
    return listOfGymDietPlan;
  }

  /// Read Per Day Data of Gym Diet Plan
  Future<List<perDayGymDietPlanModal>> perDayGymDietDataFetch(
      int daynumber) async {
    // print('enter in per day fetch');
    var dbClient = await db;
    int daynumberhere = daynumber;
    List<Map> list = await dbClient!.rawQuery(
        'select * from seven_day_gym_diet_plan WHERE day = $daynumberhere');
    List<perDayGymDietPlanModal> listOfGymDietPlan = [];
    listOfGymDietPlan.add(perDayGymDietPlanModal(
      list[0]["Day"],
      list[0]["Breakfast"],
      list[0]["Lunch"],
      list[0]["Pre Workout Snack"],
      list[0]["Dinner (Post Workout Snack)"],
    ));
    // print(listOfGymDietPlan);
    return listOfGymDietPlan;
  }

  /// Weight Gain Diet Plan Days List Get
  Future<List<weightGainDietPlanModal>> getweightGainDietPlan() async {
    var dbClient = await db;
    List<Map> list =
        await dbClient!.rawQuery('select * from seven_day_weight_gain_diet');
    List<weightGainDietPlanModal> listOfWeightGainDietPlan = [];
    for (int i = 0; i < list.length; i++) {
      listOfWeightGainDietPlan.add(weightGainDietPlanModal(
        list[i]["Day"],
      ));
    }
    return listOfWeightGainDietPlan;
  }

  /// Read Per Day Data of WeightGain Diet Plan
  Future<List<perDayWeightGainDietPlanModal>> perDayWeightGainDataFetch(
      int daynumber) async {
    // print('enter in per day fetch');
    var dbClient = await db;
    int daynumberhere = daynumber;
    List<Map> list = await dbClient!.rawQuery(
        'select * from seven_day_weight_gain_diet WHERE day = $daynumberhere');
    List<perDayWeightGainDietPlanModal> listOfWeightGainDietPlan = [];
    listOfWeightGainDietPlan.add(perDayWeightGainDietPlanModal(
      list[0]["Day"],
      list[0]["Breakfast"],
      list[0]["Lunch"],
      list[0]["Dinner"],
      list[0]["Supper/Dessert"],
      list[0]["Snacks"],
    ));
    // print(listOfGymDietPlan);
    return listOfWeightGainDietPlan;
  }

  /// Weight Loss Plan Days List Get
  Future<List<weightLossPlanModal>> getweightLossPlan() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('select * from WeightLoss');
    List<weightLossPlanModal> listOfWeightLossDietPlan = [];
    for (int i = 0; i < list.length; i++) {
      listOfWeightLossDietPlan.add(weightLossPlanModal(
        list[i]["DAY"],
      ));
    }
    return listOfWeightLossDietPlan;
  }

  /// Read Per Day Data of Weight Loss Plan
  Future<List<perDayWeightLossPlanModal>> perDayWeightLossDataFetch(
      int daynumber) async {
    // print('enter in per day fetch');
    var dbClient = await db;
    int daynumberhere = daynumber;
    List<Map> list = await dbClient!
        .rawQuery('select * from WeightLoss WHERE DAY = $daynumberhere');
    List<perDayWeightLossPlanModal> listOfWeightLossDietPlan = [];
    listOfWeightLossDietPlan.add(perDayWeightLossPlanModal(
      list[0]["DAY"],
      list[0]["BREAKFAST"],
      list[0]["AMSNACKS"],
      list[0]["LUNCH"],
      list[0]["PMSNACKS"],
      list[0]["DINNER"],
      list[0]["PREPTIP"],
      list[0]["TOTAL"],
    ));
    // print(listOfGymDietPlan);
    return listOfWeightLossDietPlan;
  }

  /// Home Screen Functions ///
  ///
  /// Get Home Screen List
  Future<List<homeDaysModal>> gethomelist() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT  * FROM    ( SELECT  *, ROW_NUMBER() OVER (PARTITION BY day ORDER BY id) rn FROM    gym_exercise ) WHERE   rn = 1');
    List<homeDaysModal> listOfHomeDays = [];
    for (int i = 0; i < list.length; i++) {
      listOfHomeDays.add(homeDaysModal(
        list[i]["id"],
        list[i]["day"],
        list[i]["status"],
      ));
    }
    // if(kDebugMode) {
    //   print(listOfHomeDays);
    // }
    return listOfHomeDays;
  }
  /// Get Home Screen List Full Data
  Future<List<homeDaysModalFullData>> gethowmuchworkdone(int id) async {
    // if(kDebugMode) {
    //   print('enter in gethowmuchworkdone');
    // }
    var dbClient = await db;
    int idhere = id;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM gym_exercise WHERE day = (SELECT day FROM gym_exercise WHERE id = $idhere)');
    List<homeDaysModalFullData> listOfHomeDaysfulldata = [];
    for (int i = 0; i < list.length; i++) {
      listOfHomeDaysfulldata.add(homeDaysModalFullData(
        list[i]["status"],
      ));
    }
    // if(kDebugMode) {
    //   print(listOfHomeDays);
    // }
    return listOfHomeDaysfulldata;
  }
  /// Get EveryDay Exercise List
  Future<List<everyDayExerciseModal>> getEveryDayExerciselist(int daynumber) async {
    var dbClient = await db;
    int daynumberhere = daynumber;
    List<Map> list = await dbClient!.rawQuery('select * from gym_exercise WHERE DAY = $daynumberhere');
    List<everyDayExerciseModal> listOfEveryDayExercise = [];
    for (int i = 0; i < list.length; i++) {
      listOfEveryDayExercise.add(everyDayExerciseModal(
        list[i]["id"],
        list[i]["title"],
        list[i]["counts"],
        list[i]["gif"],
        list[i]["day"],
        list[i]["link"],
        list[i]["description"],
        list[i]["status"],
      ));
    }
    // if(kDebugMode) {
    //   print(listOfEveryDayExercise);
    // }
    return listOfEveryDayExercise;
  }
  Future<dynamic> updateExerciseStatus(int id, int statusupdate) async {
    var dbClient = await db;
    int idhere = id;
    List<Map> result = await dbClient!.rawQuery('UPDATE gym_exercise SET status = $statusupdate WHERE id = $idhere;');
    if(kDebugMode) {
      print(result);
    }
    return result;
  }
  /// Get Full Data to Store To Firestore
  Future<List<gymExercisesModal>> getGymExercisesFullList() async {
    // if(kDebugMode) {
    //   print('Enter in DB getGymExercisesFullList');
    // }
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT  * FROM gym_exercise');
    List<gymExercisesModal> listOfGymExercisesFullList = [];
    for (int i = 0; i < list.length; i++) {
      listOfGymExercisesFullList.add(gymExercisesModal(
        list[i]["id"],
        list[i]["status"],
      ));
    }
    // if(kDebugMode) {
    //   print('listOfGymExercisesFullList in Db Function');
    //   print(listOfGymExercisesFullList);
    // }
    return listOfGymExercisesFullList;
  }
}
