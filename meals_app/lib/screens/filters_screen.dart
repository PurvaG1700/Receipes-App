import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function saveFilters;
  final Map<String, bool> createdFilters;
  FilterScreen(this.createdFilters,this.saveFilters);
  

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactose = false;
  
  @override
  void initState() {
    // TODO: implement initState
    _glutenFree= widget.createdFilters['gluten'];
    _lactose= widget.createdFilters['lactose'];
    _vegan= widget.createdFilters['vegan'];
    _vegeterian= widget.createdFilters['vegetarian'];


    super.initState();
  }

  
  Widget _buildSwitch(
    bool value,
    String titleText,
    String subtileText,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(titleText),
      value: value,
      subtitle: Text(
        subtileText,
        style: TextStyle(
            color: Colors.grey[800], fontSize: 14, fontWeight: FontWeight.bold),
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactose,
                'vegan': _vegan,
                'vegetarian': _vegeterian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitch(
                  _glutenFree,
                  'Gluten Free',
                  'Only include gluten free',
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitch(
                  _lactose,
                  'Lactose Free',
                  'Only include lactose free',
                  (newValue) {
                    setState(() {
                      _lactose = newValue;
                    });
                  },
                ),
                _buildSwitch(
                  _vegeterian,
                  'Vegeterain',
                  'Only include vegeterian meals',
                  (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  },
                ),
                _buildSwitch(
                  _vegan,
                  'Vegan',
                  'Only include vegan meals',
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
