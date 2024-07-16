

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // variables and functions that will be used through any view model .
}

abstract class BaseViewModelInputs {
  void start(); // start view model job
  void dispose(); //  end view model
}

mixin BaseViewModelOutputs {
//
}
