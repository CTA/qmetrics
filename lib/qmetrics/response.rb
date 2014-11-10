module Qmetrics
  class Response
    attr_reader :status, :description, :time_elapsed, :qmetrics_version, :result

    def initialize(qmetrics_result,api_methods)
      @api_methods        = api_methods
      @status             = qmetrics_result["result"][0][1]
      @description        = qmetrics_result["result"][1][1]
      @time_elapsed       = "#{qmetrics_result["result"][2][1]}ms"
      @qmetrics_version   = qmetrics_result["result"][3][1]

      qmetrics_result.delete("result")
      @result = zip_results(qmetrics_result)
    end

    private

    def zip_results(qmetrics_result)
      @result = {}
      qmetrics_result.each do |k,v|
        @result[translate_method_name(k)] = zip_arrs(v)
      end
      @result
    end

    def translate_method_name(java_method_name)
      @api_methods.invert[java_method_name]
    end

    def zip_arrs(r)
      r.first.size > 2 ? zip_keys_and_values(r) : hashify_pairs(r)
    end

    def zip_keys_and_values(results)
      h = results.first
      results[1..results.size].inject({}) do |a,v|
        a.merge(Hash[h.zip(v)])
      end
    end

    def hashify_pairs(results)
      results.inject({}) do |a,v|
        a.merge({v.first => v.last})
      end
    end

  end
end
