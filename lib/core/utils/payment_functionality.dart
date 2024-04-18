// import 'dart:async';
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:moyasar/moyasar.dart';
//
// import '../widgets/toast.dart';
//
// void onPaymentResult(result) {
//   if (result is PaymentResponse) {
//
//     showToast(result.source.message);
//     switch (result.status) {
//       case PaymentStatus.paid:
//         // handle success.
//         break;
//       case PaymentStatus.failed:
//         // handle failure.
//
//         break;
//       case PaymentStatus.authorized:
//         // handle authorized.
//         break;
//       default:
//     }
//     return;
//   }
//
//   // handle failures.
//   if (result is ApiError) {}
//   if (result is AuthError) {}
//   if (result is ValidationError) {}
//   if (result is PaymentCanceledError) {}
//   if (result is UnprocessableTokenError) {}
//   if (result is TimeoutError) {}
//   if (result is NetworkError) {}
//   if (result is UnspecifiedError) {}
// }
//
// Future<void> listenForPaymentUpdates(String paymentId) async {
//   const Duration pollingInterval = Duration(seconds: 10);
//
//   // Periodically check the payment status using polling
//   Timer.periodic(pollingInterval, (Timer timer) async {
//     final paymentStatus = await fetchPaymentStatus(paymentId);
//
//     // Check the payment status and update the UI
//     handlePaymentStatus(paymentStatus);
//
//     // Stop polling if the payment is no longer in an "initiated" state
//     if (paymentStatus != PaymentStatus.initiated) {
//       timer.cancel();
//     }
//   });
// }
//
// Future<PaymentStatus> fetchPaymentStatus(String paymentId) async {
//   // Make an API request to Moyasar to get the current payment status
//   // Use the paymentId to identify the specific payment
//   // Update this based on the actual Moyasar API endpoint and request
//   final response = await makeApiRequest(paymentId);
//
//   // Parse the response and extract the payment status
//   final paymentStatus = parsePaymentStatus(response);
//
//   return paymentStatus;
// }
//
// void handlePaymentStatus(PaymentStatus paymentStatus) {
//   // Update the UI based on the received payment status
//   switch (paymentStatus) {
//     case PaymentStatus.paid:
//       // Handle success.
//       break;
//     case PaymentStatus.failed:
//       // Handle failure.
//       break;
//     case PaymentStatus.authorized:
//       // Handle authorized.
//       break;
//     default:
//     // Handle other cases if needed.
//   }
// }
//
// // This function simulates making an API request to Moyasar
// Future<Map<String, dynamic>> makeApiRequest(String paymentId) async {
//   final Uri uri = Uri.parse('https://api.moyasar.com/payments/$paymentId');
//   final response = await http.get(uri);
//   if (response.statusCode == 200) {
//     // Assuming the API response is a JSON object with a 'status' field
//     return {'status': json.decode(response.body)['status']};
//   } else {
//     // Handle error or return a default status
//     return {'status': 'unknown'};
//   }
// }
//
// PaymentStatus parsePaymentStatus(Map<String, dynamic> response) {
//   // Replace this with the actual logic to parse the payment status from the API response
//   final String status = response['status'] ??
//       ''; // Assuming 'status' is a field in the API response
//
//   switch (status.toLowerCase()) {
//     case 'initiated':
//       return PaymentStatus.initiated;
//     case 'paid':
//       return PaymentStatus.paid;
//     case 'failed':
//       return PaymentStatus.failed;
//     case 'authorized':
//       return PaymentStatus.authorized;
//     default:
//       return PaymentStatus.failed; // Handle unknown statuses or errors
//   }
// }
//
// // PaymentStatus enum definition (replace with the actual PaymentStatus enum from Moyasar)
// enum PayStatus { initiated, paid, failed, authorized, unknown }
