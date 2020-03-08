import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {

  int selectedIndex = 0;
  final List<String> categories =  ['Messages', 'Online', 'Groups', 'Requests'];
  @override
  Widget build(BuildContext context) {
    return  Container(
          height: 90.0,
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context , int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },

                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 30.0

                  ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    
          // if index == selected index return white color ,if false return white70
                    color: index == selectedIndex ? Colors.white : Colors.white70,
                     
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.2,

                  ),),
                ));
            },
            ),
          );
      
    
  }
}