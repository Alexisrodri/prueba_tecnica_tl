String truncateFileName(String fileName, {int maxLength = 20}) {
  final extension = fileName.split('.').last;
  final baseName =
      fileName.substring(0, fileName.length - extension.length - 1);

  if (baseName.length > maxLength) {
    final truncatedBaseName =
        baseName.substring(0, maxLength - extension.length - 3);
    return '$truncatedBaseName...$extension';
  }
  return fileName;
}
