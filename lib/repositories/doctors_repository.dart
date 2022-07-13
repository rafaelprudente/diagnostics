import 'package:diagnostics/controllers/doctors_rest_controller.dart';
import 'package:diagnostics/data_sources/local/doctors_db_client.dart';
import 'package:diagnostics/data_sources/remote/doctors_rest_client.dart';
import 'package:diagnostics/model/doctor.dart' as model_doctor;
import 'package:get/get.dart';

class DoctorsRepository {
  static void getRemoteNameSuggestions(String partName) {
    DoctorsRestController doctorsController = Get.find();

    Get.find<DoctorsRestClient>().getNameSuggestions(partName, 1, 100).then((response) {
      doctorsController.setResultNameSuggestions(response);
    });
  }

  static void getRemoteDoctors(String partName) {
    DoctorsRestController doctorsController = Get.find();

    Get.find<DoctorsRestClient>().getDoctors(partName, 1, 100).then((response) {
      doctorsController.setResultDoctors(response);
    });
  }

  static void getRemoteDoctorByKey(String? key) {
    if (key != null) {
      DoctorsRestController doctorsController = Get.find();

      Get.find<DoctorsRestClient>().getDoctorByKey(key).then((response) {
        doctorsController.setResultDoctor(response);
      });
    }
  }

  static void addLocalDoctor(model_doctor.Doctor doctor) {
    Get.find<DoctorsDbClient>().insert(doctor.toMap());
  }

  static void getLocalAllDoctors() {
    Get.find<DoctorsDbClient>().getAll().then((response) {
      int a = 1;
    });
  }

  static void getLocalDoctorByName(String name) {
    String where = 'Name = ?';
    List<dynamic> whereArguments = [name];

    Get.find<DoctorsDbClient>().getWhere(where, whereArguments).then((response) {
      int a = 1;
    });
  }
}
