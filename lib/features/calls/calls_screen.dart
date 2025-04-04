import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Top app bar with horizontal three dots
          SliverAppBar(
            floating: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {},
              ),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.add_call), onPressed: () {}),
            ],
          ),

          // "Calls" text row below the dots
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 8, bottom: 16),
              child: Text(
                'Calls',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // "Features" section
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // "Features" text row
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    'Features',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                // "Add feature" button row (left-aligned)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 20),
                        label: const Text('Add feature'),
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF008069),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // "Recent" text row
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Recent',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),

          // Recent calls list
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=$index',
                  ),
                ),
                title: Text('Contact $index'),
                subtitle: Row(
                  children: [
                    Icon(
                      index % 2 == 0 ? Icons.call_made : Icons.call_received,
                      size: 16,
                      color: index % 3 == 0 ? Colors.red : Colors.green,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${index % 2 == 0 ? 'Outgoing' : 'Incoming'} • Today, ${index + 1}:00 PM',
                    ),
                  ],
                ),
                trailing: Icon(
                  index % 4 == 0 ? Icons.videocam : Icons.call,
                  color: const Color(0xFF008069),
                ),
                onTap: () {},
              );
            }, childCount: 10),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF008069),
        child: const Icon(Icons.add_ic_call, color: Colors.white),
      ),
    );
  }
}
