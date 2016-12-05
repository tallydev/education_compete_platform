if Rails.env.production?
  Paperclip::Attachment.default_options.merge!({
    url: "/contest/system/:class/:attachment/:id_partition/:style/:filename"
  })
end