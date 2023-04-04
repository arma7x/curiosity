var async_generator = (generator, __arguments = null, __this = this) => {

  return new Promise((resolve, reject) => {

    let fulfilled = (value) => {
      try {
        step(generator.next(value));
      } catch (e) {
        reject(e);
      }
    };

    let rejected = (value) => {
      try {
        step(generator.throw(value));
      } catch (e) {
        reject(e);
      }
    };

    let step = (x) => x.done ? resolve(x.value) : Promise.resolve(x.value).then(fulfilled, rejected);

    step((generator = generator.apply(__this, __arguments)).next());

  });
};

async_generator(function*() {
  const value = yield Promise.resolve(1);
  console.log('value:', value);
  const value2 = yield Promise.resolve(1000);
  console.log('value2:', value2);
  const timer = yield 4;
  console.log('timer:', timer);
  yield new Promise(res => setTimeout(res, 3000))
  return (value + value2) * timer;
})
.then((res) => console.log('Success:', res))
.catch((err) => console.error('Error:', err))
