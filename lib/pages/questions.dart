// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizzapp/service/database.dart';

class Question extends StatefulWidget {
  String category;
  Question({super.key, required this.category});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool show = false;
  getontheload() async {
    QuizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Stream? QuizStream;
  PageController controller = PageController();

  Widget allQuiz() {
    return StreamBuilder(
        stream: QuizStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? PageView.builder(
                  controller: controller,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 40.0, right: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  ds["Image"],
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0),
                              child: GestureDetector(
                                  onTap: () {
                                    show = true;
                                    setState(() {});
                                  },
                                  child: show
                                      ? Container(
                                          padding: const EdgeInsets.all(15.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] ==
                                                          ds["option1"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Text(
                                            ds["option1"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      : Container(
                                          padding: const EdgeInsets.all(15.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Text(
                                            ds["option1"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0),
                              child: GestureDetector(
                                  onTap: () {
                                    show = true;
                                    setState(() {});
                                  },
                                  child: show
                                      ? Container(
                                          padding: const EdgeInsets.all(15.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] ==
                                                          ds["option2"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Text(
                                            ds["option2"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      : Container(
                                          padding: const EdgeInsets.all(15.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Text(
                                            ds["option2"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0),
                              child: GestureDetector(
                                  onTap: () {
                                    show = true;
                                    setState(() {});
                                  },
                                  child: show
                                      ? Container(
                                          padding: const EdgeInsets.all(15.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] ==
                                                          ds["option3"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Text(
                                            ds["option3"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      : Container(
                                          padding: const EdgeInsets.all(15.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Text(
                                            ds["option3"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0),
                              child: GestureDetector(
                                  onTap: () {
                                    show = true;
                                    setState(() {});
                                  },
                                  child: show
                                      ? Container(
                                          padding: const EdgeInsets.all(15.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ds["correct"] ==
                                                          ds["option4"]
                                                      ? Colors.green
                                                      : Colors.red,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Text(
                                            ds["option4"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      : Container(
                                          padding: const EdgeInsets.all(15.0),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Text(
                                            ds["option4"],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = false;
                                  });
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: const Color(0xFF004840),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004840),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFf35b32),
                          borderRadius: BorderRadius.circular(60.0)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100.0,
                  ),
                  Text(
                    widget.category,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(flex: 1, child: allQuiz()),
          ],
        ),
      ),
    );
  }
}
