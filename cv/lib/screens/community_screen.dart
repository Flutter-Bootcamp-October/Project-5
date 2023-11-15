import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/modules/community_module.dart';
import 'package:cv/services/community_api.dart';
import 'package:cv/widgets/education_details.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Community? community;

  void initState() {
    // TODO: implement initState
    super.initState();
    loadCommunity();
  }

  loadCommunity() async {
    community = await getAllCommunityData();
    print(community?.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width - 300),
                        child: const Text(
                          "Community",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 706,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            margin: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
              child: FutureBuilder(
                  future: getAllCommunityData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        itemCount: 12,
                        separatorBuilder: (BuildContext context, int index) =>
                            height16,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 32,
                              height: MediaQuery.of(context).size.height - 630,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 16, top: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "name",
                                            //snapshot.data![index].data!.name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "position",
                                        //snapshot.data![index].titlePosition!,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                      height12,
                                      EducationDetail(
                                          icon: Icons.phone_android_outlined,
                                          title:
                                              "phone" //snapshot.data![index].phone!,
                                          ),
                                      height12,
                                      EducationDetail(
                                          icon: Icons.email_outlined,
                                          title:
                                              "email" //snapshot.data![index].email!,
                                          ),
                                      height12,
                                      EducationDetail(
                                        icon: Icons.my_location_outlined,
                                        title: "location",
                                        //snapshot.data![index].location!,
                                      ),
                                      height12,
                                      EducationDetail(
                                        icon: Icons.date_range_outlined,
                                        title: "dob",
                                        //snapshot.data![index].birthday!,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("error"),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

/*
child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
              child: ListView.separated(
                itemCount: 14,
                separatorBuilder: (BuildContext context, int index) => height16,
                itemBuilder: (BuildContext context, int index) {
                  return const AllUserCard();
                },
              ),
            ),

            */
