import 'package:image_picker/image_picker.dart';

abstract class EditProfileEvent {}

/// image == null -> remove image
class EditProfileChangeImage extends EditProfileEvent {
  final XFile? image;

  EditProfileChangeImage(this.image);
}

class EditProfileChangeNickName extends EditProfileEvent {
  final String nickName;

  EditProfileChangeNickName(this.nickName);
}

class EditProfileChangeIntroduce extends EditProfileEvent {
  final String introduce;

  EditProfileChangeIntroduce(this.introduce);
}

class EditProfileChangePhoneNum extends EditProfileEvent {
  final String phoneNum;

  EditProfileChangePhoneNum(this.phoneNum);
}

class EditProfileChangeRegion extends EditProfileEvent {
  final String region;

  EditProfileChangeRegion(this.region);
}

class EditProfileChangeTown extends EditProfileEvent {
  final String town;

  EditProfileChangeTown(this.town);
}

class EditProfileSubmit extends EditProfileEvent {}
