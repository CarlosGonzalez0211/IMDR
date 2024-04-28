import 'package:flutter/material.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Lepia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Settings action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Network',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 8.0),
            // Sharing Information With Section
            SizedBox(
              height: 120, // Increased height to accommodate text below avatars
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 16.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.search),
                      ),
                      const SizedBox(height: 8.0),
                      Text("Search", style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://t3.ftcdn.net/jpg/04/37/48/18/360_F_437481882_XFGm7VGH4CjFixO0KVXcX3EA6Z1B9qIW.jpg'),
                      ),
                      const SizedBox(height: 8.0),
                      Text("Mom", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://bloximages.newyork1.vip.townnews.com/morganton.com/content/tncms/assets/v3/editorial/5/50/550dd0f6-2412-11ee-b08f-3b5c497ccf13/64b44a8d017cb.image.jpg?resize=1200%2C796'),
                      ),
                      const SizedBox(height: 8.0),
                      Text("Dad", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://st3.depositphotos.com/1372276/14317/i/450/depositphotos_143170265-stock-photo-people-portrait-happy-elderly-hispanic.jpg'),
                      ),
                      const SizedBox(height: 8.0),
                      Text("Grandpa", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://static01.nyt.com/images/2024/04/03/multimedia/03CAREGIVING-mjkg/03CAREGIVING-mjkg-articleLarge.jpg?quality=75&auto=webp&disable=upscale'),
                      ),
                      const SizedBox(height: 8.0),
                      Text("Grandma", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/profile-photos-2.jpg'),
                      ),
                      const SizedBox(height: 8.0),
                      Text("Wife", style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'My Doctors',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const ListTile(
              leading: CircleAvatar(
                radius: 40,
                  backgroundImage: NetworkImage('https://www.aimshospital.co.in/admin/hms/admin/doctor/upload/rewati.jpg'
                  )),
              title: Text('Dr. Maria Morgan'),
              subtitle: Text('OB-GYN'),
            ),
            const Divider(indent: 16.0),
            const ListTile(
              leading: CircleAvatar(
                radius: 40,
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjLykkhD6IdO9lepb71SLR8grWe-r6M_C2WQ&usqp=CAU'
                  )),
              title: Text('Dr. Piter Walberg'),
              subtitle: Text('Primary Care Physician'),
            ),
            const Divider(indent: 16.0),
            const ListTile(
              leading: CircleAvatar(
                radius: 40,
                  backgroundImage: NetworkImage('https://img.freepik.com/premium-photo/portrait-female-doctor-wearing-white-coat-office_255667-25831.jpg'
                  )),
              title: Text('Dr. Jessica Gold, MD'),
              subtitle: Text('Psychiatrist'),
            ),
            const Divider(indent: 16.0),
            const ListTile(
              leading: CircleAvatar(
                radius: 40,
                  backgroundImage: NetworkImage('https://www.shutterstock.com/image-photo/profile-picture-smiling-young-caucasian-600nw-1954278664.jpg'
                  )),
              title: Text('Dr. Michael Word'),
              subtitle: Text('Osteopathic Medicine'),
            ),
            const Divider(indent: 16.0),
            const ListTile(
              leading: CircleAvatar(
                radius: 40,
                  backgroundImage: NetworkImage('https://www.shutterstock.com/image-photo/photo-sweet-confident-mature-lady-600nw-1918036262.jpg'
                  )),
              title: Text('Dr. Sara Parker, DDS'),
              subtitle: Text('Orthodontist'),
            ),
            const Divider(indent: 16.0),
          ],
        ),
      ),
    );
  }
}