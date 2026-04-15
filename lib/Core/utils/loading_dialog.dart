import 'package:flutter/material.dart';

// void showLoadingDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
//     builder: (BuildContext context) {
//       return  const AlertDialog(
//         content: Row(
//           children: [
//             CircularProgressIndicator(), // Loading indicator
//             SizedBox(width: 20), // Space between the indicator and text
//             Text("Loading..."), // Loading text
//           ],
//         ),
//       );
//     },
//   );
// }
// void closeLoadingDialog(BuildContext context) {
//   Navigator.of(context).pop(); // Closes the dialog
// }
import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(color: Color(0xFFFF6B00)),
          SizedBox(width: 20),
          Text("Please wait..."),
        ],
      ),
    ),
  );
}

void closeLoadingDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}