import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: 200,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: AssetImage('assets/images/Baked Potato Slices.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 5),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Golden, Crispy Seasoned Fries',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Perfectly spiced and freshly cut, these fries are the ultimate snack or side.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ksh. 300',
                    style: TextStyle(fontSize: 20, color: Colors.teal[700]),
                  ),
                  SizedBox(height: 10),
                  SizedBox(width: double.infinity, child: QuantitySelector()),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[800],
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Order', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Minus Button
        IconButton(icon: Icon(Icons.remove), onPressed: decrement),

        // Quantity Display (TextField-like box)
        Container(
          width: 40,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(quantity.toString(), style: TextStyle(fontSize: 16)),
        ),

        // Plus Button
        IconButton(icon: Icon(Icons.add), onPressed: increment),
      ],
    );
  }
}
