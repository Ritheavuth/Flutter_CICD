class DiscountModel {
  int? pointToDiscount;
  String? coupon;
  String? description;
  List<Map<String, String>>? activityCouldDiscounts;

  DiscountModel({
    this.pointToDiscount,
    this.coupon,
    this.description,
    this.activityCouldDiscounts,
  });

  DiscountModel.fromJson(Map<String, dynamic> json) {
    pointToDiscount = json['pointToDiscount'];
    coupon = json['coupon'];
    description = json['description'];
    activityCouldDiscounts = json['activityCouldDiscounts'];
  }
}
