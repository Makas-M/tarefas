import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchQueryController = TextEditingController();

  final List<String> _items = [];
  void _addItem() {
    setState(() {
      _items.add(_searchQueryController.text);
    });
  }

  void _clearText() {
    setState(() {
      _searchQueryController.clear();
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  //trocar de cor do icon de tarefa concluida ou pendente
  bool _isIconSelected = false;

  void _toggleIconSelection(int index) {
    setState(() {
      _isIconSelected = !_isIconSelected;
    });
  }

  void dispose() {
    _saveData();
    super.dispose();
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_items as String, '');
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_items as String);
    if (value != null) {
      // fazer algo com o valor recuperado
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: _searchQueryController,
              decoration: InputDecoration(
                hintText: 'Adicionar Tarefa',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                suffixIcon: InkWell(
                  onTap: () {
                    _addItem();
                    _clearText();
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              _items[index],
              style: const TextStyle(color: Colors.black),
            ),
            leading: const Icon(Icons.circle),
            iconColor: _isIconSelected ? Colors.green : Colors.black,
            onTap: () {
              _toggleIconSelection(index);
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.grey),
              onPressed: () {
                _deleteItem(index);
              },
            ),
          );
        },
      ),
    );
  }
}
