module QM
  class Response
    attr_reader :status, :description, :time_elapsed, :qm_version, :result

    def initialize(qm_result)
      @status       = qm_result["result"][0][1]
      @description  = qm_result["result"][1][1]
      @time_elapsed = "#{qm_result["result"][2][1]}ms"
      @qm_version   = qm_result["result"][3][1]

      api_key = qm_result.keys.last
      header = qm_result[api_key][0]
      zip_hash(header,qm_result,api_key)
    end

    private

    def zip_hash(header,response,api_call_key)
      @result = []
      response[api_call_key].each_with_index do |result,i|
        @result.push Hash[header.zip(result)] unless i == 0
      end
      @result
    end

  end
end
