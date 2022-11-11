import 'package:flutter/material.dart';
import 'package:flutter_deposit_app/pages/success_page.dart';
import 'package:flutter_deposit_app/utils/slide_route.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/success') {
          return RouteAnimation.slide(settings, const SuccessPage());
        }
        return RouteAnimation.slide(settings, const MyApp());
      },
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _textEditingController =
      TextEditingController(text: '\$0');
  int? selectedBank;
  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    Future<dynamic> confirmModal() {
      return showModalBottomSheet(
          enableDrag: true,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: const Color(0xff0E0E19),
          context: context,
          builder: (_) {
            return StatefulBuilder(builder:
                (BuildContext context, StateSetter setConfirmModalState) {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'You\'ll be depositing ${_textEditingController.text}. Are you sure?',
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/success');
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade600,
                              borderRadius: BorderRadius.circular(14)),
                          child: Center(
                            child: Text(
                                'Deposit ${_textEditingController.text}',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(14)),
                          child: Center(
                            child: Text('Dismiss',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          });
    }

    Future<dynamic> modal() {
      return showModalBottomSheet(
          enableDrag: true,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: const Color(0xff0E0E19),
          context: context,
          builder: (_) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
              Widget accountCard({String? name, String? email, int? index}) {
                return GestureDetector(
                  onTap: () {
                    setModalState(() {
                      selectedBank = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    height: 80,
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: selectedBank == index
                                ? Colors.blue.shade600
                                : Colors.transparent,
                            width: 2)),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/images/paypal.png'),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name!,
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(email!,
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade700))
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Spacer(),
                        Container(
                          width: 20,
                          height: 20,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: selectedBank == index
                                      ? Colors.blue.shade600
                                      : Colors.white,
                                  width: 2)),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedBank == index
                                    ? Colors.blue.shade600
                                    : Colors.transparent),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }

              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Bank Account',
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      accountCard(
                          name: 'Afifudin',
                          email: 'afifudin@gmail.com',
                          index: 0),
                      accountCard(
                          name: 'Humeyra',
                          email: 'humeyra@icloud.com',
                          index: 1),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          confirmModal();
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(14)),
                          child: Center(
                            child: Text('Link Account',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          });
    }

    return Scaffold(
        backgroundColor: const Color(0xff0E0E19),
        appBar: AppBar(
          backgroundColor: const Color(0xff0E0E19),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Deposit',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          leading: const Icon(Icons.arrow_back),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.blue.shade600),
                    borderRadius: BorderRadius.circular(14)),
                child: TextField(
                  controller: _textEditingController,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w700),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  modal();
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(14)),
                  child: Center(
                    child: Text('Continue',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
