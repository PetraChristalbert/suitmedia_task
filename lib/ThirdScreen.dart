import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:suitmedia/localdata.dart';
import 'package:http/http.dart' as http;

class ThirdScreenWidget extends StatefulWidget {
  const ThirdScreenWidget({super.key});

  @override
  State<ThirdScreenWidget> createState() => _ThirdScreenWidgetState();
}

class _ThirdScreenWidgetState extends State<ThirdScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, String>> users = [];
  int Limit = 10;

  @override
  void initState() {
    super.initState();
    GenerateAccount();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void GenerateAccount() async {
    users = await FetchData();
    setState(() {});
  }

  Future<List<Map<String, String>>> FetchData() async {
    final response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=1&per_page=12'));

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        final List<dynamic> userData = jsonData['data'];

        List<Map<String, String>> resultList = [];

        for (var i = 0; i < userData.length; i++) {
          var user = userData[i];
          resultList.add({
            'id': user['id'].toString(),
            'email': user['email'],
            'first_name': user['first_name'],
            'last_name': user['last_name'],
            'avatar': user['avatar'],
          });
        }

        return resultList;
      } catch (e) {
        print("Error decoding JSON response: ${response.body}");
        return [];
      }
    } else {
      throw Exception('Failed to load data from API.');
    }
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
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            'Third Screen',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontSize: 16,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
            setState(() {
              Limit = 10;
            });
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.metrics.pixels ==
                  scrollNotification.metrics.maxScrollExtent) {
                if (Limit == 10) {
                  setState(() {
                    Limit += 10;
                  });
                }
              }
              if (scrollNotification.metrics.pixels ==
                  scrollNotification.metrics.minScrollExtent) {
                if (Limit > 10) {
                  setState(() {
                    Limit = 10;
                  });
                }
              }
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  for (int i = 0; i < users.length && i < Limit; i++)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
                      child: GestureDetector(
                        onTap: () {
                          localdata.Frontname = users[i]['first_name']!;
                          localdata.Lastname = users[i]['last_name']!;
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                color: Color(0x9BC7C9CC),
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      users[i]['avatar']!,
                                      width: 49,
                                      height: 49,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${users[i]['first_name']!} ${users[i]['last_name']!}",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      users[i]['email']!,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
