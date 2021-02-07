import 'dart:math';

import 'package:appaler_cookieman/Screens/HomePage.dart';
import 'package:appaler_cookieman/admob_islemleri.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralPage extends StatefulWidget {
  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  InterstitialAd myInterstitialAd;
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
                  "GENERAL",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.redAccent),
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
  'APPLE',
  'LEMON',
  'BANANA',
  'ORANGE',
  'SPAGHETTI',
  'GINGER',
  'TOAST',
  'PASTA',
  'CHOCOLATE',
  'ICECREAM',
  'CHEESE',
  'CHESTNUT',
  'CHICKEN',
  'EGG',
  'STEAK',
  'FISH',
  'HAZELNUT',
  'CARROT',
  'MUSHROOM',
  'RADISH',
  'ARTICHOKE',
  'TOMATO',
  'BLUEBERRY',
  'WATERMELON',
  'PEACH',
  'GRAPEFRUIT',
  'GRAPE',
  'RASPBERRY',
  'BLACKBERRY',
  'BEET',
  'ALMOND',
  'PIZZA',
  'HAMBURGER',
  'COCONUT',
  'PUMPKIN',
  'AMSTERDAM',
  'ATHENS',
  'BAGHDAD',
  'BANGKOK',
  'BARCELONA',
  'BEIJING',
  'BELGRADE',
  'BERLIN',
  'BOGOTA',
  'BOSTON',
  'BRATISLAVA',
  'BRISTOL',
  'BRUSSELS',
  'BUCHAREST',
  'BUDAPEST',
  'CAMBRIDGE',
  'CHICAGO',
  'COPENHAGEN',
  'DUBAI',
  'DOCTOR',
  'DUBLIN',
  'DORTMUND',
  'FRANKFURT',
  'HELSINKI',
  'ISTANBUL',
  'KIEV',
  'LIVERPOOL',
  'LISBON',
  'LIMA',
  'LUXEMBOURG',
  'MADRID',
  'MARSEILLE',
  'MANCHESTER',
  'MOSCOW',
  'MUMBAI',
  'ROTTERDAM',
  'TOKYO',
  'ZAGREB',
  'SYDNEY',
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
  'HOSPITAL',
  'EMERGENCYROOM',
  'CAST',
  'WOUND',
  'BURN',
  'HEAL',
  'COLD',
  'FLU',
  'SICKNESS',
  'VIRUS',
  'CARDIOLOGIST',
  'ORTHOPEDIST',
  'DERMATOLOGIST',
  'GYNECOLOGIST',
  'UROLOGIST',
  'ANESTHESIOLOGIST',
  'THERAPIST',
  'ALLERGY',
  'NURSE',
  'DOCTOR',
  'ANEMIA',
  'ANTIBIOTICS',
  'BANDAGE',
  'CANCER',
  'PREGNANCY',
  'PHSIOTHERAPY',
  'INJECTION',
  'NURSE',
  'FEVER',
  'OPERATION',
  'ECZEMA',
  'RADIOGRAPHER',
  'BIOPSY',
  'EPILEPSY',
  'HEADACHE',
  'DIABETES',
  'RASH',
  'BLIND',
  'ATHLETICS',
  'AEROBICS',
  'AIKIDO',
  'AMERICANFOOTBALL',
  'ANGLING',
  'ICESKATING',
  'ARCHERY',
  'BADMINTON',
  'BACKGAMMON',
  'BASEJUMPING',
  'BASEBALL',
  'BOBSLED',
  'BILLIARDS',
  'CLIFFJUMPING',
  'FREESTYLEMOTOCROSS',
  'FOOTBALL',
  'FIELDHOCKEY',
  'FITNESS',
  'FISHING',
  'FENCING',
  'FLOWBOARDING',
  'FLYBOARDING',
  'BUNGEEJUMPING',
  'BOWLING',
  'CYCLING',
  'CRICKET',
  'DARTS',
  'GOLF',
  'HANDBALL',
  'JUDO',
  'HOCKEY',
  'KARATE',
  'GYMNASTICS',
  'KITESURFING',
  'BASKETBALL',
  'CURLING',
  'CARRACING',
  'CANOEING',
  'DIVING',
  'PARKOUR',
  'RUNNING',
  'RUGBY',
  'POLO',
  'YOGA',
  'SURFING',
  'WINDSURFING',
  'BIATHLON',
  'BOXING',
  'CAVEDIVING',
  'CAVING',
  'EQUESTRIANJUMPING',
  'WEIGHTLIFTING',
  'SWIMMING'
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
