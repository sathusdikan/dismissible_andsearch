import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> names = [
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Eva",
    "Frak",
    "Grace",
    "Hannah",
    "Ivan",
    "Jack",
    "Karen",
    "Leok",
    "dup",
    "Nina",
    "Oscar",
    "Paul",
    "Quinn",
    "Rachel",
    "Steve",
    "Tina"
  ];

  List<String> founduser = [];
  @override
  void initState() {
    founduser = names;
    super.initState();
  }

  void filter(String cname) {
    List<String> result = [];
    if (cname.isEmpty) {
      result = names;
    } else {
      for (var item in names) {
        if (item.toLowerCase().contains(cname.toLowerCase())) {
          result.add(item);
        }
      }
    }
    setState(() {
      founduser = result;
    });
  }

  bool done = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: done
            ? Text(
                "My Contacts",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              )
            : TextField(
                onChanged: (value) => filter(value),
                decoration: InputDecoration(
                    hintText: "search here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
        toolbarHeight: 90,
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  done = !done;
                });
              },
              icon: Icon(
                Icons.search,
                size: 40,
              ))
        ],
      ),
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                      onDismissed: (direction) {
                        setState(() {
                          founduser.removeAt(index);
                        });
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.grey[300],
                                  title: Text(
                                    "Save",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  content: Text(
                                    "Are you sure you want to save this number",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  actions: [
                                    GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(false),
                                        child: Container(
                                          width: 90,
                                          height: 40,
                                          child: Center(child: Text("Yes")),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        )),
                                    GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(true),
                                        child: Container(
                                          width: 90,
                                          height: 40,
                                          child: Center(child: Text("No")),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ))
                                  ],
                                );
                              });
                        } else if (direction == DismissDirection.endToStart) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.grey[300],
                                  title: Text(
                                    "Delete",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  content: Text(
                                    "Are you sure you want to Delete this number",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  actions: [
                                    GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(true),
                                        child: Container(
                                          width: 90,
                                          height: 40,
                                          child: Center(child: Text("Yes")),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        )),
                                    GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(false),
                                        child: Container(
                                          width: 90,
                                          height: 40,
                                          child: Center(child: Text("No")),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ))
                                  ],
                                );
                              });
                        }
                      },
                      background: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green[600],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      secondaryBackground: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red[600],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      key: ValueKey(names[index]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.blue[600],
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                ),
                                Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                                Text(
                                  founduser[index],
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
                },
                itemCount: founduser.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
