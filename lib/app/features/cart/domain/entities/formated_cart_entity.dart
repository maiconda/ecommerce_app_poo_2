class FormattedCartEntity {
  final String name;
  final int quantity;
  final double price;
  final String description;
  final String imgUrl;
  final int id;
  final int idToRemove;

  FormattedCartEntity({
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
    required this.imgUrl,
    required this.id,
    required this.idToRemove,
  });
}
