import 'dart:convert';

import 'package:http/http.dart' as http;

class KohaAPI {
  Map<String, String> headers = {};

  Future<bool> login() async {
    var url = Uri
        .http('biblioteca-intra.fac.unb.br', '/cgi-bin/koha/mainpage.pl');
    var request = await http.MultipartRequest('POST', url)
      ..fields['koha_login_context'] = 'intranet'
      ..fields['logout.x'] = '1'
      ..fields['userid'] = 'CEDOC'
      ..fields['password'] = '1234'
      ..fields['branch'] = 'FAC';

    var response = await request.send();

    if (response.statusCode == 200) {
      var cookie = response.headers['set-cookie'];
      if (cookie != null) {
        print(cookie);
        headers['cookie'] = response.headers['set-cookie']!;
        return true;
      }
      return false;
    } else {
      print("Deu errado");
      return false;
    }
  }

  Future<Map<String, dynamic>> getItem(int id) async {
    if (headers['cookie'] == null) {
      return Future.error('Not logged in');
    }

    var url = Uri.http('biblioteca-intra.fac.unb.br', '/api/v1/items/${id}');
    var response = await http.get(url, headers: headers);
    Map<String, dynamic> result = jsonDecode(response.body);
    return result;
  }
}