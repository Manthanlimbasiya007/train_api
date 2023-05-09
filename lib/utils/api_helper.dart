import 'dart:convert';
import 'package:http/http.dart' as http;
import '../screen/model/home_model.dart';

class ApiHelper {
  Future<List> TrainApicall() async {
    String apilink = "https://trains.p.rapidapi.com";
    Uri url = Uri.parse(apilink);

    Map m1 = {"search": "Rajdhani"};
    var json = jsonEncode(m1);

    var response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'X-RapidAPI-Key': '44c0acb7cfmsha67fcde9edf72ecp181066jsn97b1ad303826',
        'X-RapidAPI-Host': 'trains.p.rapidapi.com'
      },
      body: json,
    );
    var json1 = jsonDecode(response.body);

    List trainjsonList = json1.map((e) => TrainModel.fromJson(e)).toList();
    return trainjsonList;
  }
}