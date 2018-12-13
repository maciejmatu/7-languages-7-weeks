class CsvRow
  attr_accessor :headers, :contents

  def initialize(headers, contents)
    @headers = headers
    @contents = contents
  end

  def method_missing(name, *args)
    header = name.to_s
    index = headers.index(header)
    if index
      @contents[index]
    else
      nil
    end
  end
end


module ActsAsCsv
  def self.included(base) # executes code in the context where the module is included
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      @csv_contents.each do |content|
        yield CsvRow.new(@headers, content)
      end
    end
    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class SameAsFileName 
  include ActsAsCsv
  acts_as_csv
end

csv = SameAsFileName.new
puts csv.headers.inspect
puts csv.csv_contents.inspect

csv.each {|row| puts row.one}
