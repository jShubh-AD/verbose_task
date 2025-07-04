
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:verbose_task/category/data/venders/venders_model.dart';
import 'package:verbose_task/core/http/api_constants.dart';

class VendorDatasource {
  Future<List<Datum>> getVendors() async {
    final String url = EndPoints.venders.baseUrl();
    final response = await http.get(Uri.parse(url));
    print('[VendorDatasource] GET $url  →  ${response.statusCode}');

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch vendors – HTTP ${response.statusCode}');
    }

    final Map<String, dynamic> jsonMap =
    jsonDecode(response.body) as Map<String, dynamic>;

    final List<dynamic> rawList = jsonMap['data'] as List<dynamic>? ?? [];

    final List<Datum> vendors = rawList
        .map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList();

    print('[VendorDatasource] Parsed ${vendors.length} vendors');
    return vendors; // ← List<Datum>
  }
}
