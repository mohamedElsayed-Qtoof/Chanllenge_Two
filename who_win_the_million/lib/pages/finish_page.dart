import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:who_win_the_million/constants/colors/app_colors.dart';

// ------------------------------------
// * Final Page
// ------------------------------------

class FinishPage extends StatelessWidget {
  static final id = 'FinishPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.genColor2,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/alaa/alaa.png'),
            ),
            Text('Alaa A. Mahmoud',
                style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold))),
            Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.teal.shade100,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Source Sans Pro',
              ),
            ),
            SizedBox(
              height: 25,
              width: 180,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              color: AppColors.genColor1,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.white70,
                ),
                title: Text(
                  '+00966 561128371',
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      color: AppColors.myMoneyBtnColorEff,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              color: AppColors.genColor1,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.white70,
                ),
                title: Text(
                  'alaa@mediadezign.com',
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      color: AppColors.myMoneyBtnColorEff,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80),
                ),
                Center(
                  child: FlatButton(
                    color: AppColors.myMoneyBtnColorEff,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: AppColors.myMoneyBtnColorEff,
                    onPressed: () => exit(0),
                    child: Text(
                      'خروج',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
