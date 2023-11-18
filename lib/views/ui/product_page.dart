import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/men_shoe_model/men_shoe_model.dart';
import '../../services/helper.dart';
import '../shared/product_provider.dart';

class Product_page extends StatefulWidget {
  final String id;
  final String category;

  const Product_page({Key? key, required this.id, required this.category})
      : super(key: key);

  @override
  State<Product_page> createState() => _Product_pageState();
}

class _Product_pageState extends State<Product_page> {
  final PageController pageController = PageController();

  late Future<Welcome> _sneaker;

  void getShoes() {
    if (widget.category == "RUNNING") {
      _sneaker = Helper().getMaleSneakersById(widget.id) ;
    } else if (widget.category == "FORMAL") {
      _sneaker = Helper().getFemaleSneakersById(widget.id);
    } else {
      _sneaker = Helper().getKidsSneakersById(widget.id) ;
    }
  }


  @override
  void initState(){
    super.initState();
    getShoes();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.id.toString());
    print('cat: ------${widget.category.toString()}');
    return Scaffold(
      body: FutureBuilder<Welcome>(
        future: _sneaker,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}"); // yaha error hai solve kesa kerna hai..?
          } else {
            final sneaker = snapshot.data;
            return Consumer<ProductNotifier>(
              builder: (context, productNotifier, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: null,
                              child: Icon(Icons.close),
                            )
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: false,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width,
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sneaker!.imageUrl.length,
                                  controller: pageController,
                                  onPageChanged: (page) {
                                    productNotifier.activepage = page;
                                  },
                                  itemBuilder: (context, int index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height * 0.39,
                                          width: MediaQuery.of(context).size.width,
                                          color: Colors.grey.shade300,
                                          child: Image(
                                            image: NetworkImage(sneaker.imageUrl[index]),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                          top: MediaQuery.of(context).size.height * 0.09,
                                          right: 20,
                                          child: Icon(
                                            Icons.favorite_outline_sharp,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          left: 0,
                                          height: MediaQuery.of(context).size.height * 0.3,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: List<Widget>.generate(
                                              sneaker.imageUrl.length,
                                                  (index) => Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 4),
                                                child: CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: productNotifier.activepage != index
                                                      ? Colors.grey
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
