

def selectall
	sql="SELECT id,is_paid,is_free FROM services "
	return runQuery(sql)
end



def selectbyid(id)
	sql="SELECT id,is_paid,is_free FROM services WHERE id=#{id} "
	return runQuery(sql)
end


def insert(is_paid,is_free)
	sql="INSERT INTO services(is_paid,is_free) VALUES('#{is_paid}','#{is_free}') "
	return runQuery(sql)
end



def update(id,is_paid,is_free)
	sql="UPDATE services SET is_paid=#{is_paid},is_free=#{is_free} WHERE id=#{id} "
	return runQuery(sql)
end


def delete(id) 
	sql="DELETE FROM services WHERE id=#{id}"
	return runQuery(sql)
end
	


