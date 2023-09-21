import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qutoes_app/views/helpers/dbh_helper.dart';
import 'package:qutoes_app/views/modals/modal_class.dart';
import 'package:share_plus/share_plus.dart';

class Image_Page extends StatefulWidget {
  final qoute;
  final image;
  const Image_Page({Key? key, required this.image, required this.qoute})
      : super(key: key);

  @override
  State<Image_Page> createState() => _Image_PageState();
}

class _Image_PageState extends State<Image_Page> {
  final Random random = Random();
  var f;
  @override
  Widget build(BuildContext context) {
    String qu = widget.qoute;
    return Scaffold(
      body: Center(
          child: FutureBuilder(
        future: DBhelper.dBhelper.Fetchbg(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 1, right: 4),
                  padding: const EdgeInsets.only(top: 70, right: 15, left: 15),
                  height: 650,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage("${global.image}"), fit: BoxFit.fill),
                  ),
                  child: Text(
                    (data == null) ? widget.qoute : "${global.q}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 10, left: 5),
                  height: 70,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            global.image = global.background[
                                random.nextInt(global.background.length)];
                          });
                        },
                        icon: const Icon(
                          Icons.image,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            global.q = global
                                .qoutes[random.nextInt(global.qoutes.length)];
                          });
                        },
                        icon: const Icon(
                          Icons.text_fields,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              f = global
                                  .font[random.nextInt(global.font.length)];
                            });
                          },
                          icon: const Icon(
                            Icons.text_format,
                            color: Colors.white,
                          )),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            var A = global.fav.add(global.q);

                            if (A = true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Add to Favourite.."),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Can't add to Favourite")));
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Clipboard.setData(ClipboardData(text: global.q))
                                .then(
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Copy to Clipboard",
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            );
                          });
                        },
                        icon: const Icon(
                          Icons.copy,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Share.share(global.q);
                          });
                        },
                        icon: const Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
