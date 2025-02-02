class AccountState {
  final Function()? getCardImage;
  final Function()? getCollectingFundsImage;
  final Function()? getOtherImage;
  final Function()? asteriskFirstFourLetters;


  AccountState( {
    this.getCardImage,
    this.getCollectingFundsImage,
    this.getOtherImage,
    this.asteriskFirstFourLetters,
  });

  AccountState copyWith({
   Function()? getCardImage,
   Function()? getCollectingFundsImage,
   Function()? getOtherImage,
   Function()? asteriskFirstFourLetters,
  }) {
    return AccountState(
      getCardImage: getCardImage ,
      getCollectingFundsImage: getCollectingFundsImage ?? this.getCollectingFundsImage,
      getOtherImage: getOtherImage ?? this.getOtherImage,
      asteriskFirstFourLetters: asteriskFirstFourLetters ?? this.asteriskFirstFourLetters,
    );
  }
}