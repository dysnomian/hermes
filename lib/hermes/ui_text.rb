module UIText
  extend self

  def file_format_error(filename)
    Hermes::Error.new(
      name:     "FileFormatError",
      summary:  "Your input file doesn't appear to be formatted correctly.",
      filename: filename,
      text:     File.read(filename)
    )
  end
end
