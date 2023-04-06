import 'package:dbminer2/screens/homepage.dart';
import 'package:dbminer2/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'helpers/dbhelper.dart';
import 'helpers/image_api.dart';

Future<void> main()  async {

  WidgetsFlutterBinding.ensureInitialized();

  ImageDatabaseHelper.imageDatabaseHelper.deleteAllData();

  ImageDatabaseHelper.imageDatabaseHelper
      .insertData(allImages: await ImageAPIHelper.imageAPIHelper.fetchImages());
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),

      routes: {
        '/': (context) => const splash_screen(),
      },
    ),
  );
}