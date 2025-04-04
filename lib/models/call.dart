class Call {
  final String name;
  final String time;
  final bool isIncoming;
  final bool isMissed;
  final bool isVideoCall;
  final String avatarUrl;

  const Call({
    required this.name,
    required this.time,
    required this.isIncoming,
    required this.isMissed,
    required this.isVideoCall,
    required this.avatarUrl,
  });
}
