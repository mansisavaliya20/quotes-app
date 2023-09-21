import 'package:flutter/material.dart';
import 'package:qutoes_app/views/screens/Image_Page.dart';

import '../helpers/dbh_helper.dart';

class List_page extends StatefulWidget {
  const List_page({Key? key}) : super(key: key);

  @override
  State<List_page> createState() => _List_pageState();
}

class _List_pageState extends State<List_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: DBhelper.dBhelper.Featchdata(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          var data = snapshot.data;

          return ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) => Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Image_Page(
                                image: data[index]['image'],
                                qoute: data[index]['quote'],
                              )));
                    },
                    child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        margin: const EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 5),
                        height: 500,
                        width: 350,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(
                                data[index]['image'],
                              ),
                              fit: BoxFit.fill),
                        ),
                        child: Text(
                          "${data[index]['quote']}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
