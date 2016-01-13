Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  mount NgWillPaginate::Engine => "/ng_will_paginate"
end
