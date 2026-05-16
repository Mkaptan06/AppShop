import 'package:flutter/material.dart';
import 'package:moblil_app/components/product_cart.dart';
import 'package:moblil_app/models/product_model.dart';
import 'package:moblil_app/services/api_services.dart';
import 'package:moblil_app/views/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;
  List<Data> allProducts = [];
  ApiServices apiServices = ApiServices();
  String errorMessage = "";
  Set<int> cartIds = {};

  Future<void> loadProduct() async {
    try {
      setState(() {
        isLoading = true;
      });

      final ProductModel = await apiServices.fetchProducts();

      setState(() {
        allProducts = ProductModel.data ?? [];
        isLoading = false;
      });
    } catch (e) {
      errorMessage = "Hata oluştu!";
    }
  }

  @override
  void initState() {
    loadProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Shop',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
                  ),

                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.shopping_basket),
                    iconSize: 32,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            products: allProducts,
                            cartids: cartIds,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 8),

              const Text(
                'Start your shopping journey.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search products',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/banner.png",
                  width: double.infinity,
                  height: 80,
                  fit: BoxFit.fitWidth,
                ),
              ),

              SizedBox(height: 16),

              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: allProducts.length,
                        itemBuilder: (context, index) {
                          final product = allProducts[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: {
                                  'product': product,
                                  'cartIds': cartIds,
                                },
                              );
                            },

                            child: ProductCard(product: product),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
