module QM
  class Response
    attr_reader :status, :description, :time_elapsed, :qm_version, :result

    def initialize(qm_result,api_methods)
      @api_methods  = api_methods
      @status       = qm_result["result"][0][1]
      @description  = qm_result["result"][1][1]
      @time_elapsed = "#{qm_result["result"][2][1]}ms"
      @qm_version   = qm_result["result"][3][1]

      qm_result.delete("result")
      zip_results(qm_result)
    end

    private

    def zip_results(qm_result)
      @result = {}
      qm_result.each do |k,v|
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
