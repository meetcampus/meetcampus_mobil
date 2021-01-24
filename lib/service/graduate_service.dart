import 'package:http/http.dart' as http;
import 'package:meetcampus_mobil/model/graduate_model.dart';
import 'dart:async';
import 'dart:convert';

class GraduateService {
  Future<GraduateModel> getGraduatesData() async {
    final response = await http.get('http://cihatkaraboga.com/graduates.json');
    final mapJson = json.decode(response.body);
    final graduatePost = GraduateModel.fromJson(mapJson);
    return graduatePost;
  }
}
