import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/randomuser_model.dart';
import 'package:flutter/foundation.dart';

Future<RandomUser> readData() async{
  String url = "https://randomuser.me/api?results=50";

  http.Response response = await http.get(url);

  if(response.statusCode == 200){
    String body = response.body;
    return compute(randomUserFromJson, body);
  }
  else{
    throw Exception("Error while reading data");
  }
}
