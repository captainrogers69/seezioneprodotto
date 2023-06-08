class SeezioneProduct {
  final String? productImage;
  final String? productName;
  final String? productSubname;
  final String? productDesc;
  final String? productId;
  final num? marketPrice;
  final num? discountPrice;
  final num? discountPercent;
  const SeezioneProduct({
    required this.discountPercent,
    required this.discountPrice,
    required this.marketPrice,
    required this.productSubname,
    required this.productDesc,
    required this.productImage,
    required this.productName,
    required this.productId,
  });
}
