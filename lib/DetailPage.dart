import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'Editform.dart';

class DetailPage extends StatefulWidget {
  final String noteId;

  const DetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState(noteId: this.noteId);
}

class _DetailPageState extends State<DetailPage> {
  String noteId;

  final _mybox = Hive.box('mybox');
  late final kk;

  void getmoredata(noteId) {
    kk = _mybox.get(noteId);
  }

  @override
  void initState() {
    super.initState();

    getmoredata(noteId);
  }

  _DetailPageState({required this.noteId});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      backgroundColor: Color.fromARGB(245, 243, 230, 215),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Text("ข้อมูลส่วนตัว",
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: 1.5,
                      color: Colors.black,
                    ))),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Color(kk['color']),
                radius: 75.0,
              ),
            ),
            Text("ชื่อ :" + noteId,
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            Text("อายุ :" + kk["age"],
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            Text("เบอร์โทรศัทพ์ :" + kk["phonenumber"],
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            Text("ส่วนสูง :" + kk["height"],
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            Text("น้ำหนัก :" + kk["weight"],
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            Text("ดัชนีมวลกาย :" + kk["bodymass"],
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            Text("ความดันเลือด :" + kk["pressure"],
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            Text("กรุ๊ปเลือด :" + kk["blood"],
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            Text("กลุ่มผู้ป่วย :" + kk["disease"],
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            Text("ยาที่ทานประจำ :" + kk["medicine"],
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 72, 70, 70),
                )),
            RaisedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoteEditPage(
                            title: _mybox.get(noteId),
                            name: noteId,
                          )),
                );
              },
              child: const Text('แก้ไข'),
              textColor: Color.fromARGB(255, 0, 0, 0),
              color: Color.fromARGB(255, 255, 250, 154),
            ),
          ],
        ),
      ),
    ));
  }
}
