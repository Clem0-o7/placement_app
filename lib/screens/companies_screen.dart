import 'package:flutter/material.dart';
import 'package:placement_app/utils/constants.dart'; // Import your constants if needed
import 'package:placement_app/routes/app_routes.dart'; // Import your AppRoutes if needed

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Example Company Card
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: const Text('Company A'),
                subtitle: const Text('Description of Company A'),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Navigate to company details screen or perform any action
                  },
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: const Text('Company B'),
                subtitle: const Text('Description of Company B'),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Navigate to company details screen or perform any action
                  },
                ),
              ),
            ),
            // Add more company cards as needed
          ],
        ),
      ),
    );
  }
}
