import 'package:flutter/material.dart';
import 'package:flutter_camp/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

@override
_StudentAddState createState() => _StudentAddState();

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  var student = Student('', '', 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Öğrenci Ekle'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Öğrenci Adı',
      ),
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Öğrenci Soyadı',
      ),
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Aldığı Not',
      ),
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text('Kaydet'),
      onPressed: () {
        formKey.currentState.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}
