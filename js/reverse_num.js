function reverse(d) {
  var sum = 0;
  while(d) {
    var n = d % 10;
    sum = sum * 10 + n;
    d = parseInt(d / 10);
  }
  return sum;
}

console.log(reverse(123) === 321);
console.log(reverse(123456789) === 987654321);
console.log(reverse(1234567891) === 987654321);
