const fib = (n) => {
  const table = Array(n + 3).fill(0);
  table[1] = 1;
  for (let i = 0;i<=n;i++) {
    table[i + 1] += table[i];
    table[i + 2] += table[i];
    console.log(table);
  }
  return table[n];
}

//console.log(fib(3));
//console.log(fib(4));
//console.log(fib(5));
console.log(fib(6));
console.log(fib(7));
console.log(fib(8));
console.log(fib(9));
//console.log(fib(50));
