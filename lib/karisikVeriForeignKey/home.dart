import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_api_kullanmayi_ogreniyorum/karisikVeriForeignKey/Filmler.dart';
import 'package:web_api_kullanmayi_ogreniyorum/karisikVeriForeignKey/filmlerCevap.dart';

class KarisikVeriHome extends StatefulWidget {
  const KarisikVeriHome({Key? key}) : super(key: key);

  @override
  State<KarisikVeriHome> createState() => _KarisikVeriHomeState();
}

class _KarisikVeriHomeState extends State<KarisikVeriHome> {
  void filmlerCevapParse() {
    String strVeri =
        '{"success":1,"filmler":[{"film_id":"1","film_ad":"Interstellar",'
        '"film_yil":"2015","film_resim":"interstellar.png",}]}';

    /// kasim adalan 234. videdaki veriler

    var jsonVeri = json.decode(strVeri);
    var filmlerCevap = FilmlerCevap.fromJson(jsonVeri);
    int success = filmlerCevap.success;
    List<Filmler> filmlerListesi = filmlerCevap.filmlerListesi;
    print("Success:$success");

    for(var f in filmlerListesi){
      print("*******");
      print("Kişi ad: ${f.film_id}");
      print("Kişi ad: ${f.film_ad}");
      print("Kişi ad: ${f.film_yil}");
      print("Kişi ad: ${f.film_resim}");
      print("Kişi ad: ${f.kategori.kategori_ad}");
      print("Kişi ad: ${f.yonetmen.yonetmen_ad}");
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filmlerCevapParse();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
