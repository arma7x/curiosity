function reverse(d) {
  var sum = 0;
  var test = d;
  while(d) {
    var n = d % 10;
    sum = sum * 10 + n;
    d = parseInt(d / 10);
  }
  return sum === test;
}

console.log(reverse(121) === true);
console.log(reverse(12121) === true);
console.log(reverse(1234567) === true);
