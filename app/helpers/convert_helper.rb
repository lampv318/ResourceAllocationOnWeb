module ConvertHelper
  def convert_str(string)
    arr = string.split("\r\n")
    arr = arr.map { |arr| arr.split(" ") }
    return arr
  end

  def convert_to_arr(string)
    arr = convert_str(string)
    arr = arr.map { |str| str.map{ |a| a.to_i} }
    return arr
  end

  def convert_treq(string)
    g = {}
    arr = convert_str(string)
    arr = arr.map { |str| str.map{ |a| a.to_i} }
    i = 1
    while i < arr.count + 1
      g.update(i=>arr[i-1])
      i += 1
    end
    return g
  end

  def convert_lexp(string)
    g = {}
    arr = convert_str(string)
    arr = arr.map { |str| str.map{ |a| a.to_f} }
    i = 1
    while i < arr.count + 1
      g.update(i=>arr[i-1])
      i += 1
    end
    return g
  end
end
