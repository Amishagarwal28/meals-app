import 'package:flutter/material.dart';
import 'package:flutter5_responsive/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtersScreen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _selectedFliters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(_selectedFliters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text('select your Meal',
              style: Theme.of(context).textTheme.subtitle1),
        ),
        Expanded(
            child: ListView(children: [
          _buildSwitchListTile(
              'Gluten Free', 'only include gluten-free meals', _glutenFree,
              (newvalue) {
            setState(() {
              _glutenFree = newvalue;
            });
          }),
          _buildSwitchListTile(
              'Lactose Free', 'only include lactose-free meals', _lactoseFree,
              (newvalue) {
            setState(() {
              _lactoseFree = newvalue;
            });
          }),
          _buildSwitchListTile(
              'vegan Free', 'only include vegan-free meals', _vegan,
              (newvalue) {
            setState(() {
              _vegan = newvalue;
            });
          }),
          _buildSwitchListTile('Vegetarian Free',
              'only include vegetarian-free meals', _vegetarian, (newvalue) {
            setState(() {
              _vegetarian = newvalue;
            });
          }),
        ]))
      ]),
    );
  }
}
