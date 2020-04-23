// Adding the necessary imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.dart';

/*
This file basically keeps all the fontstyles for my app.
*/

final logoStyle = GoogleFonts.playfairDisplay(
  textStyle: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
      wordSpacing: 1.0,
      color: Colors.white,
      shadows: [
        Shadow(
          color: Colors.grey.shade700,
          offset: Offset(
            1.0,
            1.0,
          ),
          blurRadius: 2.0,
        )
      ]),
);

final headerStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
    wordSpacing: 1.0,
    color: Colors.black,
  ),
);

final barStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    wordSpacing: 1.0,
    color: Colors.white,
  ),
);

final bodyStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  ),
);

final bodyStyle2 = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  ),
);

final paraStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  ),
);

final buttonStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  ),
);

final titleStyle = GoogleFonts.playfairDisplay(
  textStyle: TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    letterSpacing: 1.0,
  ),
);

final descrStyle = GoogleFonts.playfairDisplay(
  textStyle: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
);

final favButtonStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 2.0,
  ),
);

final readMoreStyle = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.grey.shade600,
  ),
);
// final subtitleStyle = TextStyle(
//   fontFamily: 'Avenir',
//   fontSize: 14,
//   fontWeight: FontWeight.w500,
// );
