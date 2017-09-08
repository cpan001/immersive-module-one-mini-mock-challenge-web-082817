class Author
  attr_accessor :books
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @books = []
    @@all << self
  end

  def write_book(title, word_count)
    book = Book.new(title, word_count)
    self.books << book
    book.author = self
    book
  end

  def total_words
    self.books.inject(0) {|memo, book| memo + book.word_count}
  end

  def self.all
    @@all
  end


  def self.most_words
    # following method returns single instance of author with most toal words but not account for if 2 authors had same most words
    # self.all.max_by do |author|
    #   author.total_words
    # end

    # following methods returns array of author instance of author(s) that wrote most words
    self.all.group_by {|author| author.total_words}.max[1]
  end

end
