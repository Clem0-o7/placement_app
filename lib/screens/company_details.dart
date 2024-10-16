import 'package:flutter/material.dart';

class CompanyDetailsScreen extends StatelessWidget {
  const CompanyDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> company = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(company['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${company['description']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Location: ${company['location']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Contact: ${company['contact']}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Details: ${company['details']}', style: TextStyle(fontSize: 16)),
            // Here you can add additional functionality, like allowing users to submit experiences
          ],
        ),
      ),
    );
  }
}
