fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_octopus(array)
  biggest = nil
  fish_num = array.length
  (0...fish_num).each do |i|
    j = i + 1
    (j...fish_num).each do |j|
      if array[i].length > array[j].length && (biggest == nil || array[i].length > biggest.length)
        biggest = array[i]
      elsif array[j].length > array[i].length && (biggest == nil || array[j].length > biggest.length)
        biggest = array[j]
      end
    end
  end
  biggest
end

def dominant_octopus(array)
  dominant_octopus_rec(array).last
end

def dominant_octopus_rec(array)
  prc = Proc.new { |x, y| x.length <=> y.length }
  return array if array.length <= 1

  middle = array.length / 2
  left_side = dominant_octopus_rec(array.take(middle))
  right_side = dominant_octopus_rec(array.drop(middle))
  merge(left_side, right_side, &prc)

end

def merge(left, right, &prc)
  result = []
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      result << left.shift
    when 0
      result << left.shift
    when 1
      result << right.shift
    end
  end
  result + left + right
end

def clever_octopus(array)
  biggest = nil
  array.each do |fish|
    biggest = fish if biggest == nil || fish.length > biggest.length
  end
  biggest
end
