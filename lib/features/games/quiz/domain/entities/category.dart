class Category {
  const Category({
    required this.id,
    required this.name,
    required this.iconKey,
    required this.imageUrl,
    required this.isActive,
  });

  final String id;
  final String name;
  final String iconKey;
  final String imageUrl;
  final bool isActive;

  Category copyWith({
    String? id,
    String? name,
    String? iconKey,
    String? imageUrl,
    bool? isActive,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      iconKey: iconKey ?? this.iconKey,
      imageUrl: imageUrl ?? this.imageUrl,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Category &&
        other.id == id &&
        other.name == name &&
        other.iconKey == iconKey &&
        other.imageUrl == imageUrl &&
        other.isActive == isActive;
  }

  @override
  int get hashCode => Object.hash(
        id,
        name,
        iconKey,
        imageUrl,
        isActive,
      );
}