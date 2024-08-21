import 'package:flutter/material.dart';
import 'welcomepage.dart'; // Import the WelcomePage from the separate file

void main() {
  runApp(const StopAndWorkApp());
}

class StopAndWorkApp extends StatelessWidget {
  const StopAndWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StopAndWork',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.blueAccent),
        ),
      ),
      home: const WelcomePage(), // Set the initial page to WelcomePage
    );
  }
}

class StopAndWorkHome extends StatefulWidget {
  const StopAndWorkHome({super.key});

  @override
  State<StopAndWorkHome> createState() => _StopAndWorkHomeState();
}

class _StopAndWorkHomeState extends State<StopAndWorkHome> {
  List<String> _stopandworkList = [];
  String _stopandworkInput = '';
  DateTime _selectedDate = DateTime.now();

  void _addTodo() {
    if (_stopandworkInput.isNotEmpty) {
      setState(() {
        _stopandworkList.add('$_stopandworkInput - ${_selectedDate.toLocal()}');
        _stopandworkInput = ''; // Clear input field after adding the item
      });
    }
  }

  void _deleteStopandworkItem(int index) {
    setState(() {
      _stopandworkList.removeAt(index);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('StopAndWork'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'My Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                // Handle profile tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Social Events'),
              onTap: () {
                // Handle social events tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Corporate Events'),
              onTap: () {
                // Handle corporate events tap
              },
            ),
          ],
        ),
      ),
      body:Container(
        color: Colors.blueAccent,
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter a task',
                hintText: 'Enter a todo task here',
              ),
              onChanged: (text) {
                setState(() {
                  _stopandworkInput = text;
                });
              },
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Date'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _addTodo,
              child: const Text('Add Todo'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _stopandworkList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_stopandworkList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteStopandworkItem(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
