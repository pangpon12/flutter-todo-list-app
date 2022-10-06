import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'main.dart';

class NoteEditPage extends StatefulWidget {
  final String name;
  final Map title;
  const NoteEditPage({super.key, required this.title, required this.name});

  @override
  MyHomePageState createState() {
    return new MyHomePageState(title: this.title, name: this.name);
  }
}

class MyHomePageState extends State<NoteEditPage> {
  final String name;
  final Map title;

  MyHomePageState({required this.title, required this.name});

  late final _text = TextEditingController(text: name);
  late final _age = TextEditingController(text: title["age"]);
  late final _phonenumber = TextEditingController(text: title["phonenumber"]);
  late final _height = TextEditingController(text: title["height"]);
  late final _weight = TextEditingController(text: title["weight"]);
  late final _bodymass = TextEditingController(text: title["bodymass"]);
  late final _pressure = TextEditingController(text: title["pressure"]);
  late final _blood = TextEditingController(text: title["blood"]);
  late final _disease = TextEditingController(text: title["disease"]);
  late final _medicine = TextEditingController(text: title["medicine"]);

  late final _time = title["createdDate"];
  bool _validate = false;
  late String testDebug;
  @override
  Future<void> dispose() async {
    super.dispose();
  }

  String? nameform;
  String? age;
  String? phonenumber;
  String? height;
  String? weight;
  String? bodymass;
  String? pressure;
  String? blood;
  String? disease;
  String? medicine;
  int? colorValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 243, 230, 215),
      appBar: AppBar(
        title: Text('หน้าโปรไฟล์'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false, // set it to false
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildimageprofile(),
              Text(
                'ชื่อผู้ป่วย',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _text,
                decoration: InputDecoration(
                  //  labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (nameform) => setState(() {
                  testDebug = nameform;
                }),
              ),
              Text(
                'อายุ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _age,
                decoration: InputDecoration(
                  //      labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (age) => setState(() {
                  testDebug = age;
                }),
              ),
              Text(
                'เบอร์โทรศัพท์',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _phonenumber,
                decoration: InputDecoration(
                  //    labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (phonenumber) => setState(() {
                  testDebug = phonenumber;
                }),
              ),
              Text(
                'ส่วนสูง',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _height,
                decoration: InputDecoration(
                  //    labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (height) => setState(() {
                  testDebug = height;
                }),
              ),
              Text(
                'น้ำหนัก',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _weight,
                decoration: InputDecoration(
                  //       labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (weight) => setState(() {
                  testDebug = weight;
                }),
              ),
              Text(
                'มวลกล้ามเนื้อ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _bodymass,
                decoration: InputDecoration(
                  //   labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (bodymass) => setState(() {
                  testDebug = bodymass;
                }),
              ),
              Text(
                'ความดัน',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _pressure,
                decoration: InputDecoration(
                  //    labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (pressure) => setState(() {
                  testDebug = pressure;
                }),
              ),
              Text(
                'กรุ๊ปเลือด',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _blood,
                decoration: InputDecoration(
                  //    labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (blood) => setState(() {
                  testDebug = blood;
                }),
              ),
              Text(
                'โรค',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _disease,
                decoration: InputDecoration(
                  // labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (disease) => setState(() {
                  testDebug = disease;
                }),
              ),
              Text(
                'ยาที่ใช้ประจำ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _medicine,
                decoration: InputDecoration(
                  // labelText: 'Enter the Value',
                  errorText: _validate ? 'กรุณากรอกให้ครบทุกช่อง' : null,
                ),
                onChanged: (medicine) => setState(() {
                  testDebug = medicine;
                }),
              ),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    _text.text.isEmpty |
                            _age.text.isEmpty |
                            _phonenumber.text.isEmpty |
                            _height.text.isEmpty |
                            _weight.text.isEmpty |
                            _bodymass.text.isEmpty |
                            _pressure.text.isEmpty |
                            _blood.text.isEmpty |
                            _disease.text.isEmpty |
                            _medicine.text.isEmpty
                        ? _validate = true
                        : _validate = false;

                    if ((colorValue == null)) {
                      colorValue = title['color'];
                    } else {
                      this.colorValue = colorValue;
                    }
                  });

                  if (_validate == false) {
                    print(
                        "****************************************************************");
                    print(_text.text);
                    print(_phonenumber.text);
                    Hive.box('mybox').delete(name);
                    Hive.box('mybox').put(_text.text, {
                      'createdDate': _time,
                      'age': _age.text,
                      "phonenumber": _phonenumber.text,
                      "height": _height.text,
                      "weight": _weight.text,
                      "bodymass": _bodymass.text,
                      "pressure": _pressure.text,
                      "blood": _blood.text,
                      "disease": _disease.text,
                      "medicine": _medicine.text,
                      "color": colorValue
                    });

                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  }
                },
                child: Text('บันทัก'),
                textColor: Colors.white,
                color: Color.fromARGB(255, 146, 201, 143),
              ),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    _text.text.isEmpty ? _validate = true : _validate = false;
                  });
                  if (_validate == false) {
                    print(
                        "****************************************************************");
                    print(_text.text);
                    print(_phonenumber.text);
                    Hive.box('mybox').delete(name);

                    await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  }
                },
                child: Text('ลบ'),
                textColor: Colors.white,
                color: Color.fromARGB(255, 234, 111, 111),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget selectColor() {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 8,
      padding: const EdgeInsets.all(8),
      children: [
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.red.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.red,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.redAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.yellow.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.yellow,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.yellowAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.yellowAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.orange.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.orange,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.orangeAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.deepOrange.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.deepOrange,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.deepOrangeAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.deepOrangeAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.green.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.green,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.greenAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.greenAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.lightGreen.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.lightGreen,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.lightGreenAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.lightGreenAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.blue.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blue,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.blueAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blueAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.blueGrey.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.black.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.black12.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black12,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.black26.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black26,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.black38.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black38,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.black45.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black45,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.black54.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black54,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.black87.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black87,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.deepPurple.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.purple.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.purple,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.amber.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.amber,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.amberAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.amberAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.cyanAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.cyanAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.cyan.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.cyan,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.limeAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.limeAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.lime.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.lime,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.pink.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.pink,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.pinkAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 127, 105, 105).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 127, 105, 105),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 214, 183, 183).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 214, 183, 183),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.teal.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.teal,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Colors.tealAccent.value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.tealAccent,
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 155, 155, 60).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 155, 155, 60),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 126, 71, 158).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 217, 117, 233),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 141, 137, 136).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 141, 137, 136),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 86, 25, 3).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 86, 25, 3),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 247, 104, 52).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 247, 104, 52),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 2, 45, 73).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 2, 45, 73),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 138, 35, 74).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 138, 35, 74),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 201, 133, 109).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 201, 133, 109),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 7, 168, 103).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 7, 168, 103),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 67, 89, 77).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 67, 89, 77),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 63, 59, 123).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 63, 59, 123),
            )),
        InkWell(
            onTap: () {
              setState(() {
                colorValue = Color.fromARGB(255, 255, 32, 32).value;
              });
            },
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 255, 32, 32),
            )),
      ],
    );
  }

  Widget buildimageprofile() {
    return Center(
        child: Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundColor:
              (colorValue == null) ? Color(title['color']) : Color(colorValue!),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: this.context,
                    builder: ((builder) => selectColor()));
              },
              child: Icon(
                Icons.edit,
                color: Colors.teal,
                size: 28,
              )),
        )
      ],
    ));
  }
}
