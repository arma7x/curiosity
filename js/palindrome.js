const palindrome = (text) => {
  const length = text.length;
  for (i=0;i<Math.floor(text.length/2);i++) {
    if (text[i] !== text[text.length - 1 - i])
      return false;
  }
  return true;
}

console.log(palindrome('122221'));
console.log(palindrome('abcba'));
console.log(palindrome('abcab'));
