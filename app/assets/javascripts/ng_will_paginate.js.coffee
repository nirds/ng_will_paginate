angular.module('ng-will-paginate', [])
  .directive 'pagination', ->
    {
      restrict: 'A',
      scope: false,
      template:  "<div class='pagination-container' ng-if='pages.length > 1'>
                    <a class='pagination' ng-click='goToPage(1)' ng-if='currentPage > 1'>
                      <<
                    </a>
                    <a class='pagination' ng-click='goToPage(currentPage - 1)' ng-if='currentPage > 1'>
                      < prev
                    </a>
                    <a class='pagination page-links' ng-repeat='page in pages' ng-click='goToPage(page)'
                                                      ng-class=\"{'current': page == currentPage}\">
                      {{page}}
                    </a>
                    <a class='pagination' ng-click='goToPage(currentPage + 1)' ng-if='currentPage != max'>
                      next >
                    </a>
                    <a class='pagination' ng-click='goToPage(max)' ng-if='currentPage != max'>
                      >>
                    </a>
                  </div>"
    }
  .factory 'paginationService', ['$http', ($http)->

    getPage: (pageNumber, route, scope)->
      return $http.get(route, params: {page: pageNumber})
        .success ((data, status, headers, config) ->
          scope.currentPage = pageNumber
          scope.max = data.max
          buildPagesArray(scope.currentPage, scope.max, scope)
          scope.records = data.records
        )
        .error ((data, status, headers, config) ->
          return data.errors
        )

    buildPagesArray= (current, max, scope)->
      scope.pages = []
      scope.pages.push(current - 2) if current - 2 > 0
      scope.pages.push(current - 1) if current - 1 > 0
      scope.pages.push(current)
      scope.pages.push(current + 1) if current + 1 <= max
      scope.pages.push(current + 2) if current + 2 <= max
  ]
