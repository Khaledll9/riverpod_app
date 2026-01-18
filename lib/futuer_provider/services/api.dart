import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_app/futuer_provider/models/user.dart';

class Api {
  String endPoint = 'https://reqres.in/api/users?page=1';

  Future<List<User>> getUser() async {
    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => User.formJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
