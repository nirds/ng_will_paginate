#= require application
#= require angular
#= require angular-mocks

describe 'paginationService', ->
  paginationService = {}
  $httpBackend = {}

  beforeEach( ->
    module 'ng-will-paginate'
  )

  beforeEach inject(($injector) ->
    paginationService = $injector.get('paginationService')
    $httpBackend = $injector.get('$httpBackend')
    $httpBackend.when('GET', '/testroute.json')
      .respond({records: [{name: 'cool'}]})
  )

  describe 'notice', ->
    it 'sets the rootScope notice and the rootScope notice_show', ->
      paginationService.getPage()

      expect(true).toBe(false)
