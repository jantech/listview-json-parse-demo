import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listview_json_parse_demo/models/product.dart';
import 'dart:convert';

import 'package:listview_json_parse_demo/screens/product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({ Key? key }) : super(key: key);

  static const String routeName = '/product-list';

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  
  List<Product> products = [];

  Future<void> readJsonFile() async {

    final String response = await rootBundle.loadString('assets/products.json');
    final productData = await json.decode(response);

    var list = productData["items"] as List<dynamic>;

    setState(() {
      products = list.map((e) => Product.fromJson(e)).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products List"),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(onPressed: readJsonFile, child: Text("Load Products")),
          ),

          if (products.length > 0) 
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    margin: EdgeInsets.all(15.0),
                    color: Colors.greenAccent,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(products[index].name),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(products[index].price.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      onTap: () {
                        // print(jsonEncode(products[index]));
                        Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: jsonEncode(products[index]));
                      },
                    )
                  );
                },
              ),
            )
           else 
              Container(child: Text("No products"),)

        ],
      ),
    );
  }
}