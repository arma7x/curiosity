const countConstruct = (target, words, memo = {}) => {
  if (target in memo) return memo[target];
  if (target === '') return 1;

  let totalCount = 0;

  for (let word of words) {
    if (target.indexOf(word) === 0) {
      const suffix = target.slice(word.length);
      totalCount += countConstruct(suffix, words, memo);
    }
  }

  memo[target] = totalCount;
  return memo[target];
}

console.log(countConstruct('abcdef', ['ab', 'abc', 'cd', 'def', 'abcd']));
console.log(countConstruct('purple', ['purp', 'p', 'ur', 'le', 'purpl']));
console.log(countConstruct('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeef', ['e', 'ee', 'eee', 'eeee', 'eeeee']));
