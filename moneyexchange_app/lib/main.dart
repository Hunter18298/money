import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: initialPage(),
  ));
}
class initialPage extends StatefulWidget {
  const initialPage({Key? key}) : super(key: key);

  @override
  _initialPageState createState() => _initialPageState();
}

class _initialPageState extends State<initialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment(0,0.89),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/iPhone.png"),
            fit: BoxFit.fill
          ),
        ),

        child: FittedBox(
          child: Container(
            width: 370,
            height: 100,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              },
              child: Text("Login",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF622ED8),
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(35.0)
                ),
                elevation: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
