
import 'package:calculator_app/models/message_model.dart';
import 'package:calculator_app/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

// creating a function called _buildMessage and passing new variables (Message message & bool isMe)
  _buildMessage(Message message, bool isMe) {

    final Container msg = Container(

          // Condition
          margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0), //right: 80.0),

          

          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),   

          width: MediaQuery.of(context).size.width * 0.75,   

          decoration: 
          BoxDecoration(             
            borderRadius:isMe
            ? BorderRadius.only(topLeft: Radius.circular(15.0), bottomLeft: Radius.circular(15.0))
            : BorderRadius.only(topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
            
          // Color condition
          color: isMe
          ? Theme.of(context).accentColor
          : Color(0xFFFFEFEE),
                
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[    

              // message.time      
              Text(
                message.time,
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
              ),

              // sized box for spacing
              SizedBox(height: 7.0),

              // message.text
              Text(
                message.text,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey
                ),
              ),
            ],
          ),
        );

//  Here it is returning sender.id whose id is 0 and it is returning the container which has id 0 ka components
    if (isMe) {
      return msg;
    }

//  Here it is returning the row, then in the row the first child is msg Container and then the favourite 
// buttons and it is returning the compnents of the container whose sender id is not 0
    return Row(
      children: <Widget>[
        msg,
        

//----- favourites color button beside the chats -----

        // Condition for buttons 
          IconButton(
            icon: message.isLiked
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),

        // Condition for color
            color: message.isLiked
            ? Theme.of(context).primaryColor
            : Colors.blueGrey, 
            onPressed: (){})
          ,
          
      ],
      
    );
    
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(children: <Widget>[

//The button of photo in the last
        IconButton(
          color: Colors.blueGrey,
          icon: Icon(Icons.photo), 
          onPressed: (){}
          ),

// Text field
        Expanded(child: TextField(

          // For auto-capitalisation the Text at start
          textCapitalization: TextCapitalization.sentences,
          onChanged: (value) {},
          decoration: InputDecoration.collapsed(
            hintText: "Send a message...",
            
            ),
        )
        ),

// Icon button of sending a message
        IconButton(
          color: Colors.blueGrey,
          icon: Icon(Icons.send), 
          onPressed: (){
            
          }
          ),
      ],),
    )
;  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        
        elevation: 0.0,

        // title of the app bar of users nam
        title: Text(widget.user.name),
        actions: <Widget>[

          // three dot horizontally icon button
          PopupMenuButton<int>(
          itemBuilder: (context) => [

            PopupMenuItem(
              value: 1,
              child: Text("View contact"),
              ),

             PopupMenuItem(
              value: 2,
              child: Text("Clear chat"),
              ),

              PopupMenuItem(
              value: 3,
              child: Text("Search"),
              ),

              PopupMenuItem(
              value: 4,
              child: Text("Block"),
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
            
          },

          icon: Icon(
            Icons.more_horiz,
            size: 30.0,
            ),
          ),
        ], 

        // backwords icon button
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed: (){
            Navigator.of(context).pop();
          }),   
                 
      ),

      body: GestureDetector(

        //To make the keyboard disapper by tapping on the screen
        onTap: () => FocusScope.of(context).unfocus(),

        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                  )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                  ),

                  child: ListView.builder(

                    //The list is reversed and it starts from bottom
                    reverse: true,

                    padding: EdgeInsets.only(top: 19.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {

              //      Creating variables 
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == 0;

// returning and calling a function(_buildMessage) & passing the variables we just created just above       
                      return _buildMessage(message, isMe);

                    }
                    ),
                )
                
                ),
            ),

            _buildMessageComposer(),
          ],
        ),
      )
      
      
    );
  }
}