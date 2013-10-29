collection @projects

attributes :id, :name
child :tasks do
  attributes :name, :deadline, :finish
end
