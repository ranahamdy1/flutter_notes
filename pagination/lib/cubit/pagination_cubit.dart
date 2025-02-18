import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(PaginationInitial());

  final Dio _dio = Dio();
  List<dynamic> items = [];
  int _page = 1;
  bool _hasMore = true;
  bool _isLoading = false;

  Future<void> fetchData() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    emit(PaginationLoading(items));

    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        queryParameters: {'_limit': 10, '_page': _page},
      );

      if (response.data.isNotEmpty) {
        items.addAll(response.data);
        _page++;
      } else {
        _hasMore = false;
      }

      emit(PaginationSuccess(List.from(items), _hasMore));
    } catch (e) {
      emit(PaginationError("حدث خطأ أثناء تحميل البيانات"));
    } finally {
      _isLoading = false;
    }
  }
}
