import 'dart:convert';

import 'package:http/http.dart';

class NetworkOps {
  final String url;
  NetworkOps({this.url});

  Future getData() async {
    Response res = await get(url);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return data;
    } else {
      print(res.statusCode);
    }
  }
}
