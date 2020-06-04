# frozen_string_literal: true

class CreateOgPreviewers < ActiveRecord::Migration[6.0]
  def change
    create_table :og_previewers do |t|
      t.string :input_url
      t.string :og_image_url
      t.string :job_id
      t.string :status, default: 'new'

      t.timestamps
    end
  end
end
