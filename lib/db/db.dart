import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class Wallet{
  final String creditCard;
  final String address;
  final String cryptocurrency;
  Wallet({this.creditCard, this.address, this.cryptocurrency});

  Map<String, dynamic> toMap() {
    return {
      'creditCard': creditCard,
      'address': address,
      'cryptocurrency': cryptocurrency,
    };
  }
}
class WalletDatabase{
  final Database database;
  final Function wallets;
  final Function insertWallet;
  WalletDatabase({this.database, this.wallets, this.insertWallet});
}

Future<WalletDatabase> initializeDb() async {
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final Database database = await openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'crypto_exchange.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        "CREATE TABLE wallets(creditCard TEXT NOT NULL, address TEXT PRIMARY KEY, cryptocurrency TEXT NOT NULL);",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  Future<void> insertWallet(Wallet wallet) async {
    // Get a reference to the database.
    final Database db = database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'wallets',
      wallet.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Wallet>> wallets(String creditCardId) async {
    // Get a reference to the database.
    final Database db = database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('wallets', where: "creditCard = ?", whereArgs: [creditCardId]);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Wallet(
        creditCard: maps[i]['creditCard'],
        address: maps[i]['address'],
        cryptocurrency: maps[i]['cryptocurrency'],
      );
    });
  }
  return WalletDatabase(database: database, wallets: wallets, insertWallet: insertWallet);
}