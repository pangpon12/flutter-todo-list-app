import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path/path.dart';
import 'main.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class NoteDetailPage extends StatefulWidget {
  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  final ImagePicker _picker = ImagePicker();
  File? image;
  int? colorValue = Colors.grey.value;

  late final _text = TextEditingController();
  late final _age = TextEditingController();
  late final _phonenumber = TextEditingController();
  late final _height = TextEditingController();
  late final _weight = TextEditingController();
  late final _bodymass = TextEditingController();
  late final _pressure = TextEditingController();
  late final _blood = TextEditingController();
  late final _disease = TextEditingController();
  late final _medicine = TextEditingController();
  bool _validate = false;
  int? id;
  String? name;
  DateTime? createdDate;
  String? age;
  String? phonenumber;
  String? height;
  String? weight;
  String? bodymass;
  String? pressure;
  String? blood;
  String? disease;
  String? medicine;
  final _mybox = Hive.box('mybox');

  WriteData(name, age, phonenumber, height, weight, bodymass, pressure, blood,
      disease, medicine) async {
    await _mybox.put(name, {
      "createdDate": DateTime.now(),
      "age": age,
      "phonenumber": phonenumber,
      "height": height,
      "weight": weight,
      "bodymass": bodymass,
      "pressure": pressure,
      "blood": blood,
      "disease": disease,
      "medicine": medicine
    });
  }

  printdata() {
    print(_mybox.keys.toList());
    List searchTerms = _mybox.keys.toList();

    print(searchTerms);
  }

  deleteall() {
    _mybox.deleteAll(_mybox.keys);
  }

  @override
  Widget build(BuildContext context) => Material(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildimageprofile(),
              buildTitle(),
              SizedBox(height: 8),
              buildage(),
              SizedBox(height: 8),
              buildphonenumber(),
              SizedBox(height: 8),
              buildheight(),
              SizedBox(height: 8),
              buildweight(),
              SizedBox(height: 8),
              buildbodymass(),
              SizedBox(height: 8),
              buildpressure(),
              SizedBox(height: 8),
              buildblood(),
              SizedBox(height: 8),
              builddisease(),
              SizedBox(height: 8),
              buildmedicine(),
              // RaisedButton(onPressed: () {    deleteall();    }),
              //RaisedButton(onPressed: () {     printdata();  }),
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
                  });

                  if (_validate == false) {
                    print(
                        "****************************************************************");
                    print(_text.text);
                    print(_phonenumber.text);
                    Hive.box('mybox').delete(name);
                    Hive.box('mybox').put(_text.text, {
                      'createdDate': DateTime.now(),
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
                child: const Text('บรรทึก'),
                color: Color.fromARGB(255, 146, 201, 143),
              ),
            ],
          ),
        ),
      ));

  Widget buildTitle() => TextFormField(
        controller: _text,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'ชื่อ',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (name) =>
            name != null && name.isEmpty ? 'The name cannot be empty' : null,
        onChanged: (name) {
          this.name = name;
        },
      );

  Widget buildage() => TextFormField(
        controller: _age,
        keyboardType: TextInputType.number,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'อายุ',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (age) =>
            age != null && age.isEmpty ? 'The age cannot be empty' : null,
        onChanged: (age) {
          this.age = age;
        },
      );

  Widget buildheight() => TextFormField(
        controller: _height,
        keyboardType: TextInputType.number,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'ส่วนสูง',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (height) => height != null && height.isEmpty
            ? 'The height cannot be empty'
            : null,
        onChanged: (height) {
          this.height = height;
        },
      );
  Widget buildphonenumber() => TextFormField(
        controller: _phonenumber,
        keyboardType: TextInputType.number,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'เบอร์มือถือ',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (phonenumber) => phonenumber != null && phonenumber.isEmpty
            ? 'The phonenumber cannot be empty'
            : null,
        onChanged: (phonenumber) {
          this.phonenumber = phonenumber;
        },
      );
  Widget buildweight() => TextFormField(
        controller: _weight,
        keyboardType: TextInputType.number,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'น้ำหนัก',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (weight) => weight != null && weight.isEmpty
            ? 'The weight cannot be empty'
            : null,
        onChanged: (weight) {
          this.weight = weight;
        },
      );
  Widget buildbodymass() => TextFormField(
        controller: _bodymass,
        keyboardType: TextInputType.number,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'ดัชนีมวลกาย',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (bodymass) => bodymass != null && bodymass.isEmpty
            ? 'The bodymass cannot be empty'
            : null,
        onChanged: (bodymass) {
          this.bodymass = bodymass;
        },
      );
  Widget buildpressure() => TextFormField(
        controller: _pressure,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'ความดันเลือด',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (pressure) => pressure != null && pressure.isEmpty
            ? 'The pressure cannot be empty'
            : null,
        onChanged: (pressure) {
          this.pressure = pressure;
        },
      );
  Widget buildblood() => TextFormField(
        controller: _blood,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'กรุ๊ปเลือด',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (blood) =>
            blood != null && blood.isEmpty ? 'The blood cannot be empty' : null,
        onChanged: (blood) {
          this.blood = blood;
        },
      );
  Widget builddisease() => TextFormField(
        controller: _disease,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'โรคที่เป็น',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (disease) => disease != null && disease.isEmpty
            ? 'The disease cannot be empty'
            : null,
        onChanged: (disease) {
          this.disease = disease;
        },
      );
  Widget buildmedicine() => TextFormField(
        controller: _medicine,
        maxLines: 1,
        style: TextStyle(
          color: Color.fromARGB(179, 0, 0, 0),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          errorText: _validate ? 'กรุณากรอกข้อมูล' : null,
          border: InputBorder.none,
          labelText: 'ยาประจำตัว',
          hintStyle: TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
        ),
        validator: (medicine) => medicine != null && medicine.isEmpty
            ? 'The medicine cannot be empty'
            : null,
        onChanged: (medicine) {
          this.medicine = medicine;
        },
      );

  Widget buildimageprofile() {
    return Center(
        child: Stack(
      children: <Widget>[
        CircleAvatar(
            radius: 80,
            backgroundColor:
                (colorValue == null) ? Colors.grey : Color(colorValue!)),
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

  void takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
}
