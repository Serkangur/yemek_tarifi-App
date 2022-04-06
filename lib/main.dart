import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'YEMEK TARİFİ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: ekranGenisligi,
                child: Image.asset("resimler/kebab.jpg"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.blue),
                    child: Yazi("Beğen", ekranGenisligi / 22),
                    onPressed: () {
                      print("beğenildi");
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.purple),
                    child: Yazi("Yorum Yap", ekranGenisligi / 22),
                    onPressed: () {
                      print("Yorum Yapıldı");
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi / 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "KEBAB",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: ekranGenisligi / 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Yazi("Adana kebab çok hojdur", ekranGenisligi / 25),
                        Yazi("8 Ağustos", ekranGenisligi / 25)
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ekranYuksekligi / 100),
                child: Yazi(
                    "icerPişirirken kebapların kurumamasına ve sulu kalmasına özen göstererek pişirmek kebaplarınızın daha lezzetli olmasını sağlayacaktır",
                    ekranGenisligi / 25),
              )
            ],
          ),
        ));
  }
}

class Yazi extends StatelessWidget {
  String icerik;
  double yaziBoyut;

  Yazi(this.icerik, this.yaziBoyut);

  @override
  Widget build(BuildContext context) {
    return Text(
      icerik,
      style: TextStyle(fontSize: yaziBoyut),
    );
  }
}
