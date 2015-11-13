Pod::Spec.new do |s|
  s.name             = "BitfinexSwiftAPI"
  s.version          = "0.1.0"
  s.summary          = "BitfinexSwiftAPI provides API access to bitfinex.com"

  s.description      = <<-DESC
                       BitfinexSwiftAPI library
                       DESC

  s.homepage         = "https://DarthRamone@bitbucket.org/DarthRamone/bitfinexswiftapi.git"
  s.license          = 'MIT'
  s.author           = { "Alexander Moshkin" => "moshkin_alexander@outlook.com" }
  s.source           = { :git => "https://DarthRamone@bitbucket.org/DarthRamone/bitfinexswiftapi.git", :tag => s.version.to_s }

  s.requires_arc = true
  s.osx.deployment_target = "10.8"
  s.source_files = "BitfinexSwiftAPI/*.{swift}"

  s.dependency 'SwiftyJSON', '~> 2.3'
  s.dependency 'Alamofire', '~> 3.0'
  s.dependency 'CryptoSwift', '~> 0.1'
end
