import 'package:flutter/material.dart';
import 'package:my_quiz_app/Questions.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var score = 0;
  var n = 0;
  List que_list = [
    Questions("1.MS Word is a hardware.", false),
    Questions("2.CPU controls only input data of computer.", false),
    Questions("3.CPU stands for Central Processing Unit.", true),
    Questions(
        "4.Freeware is software that is available for use at no monetary cost..",
        true),
  ];

  void checkAnswer(bool choice, BuildContext ctx) {
    if (choice == que_list[n].ans) {
      //debugPrint("Correct");
      score = score + 1;
      final snackbar = SnackBar(
        content: Text("Correct Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      Scaffold.of(ctx).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text("Wrong Answer"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      Scaffold.of(ctx).showSnackBar(snackbar);
    }
    setState(() {
      if (n < que_list.length - 1) {
        n = n + 1;
      } else {
        final snackbar = SnackBar(
          content: Text("Quiz Completed Score $score/4"),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.blueAccent,
        );
        Scaffold.of(ctx).showSnackBar(snackbar);
        reset();
      }
    });
  }

  void reset() {
    setState(() {
      n = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Simple Quiz"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (ctx) => Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Score : $score/4 ",
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => reset(),
                    child: Text(
                      "Reset ",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.brown),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      que_list[n].que,
                      style: TextStyle(fontSize: 15.0),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    onPressed: () => checkAnswer(true, ctx),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  RaisedButton(
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    onPressed: () => checkAnswer(false, ctx),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
