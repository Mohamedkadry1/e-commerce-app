import 'package:flutter/material.dart';

import '../../widgets/counter.dart';

class SingleProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final void Function()? onTap;
  final int productPrice;
  final String productId;
  final int productQuantity;

  const SingleProduct(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.onTap,
      required this.productPrice,
      required this.productId,
      required this.productQuantity});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Container(
            height: 230,
            width: 175,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: widget.onTap,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            widget.productImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "1 kg",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                '\$ ${widget.productPrice}',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Count(
                              productName: widget.productName,
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productPrice: widget.productPrice,
                              productUnit: '',
                              productQuantity: 1),
                        ],
                      ),
                    )
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
