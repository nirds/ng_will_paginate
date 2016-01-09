#= require application
#= require angular
#= require angular-mocks

describe 'pagination', ->
  compile = undefined
  scope = undefined
  directiveElement = undefined



  beforeEach ->
    module 'ng-will-paginate'

    inject ($rootScope, $compile) ->
      compile = $compile
      scope = $rootScope.$new()

  setUpDirective =(currentPage, max)->
    scope.currentPage = currentPage
    scope.max = max
    scope.pages = []
    getPageArray()
    directiveElement = getCompiledElement()

  getCompiledElement =()->
    element = angular.element('<pagination/>')
    compiledElement = compile(element) scope
    scope.$digest()
    return compiledElement

  getPageArray =()->
    scope.pages.push(scope.currentPage - 2) if scope.currentPage - 2 > 0
    scope.pages.push(scope.currentPage - 1) if scope.currentPage - 1 > 0
    scope.pages.push(scope.currentPage)
    scope.pages.push(scope.currentPage + 1) if scope.currentPage + 1 <= scope.max
    scope.pages.push(scope.currentPage + 2) if scope.currentPage + 2 <= scope.max



  it 'is defined', ->
    setUpDirective(1, 5)
    expect(directiveElement).toBeDefined()

  it 'contains html', ->
    setUpDirective(1, 5)
    expect(directiveElement.html()).not.toEqual('')

  it 'creates appropriate links for a first page', ->
    setUpDirective(1, 5)
    expect(directiveElement[0].innerText).toEqual('    1  2  3   next >   >>  ')

  it 'creates appropriate links for a last page', ->
    setUpDirective(5, 5)
    expect(directiveElement[0].innerText).toEqual('  <<   < prev   3  4  5    ')
    console.log directiveElement

  it 'creates appropriate links for a middle pages', ->
    setUpDirective(5, 10)
    expect(directiveElement[0].innerText).toEqual('  <<   < prev   3  4  5  6  7   next >   >>  ')

