import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> documents = [
    {'name': 'Passport.pdf', 'color': Colors.purpleAccent},
    {'name': 'Resume.docx', 'color': Colors.orangeAccent},
    {'name': 'Visa.pdf', 'color': Colors.tealAccent},
    {'name': 'ID Card.png', 'color': Colors.blueAccent},
    {'name': 'Contract.pdf', 'color': Colors.deepPurple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Vault'),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.purple.shade300, Colors.deepPurple.shade700], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: documents.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            final doc = documents[index];
            return InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tapped on ${doc['name']}')));
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: doc['color'],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 4))],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.description, size: 60, color: Colors.white),
                    SizedBox(height: 12),
                    Text(doc['name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.center),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
