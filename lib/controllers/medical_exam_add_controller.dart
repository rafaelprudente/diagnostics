import 'package:diagnostics/controllers/doctors_rest_controller.dart';
import 'package:diagnostics/entities/doctor.dart' as entity_doctor;
import 'package:diagnostics/interfaces/i_my_all_doctors_select_field.dart';
import 'package:diagnostics/interfaces/i_my_date_input_field.dart';
import 'package:diagnostics/interfaces/i_my_file_input_field.dart';
import 'package:diagnostics/model/doctor.dart' as model_doctor;
import 'package:diagnostics/ui/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalExamAddController extends GetxController
    implements IMyAllDoctorsSelectField, IMyDateInputField, IMyFileInputField {
  String? _doctor;
  DateTime? _date;
  List<String>? _listFiles;

  @override
  String? get doctor {
    return _doctor;
  }

  @override
  set doctor(String? doctor) {
    _doctor = doctor;
  }

  @override
  DateTime? get date {
    return _date;
  }

  @override
  set date(DateTime? date) {
    _date = date;
  }

  @override
  List<String>? get listFiles {
    return _listFiles;
  }

  @override
  set listFiles(List<String>? listFiles) {
    _listFiles = listFiles;
  }

  validateForm(BuildContext context) {
    final DoctorsRestController doctorsRestController = Get.find();

    if (doctor == null) {
      Functions.showErrorMessage(context, 'Select a Doctor.');
      return;
    }

    if (date == null) {
      Functions.showErrorMessage(context, 'Select a Date.');
      return;
    } else {
      DateTime today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0, 0, 0);
      if (date!.isAfter(today)) {
        Functions.showErrorMessage(context, 'Invalid Date! It cannot be later than today.');
        return;
      }
    }

    if (listFiles!.isEmpty) {
      Functions.showErrorMessage(context, 'Select a File.');
      return;
    }

    doctorsRestController.getDoctorByKey(doctor);
    entity_doctor.Doctor entityDoctor = doctorsRestController.resultDoctor.value;

    model_doctor.Doctor modelDoctor = model_doctor.Doctor(
        crm: entityDoctor.crm,
        name: entityDoctor.name,
        status: entityDoctor.status,
        subscription: entityDoctor.subscription);

    doctorsRestController.addLocalDoctor(modelDoctor);
  }
}
