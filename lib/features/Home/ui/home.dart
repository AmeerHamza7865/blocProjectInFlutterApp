// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text("Glosery App",style: TextStyle(color: Colors.white),),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.blue.shade400,
      
      ),
      body: Center(
        child: Text("Welcome To Bloc "),
      ),
    );
  }
}