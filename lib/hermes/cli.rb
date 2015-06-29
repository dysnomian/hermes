require "thor"
require "hermes"

module Hermes
  class CLI < Thor
    desc "balances PATH_TO_FILE", "Example: hermes parse filename.txt"

    default_task :balances

    def balances(path)
      Hermes.run(path)
    end
  end
end
