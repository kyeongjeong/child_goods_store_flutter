enum EAddressCategory {
  home('집'),
  work('회사'),
  school('학교'),
  etc('기타');

  final String text;

  const EAddressCategory(this.text);
}

EAddressCategory? categoryToEAddressCategory(String? category) {
  if (category == EAddressCategory.home.text) return EAddressCategory.home;
  if (category == EAddressCategory.work.text) return EAddressCategory.work;
  if (category == EAddressCategory.school.text) return EAddressCategory.school;
  if (category == EAddressCategory.etc.text) return EAddressCategory.etc;
  return null;
}
