class devise
  def initialze(*args)
    @arr = args*
    @arr.instance_variable_set(:"@#{@arr.first}",@arr.first)
  end
  def name
    instance_variable_get(:"@#{@rr.first}")
  end
end

julie = Devise.new("user","julie")
julie.name
