# encoding: utf-8
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/test"
require_relative "lib/result_print"

# Возможность ввести свое имя в стоке параметров запуска программы
name = ARGV[0]
# Если ничего не ввели, то:socia
if name == nil
  name = "Таинственная Персона"
elsif name == "-v"
  puts version
  exit
end

puts "Тест \"Ваш уровень общительности\""

# Путь к файлам с вопросами и ответами теста
current_path = File.dirname(__FILE__)
questions_path = current_path + "/data/questions.txt"
results_path = current_path + "/data/results.txt"

test = Test.new(questions_path)
result_print = ResultPrint.new(results_path)

until test.finished?
  puts test.next_question
end

result_print.print_result(test)

