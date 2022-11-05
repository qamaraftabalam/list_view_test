import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  Future<dynamic> generateEmployeeList() async {
    // Give your sever URL of get_employees_details.php file
    var url = "http://192.168.1.33:82/FetchDatabaseMysql/fetch.php";

    final response = await http.get(Uri.parse(url));
    var list = json.decode(response.body);
    List<Employee> employees =
    await list.map<Employee>((json) => Employee.fromJson(json)).toList();
    employeeDataSource = EmployeeDataSource(employees);
    return employees;
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
