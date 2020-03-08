import 'package:calculator_app/models/message_model.dart';
import 'package:calculator_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavouriteContacts extends StatefulWidget {
  @override
  _FavouriteContactsState createState() => _FavouriteContactsState();
}

class _FavouriteContactsState extends State<FavouriteContacts> {

  
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
      children: <Widget>[
       Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),

// ---------------- Row starts -----------------     
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

// Text Favourites contacts          
          Text("Favourite Contacts", 
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
            ),

// PopupButton button in the same row                   
        PopupMenuButton<int>(
          itemBuilder: (context) => [

            PopupMenuItem(
              value: 1,
              child: Text("Add a favourite contact"),
              ),

             PopupMenuItem(
              value: 2,
              child: Text("Remove a favourite contact"),
              ),
                 ],

          //initialValue: 1,
          //elevation: 8,
          //padding: EdgeInsets.symmetric(horizontal: 80.0),
          offset: Offset(5.0, 5.0),
        
          onCanceled: () {
            print("u hav canceled the menu");
          },

          onSelected: (value) {
            print("value:$value");
          },

          icon: Icon(
            Icons.more_horiz,
            size: 30.0,
            ),
          ),
          // pop menu ends here
          
        ],
      )
    ),

     Container(
      height: 120.0,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: favourites.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(

            // on tap function to navigate to the next screen which is chat screen
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (_)=> ChatScreen(
                  user: favourites[index]
                ),)),
              
            // child of Gesture Detector. Circle avatar
            child: Padding(padding: EdgeInsets.all(10.0),
              child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage(favourites[index].imageUrl),
                ),

// Sizedbox providing the gap between Circle avatar and their name
              SizedBox(height: 6.0),

// The user names
              Text(
                favourites[index].name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey
                )
              ),
              ]
              
            )),
          );
        },
      )
      ),
      ]));


   

  
      
    
  }
}