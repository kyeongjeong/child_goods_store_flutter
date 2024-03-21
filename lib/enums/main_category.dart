enum EMainCategory {
  clothing('의류'),
  accessories('잡화'),
  babyKidsItems('유아동용품'),
  hygieneCleaning('위생 / 세척'),
  toys('교구 / 완구'),
  maternityItems('임부 의류 / 용품'),
  feedingSupplies('식품 / 수유 / 이유용품');

  final String text;

  const EMainCategory(this.text);

  static String? toJson(EMainCategory? en) {
    switch (en) {
      case EMainCategory.clothing:
        return 'CLOTHING';
      case EMainCategory.accessories:
        return 'ACCESSORIES';
      case EMainCategory.babyKidsItems:
        return 'BABY_KIDS_ITEMS';
      case EMainCategory.hygieneCleaning:
        return 'HYGIENE_CLEANING';
      case EMainCategory.toys:
        return 'TOYS';
      case EMainCategory.maternityItems:
        return 'MATERNITY_ITEMS';
      case EMainCategory.feedingSupplies:
        return 'FEEDING_SUPPLIES';
      default:
        return null;
    }
  }

  static EMainCategory? fromJson(String? str) {
    switch (str?.toUpperCase()) {
      case 'CLOTHING':
        return EMainCategory.clothing;
      case 'ACCESSORIES':
        return EMainCategory.accessories;
      case 'BABY_KIDS_ITEMS':
        return EMainCategory.babyKidsItems;
      case 'HYGIENE_CLEANING':
        return EMainCategory.hygieneCleaning;
      case 'TOYS':
        return EMainCategory.toys;
      case 'MATERNITY_ITEMS':
        return EMainCategory.maternityItems;
      case 'FEEDING_SUPPLIES':
        return EMainCategory.feedingSupplies;
      default:
        return null;
    }
  }
}

extension SMainCategoryExtension on String {
  EMainCategory get mainCategoryEnum {
    switch (this) {
      case '의류':
        return EMainCategory.clothing;
      case '잡화':
        return EMainCategory.accessories;
      case '유아동용품':
        return EMainCategory.babyKidsItems;
      case '위생 / 세척':
        return EMainCategory.hygieneCleaning;
      case '교구 / 완구':
        return EMainCategory.toys;
      case '임부 의류 / 용품':
        return EMainCategory.maternityItems;
      case '식품 / 수유 / 이유용품':
        return EMainCategory.feedingSupplies;
      default:
        throw Exception(
            '[SMainCategoryExtension.enumVal] Unknown string value: $this');
    }
  }
}

extension EMainCategoryExtension on EMainCategory {
  String get key {
    switch (this) {
      case EMainCategory.clothing:
        return 'CLOTHING';
      case EMainCategory.accessories:
        return 'ACCESSORIES';
      case EMainCategory.babyKidsItems:
        return 'BABY_KIDS_ITEMS';
      case EMainCategory.hygieneCleaning:
        return 'HYGIENE_CLEANING';
      case EMainCategory.toys:
        return 'TOYS';
      case EMainCategory.maternityItems:
        return 'MATERNITY_ITEMS';
      case EMainCategory.feedingSupplies:
        return 'FEEDING_SUPPLIES';
    }
  }
}
