import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/screens/add%20transaction/screen_add_transactions.dart';
import 'package:money_management_app/screens/home/screen_home.dart';
import 'models/transacion/transaction_model.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId))
  {
   Hive.registerAdapter(CategoryModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId))
  {
   Hive.registerAdapter(CategoryTypeAdapter());
  }
   if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId))
  {
   Hive.registerAdapter(TransactionModelAdapter());
  }

  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:ScreenHome(),
      routes: {
        ScreenAddTransactions.routename:(ctx) => ScreenAddTransactions(),
      },
    );
  }
}


