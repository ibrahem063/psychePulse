abstract class psychepulStates {}

class psychepulInitialState extends psychepulStates {}

class modileMainButtonNavState extends psychepulStates {}

class psychepulGetUserLoadingState extends psychepulStates {}

class psychepulGetUserSuccessState extends psychepulStates {}

class psychepulGetUserErrorState extends psychepulStates
{
  final String error;

  psychepulGetUserErrorState(this.error);
}
class psychepulGetDrSuccessState extends psychepulStates {}

class psychepulGetDrErrorState extends psychepulStates
{
  final String error;

  psychepulGetDrErrorState(this.error);
}
class psychepulseLikePostSuccessState extends psychepulStates {}

class psychepulLikePostErrorState extends psychepulStates
{
  final String error;

  psychepulLikePostErrorState(this.error);
}

class psychepulChangeBottomNavState extends psychepulStates {}

class psychepulmoodState extends psychepulStates {}

class psychepulProfileImagePickedSuccessState extends psychepulStates {}

class psychepulProfileImagePickedErrorState extends psychepulStates {}

class psychepulCoverImagePickedSuccessState extends psychepulStates {}

class psychepulCoverImagePickedErrorState extends psychepulStates {}

class psychepulUploadProfileImageSuccessState extends psychepulStates {}

class psychepulUploadProfileImageErrorState extends psychepulStates {}

class psychepulUploadCoverImageSuccessState extends psychepulStates {}

class psychepulUploadCoverImageErrorState extends psychepulStates {}

class psychepulUserUpdateLoadingState extends psychepulStates {}

class psychepulUserUpdateErrorState extends psychepulStates {}


// create post

class psychepulCreatePostLoadingState extends psychepulStates {}

class psychepulCreatePostSuccessState extends psychepulStates {}

class psychepulCreatePostErrorState extends psychepulStates {}

class psychepulPostImagePickedSuccessState extends psychepulStates {}

class psychepulPostImagePickedErrorState extends psychepulStates {}

class psychepulRemovePostImageState extends psychepulStates {}

class psychepulseGetPostsSuccessState extends psychepulStates {}

class psychepulseGetPostsErrorState extends psychepulStates
{
  final String error;

  psychepulseGetPostsErrorState(this.error);
}

class CreateChatError extends psychepulStates{}

class psychepulseSendMessageErrorState extends psychepulStates {}
class psychepulseSendMessageSuccessState extends psychepulStates {}
class psychepulseGetMessageSuccessState extends psychepulStates {}
class psychepulseGetMessageErrorState extends psychepulStates {}
class psychepulseSendMessageSuccessclearState extends psychepulStates{}
class psychepulseGetAllUsersLoadingState extends psychepulStates {}

class psychepulseGetAllUsersSuccessState extends psychepulStates {}

class psychepulseGetAllUsersErrorState extends psychepulStates
{
  final String error;

  psychepulseGetAllUsersErrorState(this.error);
}
class psychepulseGetAllDrsSuccessState extends psychepulStates {}

class psychepulseGetAllDrErrorState extends psychepulStates
{
  final String error;

  psychepulseGetAllDrErrorState(this.error);
}
class psychepulCreateDatabaseState extends psychepulStates {}

class psychepulGetDatabaseLoadingState extends psychepulStates {}

class psychepulGetDatabaseState extends psychepulStates {}

class psychepulInsertDatabaseState extends psychepulStates {}

class psychepulUpdateDatabaseState extends psychepulStates {}

class psychepulDeleteDatabaseState extends psychepulStates {}

class psychepulChangeBottomSheetState extends psychepulStates {}

class LoginLoadingState extends psychepulStates {}

class LoginSuccessState extends psychepulStates
{
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends psychepulStates
{
  final String error;

  LoginErrorState(this.error);
}

class SocialChangePasswordVisibilityState extends psychepulStates {}
class ShowSpinState extends psychepulStates {}

class RegisterLoadingState extends psychepulStates {}

class RegisterSuccessState extends psychepulStates {}

class RegisterErrorState extends psychepulStates
{
  final String error;

  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends psychepulStates {}

class CreateUserErrorState extends psychepulStates
{
  final String error;

  CreateUserErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends psychepulStates {}

class ShowSpinStat extends psychepulStates {}
