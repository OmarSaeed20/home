import '/core/network/base/repository/base_repository.dart';
import '/new_app/app_prefs.dart';
import '/new_app/data/api/new_app_client.dart';
import '/new_app/data/model/newapp_contact_us_model.dart';
import '/new_app/data/model/newapp_services_mode.dart';

import '/core/network/base/typedef/typedef.dart';

abstract class BaseNewAppRepository {
  ResultFuture<NewAppServicesMode> getService();
  ResultFuture<NewAppCuntactUsModel> getAppContactUsData();
}

class NewAppRepositoryImp implements BaseNewAppRepository {
  const NewAppRepositoryImp(this.remote, this.pref);
  final NewAppClient remote;
  final NewAppAppPreferences pref;

  @override
  ResultFuture<NewAppServicesMode> getService() =>
      executeAndHandleError<NewAppServicesMode>(
        () => remote.getNewAppService(lang: pref.getLang),
      );

  @override
  ResultFuture<NewAppCuntactUsModel> getAppContactUsData() =>
      executeAndHandleError<NewAppCuntactUsModel>(
        () => remote.getNewAppContactUsData(lang: pref.getLang),
      );
}
