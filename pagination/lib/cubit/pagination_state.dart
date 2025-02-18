part of 'pagination_cubit.dart';

abstract class PaginationState {
  final List<dynamic> items;
  PaginationState(this.items);
}

class PaginationInitial extends PaginationState {
  PaginationInitial() : super([]);
}

class PaginationLoading extends PaginationState {
  PaginationLoading(List<dynamic> items) : super(items);
}

class PaginationSuccess extends PaginationState {
  final bool hasMore;
  PaginationSuccess(List<dynamic> items, this.hasMore) : super(items);
}

class PaginationError extends PaginationState {
  final String message;
  PaginationError(this.message) : super([]);
}
