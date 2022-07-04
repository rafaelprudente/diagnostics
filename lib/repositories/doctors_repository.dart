import 'package:diagnostics/controllers/doctors_controller.dart';
import 'package:diagnostics/data_sources/remote/doctors_rest_client.dart';
import 'package:get/get.dart';

class DoctorsRepository {
  factory DoctorsRepository(DoctorsRestClient doctorsRestClient) {
    // TODO: implement
    throw UnimplementedError();
  }

  static void getRemoteNameSuggestions(String partName) {
    DoctorsController doctorsController = Get.find();

    Get.find<DoctorsRestClient>().getNameSuggestions(partName, 1, 100).then((response) {
      doctorsController.setResultNameSuggestions(response);
    });
  }

  static void getRemoteDoctors(String partName) {
    DoctorsController doctorsController = Get.find();

    Get.find<DoctorsRestClient>().getDoctors(partName, 1, 100).then((response) {
      doctorsController.setResultDoctors(response);
    });
  }

  static void getRemoteDoctorByKey(String key) {
    DoctorsController doctorsController = Get.find();

    Get.find<DoctorsRestClient>().getDoctorByKey(key).then((response) {
      doctorsController.setResultDoctor(response);
    });
  }
}
