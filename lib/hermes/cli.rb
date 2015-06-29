require "thor"
require "hermes"

module Hermes
  class CLI < Thor

    desc_text = "Example: hermes parse filename.txt"

    desc "parse PATH_TO_FILE", desc_text

    def parse(path)
      Hermes.run(path)
    end

    default_task :parse

  end
end
