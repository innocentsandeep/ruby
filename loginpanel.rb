$path=File.join(File.dirname(__FILE__),"lib","")
require $path+"community_details.rb" 
require "animations.rb"
require "userwindow.rb"

Shoes.setup do 
gem "mysql2"
end



	require "mysql2"



	def connect
		@@con=Mysql2::Client.new(:host=>"localhost",:database=>"communitybase",:username=>"root",:password=>"")
		@@con.query_options.merge!(:symbolize_keys=>true)
		return true if @@con
	end




	Shoes.app(title:"WELCOME TO THE FUSION HUB",height:800,width:1300,resizable:false) do 
		
		image"images/welcome3.jpg",height:800,width:1300,top:00
		timer(1) do 
		image "images/logo.png",height:60,width:200,top:00,left:800
		end
		# background "#4169e1".."#191970"
		# ball_animation
		# boxanimation
		# staranimation

		# flow {title("FUSION HUB",align:"center",font:"Algerian",stroke:"#FFDAB9",underline:"double")}
		image("images/title.png",left:400,top:0,height:80,width:400)
		

		stack(top:700,left:0) do 

			flow do 
				image("images/login.png",height:35,width:90) do 
				start_login
				self.close
				end
				para("|",stroke:white,size:16,left:85)

				image("images/signup.png",height:35,width:110) do
				start_signup 
				self.close
				end
				image("images/aboutus.png",height:35,width:110,right:130) do 
					window(title:"AboutUs",height:800,width:800) do 
						background black
						image("images/aboutus.png")


					end
				end
				para("|",stroke:white,size:15.5,left:1171)
				image("images/contactus.png",height:35,width:120,right:0) do 
					window(title:"ContactUs",height:800,width:800) do 
						background black
						image("images/contactus.png")


					end
				end

			end


		end

	end

	

def start_login
	begin
		window(title:"COMMUNITY LOGIN",height:800,width:1300,resizable:false) do 
			image "images/w1.jpg",height:800,width:1300,top:00
			timer(1) do 
			image "images/logo.png",height:60,width:200,top:00,left:800
			end
			# background "#4169e1".."#191970"
			# title("LOGIN HERE",align:"center",font:"Algerian",stroke:"#00ffff",underline:"double",stroke:black)
			image("images/loginpanel.png",left:400,top:0,height:80,width:400)

#------------------------------------------options------------------------------------------------
			stack(top:300,left:10)do
				flow(top:10,left:100){
				image("images/username.png",height:30,width:120)
				# para("username",font:"Algerian",stroke:white,size:15)
				para " "
				@username=edit_line}
				flow(top:50,left:100){
				image("images/loginpass.png",height:30,width:120)
				para " "
				@password=edit_line :secret=>true}
				flow(top:90,left:20){image("images/loginconfirm.png",height:30,width:210)
				@confirm_password=edit_line :secret=>true}
#--------------------------------------buttons----------------------------------------------------------
				flow(left:0,top:150) do 
					image("images/login.png",height:35,width:90,left:220) do
						if connect
							
							if @username.text=="" or @password.text=="" or @confirm_password.text==""
								alert "Check all the fields ...it must be filled"
							elsif @password.text.downcase==@confirm_password.text.downcase
								sql="select id,username from community_details where username= '#{@username.text.downcase}' and password='#{@password.text.downcase}'"
								result=@@con.query(sql)
								# @@store=result[:username]

								res=result.count
								if res > 0
									alert "Welcome To Your Fusion Hub"
									result.each do |user|
									user_hub(user[:username])
									@@conn=nil
									self.close

								end

									

								else
									alert "Access Denied.. check your username or password"
								end
							else
								alert "Password does not match...check again"

							end
							
						else
							alert "Failed to Connect to the database"
						end
					end
				end
			end	
		
		end


		
	rescue Mysql::Error => e
		puts e.errno
		puts e.error
	# ensure 
	# 	@@con=nil


	end
	
end

def start_signup
	window(title:"COMMUNITY SIGNUP",height:800,width:1300,resizable:false)do 
		image "images/w1.jpg",height:800,width:1300,top:00
		timer(1) do 
		image "images/logo.png",height:60,width:200,top:00,left:800
		end

		# background "#4169e1".."#191970"
			title("SIGNUP HERE",align:"center",font:"Algerian",stroke:"#00ffff",underline:"double",stroke:black)

#------------------------------------------options------------------------------------------------
		stack(top:200,left:0)do
			flow(top:10,left:100){
			para("username",font:"Algerian",stroke:white,size:15)
			para " "
			@username_s=edit_line}

			para " "

			flow(top:50,left:100){
			para("password",font:"Algerian",stroke:white,size:15)
			para " "
			@password_s=edit_line :secret=>true}
			
			para " "
			
			flow(left:15,top:90){para("confirm password",font:"Algerian",stroke:white,size:15)
			para " "
			@confirm_password_s=edit_line :secret=>true}

			flow(left:145,top:130){para("email",font:"Algerian",stroke:white,size:15)
			para " "	
			@email=edit_line}

			flow(left:25,top:170){para("HuB(Group) Name",font:"Algerian",stroke:white,size:15)
			para " "	
			@name_community=edit_line }

			flow(left:118,top:205){
			para("Login As",font:"Algerian",stroke:white,size:15)
			
			para(":",font:"Algerian",stroke:white,size:15)
			para " "
			
			@is_admin=check;
			para("is_admin",font:"Algerian",stroke:white,size:15)
			@is_admin.checked=false
			
			para "  "
			
			@is_member=check
			para("is_member",font:"Algerian",stroke:white,size:15)
			@is_member.checked=false}
	#--------------------------------------buttons----------------------------------------------------------

			flow(left:10,top:250) do 
				button("Sign Up",left:200,align:"center") do
					signup_validation

				end
			end
		end	



	end


end

def signup_validation
	if connect
		if @username_s.text=="" or @password_s.text=="" or @confirm_password_s.text=="" or @email.text=="" or @name_community.text=="" 
			alert "Check all the fields ...it must be filled"
		elsif @username_s.text.length > 5 and @password_s.text.length >5 and @email.text.length > 5
				if	@password_s.text==@confirm_password_s.text
					@email_val=@email.text
					@array=@email_val.split("")
					if @array.include? ("@")
						if @array.include? (".")
							@is_admin=@is_admin.checked ? 1:0
							@is_member=@is_member.checked ? 1:0

							insert_details

						else
							alert "Email does not contain .com or .in "
						end
					else
						alert "Invalid Email address please Enter valid email address contains @ "
					end
				else
				
					alert "Password does not match .. "

				end	
		else
			alert "Username ,Password and Email must be greater than 5 characters"

		end
	else
		alert "Failed to Connect to the database"
	end
					
	
end


def insert_details
	
	res=insert(@username_s.text,@password_s.text,@email.text,@name_community.text,@is_admin,@is_member)
	alert "Thank You For Joining To The @FUSION-HUB-COMMUNITY"
	@username_s.text=""
	@password_s.text=""
	@email.text=""
	@name_community=""
	@@connect=nil
	start_login

	self.close

end


def ball_animation

	fill "#FFDAB9"
  @gravity = 0.05
  @velocity =10.0
  @ball_radius = 60
  @ball = oval(top: 10, 
              left: width / 4 - @ball_radius, 
              radius: @ball_radius)
    animate(60) do
      @velocity += @gravity
      @ball.top += @velocity 
      if @ball.top > height - @ball_radius * 2
        @ball.top = height - @ball_radius * 2
        @velocity = @velocity * -0.8
      end
    end
		
end


