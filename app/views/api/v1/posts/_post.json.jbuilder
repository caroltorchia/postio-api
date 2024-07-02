json.extract! post, :id, :title, :content, :created_at, :updated_at
json.user post.user, partial: 'api/v1/users/user', as: :user
json.comments post.comments, partial: "api/v1/comments/comment", as: :comment
json.url api_v1_post_url(post, format: :json)
