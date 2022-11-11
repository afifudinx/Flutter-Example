import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ImagePicker _picker = ImagePicker();
  final List<File?> _images = [];

  Future<void> onSelect() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _images.add(File(image!.path));
    });
  }

  String getFileSizeString({int? bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    var i = (log(bytes!) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Image.asset('assets/1.png'),
                Text('Upload your image',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700, fontSize: 24)),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: _images.map((image) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: FileImage(image!),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            getFileSizeString(bytes: image.lengthSync()),
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _images.remove(image);
                              });
                            },
                            child: Text('Remove',
                                style: GoogleFonts.inter(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    onSelect();
                  },
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      color: Colors.grey.shade400,
                      dashPattern: const [10],
                      strokeWidth: 2,
                      radius: const Radius.circular(12),
                      padding: const EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.grey.shade200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 100,
                                  color: Colors.grey.shade400,
                                ),
                                Text('Select Image',
                                    style: GoogleFonts.inter(
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18))
                              ],
                            ),
                          ),
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
