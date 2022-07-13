import 'package:diagnostics/entities/doctor.dart' as entity_doctor;
import 'package:diagnostics/model/doctor.dart' as model_doctor;
import 'package:diagnostics/repositories/doctors_repository.dart';
import 'package:get/get.dart';

class DoctorsRestController extends GetxController {
  var resultNameSuggestions = <String>[].obs;
  var resultDoctors = <entity_doctor.Doctor>[].obs;
  var resultDoctor = entity_doctor.Doctor(subscription: DateTime.now(), name: '', status: '', crm: 0).obs;
  DoctorsRepository? doctorsRepository;

  setResultNameSuggestions(List<String> results) {
    resultNameSuggestions.assignAll(results);
    update();
  }

  setResultDoctors(List<entity_doctor.Doctor> results) {
    resultDoctors.assignAll(results);
    update();
  }

  setResultDoctor(entity_doctor.Doctor result) {
    resultDoctor = result as Rx<entity_doctor.Doctor>;
    update();
  }

  getNameSuggestions(String partName) => DoctorsRepository.getRemoteNameSuggestions(partName);

  getDoctors(String partName) => DoctorsRepository.getRemoteDoctors(partName);

  getDoctorByKey(String? key) => DoctorsRepository.getRemoteDoctorByKey(key);

  addLocalDoctor(model_doctor.Doctor doctor) => DoctorsRepository.addLocalDoctor(doctor);

  getLocalDoctorByName(String name) {
    return DoctorsRepository.getLocalDoctorByName(name);
  }
}
