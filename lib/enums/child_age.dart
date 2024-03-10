enum EChildAge {
  age6(6, '0 ~ 6개월'),
  age12(12, '6 ~ 12개월'),
  age36(36, '12 ~ 36개월'),
  age60(60, '36개월 ~ 5살'),
  age84(84, '5살 ~ 7살');

  final int age;
  final String text;

  const EChildAge(this.age, this.text);
}

EChildAge? ageToEChildAge(int? age) {
  if (age == null) return null;
  if (age <= 6) return EChildAge.age6;
  if (age <= 12) return EChildAge.age12;
  if (age <= 36) return EChildAge.age36;
  if (age <= 60) return EChildAge.age60;
  return EChildAge.age84;
}

int? strToAge(String age) {
  for (var eAge in EChildAge.values) {
    if (eAge.text == age) return eAge.age;
  }
  return null;
}
