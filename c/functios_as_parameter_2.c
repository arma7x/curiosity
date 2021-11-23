#include <stdio.h>
#include <stdlib.h>

typedef enum { DEPOSIT, WITHDRAW } Type;

typedef struct transaction
{
  int id;
  int amount;
  Type type;
  int date;
  void (*printer) (struct transaction *t);
} Transaction;

void printer_deposit(struct transaction *t) {
  printf("# DEPOSIT  -> %d %d %d %d\n", (*t).id, (*t).amount, (*t).type, (*t).date);
}

void printer_withdraw(struct transaction *t) {
  printf("# WITHDRAW -> %d %d %d %d\n", (*t).id, (*t).amount, (*t).type, (*t).date);
}

Transaction* constructor_rec_func(int id, int  amount, Type type, int date, void (*printer) (struct transaction *t)) {
  Transaction* t = (Transaction*) malloc(sizeof(Transaction));
  (*t).id = id;
  (*t).amount = amount;
  (*t).type = type;
  (*t).date = date;
  (*t).printer = printer;
  return t;
}

Transaction* constructor_use_enum(int id, int  amount, Type type, int date) {
  Transaction* t = (Transaction*) malloc(sizeof(Transaction));
  (*t).id = id;
  (*t).amount = amount;
  (*t).type = type;
  (*t).date = date;
   if (type == WITHDRAW)
    (*t).printer = printer_withdraw;
   else
    (*t).printer = printer_deposit;
  return t;
}

int main()
{
  Transaction** list = (Transaction**) malloc(sizeof(Transaction*));
  list[0] = constructor_rec_func(1, 10, DEPOSIT, 1000, printer_deposit);
  (*list[0]).printer(list[0]);

  list = realloc(list, 2 * sizeof(Transaction*));
  list[1] = constructor_use_enum(2, 10, WITHDRAW, 1001);
  (*list[1]).printer(list[1]);

  return 0;
}
