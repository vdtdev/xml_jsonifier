require 'nokogiri'
require 'json'

##
# Provides ability to generate JSON from XML, with option
# to update source XML and reprocess without needing a new instance
#
# (c) 2018, Wade H (vdtdev@gmail.com). All Rights Reserved.
# http://github.com/vdtdev
# Released under MIT license.
#
# @author Wade H <vdtdev@gmail.com>
class XmlJsonifier

    # @!group Update Source Action Constants

    ##
    # Immediately call process after loading new source
    REPROCESS = :process
    ##
    # Clear data object after loading new source, process will be
    # called manually or automatically on use of method requiring it
    RESET = :clear

    # @!endgroup

    attr_accessor :data

    ##
    # Construct new Jsonifier, loading given XML file
    # as source
    # @param [String] filename Filename of XML to load for processing
    def initialize(filename)
        @source = File.read(filename)
        @dom = Nokogiri.parse(@source)
        @data = nil
    end

    ##
    # Traverse loaded XML data and construct Hash.
    # Result is stored replacing previous value of @data.
    # @return [Hash] Constructed hash object
    def process()
        @data = {}
        base = @dom.document.root

        traverse = Proc.new do |elem, dat|
            unless elem.name == 'text'
                if dat.is_a?(Array)
                    d = {}
                    dat << d
                    dat = dat.last
                end
                if elem.children.length == 1 and elem.children[0].name == 'text'
                    dat[elem.name] = elem.children[0].to_s
                elsif elem.children.length > 0
                    loc = nil
                    if !is_multi(elem.parent, elem.name)
                        dat[elem.name] = []
                        loc = dat[elem.name]
                    else
                        dat[elem.name] = {}
                        loc = dat[elem.name]
                    end
                    elem.children.each do |c|
                        traverse.call(c, loc)
                    end
                end
            end
        end


        traverse.call(base, @data)

        @data
    end


    ##
    # Writes JSON form of data to specified file. If
    # processingg  hasn't occured yet, process() is run
    # @param [String] filename Name of file to write to
    # @return [Number] Number of bytes written
    def to_file(filename)
        File.write(filename, json())
    end

    ##
    # Returns processed data as JSON string.
    # If no data available, runs process first.
    # @return [String] Processed data as JSON string
    def json()
        process if @data.nil?
        @data.to_json
    end

    ##
    # Returns Nokogiri document object created from source XML
    # @return [Nokogiri::XML::Document] XML Document parsed by Nokogiri
    def document()
        @dom
    end

    ##
    # Update/replace source XML to be JSONified without needing to construct
    # a new instance.
    #
    # @param [String] filename Filename of XML to load
    # @param [Symbol] action Action to take after loading
    #   Either REPROCESS (default) to immediately call process, or
    #   RESET to reset @data to nil so process can be called manually
    #   or automatically by a requiring method later on
    def update_source(filename, action = XmlJsonifier::REPROCESS)
        @source = File.read(filename)
        @dom = Nokogiri.parse(@source)
        if action == XmlJsonifier::REPROCESS
            process
        else
            @data = nil
        end
    end

    private

    ##
    # Used internally to determine if a node has siblings of the same name
    # @param [Object] node Element or node to check siblings of
    # @param [String] name Node name to check for
    # @return [Boolean] True if siblings exist, false otherwise
    def is_multi(node, name)
        names = node.children.map{|n| (n.name=='text')? nil : n.name}.compact.select{|z| z == name }
        return names.length > 1
    end

end

