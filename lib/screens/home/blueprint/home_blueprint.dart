import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_app/screens/home/modules/app_bar_module.dart';
import '../modules/horizontal_menu_module.dart';
import '../modules/news_module.dart';
import '../modules/schedule_module.dart';
import '../widgets/news_item_widget.dart';
import '../widgets/schedule_item_widget.dart';

class HomeScreen extends StatefulWidget {
  final User? user;
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Handle null user case
    if (widget.user == null) {
      // Redirect to login or show an appropriate message
      return const Scaffold(
        appBar: AppBarModule(),
        body: Center(
          child: Text("No user is signed in."),
        ),
      );
    }

    // Since user is not null, we can safely access its properties
// Provide a fallback value

    return Scaffold(
      appBar: AppBarModule(userData: widget.user),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10,),
          const HorizontalMenuModule(),
          const SizedBox(height: 10,),
          ScheduleList(
            items: [
              ScheduleItem(
                date: 'May 1, 2024',
                time: '2:30 PM',
                doctorName: 'Dr. Manhattan',
                address: '500 W Overland Ave',
                color: Colors.green[100]!, // Replace with appropriate color
              ),
              ScheduleItem(
                date: 'May 1, 2024',
                time: '2:30 PM',
                doctorName: 'Dr. Manhattan',
                address: '500 W Overland Ave',
                color: Colors.red[100]!, // Replace with appropriate color
              ),
              ScheduleItem(
                date: 'May 1, 2024',
                time: '2:30 PM',
                doctorName: 'Dr. Manhattan',
                address: '500 W Overland Ave',
                color: Colors.blue[100]!, // Replace with appropriate color
              ),
              ScheduleItem(
                date: 'May 1, 2024',
                time: '2:30 PM',
                doctorName: 'Dr. Manhattan',
                address: '500 W Overland Ave',
                color: Colors.yellow[100]!, // Replace with appropriate color
              ),
              // ... More ScheduleItems ..
            ],
          ),
          const Expanded(
              child: NewsSectionModule(
                newsItems: [
                  NewsItem(
                    imageUrl: 'https://media.npr.org/assets/img/2018/02/14/medical-bill-1_custom-42158c69cbe29411fbf708040a00031aeed13cac-s800-c85.webp',
                    title: 'Health Note Title 1',
                    description: 'Short description of the health note...',
                  ),
                  NewsItem(
                    imageUrl: 'https://media.npr.org/assets/img/2018/02/14/medical-bill-1_custom-42158c69cbe29411fbf708040a00031aeed13cac-s800-c85.webp',
                    title: 'Health Note Title 1',
                    description: 'Short description of the health note...',
                  ),
                  NewsItem(
                    imageUrl: 'https://media.npr.org/assets/img/2018/02/14/medical-bill-1_custom-42158c69cbe29411fbf708040a00031aeed13cac-s800-c85.webp',
                    title: 'Health Note Title 1',
                    description: 'Short description of the health note...',
                  ),NewsItem(
                    imageUrl: 'https://media.npr.org/assets/img/2018/02/14/medical-bill-1_custom-42158c69cbe29411fbf708040a00031aeed13cac-s800-c85.webp',
                    title: 'Health Note Title 1',
                    description: 'Short description of the health note...',
                  ),
                  NewsItem(
                    imageUrl: 'https://media.npr.org/assets/img/2018/02/14/medical-bill-1_custom-42158c69cbe29411fbf708040a00031aeed13cac-s800-c85.webp',
                    title: 'Health Note Title 1',
                    description: 'Short description of the health note...',
                  ),

                  // ... More NewsItems
                ],
              )
          )
        ],
      ),
    );
  }
}
