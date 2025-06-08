String getCity(String location) {
  if (location.isEmpty) return '';

  // Step 1: Split by comma, take first part
  final beforeComma = location.split(',')[0].trim();

  // Step 2: Split by hyphen with optional spaces and take first city
  // Use regex to split on hyphen surrounded by optional spaces
  final parts = beforeComma.split(RegExp(r'\s*-\s*'));

  return parts[0].trim();
}
