import 'package:flutter/material.dart';
import 'package:fashion_shop/widgets/category_gridview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight * 0.29),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0)
          ),
          child: Container(
            color: Colors.blueAccent,
            child: Column(
              children: [
                SizedBox(height: screenheight * 0.05),
                Center(child: Text('Fashion shop', style: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),)),
                SizedBox(height: screenheight * 0.02),
                Container(
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      prefixIcon: Icon(Icons.search),
                      labelText: 'Search'
                    ),
                  ),
                ),
                SizedBox(height: screenheight * 0.035),
                Container(
                  height: 120.0,
                  width: double.infinity,
                  child: CategoryGridview(width: screenWidth, height: screenheight),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}