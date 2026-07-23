import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/cart_repo.dart';
import '../model/cart_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(CartInitial());

  final CartRepo _cartRepo;

  Future<void> getCartProducts() async {
    emit(CartLoading());

    try {
      final products = await _cartRepo.getCartProducts();

      emit(CartLoaded(products));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addToCart(CartModel product) async {
    try {
      await _cartRepo.addToCart(product);

      await getCartProducts();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> removeFromCart(int id) async {
    try {
      await _cartRepo.removeFromCart(id);

      await getCartProducts();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
  Future<void> updateQuantity(int id, int quantity) async {
  await _cartRepo.updateQuantity(id, quantity);
  getCartProducts();
}
}