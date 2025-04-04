import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  final List<Chat> dummyChats = const [
    Chat(
      name: 'John Doe',
      lastMessage: 'Hey, how are you doing?',
      time: '10:30 AM',
      unreadCount: 2,
      avatarUrl: 'https://i.pravatar.cc/150?img=3',
      isOnline: true,
      isFavorite: true,
      isGroup: false,
    ),
    Chat(
      name: 'Family Group',
      lastMessage: 'Mom',
      time: 'Yesterday',
      unreadCount: 5,
      avatarUrl: 'https://i.pravatar.cc/150?img=5',
      isOnline: false,
      isFavorite: false,
      isGroup: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
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
                IconButton(
                  icon: const Icon(Icons.camera_alt_outlined),
                  onPressed: () {},
                ),
                IconButton(icon: const Icon(Icons.add), onPressed: () {}),
              ],
            ),

            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Text(
                  'Chats',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Unread'),
                    Tab(text: 'Favorites'),
                    Tab(text: 'Groups'),
                  ],
                ),
              ),
            ),

            SliverFillRemaining(
              child: TabBarView(
                children: [
                  _buildChatList(dummyChats),
                  _buildChatList(
                    dummyChats.where((chat) => chat.unreadCount > 0).toList(),
                  ),
                  _buildChatList(
                    dummyChats.where((chat) => chat.isFavorite).toList(),
                  ),
                  _buildChatList(
                    dummyChats.where((chat) => chat.isGroup).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList(List<Chat> chats) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(chat.avatarUrl),
            child:
                chat.isOnline
                    ? Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    )
                    : null,
          ),
          title: Text(chat.name),
          subtitle: Text(chat.lastMessage, overflow: TextOverflow.ellipsis),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chat.time,
                style: TextStyle(
                  color:
                      chat.unreadCount > 0
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey,
                ),
              ),
              if (chat.unreadCount > 0)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    chat.unreadCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }
}
