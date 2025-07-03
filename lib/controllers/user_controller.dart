import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:portfolio/constants/app_colors.dart';
import 'package:portfolio/models/user_Model.dart';
import 'package:url_launcher/url_launcher.dart';

class UserController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userWebAddressController = TextEditingController();
  TextEditingController userHowCanIController = TextEditingController();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  //get portfolio projects
  Future<void> getPortfolioProjects() async {
    print("here in get portfolio");
    var projects = fireStore.collection("projects");
    try {
      QuerySnapshot snapshot = await projects.get();

      if (snapshot.docs.isEmpty) {
        print("No projects found.");
        return;
      }

      var data =
          snapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

      print("Fetched ${data.length} project(s)");
      //print("Data is $data");
    } catch (e) {
      debugPrint("error is ${e.toString()}");
    }
  }

  //get portfolio user
  UserModel user = UserModel();
  bool isUserLoaded = false;

  Future<void> getPortfolioUser() async {
    var users = fireStore.collection("user");
    try {
      DocumentSnapshot snapshot = await users.doc("user").get();

      if (!snapshot.exists) {
        print("No user found.");
        return;
      }
      var data = snapshot.data() as Map<String, dynamic>;
      user = UserModel.fromJson(data);
    } catch (e) {
      debugPrint("error is ${e.toString()}");
    }
    isUserLoaded = true;
    update();
  }

  // download resume
  bool isDownloadingResume = false;

  Future<String> launchResumeUrl() async {
    isDownloadingResume = true;
    update();
    if ((user.id ?? "").toString().isNotEmpty) {
      final url = Uri.parse(user.resumeUrl ?? "");
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        isDownloadingResume = false;
        update();
        return "Unable to download resume, try again with stable network";
      } else {
        isDownloadingResume = false;
        update();
        return "";
      }
    } else {
      isDownloadingResume = false;
      update();
      return "Unable to download resume, try again with stable network";
    }
  }

  // contact vai mail
  bool isSendingMail = false;
  Future<String> sendMail() async {
    isSendingMail = true;
    update();
    if (userHowCanIController.text.isNotEmpty) {
      if ((user.id ?? "").toString().isNotEmpty) {
        var message =
            "Name: ${userNameController.text}\nEmail: ${userEmailController.text}\nWebsite: ${userWebAddressController.text}\n Message:${userHowCanIController.text}";

        final Uri emailUri = Uri(
          scheme: 'mailto',
          path: user.email ?? "sourcecode.wildtech@gmail.com", // change to your email
          query: Uri.encodeFull('subject=How You Can Help Me&body=$message'),
        );

        if (!await launchUrl(emailUri, mode: LaunchMode.externalApplication)) {
          isSendingMail = false;
          update();
          return "Unable to contact Ojo, try again with stable network";
        } else {
          isSendingMail = false;
          userHowCanIController.clear();
          userWebAddressController.clear();
          userNameController.clear();
          userEmailController.clear();
          update();
          return "";
        }
      } else {
        isSendingMail = false;
        update();
        return "Unable to contact Ojo, try again with stable network";
      }
    } else {
      Get.snackbar(
        "Error",
        "One or two required fields are empty",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.blackColor,
        colorText: AppColors.white,
      );
      isSendingMail = false;
      update();
      return "";
    }
  }
}
