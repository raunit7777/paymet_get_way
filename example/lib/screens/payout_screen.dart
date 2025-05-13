// import 'package:flutter/material.dart';
//
// class PayoutScreen extends StatelessWidget {
//   final TextEditingController accountController = TextEditingController();
//   final TextEditingController ifscController = TextEditingController();
//   final TextEditingController amountController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           TextField(controller: accountController, decoration: InputDecoration(labelText: 'Account Number')),
//           TextField(controller: ifscController, decoration: InputDecoration(labelText: 'IFSC Code')),
//           TextField(controller: amountController, decoration: InputDecoration(labelText: 'Amount')),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               // Call your ApiService.payout here
//             },
//             child: Text('Send Payout'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:paymet_get_way_example/res/const_button.dart';
import 'package:paymet_get_way_example/res/const_color.dart';
import 'package:paymet_get_way_example/res/custom_text_feild.dart';
import 'package:paymet_get_way_example/view_model/payout_view_model.dart';
import 'package:provider/provider.dart';

import '../res/const_text.dart';

class PayoutScreen extends StatefulWidget {
  const PayoutScreen({super.key});

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

final TextEditingController accountController = TextEditingController();
final TextEditingController ifscController = TextEditingController();
final TextEditingController amountController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController mobileController = TextEditingController();
final TextEditingController remarkController = TextEditingController();
final TextEditingController bankController = TextEditingController();
final TextEditingController orderIdController = TextEditingController();

class _PayoutScreenState extends State<PayoutScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              AppBackBtn(
                color: AppColor.kSelectItemColor,
              ),
              SizedBox(
                height: 20,
              ),
              headingBold(text: "Payout"),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Account no"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: accountController,
                hintText: 'account no',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter a Ammount"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: amountController,
                hintText: 'Amount',
              ),
              SizedBox(height: 20),
              tittleMedium(text: "Enter IFSC"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: ifscController,
                hintText: 'ifsc code',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Name"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: nameController,
                hintText: '',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Bank Name"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: bankController,
                hintText: 'Bank Name',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Email"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: emailController,
                hintText: 'Email',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Remark"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: remarkController,
                hintText: 'Remark',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Mobile no"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: mobileController,
                hintText: 'Mobile no',
              ),  SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Order Id"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: orderIdController,
                hintText: 'Order Id ',
              ),
              SizedBox(
                height: 20,
              ),
              AppBtn(
                  width: width,
                  title: "Continue",
                  color: AppColor.kLightBlueColor,
                  onTap: () {
                    Provider.of<PayoutViewModel>(context, listen: false)
                        .payinApi(
                            orderIdController.text,
                            accountController.text,
                            nameController.text,
                            emailController.text,
                            mobileController.text,
                            remarkController.text,
                            ifscController.text,
                            bankController.text,
                            accountController.text,
                            context);
                  }),   SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
