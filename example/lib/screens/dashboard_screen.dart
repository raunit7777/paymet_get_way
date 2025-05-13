// import 'package:flutter/material.dart';
// import 'package:paymet_get_way_example/res/const_button.dart';
// import 'package:paymet_get_way_example/res/const_color.dart';
// import 'package:paymet_get_way_example/res/const_text.dart';
//
// void main() {
//   runApp(MaterialApp(home: PaymentGatewayUI()));
// }
//
// class PaymentGatewayUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> items = [
//       {'image': 'assets/bill.png', 'name': 'Paying'},
//       {'image': 'assets/payment.png', 'name': 'Payout'},
//       {'image': 'assets/payment.png', 'name': 'Paying Status'},
//       {'image': 'assets/smartphone_1951593.png', 'name': 'Payout Status'},
//     ];
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     final height = size.height;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.kLightBlueColor,
//         title:
//             headingBold(text: "Indian Pay", color: AppColor.kBackgroundColor),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 12,
//             ),
//             tittleBold(text: "welcome"),
//             SizedBox(
//               height: 12,
//             ),
//             ListView.builder(
//               itemCount: 4,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return Container(
//                   padding: EdgeInsets.all(8),
//                   width: width,
//                   height: 80,
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           color: AppColor.kSecondaryColor, width: 0.2)),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                           height: 40,
//                           width: 40,
//                           child: Image.asset(
//                             items[index]['image']!,
//                           )),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       tittleMedium(text: items[index]['name']!),
//                       Spacer(),
//                       Icon(Icons.arrow_forward_ios_sharp,
//                           color: AppColor.kSecondaryColor)
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       bottomSheet: Container(padding: EdgeInsets.symmetric(horizontal: 20),
//         width: width,
//         height: 55,
//
//         child: Row(
//           children: [tittleMedium(text: "₹1200"),Spacer(),AppBtn(width: width*0.55,title: "continue",color: AppColor.kLightBlueColor,)],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:paymet_get_way/generated/assets.dart';
import 'package:paymet_get_way_example/res/const_button.dart';
import 'package:paymet_get_way_example/res/const_color.dart';
import 'package:paymet_get_way_example/res/const_text.dart';
import 'package:paymet_get_way_example/screens/payin_screen.dart';
import 'package:paymet_get_way_example/screens/payout_screen.dart';

import 'paying_status_screen.dart';
import 'payout_status_screen.dart';

class PaymentGatewayUI extends StatefulWidget {
  @override
  State<PaymentGatewayUI> createState() => _PaymentGatewayUIState();
}

class _PaymentGatewayUIState extends State<PaymentGatewayUI> {
  int selectedIndex = -1; // -1 means nothing selected

  final List<Map<String, String>> items = [
    {'image': Assets.assetsBill, 'name': 'Paying'},
    {'image': Assets.assetsPayment, 'name': 'Payout'},
    {'image': Assets.assetsPaymentMethod14686594, 'name': 'Paying Status'},
    {'image': Assets.assetsSmartphone1951593, 'name': 'Payout Status'},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(backgroundColor: AppColor.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.kLightBlueColor,
        title: headingBold(text: "Indian Pay", color: AppColor.kBackgroundColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            tittleBold(text: "Welcome"),
            SizedBox(height: 12),
            ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(8),
                    width: width,
                    height: 80,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColor.r2 .withOpacity(0.2) : Colors.white,
                      border: Border.all(
                        color: isSelected ? AppColor.r3 : AppColor.kSecondaryColor,
                        width: isSelected ? 1.5 : 0.2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/bill.png"),
                        ),
                        SizedBox(width: 8),
                        tittleMedium(text: items[index]['name']!),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_sharp, color: AppColor.kSecondaryColor),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white, // ensure there's no BoxDecoration with borderRadius
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        width: width,
        height: 55,
        child: AppBtn(height: 30,
          width: width * 0.88,
          title: "Continue",
          color: AppColor.kLightBlueColor,
          onTap: () {
            if (selectedIndex == -1) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Please select an option first'),
              ));
            } else {
              switch (selectedIndex) {
                case 0:
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PayinScreen()));
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PayoutScreen()));
                  break;
                case 2:
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PayinStatusScreen()));
                  break;
                case 3:
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PayoutStatusScreen()));
                  break;
              }
            }
          },
        ),
      ),

    );
  }
}

