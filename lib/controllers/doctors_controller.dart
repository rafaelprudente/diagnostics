import 'package:diagnostics/entities/doctor.dart';
import 'package:diagnostics/repositories/doctors_repository.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController {
  var resultNameSuggestions = <String>[].obs;
  var resultDoctors = <Doctor>[].obs;
  var resultDoctor = Doctor(subscription: DateTime.now(), name: '', status: '', crm: 0).obs;
  DoctorsRepository? doctorsRepository;

  setResultNameSuggestions(List<String> results) {
    resultNameSuggestions.assignAll(results);
    update();
  }

  setResultDoctors(List<Doctor> results) {
    resultDoctors.assignAll(results);
    update();
  }

  setResultDoctor(Doctor result) {
    resultDoctor = result as Rx<Doctor>;
  }

  getNameSuggestions(String partName) => DoctorsRepository.getRemoteNameSuggestions(partName);

  getDoctors(String partName) => DoctorsRepository.getRemoteDoctors(partName);

  getDoctorByKey(String key) => DoctorsRepository.getRemoteDoctorByKey(key);
}
