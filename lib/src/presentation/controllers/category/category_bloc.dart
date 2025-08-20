import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/admin/screens/categories/category_model.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/domin/repository/main_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'category_state.dart';
part 'category_event.dart';
part 'category_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final BaseMainRepository baseMainRepository;

  CategoriesBloc(this.baseMainRepository) : super(const CategoriesState()) {
    on<CategoriesEvent>((event, emit) async {
      await event.mapOrNull(
        getCategories: (value) async {
          emit(state.copyWith(
              error: false, isAuth: false, isEmpty: false, loading: true));

          final response = await baseMainRepository.getCategoies();
          print(response);

          await response.fold(
            (l) async {
              emit(state.copyWith(
                  loading: false,
                  error: true,
                  errorMessage: l.message,
                  categories: state.categories));
            },
            (r) async {
              emit(state.copyWith(
                  loading: false,
                  error: false,
                  isAuth: true,
                  isEmpty: false,
                  categories: r));
            },
          );
        },
      );
    });
    on<_Search>(_searchEvent);
  }

  void _searchEvent(event, emit) {
    print(event.value);
    if (event.value != null || event.value != '') {
      final query = event.value?.toLowerCase().trim() ?? '';
      List<CategoryModel> category = state.categories.where((e) {
        final name = e.name?.toLowerCase() ?? '';
        return name.contains(query);
      }).toList();
      print(category);
      emit(state.copyWith(searchCategories: category));
    } else {
      emit(state.copyWith(searchCategories: null));
    }
  }
}
