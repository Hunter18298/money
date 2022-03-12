import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: login(),
  ));
}
class login extends StatefulWidget {

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            SizedBox(width: double.infinity,height: 400,
            child: Image.asset("assets/fx.jpg"),),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Enter Your Email Address",
                  labelStyle: GoogleFonts.montserrat(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.00)
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Enter Your Password",
                  labelStyle: GoogleFonts.montserrat(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.00)
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 50.00),
              child: TextButton(
                onPressed: (){},
                child: Text("Forgot Password?",
                style: GoogleFonts.montserrat(
                  color: Color(0xFF622ED8),
                  height: 3,
                  fontSize: 16,
                ),
                ),
              ),
            ),
            Container(
              width: 200,
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                },
                child: Text("LOGIN",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF622ED8),
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12.0)
                  ),
                  elevation: 20,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Forgot Password?",
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF622ED8),
                      height: 3,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(onPressed: (){},
                    child: Text("Signup here",
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF622ED8),
                        height: 3,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
