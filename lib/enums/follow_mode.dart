enum EFollowMode {
  follower('follower', '팔로워'),
  following('following', '팔로잉');

  final String key;
  final String text;

  const EFollowMode(
    this.key,
    this.text,
  );
}

EFollowMode? strToEFollowMode(String? str) {
  if (str == EFollowMode.follower.key) return EFollowMode.follower;
  if (str == EFollowMode.following.key) return EFollowMode.following;
  return null;
}
