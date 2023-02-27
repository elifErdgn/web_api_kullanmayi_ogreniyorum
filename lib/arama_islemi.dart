import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'karisikVeri/kisiler.dart';
import 'karisikVeri/kisilerCevap.dart';

class AramaIslemi extends StatefulWidget {
  const AramaIslemi({Key? key}) : super(key: key);

  @override
  State<AramaIslemi> createState() => _AramaIslemiState();
}

class _AramaIslemiState extends State<AramaIslemi> {
  List<Kisiler> parseKisilerCevap(String cevap) {
    /*
    var jsonVeri = json.decode(cevap);
    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);
    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;
    */

    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<List<Kisiler>> kisilerAra(String aramaKelimesi) async {
    var url = Uri.parse("json_link_arama");
    var veri = {"kisi_ad": aramaKelimesi};

    var cevap = await http.post(url, body: veri);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisileriGoster()async {
    var liste = await kisilerAra("a");
    for(var k in liste){
      print("*********");
      print("kişi id: ${k.kisi_id}");
      print("kişi ad: ${k.kisi_ad}");
      print("kişi tel: ${k.kisi_tel}");
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kisileriGoster();
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
