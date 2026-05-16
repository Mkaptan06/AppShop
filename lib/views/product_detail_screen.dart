import 'package:flutter/material.dart';
import 'package:moblil_app/models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Set<int>? localCartIds;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Data product = args['product'] as Data;

    localCartIds ??= args['cartIds'] as Set<int>;

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text("Back"),
        backgroundColor: Colors.grey.shade400,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image ?? "",
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                Text(
                  product.name ?? "",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 4),

                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  product.description ?? "",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.grey.shade800,
                  ),
                ),

                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      localCartIds!.add(product.id ?? 0);
                    });

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Added to Cart")));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(179, 118, 113, 113),
                    minimumSize: Size.fromHeight(50),
                  ),
                  child: Text(
                    "Buy now for ${product.price}",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
