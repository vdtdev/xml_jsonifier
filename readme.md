# XML JSONifier

Pretty basic conversion of XML to JSON.

Utilizes Nokogiri to parse XML file, then traverses it to generate a Ruby Hash representation that can then be dumped as a JSON string or directly to a file.

Released under MIT license, includes gemspec

## Usage

```ruby
# Create new instance of XmlJsonifier
jsonifier = XmlJsonifier.new('path/to/my.xml')

# Initiate processing
jsonifier.process

# Print out hash representation
p jsonifier.data

# Print out JSON string representation
p jsonifier.json

# Write JSON to file
jsonifier.to_file('my.json')

# Update source XML and reprocess
jsonifier.update_source('path/to/new.xml', XmlJsonifier::REPROCESS)

# Write out updated json
jsonifier.to_file('new.json')
```

## Additional

Source code is commented with Yard-compatible comments, if you want to build a very short HTML doc reference.