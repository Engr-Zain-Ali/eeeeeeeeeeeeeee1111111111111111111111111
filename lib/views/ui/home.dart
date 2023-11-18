
import 'package:ecommmeranceeeee/views/shared/home_bottom_men_shoe.dart';
import 'package:ecommmeranceeeee/views/shared/new_shoe.dart';
import 'package:flutter/material.dart';
import 'package:ecommmeranceeeee/generated/assets.dart';
import 'package:ecommmeranceeeee/services/helper.dart';
import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:ecommmeranceeeee/views/shared/product_card.dart';

import '../../models/men_shoe_model/men_shoe_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController =
  TabController(length: 3, vsync: this);
  late Future<List<Welcome>> _male;
  late Future<List<Welcome>> _female;
  late Future<List<Welcome>> _kids;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKIDSSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/2.png"),
                      fit: BoxFit.fill),
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(300)),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(

                    children: [
                      Text(
                        "Charming ",
                        style:
                        appStyleHt(42, Colors.white, FontWeight.bold, 1.7),
                      ),
                      Text(
                        "Shoes ",
                        style: appStyleHt(42, Colors.black.withOpacity(.9),
                            FontWeight.bold, 0.3),
                      ),
                      Text(
                        "Collection",
                        style:
                        appStyleHt(42, Colors.blue, FontWeight.bold, 1.9),
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                        unselectedLabelColor: Colors.black,
                        tabs: [
                         Tab(
                           text: "Men Shoes",
                         ),
                         Tab(
                           text: "Women Shoes",
                         ),
                         Tab(
                           text: "Kids Shoes",
                         )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.256),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                     Home_Bottom_Men_Shoe(male:_male),
                        Home_Bottom_Men_Shoe(male:_female),
                        Home_Bottom_Men_Shoe(male:_kids),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:ecommmeranceeeee/generated/assets.dart';
// import 'package:ecommmeranceeeee/services/helper.dart';
// import 'package:ecommmeranceeeee/views/shared/app_style.dart';
// import 'package:ecommmeranceeeee/views/shared/product_card.dart';
// import 'package:flutter/material.dart';
//
// import '../../models/men_shoe_model/men_shoe_model.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> with TickerProviderStateMixin {
//   late final TabController _tabController =
//       TabController(length: 3, vsync: this);
//   late Future<List<Welcome>> _male;
//   late Future<List<Welcome>> _female;
//   late Future<List<Welcome>> _kids;
//
//   void getMale() {
//     _male = Helper().getMaleSneakers() as Future<List<Welcome>>;
//   }
//
//   void getFemale() {
//     _female = Helper().getFemaleSneakers() as Future<List<Welcome>>;
//   }
//
//   void getKids() {
//     _kids = Helper().getKIDSSneakers() as Future<List<Welcome>>;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getMale();
//     getFemale();
//     getKids();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("assets/images/2.png"),
//                       fit: BoxFit.fill),
//                   borderRadius:
//                       BorderRadius.only(bottomLeft: Radius.circular(200)),
//                 ),
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                     children: [
//                       Text(
//                         "Charming ",
//                         style:
//                             appStyleHt(42, Colors.white, FontWeight.bold, 1.7),
//                       ),
//                       Text(
//                         "Shoes ",
//                         style: appStyleHt(42, Colors.black.withOpacity(.8),
//                             FontWeight.bold, 0.3),
//                       ),
//                       Text(
//                         "Collection",
//                         style:
//                             appStyleHt(42, Colors.blue, FontWeight.bold, 1.9),
//                       ),
//                       TabBar(
//                         indicatorSize: TabBarIndicatorSize.label,
//                         indicatorColor: Colors.transparent,
//                         controller: _tabController,
//                         isScrollable: true,
//                         labelColor: Colors.white,
//                         labelStyle: appStyle(25, Colors.white, FontWeight.bold),
//                         unselectedLabelColor: Colors.black,
//                         tabs: [
//                           Tab(
//                             text: "Men Shoes",
//                           ),
//                           Tab(
//                             text: "Women Shoes",
//                           ),
//                           Tab(
//                             text: "Kids Shoes",
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.256),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 12.0),
//                   child: Container(
//                     child: TabBarView(
//                       controller: _tabController,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               color: Colors.grey.withOpacity(.5),
//                               height:
//                                   MediaQuery.of(context).size.height * 0.405,
//                               child: FutureBuilder<List<Welcome>>(
//                                   future: _male,
//                                   builder: (context, snapshot) {
//                                     if (snapshot.connectionState ==
//                                         ConnectionState.waiting) {
//                                       return CircularProgressIndicator();
//                                     } else if (snapshot.hasError) {
//                                       return Text("Error${snapshot.error}");
//                                     } else {
//                                       final male = snapshot.hasData;
//                                       return ListView.builder(
//                                           itemCount: 10,
//                                           scrollDirection: Axis.horizontal,
//                                           itemBuilder: (context, index) {
//                                             final shoe = snapshot.data![index];
//                                             return Product_Card(
//                                               name: shoe.name,
//                                               image: shoe.imageUrl[0],
//                                               id: shoe.id.toString(),
//                                               category:
//                                                   shoe.category.toString(),
//                                               price: shoe.price.toString(),
//                                             );
//                                           });
//                                     }
//                                   }),
//                             ),
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 12.0,
//                                       right: 18,
//                                       top: 18,
//                                       bottom: 18),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Latest Shoes",
//                                         style: appStyle(
//                                             22, Colors.black, FontWeight.bold),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "Show All",
//                                             style: appStyle(22, Colors.black,
//                                                 FontWeight.bold),
//                                           ),
//                                           Icon(
//                                             Icons.arrow_forward,
//                                             size: 25,
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Container(
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.10,
//                                   child: ListView.builder(
//                                       itemCount: 6,
//                                       scrollDirection: Axis.horizontal,
//                                       itemBuilder: (context, index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: Container(
//                                             child: Image(
//                                               image: AssetImage(
//                                                   'assets/images/3.png'),
//                                               fit: BoxFit.cover,
//                                             ),
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                   color: Colors.white,
//                                                   //spreadRadius: .9,
//                                                   blurRadius: 3.0,
//                                                   offset: Offset(0, 1),
//                                                 ),
//                                               ],
//                                               color: Colors.white,
//                                             ),
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height *
//                                                 0.12,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width *
//                                                 0.28,
//                                           ),
//                                         );
//                                       }),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height:
//                                   MediaQuery.of(context).size.height * 0.405,
//                               color: Colors.grey,
//                             )
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height:
//                                   MediaQuery.of(context).size.height * 0.405,
//                               color: Colors.red,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
