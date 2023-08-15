import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  final TextEditingController loginEmail = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();
  final TextEditingController signupPassword = TextEditingController();
  final TextEditingController signupName = TextEditingController();
  final TextEditingController signupEmail = TextEditingController();
  final TextEditingController signupNumber = TextEditingController();
  final TextEditingController signupAddress = TextEditingController();
  final TextEditingController signupBirthday = TextEditingController();

  @override
  void onClose() {
    loginEmail.dispose();
    loginPassword.dispose();
    signupPassword.dispose();
    signupName.dispose();
    signupEmail.dispose();
    signupNumber.dispose();
    signupAddress.dispose();
    signupBirthday.dispose();
    super.onClose();
  }
}
