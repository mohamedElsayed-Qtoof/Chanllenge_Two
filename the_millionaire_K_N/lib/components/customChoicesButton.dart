import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container customChoicesButton({
  EdgeInsetsGeometry buttonPadding,
  Function onPressed,
  String text,
  String imageName,
}) {
  return Container(
    child: Padding(
      padding: buttonPadding,
      child: RaisedButton(
        color: Colors.transparent,
        onPressed: onPressed,
        child: Container(
          width: double.maxFinite,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$imageName.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
