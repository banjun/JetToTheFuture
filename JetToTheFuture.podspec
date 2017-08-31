Pod::Spec.new do |s|
  s.name             = 'JetToTheFuture'
  s.version          = '0.4.0-beta.1'
  s.summary          = 'safely `forced()` to get to the BrightFutures.Future values'
  s.description      = <<-DESC
                       brings forced future block to safely `forced()` just on the main thread.
                       its usecase is mainly for command-line and testcases
                       DESC
  s.homepage         = 'https://github.com/banjun/JetToTheFuture'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'banjun' => 'banjun@gmail.com' }
  s.source           = { :git => 'https://github.com/banjun/JetToTheFuture.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/banjun'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.source_files = 'JetToTheFuture/Classes/**/*'
  s.dependency 'BrightFutures', '>= 6.0.0-beta.1'
end
