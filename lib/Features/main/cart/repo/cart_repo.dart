import 'dart:convert';

import 'package:e_commerce_app/Features/main/cart/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  static const String cartKey = "cart";
Future<List<CartModel>> getCartProducts() async {
  final prefs = await SharedPreferences.getInstance();

  final data = prefs.getString(cartKey);

  if (data == null) {
    return [];
  }

  final List decoded = jsonDecode(data);

  return decoded
      .map((e) => CartModel.fromJson(e))
      .toList();
}Future<void> addToCart(CartModel product) async {
  final prefs = await SharedPreferences.getInstance();

  List<CartModel> cart = await getCartProducts();

  final index = cart.indexWhere((e) => e.id == product.id);

  if (index != -1) {
    cart[index].quantity++;
  } else {
    cart.add(product);
  }

  await prefs.setString(
    cartKey,
    jsonEncode(
      cart.map((e) => e.toJson()).toList(),
    ),
  );
}

Future<void> removeFromCart(int id) async {
  final prefs = await SharedPreferences.getInstance();

  List<CartModel> cart = await getCartProducts();

  cart.removeWhere((e) => e.id == id);

  await prefs.setString(
    cartKey,
    jsonEncode(
      cart.map((e) => e.toJson()).toList(),
    ),
  );
}
Future<void> updateQuantity(int id, int quantity) async {
  final prefs = await SharedPreferences.getInstance();

  List<CartModel> cart = await getCartProducts();

  final index = cart.indexWhere((e) => e.id == id);

  if (index != -1) {
    cart[index].quantity = quantity;

    await prefs.setString(
      cartKey,
      jsonEncode(
        cart.map((e) => e.toJson()).toList(),
      ),
    );
  }
}
}