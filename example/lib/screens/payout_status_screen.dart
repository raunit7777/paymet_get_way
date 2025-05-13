import 'package:flutter/material.dart';
import 'package:paymet_get_way/getway.dart';
import 'package:paymet_get_way_example/res/const_button.dart';
import 'package:paymet_get_way_example/res/const_color.dart';
import 'package:paymet_get_way_example/res/const_text.dart';
import 'package:paymet_get_way_example/res/custom_text_feild.dart';
import 'package:paymet_get_way_example/view_model/payout_status_view_model.dart';
import 'package:provider/provider.dart';

class PayoutStatusScreen extends StatefulWidget {
  @override
  _PayoutStatusScreenState createState() => _PayoutStatusScreenState();
}

class _PayoutStatusScreenState extends State<PayoutStatusScreen> {
  final TextEditingController orderIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MerchantPayoutHistoryViewModel>(context, listen: false).fetchPayoutHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
  final vm =  Provider.of<MerchantPayoutHistoryViewModel>(context).courseviewList;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ SizedBox(
              height: 20,
            ),AppBackBtn(color: AppColor.kSelectItemColor,),
              SizedBox(
                height: 20,
              ),

              headingBold(text: "Payout Status"),

              SizedBox(
                height: 20,
              ),
              tittleMedium(text: "Enter Order ID"),
              SizedBox(
                height: 20,
              ),
              CustomTextField3(
                controller: orderIdController,
                hintText: 'Order ID',
              ) ,SizedBox(
          height: 20,
        ),
        AppBtn(
            width: width,
            title: "Continue",
            color: AppColor.kLightBlueColor,
            onTap: () {
              Provider.of<MerchantPayoutHistoryViewModel>(context,listen: false).fetchPayoutHistory(orderId:orderIdController.text );;

            }),SizedBox(
                height: 20,
              ),
vm== null ?SizedBox():
              ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                itemCount: vm.msg?.length??0,
                itemBuilder: (context, index) {
                final items = vm.msg?[index];
                  return Card(color: AppColor.kBackgroundColor,
                    margin: const EdgeInsets.all(2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildRow("Ammount ",items?.amount??""),
                          _buildRow("Account Number", "₹${items?.accountNo}"),
                          _buildRow("Bank", items?.bankname??""),
                          _buildRow("IFSC code", items?.ifsccode??""),
                          // _buildRow("UTR", data?.utr.isEmpty ? "Not available" : data?.utr),
                        ],
                      ),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
        Expanded(child: Text(value)),
      ],
    ),
  );
}