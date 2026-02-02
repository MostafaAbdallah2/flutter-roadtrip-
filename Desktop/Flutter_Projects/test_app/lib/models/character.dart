/// Model for character data
class Character {
  final String name;
  final bool isSelected;

  Character({
    required this.name,
    required this.isSelected,
  });

  Character copyWith({
    String? name,
    bool? isSelected,
  }) {
    return Character(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
