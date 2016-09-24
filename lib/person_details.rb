

def selectall
	sql="SELECT person_name,qualification,email,contact_no,experiance,working_projects,live_projects,technical_skills FROM  person_details "
	return runQuery(sql)
end



def selectbyid(id)
	sql="SELECT person_name,qualification,email,contact_no,experiance,working_projects,live_projects,technical_skills FROM person_details WHERE id=#{id} "
	return runQuery(sql)
end


def insert(person_name,qualification,email,contact_no,experiance,working_projects,live_projects,technical_skills)
	sql="INSERT INTO person_details(person_name,qualification,email,contact_no,experiance,working_projects,live_projects,technical_skills) VALUES('#{person_name}','#{qualification}','#{email}','#{contact_no}','#{experiance}','#{working_projects}','#{live_projects}','#{technical_skills}') "
	return runQuery(sql)
end



def update(person_name,qualification,email,contact_no,experiance,working_projects,live_projects,technical_skills)
	sql="UPDATE person_details SET person_name=#{person_name},qualification=#{qualification},email=#{email},contact_no=#{contact_no},experiance=#{experiance},working_projects=#{working_projects},live_projects=#{live_projects},technical_skills=#{technical_skills} WHERE id=#{id} "
	return runQuery(sql)
end


def delete(id) 
	sql="DELETE FROM person_details WHERE id=#{id}"
	return runQuery(sql)
end



