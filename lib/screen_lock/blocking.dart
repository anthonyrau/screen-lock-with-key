import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Blocking extends StatefulWidget {
  const Blocking({Key? key}) : super(key: key);


  @override
  _BlockingState createState() => _BlockingState();
}

class _BlockingState extends State<Blocking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6200EA),
              Color(0xFF311B92),
            ],
            begin: Alignment.topRight,
          ),
        ),
        child: const BlockingScreen(),
      ),
    );
  }
}

class BlockingScreen extends StatefulWidget {
  const BlockingScreen({Key? key}) : super(key: key);

  @override
  _BlockingScreenState createState() => _BlockingScreenState();
}

class _BlockingScreenState extends State<BlockingScreen> {
  List<String> currentPin = ['', '', '', ''];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();

  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          buildExitButton(),
          Expanded(
            child: Container(
              alignment: const Alignment(0, 0.5),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  buildSecurityText(),
                  const SizedBox(
                    height: 40.0,
                  ),
                  buildPinRow(),
                ],
              ),
            ),
          ),
          buildNumberPad(),
        ],
      ),
    );
  }

  buildNumberPad() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyboardNumber(
                    n: 1,
                    onPressed: () {
                      pinIndexSetup('1');
                    },
                  ),
                  KeyboardNumber(
                    n: 2,
                    onPressed: () {
                      pinIndexSetup('2');
                    },
                  ),
                  KeyboardNumber(
                    n: 3,
                    onPressed: () {
                      pinIndexSetup('3');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyboardNumber(
                    n: 4,
                    onPressed: () {
                      pinIndexSetup('4');
                    },
                  ),
                  KeyboardNumber(
                    n: 5,
                    onPressed: () {
                      pinIndexSetup('5');
                    },
                  ),
                  KeyboardNumber(
                    n: 6,
                    onPressed: () {
                      pinIndexSetup('6');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeyboardNumber(
                    n: 7,
                    onPressed: () {
                      pinIndexSetup('7');
                    },
                  ),
                  KeyboardNumber(
                    n: 8,
                    onPressed: () {
                      pinIndexSetup('8');
                    },
                  ),
                  KeyboardNumber(
                    n: 9,
                    onPressed: () {
                      pinIndexSetup('9');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    width: 60.0,
                    child: MaterialButton(
                      onPressed: null,
                      child: Icon(
                        Icons.hvac_sharp,
                        color: Colors.white,
                      )
                    ),
                  ),
                  KeyboardNumber(
                    n: 0,
                    onPressed: () {
                      pinIndexSetup('0');
                    },
                  ),
                  SizedBox(
                    width: 60.0,
                    child: MaterialButton(
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0)
                      ), 
                      onPressed: () {
                        clearPin();
                      },
                      child: const Icon(
                        Icons.backspace,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  clearPin() {
    if (pinIndex ==0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      setPin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex--;
    } else {
      setPin(pinIndex, '');
      currentPin[pinIndex - 1] = '';
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    }
    else if (pinIndex < 4) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex-1] = text;
    String strPin = '';
    currentPin.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 4) {
      print(strPin);
    }
  }

  setPin(int n, String text) {
    switch(n) {
      case 1: 
      pinOneController.text = text; 
      break;
      case 2: 
      pinTwoController.text = text; 
      break;
      case 3: 
      pinThreeController.text = text; 
      break;
      case 4: 
      pinFourController.text = text; 
      break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinOneController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinTwoController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThreeController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourController,
        ),
      ],
    );
  }

  buildSecurityText() {
    return const Text(
      'Create your password',
      style: TextStyle(
        color: Colors.white70,
        fontSize: 21.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }


  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: (){},
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  const PINNumber({
    Key? key, 
    required this.textEditingController, 
    required this.outlineInputBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16.0),
          border: outlineInputBorder,
          filled: true,
          fillColor: Colors.white30,
        ),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  const KeyboardNumber({
    Key? key, 
    required this.n, 
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF6200EA).withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: const EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90.0,
        child: Text(
          '$n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24 * MediaQuery.of(context).textScaleFactor,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}