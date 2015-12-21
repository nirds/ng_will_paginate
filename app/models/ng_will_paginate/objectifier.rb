module NgWillPaginate
  class Objectifier
    def self.JSONify(per_page, page, records, as_json_options=nil)
      return { max: 0, records: [] } if records.length == 0
      total = records.first.class.count
      max_pages = total % per_page > 0 ? total / per_page + 1 : total / per_page
      return {max: max_pages, records: records.as_json(as_json_options)}
    end
  end
end
