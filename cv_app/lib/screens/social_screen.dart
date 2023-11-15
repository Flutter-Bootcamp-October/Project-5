import 'package:cv_app/services/post.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:cv_app/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({Key? key}) : super(key: key);

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  TextEditingController scontroller = TextEditingController();
  TextEditingController ucontroller = TextEditingController();
  final List<String> items = [
    'facebook',
    'youtube',
    'whatsapp',
    'instagram',
    'twitter',
    'tiktok',
    'telegram',
    'snapchat',
    'other'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: const Row(
                            children: [
                              Icon(
                                Icons.sensor_occupied,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Select App',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: scontroller.text.isNotEmpty &&
                                  items.contains(scontroller.text)
                              ? scontroller.text
                              : null,
                          onChanged: (value) {
                            setState(() {
                              scontroller.text = value.toString();
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: 160,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: purble,
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.black,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: purble,
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(6),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text('User name'),
                      subtitle: TextFormField(
                        controller: ucontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          hintText: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomBottom(
                  color: orang,
                  ontap: () async {
                    try {
                      final response = await PostAdd().addSocial({
                        "username": ucontroller.text,
                        "social": scontroller.text
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Saved Successfully")));
                    } on FormatException catch (error) {
                      print("-----");
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.message.toString())));
                    }
                  },
                  border: orang,
                  text: "Continue")
            ],
          ),
        ),
      ),
    );
  }
}
// Column(
//                     children: [
//                       RadioListTile(
//                         title: Text("facebook"),
//                         value: "facebook",
//                         groupValue: scontroller.text,
//                         onChanged: (value) {
//                           setState(() {
//                             scontroller.text = value.toString();
//                           });
//                         },
//                       ),
//                       RadioListTile(
//                         title: Text("youtube"),
//                         value: "youtube",
//                         groupValue: scontroller.text,
//                         onChanged: (value) {
//                           setState(() {
//                             scontroller.text = value.toString();
//                           });
//                         },
//                       ),
//                       RadioListTile(
//                         title: Text("whatsapp"),
//                         value: "whatsapp",
//                         groupValue: scontroller.text,
//                         onChanged: (value) {
//                           setState(() {
//                             scontroller.text = value.toString();
//                           });
//                         },
//                       ),
//                       RadioListTile(
//                         title: Text("instagram"),
//                         value: "instagram",
//                         groupValue: scontroller.text,
//                         onChanged: (value) {
//                           setState(() {
//                             scontroller.text = value.toString();
//                           });
//                         },
//                       ),
//                       RadioListTile(
//                         title: Text("twitter"),
//                         value: "twitter",
//                         groupValue: scontroller.text,
//                         onChanged: (value) {
//                           setState(() {
//                             scontroller.text = value.toString();
//                           });
//                         },
//                       ),
//                       RadioListTile(
//                         title: Text("tiktok"),
//                         value: "tiktok",
//                         groupValue: scontroller.text,
//                         onChanged: (value) {
//                           setState(() {
//                             scontroller.text = value.toString();
//                           });
//                         },
//                       ),
//                       RadioListTile(
//                         title: Text("telegram"),
//                         value: "telegram",
//                         groupValue: scontroller.text,
//                         onChanged: (value) {
//                           setState(() {
//                             scontroller.text = value.toString();
//                           });
//                         },
//                       ),
//                       RadioListTile(
//                         title: Text("snapchat"),
//                         value: "snapchat",
//                         groupValue: scontroller.text,
//                         onChanged: (value) {
//                           setState(() {
//                             scontroller.text = value.toString();
//                           });
//                         },
//                       ),
//                       RadioListTile(
//                         title: Text("Other"),
//                         value: "other",
//                         groupValue: scontroller.text,
//                         onChanged: (value) {
//                           setState(() {
//                             scontroller.text = value.toString();
//                           });
//                         },
//                       ),
//                     ],
//                   )