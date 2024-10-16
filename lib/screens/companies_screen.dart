import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:placement_app/routes/app_routes.dart'; // Import your AppRoutes
import 'package:placement_app/size_config.dart'; // Import for responsive sizing

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({super.key});

  @override
  _CompaniesScreenState createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  List<Map<dynamic, dynamic>> _companies = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchCompanies();
  }

  Future<void> _fetchCompanies() async {
    final snapshot = await _dbRef.child('companies').get();
    if (snapshot.exists) {
      final data = snapshot.value as List<dynamic>; // Cast to List<dynamic>
      setState(() {
        _companies = data
            .where((company) => company != null) // Remove null entries
            .map((company) {
              return {
                'name': company['name'],
                'description': company['description'],
                'details': company['details'],
                'location': company['location'],
                'contact': company['contact'],
              };
            }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize SizeConfig
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child: Column(
          children: [
            // Search Bar
            TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Expanded(
              child: ListView.builder(
                itemCount: _companies.length,
                itemBuilder: (context, index) {
                  final company = _companies[index];
                  if (_searchQuery.isNotEmpty &&
                      !company['name']!.toLowerCase().contains(_searchQuery)) {
                    return SizedBox.shrink(); // Skip if it doesn't match the query
                  }
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                    child: ListTile(
                      title: Text(company['name']),
                      subtitle: Text(company['description']),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          // Navigate to company details screen and pass the company data
                          Navigator.pushNamed(
                            context,
                            AppRoutes.companyDetailsScreen,
                            arguments: company, // Pass the entire company data
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
