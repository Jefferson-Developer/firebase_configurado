import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class FirebaseExamples {

  // Metodo criado apenas para ser async e não gerar erros
  Exemplos() async{
    //Inicializar o Firebase
    WidgetsFlutterBinding.ensureInitialized();

    Firestore db = Firestore.instance;
    //----------------------------------------------

    // Atualiza os dados
    db.collection("user").document("001").updateData({
      "user": "jeffers0n2",
      "senha": "123456"
    });
    //----------------------------------------------

    // Salva dos dados
    db.collection("user").document("001").setData({
      "user": "jeffers0n2",
      "senha": "123456"
    });
    //----------------------------------------------

    // Salva com um indentificador automatico para o document
    db.collection("user").add({
      "user" : "carlos",
      "senha" : "654321"
    });
    //----------------------------------------------

    //o ADD irá retorna a referencia salva
    DocumentReference ref = await db.collection("user").add({
      "user" : "carloss",
      "senha" : "654321"
    });
    //----------------------------------------------

    // Altera passando o documentID
    db.collection("user").document("4U9Sc1VC0yyhR0RHo7kQ").setData({
      "user" : "carlos2",
      "senha" : "123"
    });
    //----------------------------------------------

    // Apagar documento
    db.collection("user").document("4U9Sc1VC0yyhR0RHo7kQ").delete();
    //----------------------------------------------

    //Recupera uma "foto" instantânea do documento
    DocumentSnapshot snapshot = await db.collection("user").document("001").get();

    // o snapshot.data irá retornar um map
    Map<String, dynamic> map = snapshot.data;

    //----------------------------------------------
    // getDocuments irá retornar todas os documentos do tipo Future QuerySnapshot
    QuerySnapshot querySnapshot = await db.collection("user").getDocuments();

    // for para percorrer os documents que irá reportar DocumentSnapshot
    for(DocumentSnapshot item in querySnapshot.documents){
      var dados = item.data;
      print("Dados: " +  dados.toString());
    }

    //-------------------------------------------------

    //Modelo de requisição para que o firebase notifique caso tenha alguma mudança
    db.collection("user").snapshots().listen(
            (snapshot) {
          for(DocumentSnapshot item in snapshot.documents){
            Map<String, dynamic> dados = item.data;
            print("Usuario atualizado: " + dados["user"]);
          }
        });
    //----------------------------------------------



  }

}