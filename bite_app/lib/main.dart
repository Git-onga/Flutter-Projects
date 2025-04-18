import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const BiteApp());
}

class BiteApp extends StatelessWidget {
  const BiteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const  SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => const HomeScreen()
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 14, 6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bite',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Home page
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.settings)
        ],
        title: Text(
          'Bite',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            fontStyle: FontStyle.italic
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/ugali beef.jpeg'),
                    fit: BoxFit.cover 
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.amber
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '50%',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('off- Today only',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ))
            ],
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                  },
                  label: Text(
                    'Fast Food',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color.fromARGB(255, 125, 14, 6),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                  },
                  label: Text(
                    'Main Meals',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color.fromARGB(255, 125, 14, 6),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                  },
                  label: Text(
                    'Vegiterian',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color.fromARGB(255, 125, 14, 6),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                  },
                  label: Text(
                    'Drinks',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color.fromARGB(255, 125, 14, 6),
                )
              ],
            ),
          ),
         Positioned(
          width: double.infinity,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 200,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.amber,  
                ),
                child: Image.asset('assets/images/Burgers.jpeg'),
              ),
              Container(
                height: 200,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Image.asset('assets/images/Baked Potato Slices.jpeg'),
              ),

            ]
          ),
        )
      ],
        
      ),
      bottomNavigationBar: NavigationBar(
        destinations:  [
          NavigationDestination(
            icon: Icon(Icons.home), 
            label: 'Home'
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart), 
            label: 'Cart'
          ),
          NavigationDestination(
            icon: Icon(Icons.person), 
            label: 'Profile'
          ),
        ],
        onDestinationSelected: (int value) {
        },
      )
    );
  }
}
