import 'package:flutter/material.dart';
import 'package:suitmedia/ThirdScreen.dart';
import 'package:suitmedia/localdata.dart';
import 'package:suitmedia/main.dart';

class SecondScreenWidget extends StatefulWidget {
  const SecondScreenWidget({super.key});

  @override
  State<SecondScreenWidget> createState() => _SecondScreenWidgetState();
}

class _SecondScreenWidgetState extends State<SecondScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: Icon(
                Icons.chevron_left_sharp,
                color: Color(0xFF554AF0),
                size: 30,
              ),
              onPressed: () {
                localdata.Frontname = "";
                localdata.Lastname = "";
                localdata.Name = "";
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
            ),
          ),
          title: Text(
            'Second Screen',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontSize: 16,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wellcome',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          localdata.Name,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                localdata.Frontname.isEmpty
                    ? "Selected User Name"
                    : "${localdata.Frontname} ${localdata.Lastname}",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThirdScreenWidget(),
                      ),
                    ).then((_) {
                      setState(() {});
                    });
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
                        'Choose a User',
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
    );
  }
}
