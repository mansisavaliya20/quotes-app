import 'package:flutter/material.dart';
import 'package:qutoes_app/views/modals/modal_class.dart';

class Add_quotes_page extends StatefulWidget {
  const Add_quotes_page({Key? key}) : super(key: key);

  @override
  State<Add_quotes_page> createState() => _Add_quotes_pageState();
}

class _Add_quotes_pageState extends State<Add_quotes_page> {
  bool add = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favourite Quotes"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: global.fav
                  .map((e) => Card(
                        child: ListTile(
                          title: Text("$e"),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                global.fav.remove(e);
                              });
                            },
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
