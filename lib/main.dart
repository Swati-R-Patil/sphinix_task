import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sphinix_test/colorConverter.dart';
import 'package:sphinix_test/dashboard_page.dart';
import 'package:sphinix_test/login_page.dart';

Future<void> main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.white, Colors.white60],
              )),
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            Image.asset('assets/app_images/sphinix_logo.png'),
                            SizedBox(height: 280,),
                            Text('Digital Transformation\nTechnology',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal,
                                  color:ColorConverter.hexToColor('#1434A4')),
                            textAlign: TextAlign.center),
                          ],
                        ),
                      )
                  ),
                ]
            ),
          )
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void callTimer() async{
    Future.delayed(Duration(milliseconds: 2000), () {
      openDashboard(context);
    });

    //Timer(Duration(seconds: 5), () => openDashboard(context));
  }

  openDashboard(BuildContext context) {


    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => LoginPage()));
  }
}
