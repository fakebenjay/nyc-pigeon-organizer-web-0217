require 'pry'

def nyc_pigeon_organizer(data)
  organized_hash = {}
  pigeons_array = []

  data.each do |category, attributes|
    if category == :color
      attributes.each do |stat, pigeons|
        pigeons.each do |name|
          pigeons_array << name
          pigeons_array.uniq!
        end
      end
    end
  end

  pigeons_array.each do |bird|
    organized_hash[bird] = {}
  end

  organized_hash.each do |bird, info|
    ## Going back into the original hash to add to the new one
    data.each do |category, attributes|
      organized_hash[bird][category] = []
      attributes.each do |stat, pigeons|
        if pigeons.include?(bird)
          aspect = stat.to_s
          #because a lot of the symbols in the original array need to be strings
          organized_hash[bird][category] << aspect
        end
      end
    end
  end

return organized_hash
end
