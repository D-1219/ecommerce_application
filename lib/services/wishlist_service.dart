// Wishlist Service - Manages wishlist operations
class WishlistService {
  static final WishlistService _instance = WishlistService._internal();
  final List<Map<String, dynamic>> _wishlistItems = [];

  WishlistService._internal();

  factory WishlistService() {
    return _instance;
  }

  // Add item to wishlist
  void addItem({
    required String productId,
    required String name,
    required double price,
  }) {
    if (!isProductInWishlist(productId)) {
      _wishlistItems.add({
        'productId': productId,
        'name': name,
        'price': price,
        'addedDate': DateTime.now(),
      });
    }
  }

  // Remove item from wishlist
  void removeItem(String productId) {
    _wishlistItems.removeWhere((item) => item['productId'] == productId);
  }

  // Get all wishlist items
  List<Map<String, dynamic>> getWishlistItems() => List.from(_wishlistItems);

  // Get wishlist count
  int getWishlistCount() {
    return _wishlistItems.length;
  }

  // Clear wishlist
  void clearWishlist() {
    _wishlistItems.clear();
  }

  // Check if product in wishlist
  bool isProductInWishlist(String productId) {
    return _wishlistItems.any((item) => item['productId'] == productId);
  }

  // Toggle wishlist (add if not present, remove if present)
  void toggleWishlist({
    required String productId,
    required String name,
    required double price,
  }) {
    if (isProductInWishlist(productId)) {
      removeItem(productId);
    } else {
      addItem(productId: productId, name: name, price: price);
    }
  }
}
