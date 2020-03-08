import 'package:calculator_app/screens/search_screen.dart';
import 'package:calculator_app/widgets/category_selector.dart';
import 'package:calculator_app/widgets/favourite_contacts.dart';
import 'package:calculator_app/widgets/recent_chats.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final GlobalKey _scaffoldKey = GlobalKey();    
    
    return Scaffold(
      
      key: _scaffoldKey,

// Drawer starts here
       drawer: Drawer(    
        
        // Returning a list view
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Salahuddin Shaikh'),
              accountEmail: Text('salahudinshaikh16@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sam.jpeg'),
              ),
            ),

            // Icon New contact
            ListTile(
              leading: Icon(Icons.person, color: Colors.brown),
              title: Text(
                "New Contact",
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            //Icon group add
            ListTile(
              leading: Icon(Icons.group_add, color: Colors.brown),
              title: Text(
                "New Group",
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),

            //Icon settings
            ListTile(
              leading: Icon(Icons.settings, color: Colors.brown),
              title: Text(
                "Settings",
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),

            //Divider
            Divider(thickness: 1.0,),

            //Icon about
            ListTile(
              leading: Icon(Icons.info, color: Colors.brown),
              title: Text(
                "About",
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),

            //Icon invite friends
            ListTile(
              leading: Icon(Icons.person_add, color: Colors.brown),
              title: Text(
                "Invite Friends",
                style: TextStyle(
                    color: Colors.blueGrey, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),

// Background color of the scaffold i.e. light yellow
      backgroundColor: Theme.of(context).primaryColor,

// Appbar
      appBar: AppBar(

        title: Text(
          'Chats',
          //style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),

// Leading Icon

// Hiding the appbar shadow
        elevation: 0.0,

// Icons to the right side of the appbar
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            iconSize: 30.0,
            color: Colors.white,
          ),
        ],
      ),
      

// Body of the Scaffold
      body: Column(
        children: <Widget>[
// Calling CategorySelector
          CategorySelector(),

// Rounded Container with rounded borders
          Expanded(
              child: Container(
            height: 500.0,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),

            //    Favourites contacts calling
            child: Column(
              children: <Widget>[
                FavouriteContacts(),

//     Recent Chats calling
                RecentChats(),
              ],
            ),
          )),
        ],
      ),
      
    );
  }
}

///------ the code i copied from statck overflow for popup menu item box

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 400),
        ),
        PopupMenuButton(
          icon: Icon(Icons.settings),
          onSelected: (value) {
            debugPrint("h");
          },
          itemBuilder: (BuildContext context) {
            return Constants.choices.map((String choice) {
              return PopupMenuItem<String>(
                child: Text(choice),
                value: choice,
              );
            }).toList();
          },
        ),
      ],
    ));
  }
}

class Constants {
  static String FirstItem = 'First Item';
  static String SecondItem = 'Second Item';
  static String ThirdItem = 'Third Item';

  static List<String> choices = <String>[FirstItem, SecondItem, ThirdItem];

  // popup meny item
  //  PopupMenuButton(
  //         itemBuilder: (context){
  //           var list = List<PopupMenuEntry<Object>>();

  //           list.add(
  //             PopupMenuItem(
  //               child: Text("Setting Language"),
  //               value: 1,
  //               ),
  //           );

  //           list.add(
  //             PopupMenuDivider(
  //               height: 10,
  //             ),
  //           );

  //           list.add(
  //             CheckedPopupMenuItem(
  //               child: Text("English"),
  //               value: 2,
  //               checked: true,
  //             ),
  //           );
  //           return list;
  //                     },
  //              icon: Icon(
  //                 Icons.menu,
  //                 size: 30.0,
  //                 color: Colors.white,
  //                 ),
  //                     ),

}
