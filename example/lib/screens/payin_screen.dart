import 'package:flutter/material.dart';
import 'package:paymet_get_way_example/res/const_button.dart';
import 'package:paymet_get_way_example/res/const_color.dart';
import 'package:paymet_get_way_example/res/custom_text_feild.dart';
import 'package:paymet_get_way_example/view_model/pyin_view_model.dart';
import 'package:provider/provider.dart';

import '../res/const_text.dart';

class PayinScreen extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController orderIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              AppBackBtn(
                color: AppColor.kSelectItemColor,
              ),
              SizedBox(
                height: 20,
              ),
              headingBold(text: "Paying"),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Order ID"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: orderIdController,
                hintText: 'Order ID',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Amount"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: amountController,
                hintText: 'Amount',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter a Name"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: nameController,
                hintText: 'Name',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter a Email"),
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
              tittleMedium(text: "Enter a Mobile no"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: mobileController,
                hintText: 'Mobile',
              ),
              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter a Remark"),
              SizedBox(
                height: 5,
              ),
              CustomTextField3(
                controller: remarkController,
                hintText: 'Remark',
              ),
              SizedBox(height: 20),
              AppBtn(
                  width: width,
                  title: "Continue",
                  color: AppColor.kLightBlueColor,
                  onTap: () {
                    Provider.of<PayinViewModel>(context,listen: false).payinApi(
                        orderIdController.text,
                        amountController.text,
                        nameController.text,
                        emailController.text,
                        mobileController.text,
                        remarkController.text,
                        context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
