import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:real_project/readmore.dart';

import 'Homepage.dart';
import 'listview.dart';

late Box box;

Future<void> main() async {
  //initialize hive
  await Hive.initFlutter();

  //open the box
  Box box = await Hive.openBox('mybox');
// Create a box collection

  // Open your boxes. Optional: Give it a type.

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Homefirstpage(),
    ListviewPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _mybox = Hive.box('mybox');

  WriteData(a, b) {
    _mybox.put(a, b);
    print("object");
  }

  Future<void> printdata() async {}

  void delete() {
    _mybox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteDetailPage(),
          ));
        },
        backgroundColor: Color.fromARGB(255, 115, 151, 147),
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color.fromARGB(245, 243, 230, 215),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 46, 86, 104),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ข้อมูลทั้งหมด',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
