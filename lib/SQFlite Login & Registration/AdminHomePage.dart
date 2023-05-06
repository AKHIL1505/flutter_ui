import 'package:flutter/material.dart';

import 'SQFliteOperations.dart';

class AdminPage extends StatefulWidget {
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var userLoginDetails;

  @override
  void initState() {
    collectDatabaseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADMIN PANEL")),
      body: Container( height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/Images/bgnd.jpg"))),

        child: ListView.builder(
          itemCount: userLoginDetails.length,
          itemBuilder: (context, index) {
            return Card(color: Colors.white,
              child: ListTile(
                title: Text('${userLoginDetails[index]['name']}'),
                trailing: IconButton(
                    onPressed: () {
                      daleteUserLogin(userLoginDetails[index]['id']);
                    },
                    icon: Icon(Icons.delete)),
              ),
            );
          },
        ),
      ),
    );
  }

  void collectDatabaseData() async {
    var databaseData = await SQLHelper.getAllUserDetails();
    setState(() {
      userLoginDetails = databaseData;
    });
  }

  void daleteUserLogin(int id) async {
    await SQLHelper.deleteUser(id);
    collectDatabaseData();
  }
}
