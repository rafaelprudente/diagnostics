import 'package:diagnostics/repositories/doctors_repository.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController {
  final doctorsRepository = DoctorsRepository();
  var resultNameSuggestions = <String>[].obs;

  setResultNameSuggestions(List<String> results) {
    resultNameSuggestions.assignAll(results);
    update();
  }

  getNameSuggestions(String partName) => doctorsRepository.getNameSuggestions(partName);
}
