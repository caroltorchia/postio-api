json.extract! comment, :id, :content, :created_at, :updated_at
json.url api_v1_post_comment_url(comment.post, comment, format: :json)
