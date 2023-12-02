import 'package:ecommmeranceeeee/views/shared/app_style.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String selectedGender = ''; // Track the selected gender
  String selectedCategory = ''; // Track the selected category
  double priceValue = 500.0; // Initial value for the price slider
  String formattedPrice = '\$500'; // Initial formatted price

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
              ),

              width: 320,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Search Product",
                  hintText: "Search Product",
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.deepPurpleAccent,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('Filter', style: appStyle(36, Colors.black, FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Gender', style: appStyle(24, Colors.black, FontWeight.bold),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildGenderContainer('Male'),
                  buildGenderContainer('Female'),
                  buildGenderContainer('Kids'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Category', style: appStyle(24, Colors.black, FontWeight.bold),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCategoryContainer('Shoes'),
                  buildCategoryContainer('Apparels'),
                  buildCategoryContainer('Accessories'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Price', style: appStyle(24, Colors.black, FontWeight.bold),),
            SizedBox(height: 5,),
            Slider(
              value: priceValue,
              min: 0,
              max: 1000,
              onChanged: (value) {
                setState(() {
                  priceValue = value;
                  formattedPrice = '\$${value.toStringAsFixed(0)}';
                });
              },
            ),
            SizedBox(height: 10,),
            Text(
              formattedPrice,
              style: appStyle(20, Colors.black, FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Text('Brand', style: appStyle(24, Colors.black, FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildBrandContainer('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3AtNKmL6_q9mPupWfXpnTIMUpE5HjF3_swMaQoxwUP4w7_b1t&s'),
                  buildBrandContainer('https://clipart-library.com/image_gallery2/Adidas-Logo-Transparent.png'),
                  buildBrandContainer('https://cdn141.picsart.com/a62355e4-7b33-424e-adca-44683e3d6586/380301671066201.jpg?to=crop&type=webp&r=1008x1008&q=85'),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildBrandContainer('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYmErUFFfqpDr5slZzijlBm19UxDZs8vkxFmHFq5551Q&s'),
                  buildBrandContainer('https://www.shutterstock.com/image-vector/bangalore-india-28-september-2023-260nw-2367869925.jpg'),
                  buildBrandContainer('https://i.pinimg.com/originals/6f/fd/c6/6ffdc608b6db9b3f7761c8ff4650e113.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGenderContainer(String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: selectedGender == gender ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            gender,
            style: appStyle(20, Colors.white, FontWeight.normal),
          ),
        ),
      ),
    );
  }

  Widget buildCategoryContainer(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          color: selectedCategory == category ? Colors.black : Colors.grey,
          border: Border.all(
            color: selectedCategory == category ? Colors.black : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            category,
            style: appStyle(20, Colors.white.withOpacity(.9), FontWeight.normal),
          ),
        ),
      ),
    );
  }

  Widget buildBrandContainer(String imageUrl) {
    return Container(
      width: 100,
      height: 70,
      child: Image(image: NetworkImage(imageUrl), fit: BoxFit.cover),
    );
  }
}
