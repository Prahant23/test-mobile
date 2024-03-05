import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/feature/messages/data/model/product.dart';
import 'package:vintuff_thrift/feature/messages/presentation/state/my_profile_state.dart';
import 'package:vintuff_thrift/feature/product/data/data_source/product_remote_datasource.dart';
import 'package:vintuff_thrift/feature/product/presentation/state/product_state.dart';
import 'package:vintuff_thrift/feature/profile/data/data_source/profile_remote_datasouce.dart';
import 'package:vintuff_thrift/feature/profile/presentation/state/profile_state.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>((ref) {
  final profileRemoteDataSource = ref.read(profileRemoteDataSourceProvider);
  return ProfileViewModel(profileRemoteDataSource);
});

class ProfileViewModel extends StateNotifier<ProfileState> {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileViewModel(this.profileRemoteDataSource)
      : super(ProfileState.initial());

  Future getProfile() async {
    state = state.copyWith(isLoading: true, hasreachedmax: false);
    final currentState = state;
    final page = currentState.page + 1;
    final profile = currentState.profileApiModel;
    final hasreachedmax = currentState.hasreachedmax;
    if (!hasreachedmax) {
      final result = await profileRemoteDataSource.getprofile(page);
      result.fold(
          (Failure) => state =
              state.copyWith(isLoading: true, hasreachedmax: true), (data) {
        if (data.isEmpty) {
          state = state.copyWith(hasreachedmax: true);
        } else {
          state = state.copyWith(
              profileApiModel: [...profile, ...data],
              page: page,
              isLoading: false,
              hasreachedmax: false);
        }
      });
    }
  }

  Future resetState() async {
    state = ProfileState.initial();
    getProfile();
  }
}
