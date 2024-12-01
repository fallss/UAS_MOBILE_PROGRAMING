import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/add_new_poll_answer_screen_model.dart';

/// A controller class for the AddNewPollAnswerScreenPage.
///
/// This class manages the state of the AddNewPollAnswerScreenPage, including the
/// current addNewPollAnswerScreenModelObj
class AddNewPollAnswerScreenController extends GetxController {

  TextEditingController questionvalueController = TextEditingController();

  TextEditingController lamborghinivaluController = TextEditingController();

  TextEditingController toyotavalueoneController = TextEditingController();

  TextEditingController rangeroveroneController = TextEditingController();

  TextEditingController addnewoneController = TextEditingController();

  late Rx<AddNewPollAnswerScreenModel> addNewPollAnswerScreenModelObj;
  RxBool isVisible = false.obs;
  RxBool isVisibleImage  = false.obs;
  RxBool isVisibleVoting  = false.obs;
  @override
  void onClose() {
    super.onClose();
    questionvalueController.dispose();
    lamborghinivaluController.dispose();
    toyotavalueoneController.dispose();
    rangeroveroneController.dispose();
    addnewoneController.dispose();
  }
}
