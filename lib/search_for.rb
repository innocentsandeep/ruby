
def selectall
	sql="SELECT id,member_name,community_name,registeredproject_name FROM search_for  "
	return runQuery(sql)
end



def selectbyid(id)
	sql="SELECT id,member_name,community_name,registeredproject_name FROM search_for WHERE id=#{id} "
	return runQuery(sql)
end


def insert(id,member_name,community_name,registeredproject_name)
	sql="INSERT INTO search_for(id,member_name,community_name,registeredproject_name) VALUES('#{member_name}','#{community_name}','#{registeredproject_name}') "
	return runQuery(sql)
end



def update(id,member_name,community_name,registeredproject_name)
	sql="UPDATE search_for SET member_name=#{member_name},community_name=#{community_name},registeredproject_name=#{registeredproject_name} WHERE id=#{id} "
	return runQuery(sql)
end


def delete(id) 
	sql="DELETE FROM search_for WHERE id=#{id}"
	return runQuery(sql)
end




