import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getir_uygulamasi/data/entity/urunler.dart';
import 'package:getir_uygulamasi/ui/views/detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Urunler>> urunleriYukle() async{
   var urunlerListesi=<Urunler>[];
   var u1=Urunler(id: 1, ad: "Ayran", resim: "ayran1.png", fiyat: 5);
   var u2=Urunler(id: 2, ad: "Labne", resim: "indirimlipeynir.png", fiyat: 64);
   var u3=Urunler(id: 3, ad: "Kasar Peyniri", resim: "kasar.png", fiyat: 97);
   var u4=Urunler(id: 4, ad: "Ezine Peyniri", resim: "peynir.png", fiyat: 58);
   var u5=Urunler(id: 5, ad: "Sut", resim: "sut.png", fiyat: 33);
   var u6=Urunler(id: 6, ad: "Tereyag", resim: "tereyag.png", fiyat: 130);
   var u7=Urunler(id: 7, ad: "Ucgen Peynir", resim: "ucgenpeynir.png", fiyat: 65);
   var u8=Urunler(id: 8, ad: "Yogurt", resim: "yogurt.png", fiyat: 48);

   urunlerListesi.add(u1);
   urunlerListesi.add(u2);
   urunlerListesi.add(u3);
   urunlerListesi.add(u4);
   urunlerListesi.add(u5);
   urunlerListesi.add(u6);
   urunlerListesi.add(u7);
   urunlerListesi.add(u8);

   return urunlerListesi;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GETIR",style: TextStyle(color: Colors.purple,fontSize: 30),),),
      body: FutureBuilder<List<Urunler>>(
        future: urunleriYukle(),
        builder: (context,snapshot){

          if(snapshot.hasData){
            var urunlerListesi=snapshot.data;
            return GridView.builder(
              itemCount: urunlerListesi!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,childAspectRatio: 1/1.8),
              itemBuilder: (context,indeks){
                var urun=urunlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>DetaySayfa(urun: urun )));

                  },
                  child: Card(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("resimler/${urun.resim}"),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${urun.fiyat} TL" ,style:TextStyle(fontSize: 24),),
                          ElevatedButton(onPressed: (){
                            print("${urun.ad} sepete eklendi");
                          }, child: const Text("Sepet"))
                        ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const Center();
          }
        },
      ),
    );
  }
}
