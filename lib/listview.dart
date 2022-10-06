import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:real_project/readmore.dart';

import 'DetailPage.dart';

class ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  final _mybox = Hive.box('mybox');

  late List searchTerms;

  @override
  void initState() {
    super.initState();
    searchTerms = _mybox.keys.toList();

    print(_mybox.keys.toList());
  }

  @override
  Widget build(BuildContext context) {
    List<String> matchQuery = [];
    for (var searchresult in searchTerms) {
      if (searchresult.toLowerCase().contains("te")) {
        matchQuery.add(searchresult);
      }
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(245, 243, 230, 215),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("รายชื่อทั้งหมด"),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: Mysearchdelegate(),
                );
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _mybox.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Color(_mybox.get(_mybox.keyAt(index))['color']),
                        radius: 40,
                      ),
                      title: Text("ชื่อ : ${_mybox.keyAt(index)}"),
                      trailing: Icon(Icons.chevron_right),
                      tileColor: Color.fromARGB(255, 149, 204, 197),
                      focusColor: Color.fromARGB(255, 62, 88, 85),
                      subtitle: Text(
                        'อายุ : ${_mybox.get(_mybox.keyAt(index))['age']} ปี \n โรคที่เป็น : ${_mybox.get(_mybox.keyAt(index))['disease']}',

                        //    matchQuery[index], style: TextStyle(fontSize: 18),
                      ),
                      onTap: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailPage(
                            noteId: _mybox.keyAt(index),
                          ),
                        ));
                        print(_mybox.keyAt(index).runtimeType);
                      }));
            }));
  }
}

class Mysearchdelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    final _mybox = Hive.box('mybox');

    late List searchTerms;
    searchTerms = _mybox.keys.toList();
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Card(
          child: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final _mybox = Hive.box('mybox');

    late List searchTerms;
    searchTerms = _mybox.keys.toList();

    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      print("*******************************************************");
      print(fruit);
      if (fruit.toLowerCase().contains(query.toLowerCase()) |
          _mybox
              .get(fruit)['disease']
              .toLowerCase()
              .contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Column(children: [
          //       Text("จำนวน "),

          Card(
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color(_mybox.get(result)['color']),
                    radius: 40,
                  ),
                  title: Text("ชื่อ : ${result}"),
                  trailing: Icon(Icons.chevron_right),
                  tileColor: Color.fromARGB(255, 149, 204, 197),
                  focusColor: Color.fromARGB(255, 62, 88, 85),
                  subtitle: Text(
                    'อายุ : ${_mybox.get(result)['age']} ปี \n โรคที่เป็น : ${_mybox.get(result)['disease']} ',

                    //    matchQuery[index], style: TextStyle(fontSize: 18),
                  ),
                  onTap: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(
                        noteId: _mybox.keyAt(index),
                      ),
                    ));
                    print(_mybox.keyAt(index).runtimeType);
                  }))
        ]);
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }
}
