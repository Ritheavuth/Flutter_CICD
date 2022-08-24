import 'package:flutter/material.dart';
import 'package:vgo_app/Activity/widgets/category_item.dart';

class CategoryRow extends StatefulWidget {
  const CategoryRow({Key? key}) : super(key: key);

  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  var categoryList = ['All', 'Kid/Family', 'Travel', 'Sport'];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            categoryList.length,
            ((index) {
              return InkWell(
                onTap: () {
                  setIndex(index);
                },
                child: CategoryItem(
                  title: categoryList[index],
                  isClicked: currentIndex == index ? true : false,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
