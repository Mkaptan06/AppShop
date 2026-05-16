import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moblil_app/models/product_model.dart';

class ApiServices {
  Future<ProductModel> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://wantapi.com/products.php'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return ProductModel.fromJson(data);
    } else {
      throw Exception('Ürünler yüklenemedi!');
    }
  }
}
