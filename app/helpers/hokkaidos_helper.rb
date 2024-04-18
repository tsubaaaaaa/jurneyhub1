module HokkaidosHelper
  def render_with_hashtags(body)
    body.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/hokkaido/hashtag/#{word.delete("#")}", class: 'hashtag'}.html_safe
  end
end
