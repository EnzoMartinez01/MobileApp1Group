import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:v4s/screens/banner.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class principal extends StatelessWidget {
  @override
  List<String> images = [
    "https://i.imgur.com/B2hoaJP.jpg",
    "https://i.imgur.com/Se0syJE.jpg",
    "https://i.imgur.com/1BmMacO.jpg"
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      body: Container(
        child: Column(
          children: [
 Image.network('https://i.imgur.com/ykZmban.png?2' ,
  width: MediaQuery.of(context).size.width,
  fit: BoxFit.fitWidth,),
            SizedBox(
              height: 10,
            ),
            Container(
              child: _banner(),
            ),
            Expanded(child: banner())
          ],
        ),
      ),
    );
  }

  Widget _banner() {
    return Container(
      width: double.infinity,
      height: 250.0,
      child: Container(
        child: Swiper(
          viewportFraction: 0.9,
          scale: 0.7,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return FlatButton(
              child: Image.network(
                images[index],
                fit: BoxFit.fill,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'beta');
              },
            );
          },
          pagination: SwiperPagination(margin: EdgeInsets.only(top: 10)),
        ),
      ),
    );
  }
}
