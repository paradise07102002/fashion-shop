import 'package:flutter/material.dart';
import 'package:fashion_shop/models/category_model/get_category.dart' as CategoryModel;
import 'package:fashion_shop/services/category_service/category_service.dart';

class CategoryGridview extends StatefulWidget {
  const  CategoryGridview({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  State<CategoryGridview> createState() => _CategoryGridviewState();
}

class _CategoryGridviewState extends State<CategoryGridview> {
  late Future<List<CategoryModel.Result>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryService().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel.Result>>(
      future: futureCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Error'));
        } else {
          final categories = snapshot.data!;
          return GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 5.0
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final catgory = categories[index];
              return Column(
                children: [
                  Container(
                    width: widget.width * 0.165,
                    height: widget.width * 0.165,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(widget.width * 0.33)),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0
                      ),
                      color: Colors.white
                    ),
                    child: ClipOval(
                      child: Image.network(catgory.thumbnail ?? '', fit: BoxFit.contain,)
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}