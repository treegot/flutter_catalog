import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

void main()
{
  
  runApp(LoginPage());
  
}
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name ="";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();  //can access any where it is using for associated for textbox


  MovetoHome(BuildContext context) async
  {

    if(_formkey.currentState!.validate()) {  //if current state will be true then move in home screen
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));

      await Navigator.pushNamed(context, MyRoutes.homeRoutes);
      setState(() {
        changeButton = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(             //  form is parrent so it associate with all textbox
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/hey.png",
              fit: BoxFit.cover,),
              SizedBox(
                height: 20.0,
              ),
                Text("Welcome $name",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                ),),

              SizedBox(
                height: 20.0,
              ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
               child: Column(children: [

                 TextFormField(
                   decoration: InputDecoration(
                     hintText: "Enter username",
                     labelText: "Username",

                   ),
                   validator: (value) {               // to make condition for  inputbox to  validating
                     if(value!.isEmpty)
                       {
                       return "Username can not be Empty ";

                       }

                   },


                   onChanged: (value)
                   {
                     name=value;
                     setState(() {



                     });

                   },

                 )
                 ,  TextFormField(
                   obscureText: true,
                   decoration: InputDecoration(
                     hintText: "Enter password",
                     labelText: "Password",

                   ),
                   validator: (value) {     // to make condition for  inputbox to  validating
                     if(value!.isEmpty)
                     {
                       return "Password can not be Empty ";

                     }

                    else if(value.length<6)
                     {
                       return "Password length shoul be at least 6  ";

                     }

                   },


                 ),
                 SizedBox(
                   height: 40.0,
                 ),

                 Material(
                      color: context.theme.buttonColor,
                     borderRadius: BorderRadius.circular(changeButton?50:8),
                   child: InkWell(
                     onTap: () =>MovetoHome(context),
                     child: AnimatedContainer(
                       duration: Duration(seconds: 1),
                       height: 40,
                       width: changeButton?50:130,

                       alignment: Alignment.center,
                       child:changeButton?Icon(Icons.done,
                       color: Colors.white,

                       ) :Text("Login",
                         style: TextStyle(color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 18),
                       ),

                     ),
                   ),
                 )

               // ElevatedButton(
               //   style: .styleFrom(minimumSize:Size(120, 40)),
               //     onPressed: (){
               //     Navigator.pushNamed(context, MyRoutes.homeRoutes);
               //
               //     },
               //     child: Text("Login",
               //       style:TextStyle(
               //           fontSize: 20
               //
               //     ),),)

               ],),
             )
            ],),
        ),
      )
    );
  }
}
