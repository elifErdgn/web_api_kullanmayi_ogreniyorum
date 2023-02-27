import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:web_api_kullanmayi_ogreniyorum/karisikVeri/kisilerCevap.dart';

import 'karisikVeri/kisiler.dart';

class GetKulanimi extends StatefulWidget {
  const GetKulanimi({Key? key}) : super(key: key);

  @override
  State<GetKulanimi> createState() => _GetKulanimiState();
}

class _GetKulanimiState extends State<GetKulanimi> {
  List<Kisiler> parseKisilerCevap(String cevap) {
    /*
    var jsonVeri = json.decode(cevap);
    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);
    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;
    */

    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<List<Kisiler>> tumKisiler() async {
    var url = Uri.parse("json_link");

    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisileriGoster()async {
    var liste = await tumKisiler();
    for(var k in liste){
      print("*********");
      print("kişi id: ${k.kisi_id}");
      print("kişi ad: ${k.kisi_ad}");
      print("kişi tel: ${k.kisi_tel}"); 
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
