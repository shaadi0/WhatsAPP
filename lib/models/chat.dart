class Chat {
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String avatarUrl;
  final bool isOnline;
  final bool isFavorite;
  final bool isGroup;

  const Chat({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.avatarUrl,
    required this.isOnline,
    required this.isFavorite,
    required this.isGroup,
  });
}
