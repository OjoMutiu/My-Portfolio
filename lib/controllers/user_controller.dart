import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class UserController extends GetxController{

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userWebAddressController = TextEditingController();
  TextEditingController userHowCanIController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  //get portfolio projects
  Future<void> getPortfolioProjects() async{
    print("here in get portfolio");
    var projects  = firestore.collection("projects");
    try{
      QuerySnapshot snapshot = await projects.get();

      if (snapshot.docs.isEmpty) {
        print("No projects found.");
        return;
      }

      var data = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      print("Fetched ${data.length} project(s)");
      print("Data is $data");

    }catch (e){
      debugPrint("error is ${e.toString()}");
    }
  }

  //get portfolio resume
  Future<void> getPortfolioResume() async{
    print("here in get portfolio");
    var projects  = firestore.collection("projects");
    try{
      QuerySnapshot snapshot = await projects.get();

      if (snapshot.docs.isEmpty) {
        print("No projects found.");
        return;
      }

      var data = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      print("Fetched ${data.length} project(s)");
      print("Data is $data");

    }catch (e){
      debugPrint("error is ${e.toString()}");
    }
  }

  //download portfolio resume
}