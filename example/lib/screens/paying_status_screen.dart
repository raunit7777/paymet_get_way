// import 'package:flutter/material.dart';
//
// class PayinStatusScreen extends StatelessWidget {
//   final TextEditingController orderIdController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           TextField(controller: orderIdController, decoration: InputDecoration(labelText: 'Order ID')),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               // Call your ApiService.getPayinStatus
//             },
//             child: Text('Check Status'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:paymet_get_way/getway.dart';
import 'package:paymet_get_way_example/res/const_button.dart';
import 'package:paymet_get_way_example/res/const_color.dart';
import 'package:paymet_get_way_example/res/const_text.dart';
import 'package:paymet_get_way_example/res/custom_text_feild.dart';
import 'package:paymet_get_way_example/view_model/payin_status_view_model.dart';
import 'package:provider/provider.dart';

class PayinStatusScreen extends StatefulWidget {
  @override
  _PayinStatusScreenState createState() => _PayinStatusScreenState();
}

class _PayinStatusScreenState extends State<PayinStatusScreen> {
  final TextEditingController orderIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<PayinStatusViewModel>(context);
    final data = viewModel.courseviewList;
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

              headingBold(text: "Paying Status"),

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
              ),SizedBox(
                height: 20,
              ),
data == null ? SizedBox():
          ListView.builder(shrinkWrap: true,
            itemCount: 1, // Sirf 1 data object hai
            itemBuilder: (context, index) {
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
                      _buildRow("Transaction ID", data?.transactionid??""),
                      _buildRow("Amount", "₹${data?.amount}"),
                      _buildRow("Date", data?.date),
                      _buildRow("VPA", data?.vpa),
                      _buildRow("UTR", data?.utr.isEmpty ? "Not available" : data?.utr),
                    ],
                  ),
                ),
              );
            },
          ),


              SizedBox(height: 20),
              AppBtn(
                  width: width,
                  title: "Continue",
                  color: AppColor.kLightBlueColor,
                  onTap: () {
                    Provider.of<PayinStatusViewModel>(context,listen: false).checkPayinStatus(orderIdController.text);
                  }),
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