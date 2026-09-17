// Cart Service - Manages shopping cart operations
class CartService {
  static final CartService _instance = CartService._internal();
  final List<Map<String, dynamic>> _cartItems = [];

  CartService._internal();

  factory CartService() {
    return _instance;
  }

  // Add item to cart
  void addItem({
    required String productId,
    required String name,
    required double price,
    required int quantity,
  }) {
    final existingIndex = _cartItems.indexWhere(
      (item) => item['productId'] == productId,
    );

    if (existingIndex >= 0) {
      _cartItems[existingIndex]['quantity'] += quantity;
    } else {
      _cartItems.add({
        'productId': productId,
        'name': name,
        'price': price,
        'quantity': quantity,
      });
    }
  }

  // Remove item from cart
  void removeItem(String productId) {
    _cartItems.removeWhere((item) => item['productId'] == productId);
  }

  // Update quantity
  void updateQuantity(String productId, int quantity) {
    final index = _cartItems.indexWhere(
      (item) => item['productId'] == productId,
    );
    if (index >= 0) {
      if (quantity > 0) {
        _cartItems[index]['quantity'] = quantity;
      } else {
        removeItem(productId);
      }
    }
  }

  // Get all cart items
  List<Map<String, dynamic>> getCartItems() => List.from(_cartItems);

  // Get cart count
  int getCartCount() {
    return _cartItems.fold(0, (sum, item) => sum + (item['quantity'] as int));
  }

  // Get cart total
  double getCartTotal() {
    return _cartItems.fold(
      0,
      (sum, item) =>
          sum + (item['price'] as double) * (item['quantity'] as int),
    );
  }

  // Clear cart
  void clearCart() {
    _cartItems.clear();
  }

  // Check if product in cart
  bool isProductInCart(String productId) {
    return _cartItems.any((item) => item['productId'] == productId);
  }
}
