module DashboardHelper

  def instruction_quiz(instruction)
    instruction.quizzes.active.last
  end

end
