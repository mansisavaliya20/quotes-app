import 'package:flutter/material.dart';
import 'package:qutoes_app/views/modals/modal_class.dart';
import 'package:qutoes_app/views/screens/fav_page.dart';
import 'package:qutoes_app/views/screens/list_page.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quotes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Add_quotes_page()));
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Mybox(image: "wallpaper_1.jpg"),
                Mybox(image: "w_4.jpg"),
                Mybox(image: "w_3.jpg"),
                Mybox(image: "w_2.jpg"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Mybox({required String image}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const List_page()));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 170,
        width: 340,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 5),
            borderRadius: BorderRadius.circular(15),
            color: Colors.pink,
            image: DecorationImage(
                image: AssetImage(imagepath + "${image}"), fit: BoxFit.fill)),
      ),
    );
  }
}
