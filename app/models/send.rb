class Send < ActiveHash::Base 
  self.data = [
    { id: 1, name: '翌日までに発送' }
    { id: 2, name: '２〜３日後までに発送' }
    { id: 3, name: '４〜７日後までに発送' }
  ]
end
