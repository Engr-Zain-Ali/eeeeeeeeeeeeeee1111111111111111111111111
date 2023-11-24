import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';
class Product_Card extends StatefulWidget {
  const Product_Card({super.key, required this.name, required this.image, required this.id, required this.category, required this.price, required this.items_left, required this.text});
  final String name;
  final String image;
  final String id;
  final String category;
  final String price;
  final String items_left;
  final String text;

  @override
  State<Product_Card> createState() => _Product_CardState();
}

class _Product_CardState extends State<Product_Card> {
  @override
  Widget build(BuildContext context) {
    bool selected=true;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 5,bottom: 25),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width*0.6,

          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(

                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.8,
                offset: Offset(1,1),
              ),

            ],



          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                     Container(
                      height: MediaQuery.of(context).size.height*0.20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.image),fit: BoxFit.cover,

                          )
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,



                        child: GestureDetector(
                            onTap: null,
                            child: Icon(Icons.favorite_outline_sharp,color: Colors.red,size: 27,))),
                    Positioned(
                        left: 14,
                        top: 10,



                        child: GestureDetector(
                            onTap: null,
                            child: Text(widget.items_left,style: appStyle(18, Colors.black, FontWeight.bold),

                            ),
                        ),
                    ),
                    Positioned(
                        left: 25,
                        top: 10,



                        child: GestureDetector(
                            onTap: null,
                            child: Text(widget.text,style: appStyle(16, Colors.grey, FontWeight.bold),))),


                  ],

                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: appStyleHt(24, Colors.black, FontWeight.bold,1.1),),
                      Text(widget.category,style: appStyleHt(18, Colors.grey, FontWeight.bold,1.5),),


                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.price,style: appStyle(26, Colors.black, FontWeight.bold,),),
                      Row(
                        children: [
                          Text("Colors:",style: appStyle(18, Colors.red, FontWeight.bold),),
                          SizedBox(width: 5,),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.blue,
                          ),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.red,
                          ),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.black,
                          ),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.green,
                          ),
                          CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.grey,
                          ),




                        ],
                      )
                    ],
                  ),
                )






              ],
            ),
          ),

        ),
      ),

    );
  }
}
