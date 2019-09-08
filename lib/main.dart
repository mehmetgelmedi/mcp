import 'package:flutter/material.dart';
import 'package:mcp/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mcp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Helvetica',
      ),
      home: Routes.getMainPage(),
      routes: Routes.routes,
    );
  }
}
