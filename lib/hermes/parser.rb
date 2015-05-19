class Parser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    file_lines.map { |line| InputLine.new(line) }
  end

  private

  def file_lines
    @file_lines ||= File.readlines(self.filename)
  end
end
