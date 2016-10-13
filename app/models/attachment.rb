class Attachment < ApplicationRecord
  has_attached_file :image, styles: { medium: "200x200>" }
  validates_attachment :image, presence: true,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                       size: { in: 0..2.megabytes }

  default_scope { order('created_at DESC') }
end
