import 'package:flutter/material.dart';
import 'package:suitmedia/SecondScreen.dart';
import 'package:suitmedia/localdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  String Palindrome = "";

  @override
  void initState() {
    super.initState();

    textController1 ??= TextEditingController();
    textFieldFocusNode1 ??= FocusNode();

    textController2 ??= TextEditingController();
    textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    super.dispose();
  }

  bool isPalindrome(String str) {
    String cleanedStr =
        str.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();
    String reversedStr = cleanedStr.split('').reversed.join('');
    return cleanedStr == reversedStr;
  }

  void showDialogs(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFf1f4f8),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/5ea2a92c2d7771c7921246067122c2e9.png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: 0.8,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              'assets/32f7c87c9837957ea28a7fca1c27c7ab.png',
                              width: 116,
                              height: 116,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 15),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              localdata.Name = value;
                            },
                            controller: textController1,
                            focusNode: textFieldFocusNode1,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0x9B57636C),
                                letterSpacing: 0,
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                            ),
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 15),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              Palindrome = value;
                            },
                            controller: textController2,
                            focusNode: textFieldFocusNode2,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Palindrome',
                              labelStyle: TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Color(0x9B57636C),
                                letterSpacing: 0,
                              ),
                              hintStyle: TextStyle(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                            ),
                            style: TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 15),
                        child: GestureDetector(
                          onTap: () {
                            if (isPalindrome(Palindrome)) {
                              showDialogs(
                                  context, "Palindrome Check", "isPalindrome");
                            } else {
                              showDialogs(context, "Palindrome Check",
                                  "not palindrome");
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B637B),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                'CHECK',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 15),
                        child: GestureDetector(
                          onTap: () {
                            if (localdata.Name.isNotEmpty) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SecondScreenWidget(),
                                ),
                              );
                            } else {
                              showDialogs(
                                  context, "Name Check", "Please input name.");
                            }
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(0xFF2B637B),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
