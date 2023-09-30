import 'package:flutter/material.dart';

import '../../my_profile/my_profile.dart';
// import 'home.dart';
import '../../review_cart/review_cart.dart';
import 'home_screen.dart';
class DrawerSide extends StatelessWidget {
  const DrawerSide({super.key});

  @override
  Widget listTile({required String title,required IconData icon,void Function()?onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon,size: 32,),
      title: Text(title,style: TextStyle(
          color: Colors.black45
      ),),
    );
  }
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Color(0xffd1ad17),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 43,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/logo.jpg'),
                          // child: Image.asset('assets/logo.png'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Welcome Guest"),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Login",
                                  style: TextStyle(color: Colors.black)),
                            ),
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45, // Color of the border
                                  width: 1.0, // Width of the border
                                ),
                                borderRadius: BorderRadius.circular(15)),
                          )
                        ],
                      )
                    ],
                  )),
              listTile(
                icon: Icons.home_outlined,
                title: "Home",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
              listTile(
                icon: Icons.shopping_cart,
                title: "Review Cart",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                },
              ),
              listTile(
                icon: Icons.person_outlined,
                title: "My Profile",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(),
                    ),
                  );
                },
              ),
              listTile(
                  icon: Icons.notifications_outlined, title: "Notificatio"),
              listTile(
                  icon: Icons.star_outline, title: "Rating & Review"),
              listTile(
                icon: Icons.favorite_outline,
                title: "Wishlist",
                // onTap: () {
                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (context) => WishLsit(),
                //     ),
                //   );
                // }
              ),
              listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
              Container(
                height: 350,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Support",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Call us:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("+201065766600"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text("Mail us:",
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Mohamed@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
