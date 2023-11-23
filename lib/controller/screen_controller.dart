import 'dart:convert';
//import 'dart:html';
//import 'dart:html';
//import 'dart:html';

import 'package:api_integration/model_class/model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class screen_controller with ChangeNotifier {
  ModelEmployeeApi? Responcemodel;
  List<Employee> employeelist = [];
  bool? loading;

  getemployee() async {
    loading = true;
    notifyListeners();
    final url = Uri.parse("http://3.92.68.133:8000/api/addemployee/");
    var responce1 = await http.get(url);

    if (responce1.statusCode == 200) {
      var decodedata = (jsonDecode(responce1.body));
      print(responce1.body);
      Responcemodel = ModelEmployeeApi.fromJson(decodedata);
      employeelist = Responcemodel?.employees ?? [];
    } else {
      print("failed");
    }
    loading = false;

    notifyListeners();
  }

  addemployee({required String name, required String des}) async {
    loading = true;
    notifyListeners();
    final url = Uri.parse("http://3.92.68.133:8000/api/addemployee/");
    var responce1 =
        await http.post(url, body: {"employee_name": name, "designation": des});
    if (responce1.statusCode == 200) {
      var decodedata = (jsonDecode(responce1.body));
      print(responce1.body);
      print(responce1.statusCode);
      Responcemodel = ModelEmployeeApi.fromJson(decodedata);
      employeelist = Responcemodel?.employees ?? [];
    } else {
      print("failed");
    }
    loading = false;

    notifyListeners();
    getemployee();
  }

  deleteemployee({required String id}) async {
    loading = true;
    notifyListeners();
    final Url = Uri.parse("http://3.92.68.133:8000/api/addemployee/$id/");
    var responce1 = await http.delete(Url);
    if (responce1.statusCode == 200) {
      var decodedata = (jsonDecode(responce1.body));
      print(responce1.body);
      print(responce1.statusCode);
      Responcemodel = ModelEmployeeApi.fromJson(decodedata);
      employeelist = Responcemodel?.employees ?? [];
    } else {
      print("failed");
    }
    loading = false;

    notifyListeners();
    getemployee();
  }

  updateemployee(
      {required String id,
      required String newname,
      required String des}) async {
    loading = true;
    notifyListeners();
    final Url = Uri.parse("http://3.92.68.133:8000/api/addemployee/$id/");
    var responce1 = await http
        .put(Url, body: {"employee_name": newname, "designation": des});
    if (responce1.statusCode == 200) {
      // var decodedata = (jsonDecode(responce1.body));
      print(responce1.body);
      // print(responce1.statusCode);
      // Responcemodel = ModelEmployeeApi.fromJson(decodedata);
      // employeelist = Responcemodel?.employees ?? [];
    } else {
      print("failed");
    }
    getemployee();
    loading = false;
    notifyListeners();
  }
}
