// ignore_for_file: unused_import

import 'package:flutter/material.dart'; // this is allows me to use material design
import './random_words.dart';

// now the main function the entrie point to the app

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: RandomWords()
    );
  }
}





// here what i did
// it just each app has a main function it"s the entrie point to the application
// i create the MyApp because it the class that my entrie function returns
// to create a Text first you define a proprety home then you create an instance
//of the Text Class that contains many methods including  the style just by typing
//style and create an instance from the class TextStyled and pass the your style as a parameter

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home:Text("hello world",style:TextStyle(  // here where i pass my css for a text widget
//         fontSize: 30,
//         color:Colors.white70,
//       ))
//     );
//   }
// }