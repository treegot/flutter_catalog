import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'dart:convert';
import 'package:flutter_catalog/widgets/item_widget.dart';
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
      appBar: AppBar(
        title: Text("Catelog App",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(       // here we are loding all product detail in home screen with help of ListView
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items!= null && CatalogModel.items.isNotEmpty)
            ?GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,

        ),
          itemBuilder: (context,index){
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: GridTile(
                    header: Container(child: Text(item.name,style: TextStyle(color: Colors.white),),
                    padding:const EdgeInsets.all(12),
                      decoration: BoxDecoration(

                        color: Colors.deepPurple
                      ),

                    ),
                      child:  Image.network(item.image),
                  footer: Text(item.price.toString()

                  ),

                  ));

          },
          itemCount: CatalogModel.items.length,

        )
            



            :Center(child: CircularProgressIndicator()
          ,),
      ),
      drawer: MyDrawer(),
    );
  }

}