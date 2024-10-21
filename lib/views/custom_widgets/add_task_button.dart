import 'package:flutter/material.dart';
//
// Widget addTaskButton(BuildContext context) {
//   return FloatingActionButton(
//     onPressed: () {
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: const Text('Add a Task'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//
//                   }); //Problem: setState Not available here.
//                 },
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Add a task...',
//                 ),
//               ),
//               MaterialButton(
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//     child: const Icon(Icons.add),
//   );
// }
