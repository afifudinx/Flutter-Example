import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_email_app/context/context.dart';
import 'package:flutter_email_app/pages/mail_page.dart';
import 'package:flutter_email_app/utils/slide_route.dart';
import 'package:flutter_email_app/utils/system_ui.dart';

void main() => runApp(ChangeNotifierProvider<AppContext>(
      create: (context) => AppContext(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          if (settings.name == '/mail') {
            return RouteAnimation.slide(settings, const MailPage());
          }
          return RouteAnimation.slide(settings, const MyApp());
        },
      ),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> names = [
    'Ervin Howell',
    'Leanne Graham',
    'Clementine Bauch',
    'Patricia Lebsack',
    'Uncle Ben',
    'Humayra',
    'Chelsey Dietrich',
    'Nicholas Runolfsdottir V',
    'Glenna Reichert',
    'Kurtis Weissnat',
    'Mrs. Dennis Schulist',
    'Clementina DuBuque',
    'Kattie Turnpike',
    'Moriah Stanton',
  ];
  @override
  Widget build(BuildContext context) {
    systemUi();
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
            centerTitle: true,
            title: Text('Contacts',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, color: Colors.black))),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 14,
          itemBuilder: (context, index) {
            return Consumer<AppContext>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    value.name = names[index];
                    value.image = 'assets/images/${index + 1}.png';
                    Navigator.pushNamed(context, '/mail');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                          child: Text('${index + 1}',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Hero(
                          tag: 'assets/images/${index + 1}.png',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: Image.asset(
                              'assets/images/${index + 1}.png',
                              width: 48,
                              height: 48,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(names[index],
                            style:
                                GoogleFonts.inter(fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
