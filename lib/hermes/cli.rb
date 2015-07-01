module CLI
  extend self

  def run(args)
    puts version

    if args.empty?
      puts banner
    else
      Hermes.run(args.first)
    end
  end

  private

  def version
    "Hermes version #{Hermes::VERSION}\n\n"
  end

  def banner
    "Usage: hermes FILENAME\n"
  end
end
