enum EFollowMode {
  follower('팔로워'),
  following('팔로잉');

  final String text;

  const EFollowMode(this.text);
}

extension SFollowModeExtension on String {
  EFollowMode get followModeEnum {
    switch (this) {
      case 'follower':
        return EFollowMode.follower;
      case 'following':
        return EFollowMode.following;
      default:
        throw Exception(
            '[SFollowModeExtension.enumVal] Unknown string value: $this');
    }
  }
}

extension EChildAgeExtension on EFollowMode {
  String get key {
    switch (this) {
      case EFollowMode.follower:
        return 'follower';
      case EFollowMode.following:
        return 'following';
    }
  }
}
