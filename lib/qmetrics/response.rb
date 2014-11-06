module Qmetrics
  class Response
    attr_reader :status, :description, :time_elapsed, :Qmetrics_version, :result

    def initialize(qmetrics_result,api_methods)
      @api_methods        = api_methods
      @status             = qmetrics_result["result"][0][1]
      @description        = qmetrics_result["result"][1][1]
      @time_elapsed       = "#{qmetrics_result["result"][2][1]}ms"
      @Qmetrics_version   = qmetrics_result["result"][3][1]

      qmetrics_result.delete("result")
      zip_results(qmetrics_result)
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

    def zip_arrs(method_results)
      results = []
      header = method_results.first
      method_results.each_with_index do |r,i|
        results.push(Hash[header.zip(r)]) unless i == 0
      end
      results
    end

  end
end
