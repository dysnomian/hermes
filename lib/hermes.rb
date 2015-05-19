require 'require_all'

module Hermes
  require_all 'lib'

  extend self

  def run(filename)
      if transactions = TransactionProcessor.new(filename).run
        Register.new(transactions: transactions).print
      else
        puts "Error, exiting."
      end
  end


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
end
