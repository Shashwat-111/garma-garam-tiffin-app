import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Map<String, IconData> settingList = {
    "My Subscription" : Icons.calendar_month,
    "My Orders" : Icons.access_time_sharp,
    "Food Preference" : Icons.fastfood_outlined,
    "Address" : Icons.location_pin,
    "Rate this app" : Icons.star_rate,
    "Log out" : Icons.logout_sharp,
  };

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(height: defaultHeightPadding,),
        const ListTile(
          leading: CircleAvatar(radius: 24,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/defaultDP.png")),
          title: Text("Shashwat Dubey",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          subtitle: Text("+91 7999204389",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
          trailing: Icon(Icons.settings),
        ),
       const SizedBox(height: defaultHeightPadding,),
        Card(
          elevation: 2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width-32,
            height: 350,
            child: ListView.builder(
              itemCount: settingList.length,
                itemBuilder: (context, index){
              return ListTile(
                leading: Icon(settingList.values.elementAt(index), color: Colors.grey,),
                title: Text(settingList.keys.elementAt(index)),
                trailing: index == 5 ? null : const Icon(Icons.chevron_right),
                onTap: (){
                  FirebaseAuth.instance.signOut();
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
