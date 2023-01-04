ActiveAdmin.register SessionTag do
  permit_params :feedback_session_id, :tag_id

  index do
    selectable_column
    id_column
    column :feedback_session
    column :tag
    actions
  end

  filter :feedback_session
  filter :tag
  filter :created_at

  form do |f|
    f.inputs do
      f.input :feedback_session
      f.input :tag
    end
    f.actions
  end
end
