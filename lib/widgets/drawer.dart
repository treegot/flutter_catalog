import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
 // final ImageUrl="https://image.shutterstock.com/image-vector/businessman-icon-mens-avatar-600w-383196565.jpg";
     return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                   // decoration: BoxDecoration(color: Colors.red),
                    accountName: Text("sandip"),
                    accountEmail: Text("sandipjayaswal@gmail.com"),
                  currentAccountPicture: CircleAvatar(
             // backgroundImage: NetworkImage(ImageUrl),                        for network image in flutter
               backgroundImage: AssetImage("assets/images/sandip.jpg"),
                  ),
                )),
            ListTile(leading: Icon(

              CupertinoIcons.home,
              color: Colors.white,
            ),
             title: Text("Home",
               textScaleFactor: 1.2,
               style:TextStyle(
                 color: Colors.white,

               ),),

            ),
            ListTile(leading: Icon(

              CupertinoIcons.profile_circled,
              color: Colors.white,

            ),
              title: Text("Profile",
                textScaleFactor: 1.2,
                style:TextStyle(
                  color: Colors.white,

                ),),

            ),
            ListTile(leading: Icon(

              CupertinoIcons.mail,
              color: Colors.white,
            ),
              title: Text("E-Mail me",
                textScaleFactor: 1.2,
                style:TextStyle(
                  color: Colors.white,

                ),),

            )
          ],
        ),
      ),

    );
  }
}
