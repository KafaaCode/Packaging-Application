
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/domin/repository/main_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'category_state.dart';
part 'category_event.dart';
part 'category_bloc.freezed.dart';

class CategoriesBloc extends HydratedBloc<CategoriesEvent, CategoriesState> {
  final BaseMainRepository baseMainRepository;

  CategoriesBloc(this.baseMainRepository) : super(const CategoriesState()) {
    on<CategoriesEvent>((event, emit) async {
      await event.map(
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

 
  }



  @override
  CategoriesState? fromJson(Map<String, dynamic> json) {
    return CategoriesState(
      categories:
          (json['categories'] as List).map((e) => Category.fromJson(e)).toList(),
      loading: json['loading'],
      isEmpty: json['isEmpty'],
      isAuth: json['isAuth'],
    );
  }

  @override
  Map<String, dynamic>? toJson(CategoriesState state) {
    return {
      'categories': state.categories.map((e) => e.toJson()).toList(),
      'loading': state.loading,
      'isEmpty': state.isEmpty,
      'isAuth': state.isAuth,
    };
  }
}
