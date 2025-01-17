import 'package:againbloc/pages/pages/profile/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar() ,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // o'rta
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // o'rta
            children: [
              profileIconAndEditButton(),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.only(left: 25.w),
                child: buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
