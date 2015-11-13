Pod::Spec.new do |s|
  s.name             = "BitfinexSwiftAPI"
  s.version          = "0.0.3"
  s.summary          = "BitfinexSwiftAPI provides API access to bitfinex.com"

  s.description      = <<-DESC
                       BitfinexSwiftAPI library
                       DESC

  s.homepage         = "https://DarthRamone@bitbucket.org/DarthRamone/bitfinexswiftapi.git"
  s.license          = 'MIT'
  s.author           = { "Alexander Moshkin" => "moshkin_alexander@outlook.com" }
  s.source           = { :git => "https://DarthRamone@bitbucket.org/DarthRamone/bitfinexswiftapi.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.1'
  s.requires_arc = true

  s.dependency 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git'
  s.dependency 'Alamofire', '~> 3.0'
  s.dependency 'CryptoSwift', '~> 0.1'
end
