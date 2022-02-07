import 'package:flutter/material.dart';
import 'package:meal_app/models/filter.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  Filter selectedFilters;
  Function setFilters;

  FiltersScreen(
      {Key? key, required this.selectedFilters, required this.setFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.selectedFilters.glutenFree;
    _lactoseFree = widget.selectedFilters.lactoseFree;
    _isVegan = widget.selectedFilters.isVegan;
    _isVegetarian = widget.selectedFilters.isVegetarian;
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subTitle, bool value, Function(bool value) update) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: value,
        onChanged: update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                Filter updatedFilter = Filter(
                    glutenFree: _glutenFree,
                    isVegan: _isVegan,
                    lactoseFree: _lactoseFree,
                    isVegetarian: _isVegetarian);
                widget.setFilters(updatedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Text(
              'Adjust your filters',
              style: Theme.of(context).textTheme.headline6,
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          buildSwitchListTile(
              'Gluten-free', 'Gluten free meals only', _glutenFree, (value) {
            setState(() {
              _glutenFree = value;
            });
          }),
          buildSwitchListTile(
              'Lactose-free', 'Lactose free meals only', _lactoseFree, (value) {
            setState(() {
              _lactoseFree = value;
            });
          }),
          buildSwitchListTile('Vegan', 'Vegan meals only', _isVegan, (value) {
            setState(() {
              _isVegan = value;
            });
          }),
          buildSwitchListTile(
              'Vegetarian', 'Vegetarian meals only', _isVegetarian, (value) {
            setState(() {
              _isVegetarian = value;
            });
          }),
        ],
      ),
    );
  }
}
