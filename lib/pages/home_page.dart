import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
void main()
{
  runApp(HomePage());

}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList= List.generate(50, (index) => CatalogModel.items[0]); //creating dummy List View
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App",style: TextStyle(color: Colors.black),),
      ),
      body: Padding(       // here we are loding all product detail in home screen with help of ListView
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(itemCount: dummyList.length,
        itemBuilder: (context, index){

            return ItemWidget(item: dummyList[index],);

        },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
