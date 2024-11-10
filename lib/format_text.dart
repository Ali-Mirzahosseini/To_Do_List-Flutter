String formatTaskText(String text) {
  text = text.trim();
  // Add line breaks every 25 characters
  String formattedText = '';
  for (int i = 0; i < text.length; i += 25) {
    if (i + 25 < text.length) {
      formattedText += '${text.substring(i, i + 25)}\n';
    } else {
      formattedText += text.substring(i, text.length);
    }
  }

  // Truncate the string to a maximum of 50 characters
  if (formattedText.length > 50) {
    formattedText = formattedText.substring(0, 50);
  }

  return formattedText;
}