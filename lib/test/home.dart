// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:e_commerce_iti/provider/product_provider.dart';
// import 'package:e_commerce_iti/screens/home/product_overview/product_overview.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'drawer_side.dart';
// import 'product.dart';
//
// class HomeScreen1 extends StatefulWidget {
//   const HomeScreen1({super.key});
//
//   @override
//   State<HomeScreen1> createState() => _HomeScreen1State();
// }
//
// class _HomeScreen1State extends State<HomeScreen1> {
//   late ProductProvider productProvider;
//   Widget _buildHerbsProduct(context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Herbs Seasonings'),
//               GestureDetector(
//                 onTap: () {
//                   // Navigator.of(context).push(
//                   //   MaterialPageRoute(
//                   //     builder: (context) => Search(
//                   //       search: productProvider.getHerbsProductDataList,
//                   //     ),
//                   //   ),
//                   // );
//                 },
//                 child: Text(
//                   'view all',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: productProvider.getHerbsProductList.map(
//                   (herbsProductData) {
//                 return SingleProduct(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => ProductOverview(
//                           // productId: herbsProductData.productId,
//                           productPrice: herbsProductData.productPrice,
//                           productName: herbsProductData.productName,
//                           productImage: herbsProductData.productImage,
//                         ),
//                       ),
//                     );
//                   },
//                   productImage: herbsProductData.productImage,
//                   productName: herbsProductData.productName,
//                   productPrice: herbsProductData.productPrice,
//                 );
//               },
//             ).toList(),
//             // children: [
//
//             // ],
//           ),
//         ),
//       ],
//     );
//   }
//   @override
//   void initState() {
//    ProductProvider productProvider=Provider.of(context,listen: false);
//    productProvider.setHerbsProductData();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     ProductProvider productProvider=Provider.of(context);
//
//     final List<String> images = [
//       'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
//       'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
//       'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
//       'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
//       'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
//       'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
//       'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
//     ];
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       drawer: DrawerSide(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           "Home",
//           style:
//               TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 1.4),
//         ),
//         actions: [
//           CircleAvatar(
//             child: Icon(
//               Icons.search,
//               size: 20,
//               color: Colors.black,
//             ),
//             radius: 18,
//             backgroundColor: Color(0xffd4d181),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: CircleAvatar(
//               child: Icon(
//                 Icons.shopping_cart,
//                 size: 20,
//                 color: Colors.black,
//               ),
//               radius: 18,
//               backgroundColor: Color(0xffd4d181),
//             ),
//           ),
//           SizedBox(width: 20,),
//         ],
//         backgroundColor: Color(0xffd6b738),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//         child: ListView(
//           children: [
//             Container(
//               height: 150,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(
//                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
//                 ),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       color: Colors.red,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(right: 130, bottom: 10),
//                             child: Container(
//                               height: 50,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 color: Color(0xffd1ad17),
//                                 borderRadius: BorderRadius.only(
//                                   bottomRight: Radius.circular(50),
//                                   bottomLeft: Radius.circular(50),
//                                 ),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   'INSTA',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                     shadows: [
//                                       BoxShadow(
//                                           color: Colors.green,
//                                           blurRadius: 10,
//                                           offset: Offset(3, 3))
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             '30% Off',
//                             style: TextStyle(
//                                 fontSize: 40,
//                                 color: Colors.green[100],
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Text(
//                               'On all vegetables products',
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Herb's Seasonings "),
//                   Text(
//                     "View all",
//                     style: TextStyle(color: Colors.grey),
//                   )
//                 ],
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   SingleProduct(
//                       productImage: 'assets/basil.png',
//                       productName: 'Fresh basil',
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => ProductOverview(
//                               productImage: 'assets/basil.png',
//                               productName:'Fresh basil' ,
//                               productPrice:123 ,
//                             )));
//                       }),
//                   SingleProduct(
//                       productImage: 'assets/basil.png',
//                       productName: 'Fresh basil',
//                       onTap: () {}),
//                   SingleProduct(
//                       productImage: 'assets/basil.png',
//                       productName: 'Fresh basil',
//                       onTap: () {})
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Fresh fruits "),
//                   Text(
//                     "View all",
//                     style: TextStyle(color: Colors.grey),
//                   )
//                 ],
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   SingleProduct(
//                       productImage: 'assets/watermelon.png',
//                       productName: 'Watermelon',
//                       onTap: () {}),
//                   SingleProduct(
//                       productImage: 'assets/red_grapes.png',
//                       productName: 'Red grapes',
//                       onTap: () {}),
//                   SingleProduct(
//                       productImage: 'assets/yellow_grapes.png',
//                       productName: 'Yellow grapes',
//                       onTap: () {})
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
