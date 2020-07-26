import 'package:flutter/material.dart';
import 'package:burger_king/screens/homepage.dart';
import 'package:provider/provider.dart';

import 'fakedatabase/db.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FakeDB(),
        )
      ],
      child: MaterialApp(
          title: 'Burger King',
          theme: ThemeData(canvasColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: HomePage()),
    );
  }
}
