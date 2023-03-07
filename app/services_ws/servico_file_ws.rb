module ServicoFileWs

  class << self
    # attr_reader :uploadfile

    def get_upload_arquivo_ws(uploadfile)
      begin
        url = "http://api-metrofile-h.sig.metrofor.ce.gov.br/api/arquivos/upload/"
        request = RestClient::Request.new(
                                method: :post,
                                url: url,
                                payload: {
                                    multipart: true,
                                    'files[]': uploadfile,
                                    modulo: 'METRODATA'
                                }
        )
        response = request.execute
        JSON.parse response.body
      rescue Exception => e
        Rails.logger.warn e.inspect
        Rails.logger.warn("Class: ServicoFileWS, Method: get_upload_arquivo_ws, params: #{uploadfile}")
      end
    end

    def get_download_arquivo_ws(token)
      begin
        url = "http://api-metrofile-h.sig.metrofor.ce.gov.br/api/arquivos/download/"
        url = url + "?token=" + token
        # params = {token: token}
        RestClient.get(url)
      rescue Exception => e
        Rails.logger.warn e.inspect
        Rails.logger.warn("Class: ServicoFileWS, Method: get_download_arquivo_ws, params: #{token}")
      end
    end

    def get_delete_arquivo_ws(token)
      begin
        url = "http://api-metrofile-h.sig.metrofor.ce.gov.br/api/arquivos/delete/"
        params = {token: token}
        retorno = RestClient.post(url, params.to_json, {content_type: :json, timeout: 10})
      rescue Exception => e
        Rails.logger.warn e.inspect
        Rails.logger.warn("Class: ServicoFileWS, Method: get_delete_arquivo_ws, params: #{token}")
      end
    end

  end
end
