class Hermes::Error
  attr_reader :name, :summary, :filename, :line, :text

  def initialize(params = {})
    @name     = params.fetch(:name, "General Error")
    @summary  = params.fetch(:summary, "Exiting.")
    @filename = params.fetch(:filename, nil)
    @line     = params.fetch(:line, nil).to_s
    @text     = params.fetch(:text, nil)
  end

  def to_s
    "#{title}\n\n#{body}"
  end

  def location
    if filename && line != ""
      "#{filename}:#{line}"
    elsif filename
      "#{filename}"
    elsif text
      "User input was"
    else
      ""
    end
  end

  def title
    "#{name}: #{summary}"
  end

  def body
    if location && text
      "#{location}:\n#{text}"
    elsif text
      text
    else
      ""
    end
  end
end

class FileFormatError < StandardError; end
