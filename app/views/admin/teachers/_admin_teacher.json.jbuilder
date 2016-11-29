json.extract! admin_teacher, :id, :name, :email, :postcode, :mobile, :id_card, :position,
       :sex, :remark, :phone, :address, :job_title, :qq, :created_at, :updated_at
json.school_name admin_teacher.school.try(:name)