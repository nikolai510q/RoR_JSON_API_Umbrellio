class AuthorIps
  def call
    # Айпишники с которых постило несколько разных авторов
    Post.joins(:user)
      .select('text(posts.author_ip) AS ip, array_agg(DISTINCT users.login) AS logins')
      .having('Count(DISTINCT users.login) > 1')
      .group('posts.author_ip')
      .as_json(except: [:id])
  end
end
