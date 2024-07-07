enum RequestState {
  none,

  loadMore,
  loadingRef,
  loading,
  loadingSearch,

  success,
  failure,
  offLineFailure,
  empty,
}
 

extension AppStatusX on RequestState {
  bool get isNon => this == RequestState.none;
  bool get isSuccess => this == RequestState.success;
  bool get isError => this == RequestState.failure;
  bool get isLoading => this == RequestState.loading;
  bool get isLoadingRef => this == RequestState.loadingRef;
  bool get isLoadingMore => this == RequestState.loadMore;
  bool get isEmpty => this == RequestState.empty;
  bool get isOffLine => this == RequestState.offLineFailure;
}
 

enum LanguageType { ar, en }
 