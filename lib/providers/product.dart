import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
  });

  Future<void> toggleFavourite() async {
    final url =
        'https://flutter-shop-app-d30ff.firebaseio.com/products/$id.json';
    isFavourite = !isFavourite;
    notifyListeners();
    final response =
        await http.patch(url, body: json.encode({'isFavourite': isFavourite}));
    if (response.statusCode >= 400) {
      isFavourite = !isFavourite;
      notifyListeners();
      throw HttpException('Error! Try again later.');
    }
  }
}
