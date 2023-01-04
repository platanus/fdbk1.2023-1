ActiveAdmin.register FeedbackSession do
  permit_params :receiver_id, :provider_id, :session_date, tag_ids: []

  includes :receiver, :provider, :tags

  index do
    selectable_column
    id_column
    column :receiver
    column :provider
    column :session_date
    column :tags
    actions
  end

  filter :receiver
  filter :provider
  filter :session_date
  filter :tags
  filter :created_at

  form do |f|
    f.inputs do
      f.input :receiver
      f.input :provider
      f.input :session_date
      f.input :tags
    end
    f.actions
  end
end
