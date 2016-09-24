

def selectall
	sql="SELECT id,find_address,find_nearestplace FROM web_navigation"
	return runQuery(sql)
end



def selectbyid(id)
	sql="SELECT id,find_address,find_nearestplace FROM web_navigation WHERE id=#{id}"
	return runQuery(sql)
end


def insert(find_address,find_nearestplace)
	sql="INSERT INTO web_navigation(find_address,find_nearestplace) VALUES ('#{find_address}','#{find_nearestplace}')"
	return runQuery(sql)
	
end



def update(id,find_address,find_nearestplace)
	sql="UPDATE web_navigation SET find_address=#{find_address},find_nearestplace=#{find_nearestplace} WHERE id=#{id} "
	return runQuery(sql)
end


def delete(id) 
	sql="DELETE FROM web_navigation WHERE id=#{id} "
	return runQuery(sql)
end


