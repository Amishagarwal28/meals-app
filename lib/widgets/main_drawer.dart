import 'package:flutter/material.dart';
import 'package:flutter5_responsive/screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title,IconData icon,Function tapHAndler)
  {
    return ListTile(
          leading: Icon(icon, size: 26),
          title: Text(title,
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w700,
                  fontSize: 24)),
          onTap:tapHAndler   ,     
        );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking up....',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        _buildListTile('Meals',Icons.restaurant,(){
          Navigator.of(context).pushReplacementNamed('/');
        }),
        _buildListTile('Filters',Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
      ]),
    );
  }
}
