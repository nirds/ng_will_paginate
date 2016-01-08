require 'spec_helper'

describe NgWillPaginate do
  it 'has a version number' do
    expect(NgWillPaginate::VERSION).not_to be nil
  end

  it 'objectifies and returns reasonable content when there are no records' do
    per_page = 10
    page = 1
    records = []
    expect(NgWillPaginate::Objectifier.JSONify(per_page, page, records)).to eq({:max=>0, :records=>[]})
  end

  it 'objectifies and returns reasonable content when there are multiple pages of records' do
    per_page = 3
    page = 2
    records = []
    expect(NgWillPaginate::Objectifier.JSONify(per_page, page, records)).to eq({:max=>0, :records=>[4, 5, 6]})
  end
end
