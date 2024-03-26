import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getir_uygulamasi/data/entity/urunler.dart';

class DetaySayfa extends StatefulWidget {
  Urunler urun;

  DetaySayfa({required this.urun});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.urun.ad,style:const TextStyle(fontSize: 50),),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.urun.resim}"),
            Text("${widget.urun.fiyat} TL",style: const TextStyle(fontSize: 50),),
          ],

        ),
      ),
    );
  }
}
