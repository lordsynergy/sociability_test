# Класс вывода результатов прохождения теста
class ResultPrint
  def initialize(results_path)
    # Проверяем наличие файла с результатами
    unless File.exist?(results_path)
      abort "Файл с результатами #{results_path} не найден."
    end

    file = File.new(results_path, "r:UTF-8")
    @results = file.readlines
    file.close
  end

  # Метод вывода результата теста
  def print_result(test)
    puts "\n\nРезультат теста (всего баллов - #{test.points})"

    case
      when test.points >= 30
        puts @results[0]
      when test.points >= 25
        puts @results[1]
      when test.points >= 19
        puts @results[2]
      when test.points >= 14
        puts @results[3]
      when test.points >= 9
        puts @results[4]
      when test.points >= 4
        puts @results[5]
      else
        puts @results[6]
    end
  end
end
