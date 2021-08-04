
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:listview_json_parse_demo/models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({ Key? key }) : super(key: key);

  static const String routeName = '/product-detail';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  
  var productName = "";
  Product? product;

  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {

    var productString = ModalRoute.of(context)?.settings.arguments as String;
    print('page 2');
    print(productString);

    var productJson = jsonDecode(productString);
    print(productJson);

    setState(() {
      
      product = Product.fromJson(productJson);
      productName = product!.name;

    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName),),
      body: Center(
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 25,),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: Text("Name : " + (product!.name) ,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                  ),
                  SizedBox(height: 25,),
                  Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text("Price : " + (product!.price.toString()),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0))
                  ),
                  SizedBox(height: 25,),
                  Container(
                      margin: EdgeInsets.all(5.0),
                      child: Text("Status : " + (product!.inventoryStatus.toString()),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0))
                  ),
                ],
              ),
          ),
      ),
    );
  }
}