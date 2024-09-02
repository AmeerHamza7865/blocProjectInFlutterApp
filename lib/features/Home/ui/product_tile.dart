import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/features/Home/bloc/home_bloc.dart';
import 'package:flutter_bloc_project/features/Home/models/data_products_models.dart';

class ProductTile extends StatelessWidget {
 final DataProductsModels productsModels;
 HomeBloc homeBloc=HomeBloc();
   ProductTile({super.key, required this.productsModels,required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(

        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),

      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              
              image: DecorationImage(
                image: NetworkImage(productsModels.imageUrl),
                fit: BoxFit.cover,
                
              
              )
            ),
          ),
          // Image.network(productsModels.imageUrl,fit: BoxFit.cover,),
          Text(productsModels.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
         
          Text(productsModels.description),
          SizedBox(height: 20,),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("\$"+productsModels.price.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
               Row(
              
                children: [
                   IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishListButtonClickEvent(clickProduct: productsModels));
                        // homeBloc.add(HomeWishListButtonNavigationEvent());
                      },
                      icon: Icon(
                        Icons.favorite_border_outlined,
                       
                      )),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickEvent(clickProduct: productsModels));
                        // homeBloc.add(HomeCartButtonNavigationEvent());
                      },
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                       
                      )),
                ],
               )
             ],
           ),
           
        ],
      ),
    );
  }
}