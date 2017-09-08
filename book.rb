class Book
  attr_accessor :author, :word_count
  attr_reader :title

  def initialize(title, word_count)
    @title = title
    @word_count = word_count
  end

  def self.all
    Author.all.collect do |author|
      author.books
    end.flatten
  end

end
