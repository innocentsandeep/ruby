def staranimation
	fill "#FFDAB9"
		@object= star(points: 4)	
	animate{
		@object.top += (0..80).rand
		@object.left += (50..100).rand
		@object.down  += (10..50).rand
	}

end

def boxanimation
	 @moving_box = star 15, 15, 15, 15  
  	@colors = ["#FFDAB9",rgb(255,20,147),lightblue,purple,white]
  	animate(2) do  
    x = (0..width-20).rand  
    y = (0..height-20).rand  
    @moving_box.move x, y  
    @moving_box.fill = @colors[rand(@colors.length)]
	end
end