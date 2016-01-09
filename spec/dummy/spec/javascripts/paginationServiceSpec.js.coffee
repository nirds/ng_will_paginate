#= require application
#= require angular
#= require angular-mocks

describe 'paginationService', ->
  $scope = {}
  paginationService = {}
  $httpBackend = {}

  beforeEach( ->
    module 'ng-will-paginate'
  )

  beforeEach inject(($injector) ->
    $scope = {}
    paginationService = $injector.get('paginationService')
    $httpBackend = $injector.get('$httpBackend')
    $httpBackend.when('GET', '/testroute.json?page=3')
      .respond({records: [{name: 'cool'}], max: 5})
  )

  describe 'getPage', ->
    it 'makes an http call and sets variables with returned data', ->

      paginationService.getPage(3, '/testroute.json', $scope)

      $httpBackend.expectGET('/testroute.json?page=3')
      $httpBackend.flush()
      expect($scope.max).toBe(5)
      expect($scope.records).toEqual([{name: 'cool'}])
