Gem::Specification.new do |s|
    s.name          = 'xml_jsonifier'
    s.version       = '0.1.0'
    s.licenses      = ['MIT']
    # s.license     = 'MIT'
    s.summary       = "XML to JSON conversion"
    s.description   = <<-EOF
        Provides basic support for converting XML to JSON, making
        use of Nokogiri for XML parsing
    EOF
    s.author        = 'Wade H.'
    s.email         = 'vdtdev.prod@gmail.com'
    # s.email       = ['user1@mail.com','user2@mail.com']
    s.files         = ["lib/xml_jsonifier.rb"]
    # (if require 'rake')
    # s.files       = FileList['lib .rb', 'bin/*', '[A-Z]*', 'test/*'].to_a
    # (without require 'rake')
    # s.files       = Dir['lib/*.rb'] + Dir['bin/*']
    # s.files.reject! {|fn| fn.include? "rejected" }
    # s.homepage      = 'https://rubygems.org/gems/flatiron'
    s.homepage      = "https://github.com/vdtdev/xml_jsonifier"
    s.metadata      = { 
        "source_code_uri"   => "https://github.com/vdtdev/xml_jsonifier.git",
    #     "bug_tracker_uri"   => "url",
    #     "documentation_uri" => "url",
    #    "homepage_uri"      => "https://github.com/vdtdev/xml_jsonifier",
    #     "mailing_list_uri"  => "url",
    #     "wiki_uri"          => "url"
    }
    # s.bindir      = 'bin'
    # s.executables << 'exec'
    # s.extensions << 'path/extconf/rb'
    # s.required_ruby_version   = '>= 2.5.0'
    # s.require_paths           = ['lib']
    # s.post_install_message    = "Message"
    # RDOC
    # s.rdoc_options << '--title' << 'flatiron'
    # s.extra_rdoc_files        = ['README', 'doc/thing.txt']
    # DEPENDENCIES
    # s.add_development_dependency 'gem', '~> 1.0'
    # s.add_runtime_dependency 'gem', '~> 1.0'
end
    