

def selectall
	sql="SELECT id,local,national,international FROM communities"
	return runQuery(sql)
end



def selectbyid(id)
	sql="SELECT id,local,national,international FROM communities WHERE id=#{id}"
	return runQuery(sql)
end


def insert(local,national,international)
	sql="INSERT INTO communities(local,national,international) VALUES ('#{local}','#{national}','#{international}')"
	return runQuery(sql)
	
end



def update(id,local,national,international)
	sql="UPDATE communities SET local=#{local},national=#{national},international=#{international} WHERE id=#{id} "
	return runQuery(sql)
end


def delete(id) 
	sql="DELETE FROM communities WHERE id=#{id} "
	return runQuery(sql)
end


