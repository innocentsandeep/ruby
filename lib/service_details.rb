

def selectall
	sql="SELECT id,member_strength,member_workingprojects,post_ideas,buy_community,sell_community,member_chat,member_liveprojects,tie_ups FROM  service_details "
	return runQuery(sql)
end



def selectbyid(id)
	sql="SELECT id,member_strength,member_workingprojects,post_ideas,buy_community,sell_community,member_chat,member_liveprojects,tie_ups FROM service_details WHERE id=#{id} "
	return runQuery(sql)
end


def insert(member_strength,member_workingprojects,post_ideas,buy_community,sell_community,member_chat,member_liveprojects,tie_ups)
	sql="INSERT INTO service_details(member_strength,member_workingprojects,post_ideas,buy_community,sell_community,member_chat,member_liveprojects,tie_ups) VALUES('#{member_strength}','#{member_workingprojects}','#{post_ideas}','#{buy_community}','#{sell_community}','#{member_chat}','#{member_liveprojects}','#{tie_ups}') "
	return runQuery(sql)
end



def update(member_strength,member_workingprojects,post_ideas,buy_community,sell_community,member_chat,member_liveprojects,tie_ups)
	sql="UPDATE service_details SET member_strength=#{member_strength},member_workingprojects=#{member_workingprojects},post_ideas=#{post_ideas},buy_community=#{buy_community},sell_community=#{sell_community},member_chat=#{member_chat},member_liveprojects=#{member_liveprojects},tie_ups=#{tie_ups} WHERE id=#{id} "
	return runQuery(sql)
end


def delete(id) 
	sql="DELETE FROM service_details WHERE id=#{id}"
	return runQuery(sql)
end



