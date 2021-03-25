

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{

  //Inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();

  Firestore db = Firestore.instance;



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

