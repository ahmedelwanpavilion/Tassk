abstract class HomeStates {}

class HomeInitState extends HomeStates{}

class InterNetConnectionState extends HomeStates{}

class GetHomeSuccessState extends HomeStates{}
class GetHomeErrorState extends HomeStates{}

class GetProductsLoadingState extends HomeStates{}
class GetProductsSuccessState extends HomeStates{}
class GetProductsErrorState extends HomeStates{}