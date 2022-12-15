import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:zicakes/models/models_cake.dart';
import 'package:zicakes/onboarding_page.dart';

import '../models/models_cake.dart';
// import 'chart.dart';

class Detailcake extends StatefulWidget {
  final Data cake;
  const Detailcake({Key? key, required this.cake}) : super(key: key);

  @override
  State<Detailcake> createState() => _DetailcakeState();
}

class _DetailcakeState extends State<Detailcake> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 121, 87, 43),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 172, 145, 101)),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Zicakes',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            icon: new Icon(Icons.shopping_bag_rounded),
            color: Color.fromARGB(255, 172, 145, 101),
            onPressed: () {
              print('Keranjang');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingPage()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: [
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.cake.gambar.toString()),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cake.nama.toString(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 91, 79, 48),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),

                    Text(
                      widget.cake.deskripsi.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   height: 50,
                    //   width: width,
                    //   child: ListView.builder(
                    //     itemCount: widget.Data.rate,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, int key) {
                    //       return Icon(
                    //         Icons.star,
                    //         color: Colors.amber.shade300,
                    //         size: 28,
                    //       );
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              widget.cake.harga.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 91, 68, 48),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   style: ElevatedButton.styleFrom(
                        //       padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
                        //       shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(10.0)),
                        //       primary: Color.fromARGB(255, 48, 91, 60)),
                        //   child: Text(
                        //     'Chart',
                        //     style: TextStyle(
                        //         color: Color.fromARGB(255, 172, 145, 101),
                        //         fontSize: 18),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
