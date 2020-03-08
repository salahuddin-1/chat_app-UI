//---- Class for search button
import 'package:calculator_app/screens/home_screen.dart';
import 'package:calculator_app/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      appBar: AppBar(
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          color: Colors.brown,),

        backgroundColor: Colors.white,
        title:  TextField(

          // For auto-capitalisation the Text at start
          textCapitalization: TextCapitalization.sentences,
          onChanged: (value) {},
          decoration: InputDecoration.collapsed(
            hintText: "Search...",
            hintStyle: TextStyle(
              fontSize: 18.0,

            )
            
            ),
        
        ),
      
      
    )
    
    );
  }
}