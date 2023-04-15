function addSpaceBeforeUpper(i, text) {
  if (text[i] >= 'A' && text[i] <= 'Z')
    text = text.substring(0, i) + ' ' + text.substring(i), i += 2;
  else
    i++;
  if (i >= text.length)
    return text;
  return addSpaceBeforeUpper(i, text);
}

addSpaceBeforeUpper(1, 'addSpaceBeforeUpper');
