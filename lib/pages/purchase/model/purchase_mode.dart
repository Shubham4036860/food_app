// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<PurchaseModel> welcomeFromJson(String str) => List<PurchaseModel>.from(json.decode(str).map((x) => PurchaseModel.fromJson(x)));

String welcomeToJson(List<PurchaseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PurchaseModel {
  int id;
  String name;
  String? shortDescription;
  String? fullDescription;
  String? sku;
  String? gtin;
  bool isGiftCard;
  double taxRate;
  int manageInventoryMethodId;
  bool displayStockAvailability;
  bool displayStockQuantity;
  int stockQuantity;
  double price;
  bool customerEntersPrice;
  double minimumCustomerEnteredPrice;
  double maximumCustomerEnteredPrice;
  List<ProductPicture> productPictures;
  List<ProductPicture> productFullSizePictures;
  String productCategories;
  List<ProductAttribute> productAttributes;
  List<ProductSpecificationAttribute> productSpecificationAttributes;
  bool published;
  int displayOrder;
  bool showOnWebsite;
  bool showOnKiosk;
  bool showOnPosWeb;
  bool showOnPosMobile;
  double discountAmount;
  double discountPercentage;
  bool usePercentage;

  PurchaseModel({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.sku,
    required this.gtin,
    required this.isGiftCard,
    required this.taxRate,
    required this.manageInventoryMethodId,
    required this.displayStockAvailability,
    required this.displayStockQuantity,
    required this.stockQuantity,
    required this.price,
    required this.customerEntersPrice,
    required this.minimumCustomerEnteredPrice,
    required this.maximumCustomerEnteredPrice,
    required this.productPictures,
    required this.productFullSizePictures,
    required this.productCategories,
    required this.productAttributes,
    required this.productSpecificationAttributes,
    required this.published,
    required this.displayOrder,
    required this.showOnWebsite,
    required this.showOnKiosk,
    required this.showOnPosWeb,
    required this.showOnPosMobile,
    required this.discountAmount,
    required this.discountPercentage,
    required this.usePercentage,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) => PurchaseModel(
    id: json["Id"],
    name: json["Name"],
    shortDescription: json["ShortDescription"],
    fullDescription: json["FullDescription"],
    sku: json["Sku"],
    gtin: json["Gtin"],
    isGiftCard: json["IsGiftCard"],
    taxRate: json["TaxRate"],
    manageInventoryMethodId: json["ManageInventoryMethodId"],
    displayStockAvailability: json["DisplayStockAvailability"],
    displayStockQuantity: json["DisplayStockQuantity"],
    stockQuantity: json["StockQuantity"],
    price: json["Price"]?.toDouble(),
    customerEntersPrice: json["CustomerEntersPrice"],
    minimumCustomerEnteredPrice: json["MinimumCustomerEnteredPrice"],
    maximumCustomerEnteredPrice: json["MaximumCustomerEnteredPrice"],
    productPictures: List<ProductPicture>.from(json["ProductPictures"].map((x) => ProductPicture.fromJson(x))),
    productFullSizePictures: List<ProductPicture>.from(json["ProductFullSizePictures"].map((x) => ProductPicture.fromJson(x))),
    productCategories: json["ProductCategories"],
    productAttributes: List<ProductAttribute>.from(json["ProductAttributes"].map((x) => ProductAttribute.fromJson(x))),
    productSpecificationAttributes: List<ProductSpecificationAttribute>.from(json["ProductSpecificationAttributes"].map((x) => ProductSpecificationAttribute.fromJson(x))),
    published: json["Published"],
    displayOrder: json["DisplayOrder"],
    showOnWebsite: json["ShowOnWebsite"],
    showOnKiosk: json["ShowOnKiosk"],
    showOnPosWeb: json["ShowOnPosWeb"],
    showOnPosMobile: json["ShowOnPosMobile"],
    discountAmount: json["DiscountAmount"],
    discountPercentage: json["DiscountPercentage"],
    usePercentage: json["UsePercentage"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "ShortDescription": shortDescription,
    "FullDescription": fullDescription,
    "Sku": sku,
    "Gtin": gtin,
    "IsGiftCard": isGiftCard,
    "TaxRate": taxRate,
    "ManageInventoryMethodId": manageInventoryMethodId,
    "DisplayStockAvailability": displayStockAvailability,
    "DisplayStockQuantity": displayStockQuantity,
    "StockQuantity": stockQuantity,
    "Price": price,
    "CustomerEntersPrice": customerEntersPrice,
    "MinimumCustomerEnteredPrice": minimumCustomerEnteredPrice,
    "MaximumCustomerEnteredPrice": maximumCustomerEnteredPrice,
    "ProductPictures": List<dynamic>.from(productPictures.map((x) => x.toJson())),
    "ProductFullSizePictures": List<dynamic>.from(productFullSizePictures.map((x) => x.toJson())),
    "ProductCategories": productCategories,
    "ProductAttributes": List<dynamic>.from(productAttributes.map((x) => x.toJson())),
    "ProductSpecificationAttributes": List<dynamic>.from(productSpecificationAttributes.map((x) => x.toJson())),
    "Published": published,
    "DisplayOrder": displayOrder,
    "ShowOnWebsite": showOnWebsite,
    "ShowOnKiosk": showOnKiosk,
    "ShowOnPosWeb": showOnPosWeb,
    "ShowOnPosMobile": showOnPosMobile,
    "DiscountAmount": discountAmount,
    "DiscountPercentage": discountPercentage,
    "UsePercentage": usePercentage,
  };
}

class ProductAttribute {
  int id;
  int productAttributeId;
  String name;
  String? description;
  String? textPrompt;
  bool isRequired;
  dynamic defaultValue;
  dynamic allowedFileExtensions;
  int attributeControlTypeId;
  AttributeControlType attributeControlType;
  List<Value> values;
  int displayOrder;

  ProductAttribute({
    required this.id,
    required this.productAttributeId,
    required this.name,
    required this.description,
    required this.textPrompt,
    required this.isRequired,
    required this.defaultValue,
    required this.allowedFileExtensions,
    required this.attributeControlTypeId,
    required this.attributeControlType,
    required this.values,
    required this.displayOrder,
  });

  factory ProductAttribute.fromJson(Map<String, dynamic> json) => ProductAttribute(
    id: json["Id"],
    productAttributeId: json["ProductAttributeId"],
    name: json["Name"],
    description: json["Description"],
    textPrompt: json["TextPrompt"],
    isRequired: json["IsRequired"],
    defaultValue: json["DefaultValue"],
    allowedFileExtensions: json["AllowedFileExtensions"],
    attributeControlTypeId: json["AttributeControlTypeId"],
    attributeControlType: attributeControlTypeValues.map[json["AttributeControlType"]]!,
    values: List<Value>.from(json["Values"].map((x) => Value.fromJson(x))),
    displayOrder: json["DisplayOrder"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "ProductAttributeId": productAttributeId,
    "Name": name,
    "Description": description,
    "TextPrompt": textPrompt,
    "IsRequired": isRequired,
    "DefaultValue": defaultValue,
    "AllowedFileExtensions": allowedFileExtensions,
    "AttributeControlTypeId": attributeControlTypeId,
    "AttributeControlType": attributeControlTypeValues.reverse[attributeControlType],
    "Values": List<dynamic>.from(values.map((x) => x.toJson())),
    "DisplayOrder": displayOrder,
  };
}

enum AttributeControlType {
  CHECKBOXES,
  DROPDOWN_LIST,
  MULTILINE_TEXTBOX,
  RADIO_LIST
}

final attributeControlTypeValues = EnumValues({
  "Checkboxes": AttributeControlType.CHECKBOXES,
  "DropdownList": AttributeControlType.DROPDOWN_LIST,
  "MultilineTextbox": AttributeControlType.MULTILINE_TEXTBOX,
  "RadioList": AttributeControlType.RADIO_LIST
});

class Value {
  int id;
  String name;
  String? colorSquaresRgb;
  String? priceAdjustment;
  double priceAdjustmentValue;
  bool isPreSelected;
  String? pictureUrl;
  String? fullSizePictureUrl;
  bool allowOutOfStock;
  int stockQuanity;

  Value({
    required this.id,
    required this.name,
    required this.colorSquaresRgb,
    required this.priceAdjustment,
    required this.priceAdjustmentValue,
    required this.isPreSelected,
    required this.pictureUrl,
    required this.fullSizePictureUrl,
    required this.allowOutOfStock,
    required this.stockQuanity,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["Id"],
    name: json["Name"],
    colorSquaresRgb: json["ColorSquaresRgb"],
    priceAdjustment: json["PriceAdjustment"],
    priceAdjustmentValue: json["PriceAdjustmentValue"]?.toDouble(),
    isPreSelected: json["IsPreSelected"],
    pictureUrl: json["PictureUrl"],
    fullSizePictureUrl: json["FullSizePictureUrl"],
    allowOutOfStock: json["AllowOutOfStock"],
    stockQuanity: json["StockQuanity"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "ColorSquaresRgb": colorSquaresRgb,
    "PriceAdjustment": priceAdjustment,
    "PriceAdjustmentValue": priceAdjustmentValue,
    "IsPreSelected": isPreSelected,
    "PictureUrl": pictureUrl,
    "FullSizePictureUrl": fullSizePictureUrl,
    "AllowOutOfStock": allowOutOfStock,
    "StockQuanity": stockQuanity,
  };
}

class ProductPicture {
  String pictureUrl;
  int displayOrder;

  ProductPicture({
    required this.pictureUrl,
    required this.displayOrder,
  });

  factory ProductPicture.fromJson(Map<String, dynamic> json) => ProductPicture(
    pictureUrl: json["PictureUrl"],
    displayOrder: json["DisplayOrder"],
  );

  Map<String, dynamic> toJson() => {
    "PictureUrl": pictureUrl,
    "DisplayOrder": displayOrder,
  };
}

class ProductSpecificationAttribute {
  int id;
  String attributeTypeName;
  String attributeName;
  String valueRaw;
  bool allowFiltering;
  bool showOnProductPage;
  int displayOrder;

  ProductSpecificationAttribute({
    required this.id,
    required this.attributeTypeName,
    required this.attributeName,
    required this.valueRaw,
    required this.allowFiltering,
    required this.showOnProductPage,
    required this.displayOrder,
  });

  factory ProductSpecificationAttribute.fromJson(Map<String, dynamic> json) => ProductSpecificationAttribute(
    id: json["Id"],
    attributeTypeName: json["AttributeTypeName"],
    attributeName: json["AttributeName"],
    valueRaw: json["ValueRaw"],
    allowFiltering: json["AllowFiltering"],
    showOnProductPage: json["ShowOnProductPage"],
    displayOrder: json["DisplayOrder"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "AttributeTypeName": attributeTypeName,
    "AttributeName": attributeName,
    "ValueRaw": valueRaw,
    "AllowFiltering": allowFiltering,
    "ShowOnProductPage": showOnProductPage,
    "DisplayOrder": displayOrder,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
