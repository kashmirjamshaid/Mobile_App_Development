import 'package:flutter/material.dart';
import 'confirm.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _promocontroller = TextEditingController();

  String? _promoError;
  String _selectedSize = 'Small';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'User Input',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: _promocontroller,
              onChanged: (value) {
                setState(() {
                  if (value.contains(' ')) {
                    _promoError = "Don't use blank spaces";
                  } else {
                    _promoError = null;
                  }
                });
              },
              decoration: InputDecoration(
                hintText: 'Promo Code',
                prefixIcon: const Icon(Icons.label),
                errorText: _promoError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButton(
              value: _selectedSize,
              items: const [
                DropdownMenuItem(value: 'Small', child: Text('Small')),
                DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                DropdownMenuItem(value: 'Large', child: Text('Large')),
                DropdownMenuItem(value: 'PartySize', child: Text('PartySize')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedSize = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {

                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationScreen(
                      username: _usernameController.text,
                      size: _selectedSize,
                    ),
                  ),
                );

                if (result == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order Confirmed ')),
                  );
                }
              },
              child: const Text("Submit Order"),
            ),

          ],
        ),
      ),
    );
  }
}