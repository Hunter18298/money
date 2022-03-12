import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneyexchange_app/drawer.dart';
import 'drawer.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currencies=['USD','EUR','IQD'];
  var _currentvalue='USD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFF622ED8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/icon_person.png"),
        ),
        title:  Text("Welcome Karwan",
          style: GoogleFonts.montserrat(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: NavBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          padding: EdgeInsets.all(35),
          children: [
            Container(
              padding: EdgeInsets.only(top: 50,left: 40),
              child: Text("Convert",
                style: GoogleFonts.montserrat(
                  color: Colors.black54,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:20,left: 40,bottom: 20),
              child: Text("Any Currency",
                style: GoogleFonts.montserrat(
                  fontSize: 28,
                ),
              ),
            ),
            Card(
              elevation: 20,
              shadowColor: Color(0xFFE9DFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              child: Container(
                height: 200,
                child: Column(
                  children: [
                    Container(
                      height:40,
                      width: 140,
                      margin: EdgeInsets.only(right: 200,top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),

                      ),
                      child: DropdownButtonFormField(items: _currencies.map((String dropDown){
                        return DropdownMenuItem(
                          value: dropDown,
                            child: Text(dropDown),
                        );
                      }).toList(), onChanged: (String? newValue){
                        setState(() {
                          this._currentvalue=newValue!;

                        },);
                      },
                        isDense: true,
                        isExpanded: false,
                      value: _currentvalue,
                        dropdownColor: Color(0xFFE9DFFF),
                        style: GoogleFonts.montserrat(color: Colors.black87),
                      decoration: InputDecoration(
                        fillColor: Color(0xFFE9DFFF),
                        filled: true,
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 200,top: 20),
                      child: Text("\$ 120.00",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 34,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 185,top: 10),
                      child: Text("1 EUR = 1.19 USD",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xFF622ED8),
                borderRadius: BorderRadius.circular(15)
              ),
              margin: EdgeInsets.symmetric(horizontal: 170,vertical: 20),
              child: MaterialButton(
                onPressed: (){},
                child: Icon(Icons.swap_vert,color: Colors.white,size: 35.00),
              )
            ),
            Card(
              elevation: 20,
              shadowColor: Color(0XFFE9DFFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Container(
                height: 200,
                child: Column(
                  children: [
                    Container(
                      height:40,
                      width: 140,
                      margin: EdgeInsets.only(right: 200,top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),

                      ),
                      child: DropdownButtonFormField(items: _currencies.map((String dropDown){
                        return DropdownMenuItem(
                          value: dropDown,
                          child: Text(dropDown),
                        );
                      }).toList(), onChanged: (String? newValue){
                        setState(() {
                          this._currentvalue=newValue!;

                        },);
                      },
                        isDense: true,
                        isExpanded: false,
                        value: _currentvalue,
                        dropdownColor: Color(0xFFE9DFFF),
                        style: GoogleFonts.montserrat(color: Colors.black87),
                        decoration: InputDecoration(
                          fillColor: Color(0xFFE9DFFF),
                          filled: true,
                        ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 200,top: 20),
                      child: Text("\$ 120.00",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 34,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 185,top: 10),
                      child: Text("1 EUR = 1.19 USD",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
