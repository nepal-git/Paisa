import 'package:injectable/injectable.dart';
import 'package:paisa/src/data/expense/model/expense.dart';

import '../../../core/enum/card_type.dart';
import '../../../domain/account/repository/account_repository.dart';
import '../data_sources/account_local_data_source.dart';
import '../model/account.dart';

@Singleton(as: AccountRepository)
class AccountRepositoryImpl extends AccountRepository {
  AccountRepositoryImpl({required this.dataSource});

  final LocalAccountManagerDataSource dataSource;

  @override
  Future<void> addAccount({
    required String bankName,
    required String holderName,
    required String number,
    required CardType cardType,
    required double amount,
  }) {
    return dataSource.addAccount(Account(
      name: holderName,
      icon: cardType.icon.codePoint,
      bankName: bankName,
      number: number,
      cardType: cardType,
      amount: amount,
    ));
  }

  @override
  Future<void> deleteAccount(int key) => dataSource.deleteAccount(key);

  @override
  Future<void> updateAccount(Account account) async =>
      dataSource.addAccount(account);

  @override
  Account? fetchAccountFromId(int accountId) =>
      dataSource.fetchAccountFromId(accountId);

  @override
  List<Account> getAccounts() => dataSource.accounts();

  @override
  List<Expense> fetchExpensesFromAccountId(int accountId) =>
      dataSource.fetchExpensesFromAccountId(accountId);
}
