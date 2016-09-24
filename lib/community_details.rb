

def insert(username,password,email,name_community,is_admin,is_member)
	sql="insert into community_details(username,password,email,name_community,is_admin,is_member) values('#{username}','#{password}','#{email}','#{name_community}' ,#{is_admin},#{is_member})"
	return runQuery(sql)
end

def selectall
	sql="SELECT id,username,password,email,name_community,is_admin,is_member,is_updated,is_created,is_modified FROM community_details  "
	return runQuery(sql)

end



def selectbyid(id)
	sql="SELECT id,username,password,email,name_community,is_admin,is_member,is_updated,is_created,is_modified FROM community_details WHERE id=#{id} "
	return runQuery(sql)
end




def update(id,username,password,email,name_community,is_admin,is_member,is_updated,is_created,is_modified)
	sql="UPDATE community_details SET username='#{username}',password='#{password}', email='#{email}',name_community='#{name_community}'  ,is_admin=#{is_admin},is_member=#{is_member},is_updated=#{is_updated},is_created=#{is_created},is_modified=#{is_modified} WHERE id=#{id} "
	return runQuery(sql)
end


def delete(id) 
	sql="DELETE FROM community_details WHERE id=#{id}"
	return runQuery(sql)
end

def runQuery(sql)
	result=@@con.query(sql)
	return true if result
end