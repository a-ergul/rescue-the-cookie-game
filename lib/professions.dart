import 'dart:math';

import 'package:appaler_cookieman/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfessionPage extends StatefulWidget {
  @override
  _ProfessionPageState createState() => _ProfessionPageState();
}

class _ProfessionPageState extends State<ProfessionPage> {
  int status = 0;
  String word = wordslist[Random().nextInt(wordslist.length)];
  List guessedwords = [];
  List<String> images = [
    "assets/images/kucuk.png",
    "assets/images/kucuk1.png",
    "assets/images/kucuk2.png",
    "assets/images/kucuk3.png",
    "assets/images/kucuk4.png",
    "assets/images/kucuk5.png",
    "assets/images/kucuk6.png",
  ];
  opendialog(String text) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width / 2,
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width / 2,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            status = 0;
                            guessedwords.clear();
                            word =
                                wordslist[Random().nextInt(wordslist.length)];
                          });
                        },
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            "Play Again",
                            style: GoogleFonts.montserrat(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width / 3,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            "Go Home",
                            style: GoogleFonts.montserrat(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  handletext() {
    String displayword = '';
    for (int i = 0; i < word.length; i++) {
      var char = word[i];
      if (guessedwords.contains(char)) {
        displayword += char + " ";
      } else {
        displayword += "_ ";
      }
    }

    return displayword;
  }

  checkletter(String alphabet) {
    if (word.contains(alphabet)) {
      setState(() {
        guessedwords.add(alphabet);
      });
    } else {
      if (status != 6) {
        setState(() {
          status += 1;
        });
      } else {
        opendialog("PLEASE TRY AGAIN :(");
      }
    }

    bool isWoned = true;
    for (int i = 0; i < word.length; i++) {
      var char = word[i];
      if (!guessedwords.contains(char)) {
        setState(() {
          isWoned = false;
        });
        break;
      }
    }
    if (isWoned) {
      opendialog("Cookie Man Rescued :) , YOU WON");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 30.0),
                alignment: Alignment.center,
                child: Text(
                  "JOBS",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                )),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Image(
                image: AssetImage(images[status]),
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  handletext(),
                  style: GoogleFonts.montserrat(fontSize: 30),
                  textAlign: TextAlign.center,
                )),
            Container(
              margin: EdgeInsets.all(20),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 7,
                children: letters.map((eachalpahbet) {
                  return GestureDetector(
                    onTap: () => checkletter(eachalpahbet),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: Center(
                        child: Text(
                          eachalpahbet,
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List wordslist = [
  'ACTRESS',
  'ADVERTISAR',
  'ACTOR',
  'AUTHOR',
  'BAKER',
  'BARBER',
  'BANKER',
  'BALLERINA',
  'ATHLETE',
  'BARMAN',
  'COOK',
  'DRIVER',
  'DENTIST',
  'DOCTOR',
  'DETECTIVE',
  'FARMER',
  'ENGINEER',
  'FIREMAN',
  'HAIRDRESSER',
  'FASHIONDESIGNER',
  'GARDENER',
  'HOSTESS',
  'INSPECTOR',
  'JOCKEY',
  'LAWYER',
  'JUDGE',
  'MAJOR',
  'NURSE',
  'PAINTER',
  'PILOT',
  'POLICE	',
  'PROGRAMMER',
  'RECEPTIONIST',
  'SECRETARY',
  'PSYCHOLOGIST',
  'POSTMAN',
  'SOLDIER',
  'SPEAKER',
  'TRANSLATOR',
  'SURGEON',
  'REFEREE',
  'DEVELOPER',
  'PRESIDENT',
  'POET',
  'MINER'
];
List<String> letters = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];
