import 'package:zicakes/models/models_cake.dart';
import 'package:zicakes/service/cake_service.dart';
// import 'package:zicakes/view/add_cake.dart';
// import 'package:zicakes/view/chart.dart';
import 'package:zicakes/onboarding_page.dart';
import 'package:zicakes/view/detail.dart';
import 'package:zicakes/view/login.dart';
// import 'package:zicakes/view/news_kopi.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page();

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 121, 87, 43),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'zicakes',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            icon: new Icon(Icons.shopping_bag_rounded),
            color: Color.fromARGB(255, 0, 0, 0),
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
          margin: EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                        size: 28,
                      ),
                      hintText: "Search your Cake",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16)),
                ),
              ),
              // SizedBox(height: 5,),
              // Text(
              //   'Use Best Voucher',
              //   style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 13, 155, 0)),
              // ),
              SizedBox(
                height: 10,
              ),

              // GridView.builder(

              // ),
              FutureBuilder<List<Data>>(
                future: CakeService.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return ListView.separated(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detailcake(
                                            cake: Data(
                                                id: int.parse(
                                                    "${snapshot.data?[index].id}"),
                                                nama:
                                                    "${snapshot.data?[index].nama}",
                                                harga:
                                                    "${snapshot.data?[index].harga}",
                                                deskripsi:
                                                    "${snapshot.data?[index].deskripsi}",
                                                gambar:
                                                    "${snapshot.data?[index].gambar}"),
                                          )));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                child: Center(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, right: 10, left: 0),
                                        child: Container(
                                          height: 120,
                                          width: 100,
                                          // child: Image.asset(dataKopi[index].image,fit: BoxFit.contain,),
                                          decoration: BoxDecoration(
                                              // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data![index].gambar
                                                      .toString()),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  snapshot.data![index].nama
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                snapshot.data![index].deskripsi
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                snapshot.data![index].harga
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 48, 91, 60)),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 48, 91, 60),
                //  borderRadius: BorderRadius.only(bottomLeft: 9.0, bottomRight: )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kaffee,",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 172, 145, 101)),
                  ),
                  Text(
                    "For your best Coffee!",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 172, 145, 101)),
                  ),
                ],
              ),
            ),
            ListTile(
                leading:
                    Icon(Icons.home, color: Color.fromARGB(255, 172, 145, 101)),
                title: const Text(
                  'Home',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 48, 91, 60)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (Home_page()),
                      ));
                }),

            //  ListTile(
            //    leading: Icon(Icons.newspaper_rounded,color: Color.fromARGB(255, 172, 145, 101)),
            //    title: const Text('Coffee News', style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),),
            //    onTap: () {
            //      Navigator.pop(context);
            //      Navigator.push(context,
            //          MaterialPageRoute(builder: (context) => (NewsKopi()),
            //          ));
            //    },
            //  ),
            //  ListTile(
            //    leading: Icon(Icons.coffee_rounded,color: Color.fromARGB(255, 172, 145, 101)),
            //    title: const Text('Add Coffee', style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),),
            //      onTap: () {
            //        Navigator.push(context,
            //        MaterialPageRoute(builder: (context) => (AddKopi()),
            //        ));
            //      }
            //  ),
            //  new Divider(),
            //  SizedBox(height: 290,),
            //  ListTile(
            //    leading: Icon(Icons.exit_to_app,color: Color.fromARGB(255, 172, 145, 101)),
            //    trailing: new Icon(Icons.cancel,),
            //     title: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 48, 91, 60)),),
            //    onTap: () {
            //      Navigator.pop(context);
            //      Navigator.pushReplacement(context,
            //          MaterialPageRoute(builder: (context) => (dashboardd()),
            //          ));
            //    },
            //  ),
          ],
        ),
      ),
    );
  }
}
