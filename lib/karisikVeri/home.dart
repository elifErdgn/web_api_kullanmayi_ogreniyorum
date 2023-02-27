
import 'dart:convert';

import 'package:flutter/material.dart';

import 'kisiler.dart';
import 'kisilerCevap.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void kisilerCevapParse() {
    String strVeri =
        ' {"success": 1,"kisiler": [{"kisi_id": "1", "kisi_ad": "Ahmet", "kisi_tel": "23424234"},{"kisi_id": "2", "kisi_ad": "Mehmet", "kisi_tel": "66666666"},]}';

    //String veriyi json yapısına dönüştürme
    var jsonVeri = json.decode(strVeri);

    //json nesnesi alınır
    KisilerCevap kisilerCevap = KisilerCevap.fromJson(jsonVeri);

    // Nesne içindeki liste ve değişkene erişilir.
    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;
    int success = kisilerCevap.success;
    print("Success :$success");
    for (var k in kisilerListesi) {
      print("*********");
      print("Kisi id: ${k.kisi_id}");
      print("Kisi ad: ${k.kisi_ad}");
      print("Kisi tel: ${k.kisi_tel}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kisilerCevapParse();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
