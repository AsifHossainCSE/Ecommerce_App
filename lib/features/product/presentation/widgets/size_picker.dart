import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class  SizePiker extends StatefulWidget{
  const SizePiker({super.key, required this.onChange, required this.sizes});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePiker> createState() => _SizePikerState();
}

class _SizePikerState extends State<SizePiker> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for(String color in widget.sizes)
        GestureDetector(
          onTap: (){
            _selectedSize = color;
            widget.onChange(_selectedSize!);
            setState(() {

              
            });
          },
          child: Container(
            margin: .only(right: 8),
            padding: .symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey),
              color: _selectedSize == color ? AppColors.themeColor : null,
            ),
            child: Text(color, style: TextStyle(
             color:  _selectedSize == color ? Colors.white : null,
            ),),
          ),
        )
      ],
    );
  }
}