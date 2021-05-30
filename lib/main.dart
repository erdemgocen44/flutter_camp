import 'package:flutter/material.dart';
import 'package:flutter_camp/student.dart';
import 'screens/student_add.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student> students = [
    Student.withId(
      1,
      'Engin',
      'Demirog',
      90,
    ),
    Student.withId(2, 'Güven', 'Atun', 50),
    Student.withId(3, 'Sadık', 'Katır', 40),
  ];
  Student selectedStudent = Student.withId(0, 'Mahmut', 'Bakır', 66);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Takip Sistemi'),
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(students[index].firstName +
                      ' ' +
                      students[index].lastName),
                  subtitle: Text(
                    'Sınavdan Aldığı Not :' +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]",
                    style: TextStyle(fontSize: 11),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/anime2.jpg'),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(
                      () {
                        this.selectedStudent = students[index];
                      },
                    );
                  },
                );
              },
            ),
          ),
          Text('Seçili Öğrenci: ' +
              selectedStudent.firstName +
              ' ' +
              selectedStudent.lastName),
          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 16,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Yeni Öğrenci',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)));
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 16,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Güncelle',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.redAccent,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 16,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Sil',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildStatusIcon(int grade) {
  if (grade >= 50) {
    return Icon(Icons.done);
  } else if (grade >= 40) {
    return Icon(Icons.album);
  } else {
    return Icon(Icons.clear);
  }
}
