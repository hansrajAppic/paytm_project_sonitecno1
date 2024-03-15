// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyForm(),
//   ));
// }

// class MyForm extends StatefulWidget {
//   @override
//   _MyFormState createState() => _MyFormState();
// }


//   class _MyFormState extends State<MyForm> {
//   final _formKey = GlobalKey<FormState>();

//   TextEditingController textEditingController = TextEditingController();
//   late String selectedOption = 'Option 1';

//   List<String> dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TextFormField with DropdownButtonFormField'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ... your existing code

//               SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 value: selectedOption,
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedOption = newValue!;
//                   });
//                 },
//                 items: dropdownOptions.map((option) {
//                   return DropdownMenuItem<String>(
//                     value: option,
//                     child: Text(option),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(
//                   isCollapsed: true,
//                   contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 32),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Process the entered text and selected option
//                     String enteredText = textEditingController.text;
//                     print('Entered Text: $enteredText');
//                     print('Selected Option: $selectedOption');
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
