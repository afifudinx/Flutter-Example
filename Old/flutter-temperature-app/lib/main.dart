import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  double _windSpeed = 1;
  int index = 0;
  List<IconData> icons = [Icons.ac_unit, Icons.cloud, Icons.water];
  int iconIndex = 0;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            iconIndex = index;
          });
          _animationController.reverse();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget mode({IconData? icon, int? n}) {
    return GestureDetector(
      onTap: () {
        if (n != index) {
          _animationController.forward();
          setState(() {
            index = n!;
          });
        }
      },
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color: n == index ? Colors.blue : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
                color: n == index ? Colors.blue : Colors.grey.shade800,
                width: 2)),
        child: Icon(icon!,
            color: n == index ? Colors.white : Colors.grey.shade800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff18181A),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff18181A),
          leading: Container(
              margin: EdgeInsets.only(left: 20), child: Icon(Icons.arrow_back)),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(
                      MediaQuery.of(context).size.width * _animation.value, 0),
                  child: Icon(
                    icons[iconIndex],
                    color: Colors.blue,
                    size: 400,
                  ),
                ),
                Container(
                    height: 250,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.blue.withOpacity(0.1 * _windSpeed),
                          Color(0xff18181A).withOpacity(0)
                        ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter))),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('TEMPERATURE °C',
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      Text('22',
                          style: GoogleFonts.robotoSlab(
                              color: Colors.white,
                              fontSize: 144,
                              fontWeight: FontWeight.w800)),
                      SizedBox(
                        height: 64,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          mode(icon: Icons.ac_unit, n: 0),
                          SizedBox(
                            width: 24,
                          ),
                          mode(icon: Icons.cloud, n: 1),
                          SizedBox(
                            width: 24,
                          ),
                          mode(icon: Icons.water, n: 2)
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Icon(Icons.air, color: Colors.grey.shade800),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  overlayShape: SliderComponentShape.noThumb,
                                  trackHeight: 10,
                                  activeTrackColor: Colors.blue,
                                  inactiveTrackColor: Colors.grey.shade800,
                                  overlayColor: Colors.transparent,
                                  thumbColor: Colors.white),
                              child: Slider(
                                divisions: 3,
                                value: _windSpeed,
                                min: 1,
                                max: 10,
                                onChanged: (val) {
                                  setState(() {
                                    _windSpeed = val;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
