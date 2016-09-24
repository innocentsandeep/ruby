def user_hub(username)
		
	Shoes.app(title:"WELCOME TO THE FUSION HUB",height:800,width:1300,resizable:false,:scroll=>true) do 
		background "#FFDAB9"
		stack(top:0,left:0,height:50,width:1300) do 
			@title=title("FUSION HUB",underline:"double",left:500,size:20,font:"Algerian")
			timer(5) do 
				button("Change Hub Color",left:0,top:0) do
					color=ask_color "#fff"
					background color
					@title.replace title("FUSION HUB",underline:"double",left:500,size:20,font:"Algerian")
				end	
			end
		end



		stack(top:50,left:0,height:500,width:650) do 
			# background lightblue
			button("Update Picture",left:0,top:200) do  


			end
			para("#{username.upcase}",left:150,top:5,font:"Algerian",size:20)
			stack(top:10,left:0,height:180,width:150) do 
				background red




			end
		end
	end
end


	

		


	


