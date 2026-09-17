import '../models/product.dart';

class ProductData {
  static final List<Product> products = [
    Product(
      id: 1,
      name: 'Smart Watch',
      image: 'assets/images/watch.jpg',
      price: 2499,
      description: 'Advanced fitness tracking, heart rate monitor, sleep tracking, water resistant up to 50m. Perfect for your daily activities and workouts.',
      category: 'Electronics',
      rating: 4.5,
    ),
    Product(
      id: 2,
      name: 'Running Shoes',
      image: 'assets/images/shoes.jpg',
      price: 1999,
      description: 'Lightweight and comfortable running shoes with cushioned sole. Designed for professional runners and casual joggers.',
      category: 'Shoes',
      rating: 4.3,
    ),
    Product(
      id: 3,
      name: 'Wireless Headphones',
      image: 'assets/images/headphones.jpg',
      price: 2999,
      description: 'Premium noise-cancelling wireless headphones with 30-hour battery life. Crystal clear audio quality and comfortable fit.',
      category: 'Electronics',
      rating: 4.7,
    ),
    Product(
      id: 4,
      name: 'Travel Backpack',
      image: 'assets/images/bag.jpg',
      price: 1499,
      description: 'Spacious travel backpack with multiple compartments. Water-resistant material and ergonomic design for comfortable carrying.',
      category: 'Accessories',
      rating: 4.4,
    ),
    Product(
      id: 5,
      name: 'Winter Jacket',
      image: 'assets/images/jacket.jpg',
      price: 3499,
      description: 'Warm and stylish winter jacket made from premium quality fabric. Perfect for cold weather with insulated padding.',
      category: 'Fashion',
      rating: 4.6,
    ),
    Product(
      id: 6,
      name: 'Casual T-Shirt',
      image: 'assets/images/tshirt.jpg',
      price: 499,
      description: 'Comfortable and breathable casual t-shirt in various colors. Made from 100% cotton for maximum comfort.',
      category: 'Fashion',
      rating: 4.2,
    ),
    Product(
      id: 7,
      name: 'Sunglasses',
      image: 'assets/images/sunglasses.jpg',
      price: 1299,
      description: 'Stylish UV-protected sunglasses with polarized lenses. Perfect for sunny days and beach outings.',
      category: 'Accessories',
      rating: 4.5,
    ),
    Product(
      id: 8,
      name: 'Sports Socks Pack',
      image: 'assets/images/socks.jpg',
      price: 599,
      description: 'Pack of 3 high-quality sports socks with moisture-wicking technology. Ideal for running and intense workouts.',
      category: 'Accessories',
      rating: 4.1,
    ),
  ];

  static List<Product> getProductsByCategory(String category) {
    return products.where((product) => product.category == category).toList();
  }

  static Product? getProductById(int id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<String> getCategories() {
    return products.map((p) => p.category).toSet().toList();
  }

  static List<Product> getTopRatedProducts() {
    final List<Product> sorted = List.from(products);
    sorted.sort((a, b) => b.rating.compareTo(a.rating));
    return sorted.take(6).toList();
  }

  static List<Product> searchProducts(String query) {
    return products
        .where(
          (product) =>
              product.name.toLowerCase().contains(query.toLowerCase()) ||
              product.description.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
