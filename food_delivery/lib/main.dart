import 'package:flutter/material.dart';

void main() =>  runApp(FoodOrderingApp());


class FoodOrderingApp extends StatefulWidget {
  const FoodOrderingApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FoodOrderingAppState createState() => _FoodOrderingAppState();
}

class _FoodOrderingAppState extends State<FoodOrderingApp> {
  List<Map<String, dynamic>> cart = [];

  final List<Map<String, dynamic>> menuItems = [
    {'name': 'Burger', 'price': 300, 'image': Icons.fastfood},
    {'name': 'Pizza', 'price': 500, 'image': Icons.local_pizza},
    {'name': 'Fries', 'price': 200, 'image': Icons.restaurant},
    {'name': 'Juice', 'price': 150, 'image': Icons.local_drink},
  ];

  void addToCart(item){
    setState(() {
      cart.add(item);
    });
  }

  void clearCart(){
    setState(() {
      cart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Food App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: HomeScreen(onStart: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => MenuScreen(
            menuItems: menuItems,
            onAdd: addToCart,
            cart: cart,
          ),
          ));
      }),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  final VoidCallback onStart;

  const HomeScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to Foodie!')),
      body: Center(
        child: ElevatedButton(
          onPressed: onStart,
          child: Text('View Menu'),
        ),
      ),
    );
  }
}


//Menu Screen
class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems;
  final Function(Map<String, dynamic>) onAdd;
  final List<Map<String, dynamic>> cart;

  const MenuScreen({super.key, required this.menuItems, required this.onAdd, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => CartScreen(cart: cart),
                ));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index){
          var item = menuItems[index];
          return ListTile(
            leading: Icon(item['image'], size: 40),
            title: Text(item['name']),
            subtitle: Text('ksh ${item['price']}'),
            trailing: ElevatedButton(
              onPressed: () => onAdd(item),
              child: Text('Add'),
            ),
          );
        },
      ),
    );
  }
}

// Cart Screen
class CartScreen extends StatelessWidget{
  final List<Map<String, dynamic>> cart;

  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    int total = cart.fold(0, (sum, item) => item['price']);
    
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
              ? Center(child: Text('Cart is Empty'))
              : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index){
                  var item = cart[index];
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text('ksh ${item['price']}'),
                  );
                },
              ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Total: ksh $total', style:TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                ElevatedButton(onPressed: cart.isEmpty
                  ? null
                  : () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => CheckoutScreen(),
                    ));
                  },
                child: Text('Checkout'),
                )
              ],
            ))
        ],
      )
    );
  }
}

// Checkout Screen
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmed')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 80, color: Colors.green,),
            SizedBox(height: 20),
            Text('Thank you for your Order!', style: TextStyle(fontSize: 20)),
            SizedBox( height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Back to Home'),
            )
          ],
        ),
      ),
    );
  }
  
}