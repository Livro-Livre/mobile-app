import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:livro_livre/model/biblio_item.dart';
import 'package:livro_livre/util/marc_parser.dart';

class KohaAPI {
  static Map<String, String> headers = {};

  Future<bool> login() async {
    var url =
        Uri.http('biblioteca-intra.fac.unb.br', '/cgi-bin/koha/mainpage.pl');
    var request = http.MultipartRequest('POST', url)
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
      print("Login failed");
      return false;
    }
  }

  Future<Map<String, dynamic>> getJSON(
      String path, Map<String, String> headers) async {
    var url = Uri.http('biblioteca-intra.fac.unb.br', path);
    var response = await http.get(url, headers: headers);

    if (response.statusCode != 200) {
      bool loginStatus = await login();
      if (!loginStatus) {
        return Future.error("Login failed");
      }
      response = await http.get(url, headers: headers);
    }

    Map<String, dynamic> result = jsonDecode(response.body);
    return result;
  }

  Future<BiblioItem> getBiblioItem(String id) async {
    if (headers['cookie'] == null) {
      bool loginStatus = await login();
      if (!loginStatus) {
        return Future.error("Login failed");
      }
    }

    Map<String, String> biblioHeaders = Map.from(headers);
    biblioHeaders["Accept"] = "application/marc-in-json";

    Map<String, dynamic> item = await getJSON('/api/v1/items/${id}', headers);
    Map<String, dynamic> biblio =
        await getJSON('/api/v1/biblios/${item["biblio_id"]}', biblioHeaders);

    final BiblioItem biblioItem = BiblioItem();

    biblioItem.itemId = item["item_id"];
    biblioItem.biblioId = item["biblio_id"];
    biblioItem.itemType = item["item_type"];

    MarcParser.parseBiblio(biblioItem, biblio);

    return biblioItem;
  }
}
