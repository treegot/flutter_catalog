import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_widgets.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';


void main()
{
  runApp(HomePage());

}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  void loadData()async {
    await Future.delayed(Duration(seconds: 2));
   
   final   catalogjson=  await  rootBundle.loadString("assets/files/catalog.json");   //root bundle in service library
   final decodeData= jsonDecode(catalogjson);
   final productsData =decodeData["products"];
CatalogModel.items=List.from(productsData).map<Item>((item) =>Item.fromMap(item)).toList();
setState(() {

});

  }


@override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      body:  SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),

              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16( ).expand()
              else
            CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      )
    );
  }

}





