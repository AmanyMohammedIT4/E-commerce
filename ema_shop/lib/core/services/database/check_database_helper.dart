// import 'package:ema_shop/constants.dart';
// import 'package:ema_shop/model/cart_product_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class CheckDatabaseHelper{

//   CheckDatabaseHelper._();

//   static final CheckDatabaseHelper db = CheckDatabaseHelper._();

//   static Database? _database;

//   Future<Database> get database async{
//     if(_database != null) return _database!;

//     _database= await initDb();
//     return _database!;
//   }
  
//  Future<Database> initDb() async{
//     String path = join(await getDatabasesPath(),'CartProduct.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (Database db, int version) async{
//       //write the query
//       await db.execute('''
//         CREATE TABLE $tableCartProduct (
//           $columnName TEXT NOT NULL,
//           $columnImage TEXT NOT NULL,
//           $columnPrice TEXT NOT NULL,
//           $columnQuantity INTEGER NOT NULL,
//           $columnProductId TEXT NOT NULL)
//       ''');
//     });
//   }

// Future<List<CartProductModel>> getAllProduct()async{
//    var dbClient = await database;
//    List<Map> maps = await dbClient.query(tableCartProduct);

//    List<CartProductModel> list = maps.isNotEmpty 
//     ?
//     maps.map((product) => CartProductModel.fromJson(product)).toList()
//     : [];

//     return list;
// }
//   //for insert data 
//   insert(CartProductModel model)async{
//     var dbClient = await database;

//     await dbClient.insert(
//        tableCartProduct,
//        model.toJson(),
//        conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   //for update data
//   updateProduct(CartProductModel model)async{
//     var dbClient = await database;
//     return await dbClient.update(
//       tableCartProduct,
//       model.toJson(),
//       where: '$columnProductId = ? ', whereArgs: [model.productId]
//     );
//   }
// }