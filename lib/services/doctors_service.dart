import 'package:diagnostics/model/doctor.dart';
import 'package:diagnostics/providers/doctors_provider.dart';
import 'package:get/get.dart';

class DoctorsService extends GetxService {
  DoctorsProvider doctorsProvider = DoctorsProvider();

  Future<Future<Response<List<String>>>> getSuggestions(String query) async {
    return doctorsProvider.getNameSuggestions(query);
  }

  Future<DoctorsService> init() async {
    return this;
  }
}
