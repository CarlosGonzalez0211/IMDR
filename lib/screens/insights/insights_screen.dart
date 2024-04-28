import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  _InsightsScreenState createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  // A map to keep track of the toggle values
  Map<String, bool> conditions = {
    'AIDS/HIV': false,
    'Alcoholism': false,
    'Allergy Shots': false,
    'Anemia': false,
    'Anorexia': false,
    'Appendicitis': false,
    'Arthritis': false,
    'Asthma': false,
    'Bleeding Disorders': false,
    // Add more conditions here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Lepia'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.upload),
            onPressed: () {
              // Action for the shopping cart icon
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Insights',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20.0),
            Expanded( // The Column is wrapped in Expanded to ensure it fills the space in the Scaffold's body
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ensures that the column takes up only the space it needs
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Have you had any of the following?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    const Text('Please toggle if yes'),
                    const SizedBox(height: 16.0),
                    Expanded( // ListView is now inside an Expanded widget
                      child: ListView(
                        children: conditions.keys.map((String key) {
                          return SwitchListTile(
                            activeColor: Colors.green,
                            title: Text(key),
                            value: conditions[key]!,
                            onChanged: (bool value) {
                              setState(() {
                                conditions[key] = value;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
