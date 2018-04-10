var ReferenceDisplayCtrl = function($scope) {
  $scope.mapPhraseIndices = function(phraseObj, text) {
    return text.substring(phraseObj.start, phraseObj.end);
  };

  $scope.mapTuples = function(tuples) {
    return tuples.join(', ');
  };
};
