import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/util/animation/animation.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 46.0,
                backgroundImage: NetworkImage(
                  "https://i.ibb.co/PGv8ZzG/me.jpg",
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "Rizky",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "rizky@gmail.com",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(Icons.question_answer),
                minLeadingWidth: 0.0,
                title: Text("FAQ"),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () => controller.logout(),
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                minLeadingWidth: 0.0,
                title: Text("TOS"),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () => controller.logout(),
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                minLeadingWidth: 0.0,
                title: Text("Privacy policy"),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () => controller.logout(),
              ),
              ListTile(
                leading: Icon(Icons.help),
                minLeadingWidth: 0.0,
                title: Text("Help centre"),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () => controller.logout(),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                minLeadingWidth: 0.0,
                title: Text("Logout"),
                trailing: Icon(
                  Icons.chevron_right,
                  size: 24.0,
                ),
                onTap: () => controller.logout(),
              ),
            ],
          ).amx,
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
