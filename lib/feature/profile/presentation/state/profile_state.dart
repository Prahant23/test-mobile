
import 'package:vintuff_thrift/feature/product/data/model/product_api_model.dart';
import 'package:vintuff_thrift/feature/profile/data/model/profile_api_model.dart';

class ProfileState {
  final List< ProfileApiModel> profileApiModel;
  final bool hasreachedmax;
  final String? error;
  final bool isSuccess;
  final bool? showMessage;
  final bool isLoading;
  final int page;

  ProfileState(
      {required this.profileApiModel,
      required this.hasreachedmax,
      this.error,
      this.isSuccess = false,
      this.showMessage,
      required this.isLoading,
      required this.page});

  factory ProfileState.initial() {
    return ProfileState(
      profileApiModel: [],
      hasreachedmax: false,
      isLoading: false,
      error: null,
      showMessage: false,
      page: 0,
    );
  }

  ProfileState copyWith({
    List<ProfileApiModel>? profileApiModel,
    bool? hasreachedmax,
    bool? isLoading,
    String? error,
    bool? showMessage,
    int? page,
  }) {
    return ProfileState(
      profileApiModel: profileApiModel ?? this.profileApiModel,
      hasreachedmax: hasreachedmax ?? this.hasreachedmax,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      showMessage: showMessage ?? this.showMessage,
    );
  }
}