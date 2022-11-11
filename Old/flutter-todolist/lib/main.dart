import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_todolist/utils/fade_animation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _newTodoController =
      TextEditingController(text: '');
  List<String> todos = [];
  List<Color> colors = [];
  //////////////////////////////
  ///
  /// follow @withflutter
  ///
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Todolist App',
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w700, color: Colors.black, fontSize: 16),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: TextField(
                      controller: _newTodoController,
                      style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          isCollapsed: true,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'New Todo',
                          hintStyle: GoogleFonts.inter(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w500)),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    if (_newTodoController.text == '') {
                      return;
                    }
                    setState(() {
                      todos.add(_newTodoController.text);
                      colors.add(Colors
                          .primaries[Random().nextInt(Colors.primaries.length)]
                          .shade200);
                    });
                    _newTodoController.clear();
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: todos.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemBuilder: (context, index) {
                    return FadeAnimation(
                      delay: 200,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(todos[index],
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade800))),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    todos.remove(todos[index]);
                                    colors.remove(colors[index]);
                                  });
                                },
                                child: const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child:
                                        Icon(Icons.delete, color: Colors.red)))
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
