import 'package:calculator_app/models/message_model.dart';
import 'package:calculator_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(

    // Container for the recent chats
              child: Container(
                height:100.0,             
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                      )  
                    ),

      
      //To clip the list with rounded borders
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),

    // ---------List starts here --------------                
                  child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message chat = chats[index];

    //  Starting Row i.e Row1              
                    return GestureDetector(

               // on tap function to navigate to the next screen which is chat screen
                      onTap: () => Navigator.push(context,
                       MaterialPageRoute(
                         builder: (_) => ChatScreen(
                           user: chat.sender,
                         ) )
                         ),
                      
                        child: Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(

              // if chat.unread is true return color(0xFFFFEFEE) ,if false return white color
                          color: chat.unread? Color(0xFFFFEFEE): Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            ),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

    // Row inside row i.e Row2                  
                            Row(                        
                              children: <Widget>[    
                                CircleAvatar(
                                  radius: 35.0,
                                  backgroundImage: AssetImage(chat.sender.imageUrl),
                                  ),

    // To provide space between widgets
                            SizedBox(width: 10.0),
                                  
     // Column inside first Row i.e Row1    (sender name)                
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      chat.sender.name,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold
                                      ),
                                        ),

                                    SizedBox(height: 5.0),
                                        
                                    Container(
                                      // You can give this width also that i have commented                 
                                        //color: Colors.blue,
                                        //width: 180,

                                      // (chat message)           
                                        width: MediaQuery.of(context).size.width * 0.45,                                  
                                        child: Text(
                                          chat.text,
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                  ],
                                ),
                                ]),

      // 2 Column inside first Row   

                                // (chat.time) Time                 
                                Column(children: <Widget>[
                                  Text(chat.time,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  )),

                              //  SizedBox for space between widgts
                                  SizedBox(height: 5.0),

                                // (NEW) New
                // checking if check unread, if true return container if false return empty Tex("")                                              
                      chat.unread? Container(
                                    width: 40.0,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    alignment: Alignment.center,                                                                  
                                    child: Text("NEW",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9.0
                                      ),
                                    ),
                                  )
                                
                             //   returning empty Text("")
                                  : Text(""),
                                  
                                ],
                              )
                            ],                
                          ),
                        ),
                    );
                    }
                  ),
                ),
              )
            );
      
   
  }
}