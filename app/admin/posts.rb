ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :body, :user_id, :tag_list, :skill_list, :interest_list, :project_id, :image
  index do
    selectable_column
    id_column
    column :title
    column :body do |post|
      post.body.truncate(20,omission: '...')
    end
    column :user_id
    column :tag_list
    column :skill_list
    column :interest_list
    column :project_id
    actions
  end

  show do
    attributes_table do
      row :title
      row :body
      row :user_id
      row :tag_list do |post|
        User.where(id: post.tag_list)
      end
      row :skill_list
      row :project_id
      row :images do |post|
        image_tag(post.image.url)
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :user_id, as: :select, collection: User.all.map{|u| u.id}
      f.input :tag_list #if f.object.new_record?
      f.input :project_id ,as: :select, collection: Project.all.map{|p| p.id}
    #f.input :emails, as: :select, collection: User.all.map{|u| u.id}
      f.input :image
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content, :user_id, :tag_list, :skill_list, :interest_list]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
