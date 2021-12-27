import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
//import 'package:flutter_catalog/widgets/drawer.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
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
      backgroundColor: MyTheme.creamcolor,
      body:  SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),

              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child:CircularProgressIndicator(),)


            ],
          ),
        ),
      )
    );
  }

}



class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "trending products".text.xl2.make()


      ],
    );
  }
}
class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}


 class CatalogItem extends StatelessWidget {
  final Item catalog;
   const CatalogItem({Key? key,required this.catalog}) :assert(catalog!= null) ,super(key: key);

   @override
   Widget build(BuildContext context) {
     return  VxBox(
     child: Row(
       children: [
        CatalogImage(image: catalog.image,
        ),
         Expanded(child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
             catalog.desc.text.textStyle(context.captionStyle).make(),
             10.heightBox,
             ButtonBar(
               alignment: MainAxisAlignment.spaceBetween,
               buttonPadding: EdgeInsets.zero,
               children: [
                 "\$${catalog.price}".text.bold.xl.make(),
                 ElevatedButton(onPressed: (){},
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                       shape: MaterialStateProperty.all(StadiumBorder(),)

                     ),
                     child: "Buy".text.make())
               ],
             ).pOnly(right: 8.0)
         ],
         ))
       ],
     )
     ).white.roundedLg.square(150).make().py16();
   }
 }
 class CatalogImage extends StatelessWidget {
   const CatalogImage({Key? key,required this.image}) : super(key: key);
    final String image;
   @override
   Widget build(BuildContext context) {
     return   Image.network(image).box.rounded.p8.color(MyTheme.creamcolor).make().p16().w40(context)
     ;
   }
 }
 