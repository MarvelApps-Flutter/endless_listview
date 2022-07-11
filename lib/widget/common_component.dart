import 'package:flutter/material.dart';

class CommonComponent{

  static AppBar appbar(String title){
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Merienda'
        ),
        ),
      centerTitle: true,
      backgroundColor:const Color(0xFF2873F0),
    );
  }
 
  static Widget getRating(BuildContext context,dataList,int index1,{double size=25}){
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: Icon(
              Icons.star,
              size: size,
              color: dataList==null? const Color(0xFFE0E0E0):
              index1+1<=dataList!? Colors.green: const Color(0xFFE0E0E0),
            ),
    );
  }
 
  static Widget reviewText(BuildContext context,int? rating){
    return rating==null? const Text(
      'Rate this product now',
      style: TextStyle(
        fontFamily: 'NotoSerif',
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Color(0xFF7A7A7A),
      ),
    ):
    const Text(
      'Write a Review',
      style: TextStyle(
        fontFamily: 'NotoSerif',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF4279d3)
      ),
    );
  }
 
  
}