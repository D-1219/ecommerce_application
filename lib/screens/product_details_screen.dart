import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String imageUrl;
  final double price;
  final String description;
  final double rating;

  const ProductDetailsScreen({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.rating,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  String selectedSize = "M";
  String selectedColor = "Black";

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void addToCart() {
    double totalPrice = widget.price * quantity;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${widget.productName} added to cart"),
        action: SnackBarAction(
          label: "VIEW CART",
          onPressed: () {
            // Navigate to CartScreen later
          },
        ),
      ),
    );

    print("Product: ${widget.productName}");
    print("Size: $selectedSize");
    print("Color: $selectedColor");
    print("Quantity: $quantity");
    print("Total: ₹$totalPrice");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to CartScreen later
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------------
            // PRODUCT IMAGE
            // -------------------------
            Container(
              width: double.infinity,
              height: 350,
              color: Colors.grey[100],

              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.contain,

                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 80,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -------------------------
                  // PRODUCT NAME
                  // -------------------------
                  Text(
                    widget.productName,

                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // -------------------------
                  // RATING
                  // -------------------------
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.green,
                        ),

                        child: Row(
                          children: [
                            Text(
                              widget.rating.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(width: 4),

                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        "120 Ratings",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // -------------------------
                  // PRICE
                  // -------------------------
                  Text(
                    "₹${widget.price.toStringAsFixed(0)}",

                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  const SizedBox(height: 15),

                  // -------------------------
                  // DESCRIPTION
                  // -------------------------
                  const Text(
                    "Description",

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    widget.description,

                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // -------------------------
                  // SIZE
                  // -------------------------
                  const Text(
                    "Select Size",

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      sizeButton("S"),
                      sizeButton("M"),
                      sizeButton("L"),
                      sizeButton("XL"),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // -------------------------
                  // COLOR
                  // -------------------------
                  const Text(
                    "Select Color",

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 10,

                    children: [
                      colorButton("Black"),
                      colorButton("White"),
                      colorButton("Blue"),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // -------------------------
                  // QUANTITY
                  // -------------------------
                  const Text(
                    "Quantity",

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      IconButton(
                        onPressed: decreaseQuantity,
                        icon: const Icon(Icons.remove_circle_outline),
                      ),

                      Text(
                        "$quantity",

                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      IconButton(
                        onPressed: increaseQuantity,
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // -------------------------
                  // TOTAL PRICE
                  // -------------------------
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text(
                          "Total Price",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "₹${(widget.price * quantity).toStringAsFixed(0)}",

                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // -------------------------
                  // ADD TO CART
                  // -------------------------
                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(
                      onPressed: addToCart,

                      icon: const Icon(Icons.shopping_cart),

                      label: const Text(
                        "ADD TO CART",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // -------------------------
                  // BUY NOW
                  // -------------------------
                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Proceeding to checkout..."),
                          ),
                        );
                      },

                      child: const Text(
                        "BUY NOW",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------
  // SIZE BUTTON
  // -------------------------

  Widget sizeButton(String size) {
    bool isSelected = selectedSize == size;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },

      child: Container(
        margin: const EdgeInsets.only(right: 10),

        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

          border: Border.all(width: 2),

          color: isSelected ? Colors.black : Colors.white,
        ),

        child: Text(
          size,

          style: TextStyle(
            fontWeight: FontWeight.bold,

            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  // -------------------------
  // COLOR BUTTON
  // -------------------------

  Widget colorButton(String color) {
    bool isSelected = selectedColor == color;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

          border: Border.all(width: isSelected ? 2 : 1),
        ),

        child: Text(color, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
