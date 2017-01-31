json.set! @post.id do
  json.extract! @post, :id, :author_id, :body
end
