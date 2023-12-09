import 'package:flutter/material.dart';

class UserPortal extends StatefulWidget {
  @override
  _UserPortalState createState() => _UserPortalState();
}

class _UserPortalState extends State<UserPortal> {
  List<Application> applications = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: Text('User Portal', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade800,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pushNamed(context, 'applicationform');
                  Application? newApplication = await Navigator.pushNamed(context, 'applicationform');
                  if (newApplication != null) {
                    // Add the new application to the list
                    setState(() {
                      applications.add(newApplication);
                    });
                  }
                },
                child: Text('+Add', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: ApplicationList(applications: applications),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('User Name'),
                accountEmail: Text('user@example.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text('Change Password'),
                onTap: () {
                  print('Change Password');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {
                  print('Log Out');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicationList extends StatelessWidget {
  final List<Application> applications;

  ApplicationList({required this.applications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: applications.length,
      itemBuilder: (context, index) {
        return ApplicationCard(application: applications[index]);
      },
    );
  }
}

class Application {
  final String name;
  bool isApproved;

  Application({required this.name, this.isApproved = false});
}

class ApplicationCard extends StatefulWidget {
  final Application application;

  const ApplicationCard({Key? key, required this.application}) : super(key: key);

  @override
  _ApplicationCardState createState() => _ApplicationCardState();
}

class _ApplicationCardState extends State<ApplicationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Application Name: ${widget.application.name}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'Status: ',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                Switch(
                  value: widget.application.isApproved,
                  onChanged: (value) {
                    setState(() {
                      widget.application.isApproved = value;
                    });
                  },
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                ),
                Text(
                  widget.application.isApproved ? 'Approved' : 'Pending',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                print('View Full Contents Button Pressed for ${widget.application.name}');
              },
              child: Text('View Full Contents'),
            ),
          ],
        ),
      ),
    );
  }
}
