import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    @override
    Widget nahiajudul = Container(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text('Lawang Sewu',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              Text('Semarang, Jawa Tengah', style: TextStyle(fontSize: 15))
            ],
          )),
          FavoriteWidget()
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget nahiaIcon = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _nahiaIcon(color, Icons.call, 'Telepon'),
          _nahiaIcon(color, Icons.near_me, 'Rute'),
          _nahiaIcon(color, Icons.share, 'Share'),
        ],
      ),
    );

    Widget nahiaDeskripsi = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        "Lawang Sewu (Seribu Pintu) adalah landmark di Semarang, Jawa Tengah, Indonesia, yang dibangun sebagai kantor pusat Perusahaan Kereta Api Hindia Belanda. Bangunan era kolonial terkenal sebagai rumah berhantu dan lokasi syuting, meskipun pemerintah kota Semarang telah berusaha mengubah citra itu. \n\nNama Lawang Sewu berasal dari bahasa Jawa; yang memiliki arti Seribu Pintu. Nama ini berasal dari desainnya, dengan banyak uang. Bangunan ini memiliki sekitar 1000 jendela besar. \n\nKompleks Lawang Sewu terdiri dari beberapa bangunan, dua yang utama bernama A dan B dan dua yang lebih bernama C dan D, di Jalan Pemuda. Bangunan A yang berbentuk l menghadap bundaran Tugu Muda. Ada dua menara identik di gedung A, yang awalnya digunakan untuk menyimpan air, masing-masing dengan kapasitas 7000 liter (1800 US gal). Bangunan ini memiliki jendela-jendela kaca besar dan tangga besar di tengahnya. Ada juga sebuah terowongan yang menghubungkan bangunan A ke beberapa situs lain di kota, termasuk rumah gubernur dan pelabuhan. \n\nDi depan sebuah gedung berdiri sebuah monumen untuk lima karyawan yang terbunuh selama Perang Kemerdekaan Indonesia .  \n\n\nPradana Aditiya Putra \nSKP 19.2S Siliwangi",
        softWrap: true,
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 13.5),
      ),
    );

    return MaterialApp(
      title: 'Dindoot',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.teal[400],
              title: Text('Maskot Semarang'),
              centerTitle: true),
          body: ListView(
            children: [
              Image.asset('images/gambar.jpg',
                  width: 600, height: 300, fit: BoxFit.cover),
              nahiajudul,
              nahiaIcon,
              nahiaDeskripsi,
            ],
          )),
    );
  }

  Column _nahiaIcon(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(label,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: color)),
        )
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _FavoriteCount = 100;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _FavoriteCount -= 1;
        _isFavorited = false;
      } else {
        _FavoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            color: Colors.pink,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 30,
          child: Container(
            child: Text('$_FavoriteCount'),
          ),
        )
      ],
    );
  }
}
