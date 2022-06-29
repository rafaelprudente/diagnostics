import 'package:diagnostics/controllers/doctors_controller.dart';
import 'package:diagnostics/data_sources/remote/rest_client.dart';
import 'package:get/get.dart';

class DoctorsRepository {
  void getNameSuggestions(String partName) {
    Get.find<DoctorsRestClient>().getNameSuggestions(partName, 1, 100).then((response) {
      DoctorsController doctorsController = Get.find();
      doctorsController.setResultNameSuggestions(response);
    });
  }
}
