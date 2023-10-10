import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingScreen(),
    );
  }
}

class ShoppingScreen extends StatelessWidget {
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 50,
              ),
              FloatingActionButton(
                backgroundColor: Colors.white,
                elevation: 0,
                onPressed: () {},
                child: Icon(Icons.search,color: Colors.black, size: 30,),
              ),
              Row(
                children: [
                  Text(
                    ' My Bag',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ShoppingItem(
                title: 'Pullover',
                subtitle: 'Description of Product 1',
                color: 'Black',
                size: 'L',
                price: 20,
              ),
              ShoppingItem(
                title: 'T-Shirt',
                subtitle: 'Description of Product 2',
                color: 'Green',
                size: 'M',
                price: 15,
              ),
              ShoppingItem(
                title: 'Sport Dress',
                subtitle: 'Description of Product 3',
                color: 'Pink',
                size: 'XL',
                price: 35,
              ),
              SizedBox(height: 250),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Total Amount: ',
                    style: TextStyle(color: Colors.black38, fontSize: 12),
                  ),
                  SizedBox(
                    width: 220,
                  ),
                  Text(
                    '120 \$',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.red,
                  minimumSize: Size(370, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Text('Congratulations! Checkout successful.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text('CHECK OUT'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class ShoppingItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String color;
  final String size;
  final int price;

  ShoppingItem({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.size,
    required this.price,
  });

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  int itemCount = 0;

  void increment() {
    setState(() {
      itemCount++;
    });
  }

  void decrement() {
    setState(() {
      if (itemCount > 0) {
        itemCount--;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            elevation: 10,
            child: ListTile(
              leading: Image.asset('image/pullover.jpeg',
                width: 80,
                fit: BoxFit.cover,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(children: [
                    Text(
                      'Color: ',
                      style: TextStyle(color: Colors.black38, fontSize: 12),
                    ),
                    Text(
                      widget.color,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Size: ',
                      style: TextStyle(color: Colors.black38, fontSize: 12),
                    ),
                    Text(
                      widget.size,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ])
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: increment,
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        mini: true,
                      ),
                      SizedBox(width: 5),
                      Text('$itemCount',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: decrement,
                        child: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                        mini: true,
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.more_vert),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${(widget.price * itemCount)} \$',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}