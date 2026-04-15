import 'package:crafty_bay/features/common/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  static const String name = '/wish-list';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}
class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:  3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 8,),
          itemBuilder: (context,index){
        
            return  FittedBox(child: ProductCard());
        
          }
        ),
      ),
    );
  }
}