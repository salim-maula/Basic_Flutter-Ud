import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  String title = "Antara Menpora, Bonus Piala Thomas, dan Kas Negara";

  String publish = '20 Oktober 2021  10:14';
  String update = '20 Oktober 2021  10:20';
  String imageCover =
      'https://akcdn.detik.net.id/community/media/visual/2021/10/18/piala-thomas-1.jpeg?w=700&q=90';
  String imageDescription =
      'Antara Menpora, Bonus Piala Thomas, dan Kas Negara';

  String content= '''
  Menteri asal Gorontalo menjamin bonus akan turun untuk tim Piala Thomas. Ke depannya, ia berharap tak akan ada lagi sindir-menyindir terkait apresiasi pemerintah untuk atlet berprestasi.

Untuk itu, masalah bonus pun akan dibuat aturan-aturannya. Kejuaraan mana misalnya yang dianggap layak mendapat bonus, dan kejuaraan mana yang dianggap kurang prestise.

"Kami sudah memutuskan untuk pemberian apresiasi dari pemerintah dalam bentuk bonus. Saya harus hati-hati karena ini menyangkut keuangan negara, saya tidak mau salah kalau ternyata dalam aturan kita tidak begitu cukup jelas. Kami juga berkonsultasi dengan Kementerian Keuangan kaitan dengan apresiasi ini," ucap Amali.

"Nah penyerahannya kami rencanakan kalau tidak Selasa atau hari Rabu pekan depan bersama dengan kami akan serahkan. Ini bukan seperti jajan di warung, kita mau tinggal beli, kita dapat, tentu beda. Pengelolaan uang negara itu harus hati-hati. Harus jelas betul," tuturnya.

"Saya juga tidak tahu gejala apa itu (atlet minta bonus) makanya nanti akan kami menyampaikan, menjelaskan kepada PBSI tentang ini loh kenapa kami harus hati-hati. Karena Kemenpora ini setelah 10 tahun berturut-turut tidak pernah dapat WTP (wajar tanpa pengecualian) bahkan sempat disclaimer dua tahun, sekarang kami sudah dapat WTP maka saya jaga betul, saya tidak kamu ada pengeluaran tanpa adanya aturan yang jelas," katanya menegaskan.

Baca artikel detiksport, "Antara Menpora, Bonus Piala Thomas, dan Kas Negara" 
  ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel Page'),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'notif',
                    mini: true,
                    child: Icon(Icons.notifications),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'share',
                    mini: true,
                    child: Icon(Icons.share),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Publish : ' + publish,
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Update : ' + update,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Stack(
                children: [
                  Image.network(
                    imageCover,
                  ),
                  Positioned(
                    top: 6,
                    right: 8,
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.visibility),
                        label: Text('Lihat Foto')),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                imageDescription,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                content,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
