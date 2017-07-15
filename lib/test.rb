# Класс, отвечающий за вывод вопросов теста, окончание теста и подсчет баллов
class Test
  attr_reader :points

  def initialize(questions_path)
    # Проверяем наличие файла с вопросами
    unless File.exist?(questions_path)
      abort "Файл с вопросами #{questions_path} не найден."
    end

    # Если файл найден:
    file = File.new(questions_path, "r:UTF-8")
    @questions = file.readlines
    file.close
    @current_question = 0
    @points = 0
  end

  # Метод, определяющий окончание теста
  def finished?
    @current_question >= @questions.size
  end

  # Метод вывода следующего вопроса теста и подсчата баллов
  def next_question
    puts @questions[@current_question]

    user_input = nil

    until user_input == 1 || user_input == 2 || user_input == 3
      puts "Выберите один из вариантов: 1 – да, 2 – нет, 3 – иногда, и нажмите Enter"
      user_input = gets.to_i
    end

    @points += 2 if user_input == 1
    @points += 1 if user_input == 3

    @current_question += 1
  end
end


