ActiveAdmin.register Tag do
  permit_params :name, feedback_session_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :feedback_sessions
    column :session_tags
    actions
  end

  filter :name
  filter :feedback_sessions
  filter :session_tags
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :feedback_sessions
    end
    f.actions
  end
end
