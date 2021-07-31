require_relative './exception.rb'

module Authentication
  def decode request_header: nil
    begin
      #変数をセットする。
      region          = ENV['COGNITO_REGION']
      userPool_id     = ENV['COGNITO_USERPOOL_ID']
      client_id       = ENV['COGNITO_CLIENT_ID'] 
      keyset_url      = "https://cognito-idp.#{region}.amazonaws.com/#{userPool_id}/.well-known/jwks.json"
      comparison_iss  = "https://cognito-idp.#{region}.amazonaws.com/#{userPool_id}"
      jwt_token       = request_header["Authorization"]
      # JWTを検証なしでデコード
      decode_token    = JWT.decode(jwt_token, nil, false)
      # JWTのヘッダーの要素を取得
      algorithm       = decode_token["alg"]
      kid             = decode_token['kid']
      #　Keyセットをダウンロードしてくる。
      response        = Net::HTTP.get_response(URI.parse(keyset_url))
      jwks            = JSON.parse(response.body)  
      # JWKSセットの中からkidが一致するものを取得
      #jwk             = jwks["keys"].detect { |jwk| jwk["kid"] == kid }
      jwk             = jwks["keys"].find { |obj| obj["kid"] == decode_token[1]["kid"] }
      raise ActionController::InvalidAuthenticityToken unless jwt.present?   
      public_key      = public_key(jwt)
      
      puts (decode_token)
      
      # ペイロードの確認。
      return false if decode_token[0]['iss'] != comparison_iss
      return false if decode_token[0]['token_use'] != 'id'
      # 要素を検証していく。
      JWT.decode(jwt_token, public_key, true, algorithm: 'RS256')
    end
  end
  
  def public_key(jwk)
    modulus   = openssl_bn(jwk['n'])
    exponent  = openssl_bn(jwk['e'])
    sequence  =  OpenSSL::ASN1::Sequence.new(
        [OpenSSL::ASN1::Integer.new(modulus),
          OpenSSL::ASN1::Integer.new(exponent)])
    OpenSSL::PKey::RSA.new(sequence.to_der)
  end

  def openssl_bn(n)
    n = n + '=' * (4 - n.size % 4) if n.size % 4 != 0
    decoded = Base64.urlsafe_decode64 n
    unpacked = decoded.unpack1('H*')
    OpenSSL::BN.new unpacked, 16
  end
end

