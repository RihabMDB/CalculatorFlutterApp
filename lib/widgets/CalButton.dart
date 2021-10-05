import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalButton extends StatelessWidget {
  final String text;
  final Function callback;
  final int color;

  const CalButton(
      //  Key key,
      this.text,
      this.color,
      this.callback); //: super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
              fontSize: 15,
              color: Colors.white,
            )),
          ),
          onPressed: () {
            callback(text);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Color(color)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            )),
          ),
        ),
      ),
    );
  }
}
