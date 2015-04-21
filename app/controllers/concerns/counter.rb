# Счетчик посещений сайта

module Counter
  def increment
    initialize_counter
    session[:counter] += 1
  end

  def reset
    initialize_counter
    session[:counter] = 0
  end

  def get_counter_value
    initialize_counter
    session[:counter]
  end

  def destroy
    session[:counter] = nil
  end

  private

  def initialize_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
  end
end