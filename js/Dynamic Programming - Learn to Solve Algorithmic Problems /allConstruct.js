const allConstruct = (target, words, memo = {}) => {
  if (target in memo) return memo[target];
  if (target === '') return [[]];

  let result = [];

  for (let word of words) {
    if (target.indexOf(word) === 0) {
      const suffix = target.slice(word.length);
      const suffixWays = allConstruct(suffix, words, memo);
      const targetWays = suffixWays.map(way => [word, ...way]);
      result.push(...targetWays);
    }
  }

  memo[target] = result;
  console.log(memo);
  return memo[target];
}

console.log(allConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd', 'de' , 'f']));
//console.log(allConstruct('purple', ['purp', 'p', 'ur', 'le', 'purpl']));
//console.log(allConstruct('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef', ['e', 'ee', 'eee', 'eeee', 'eeeee']));
