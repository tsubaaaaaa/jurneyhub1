class HokkaidosController < ApplicationController


  def index
     @hokkaidos = Hokkaido.all
     @hashtag_list = Hashtag.all

     #検索ここから
     if params[:keywords].blank?
      @hokkaidos= Hokkaido.all
     else
      #部分検索
      search_terms = params[:keywords].split(/[[:space:]]+/) # 検索ワードをスペースで分割して配列に格納する

      # 各検索ワードに対して OR 条件を追加する
      conditions = search_terms.map { "(address LIKE ? OR name LIKE ? OR body LIKE ?)" }.join(" OR ")

      # 各検索ワードに対して複数のプレースホルダーを使用する
      placeholders = search_terms.map { |term| ["%#{term}%", "%#{term}%", "%#{term}%"] }.flatten

      # 条件とプレースホルダーを組み合わせてクエリを作成する
      @hokkaidos = Hokkaido.where(conditions, *placeholders)
      end
    #ここまで

    @hokkaidos = @hokkaidos.page(params[:page]).per(24)
  end

  def mapindex
    @hokkaidos = Hokkaido.all

    #検索ここから
    if params[:keywords].blank?
      @hokkaidos= Hokkaido.all
     else
      #部分検索
      search_terms = params[:keywords].split(/[[:space:]]+/) # 検索ワードをスペースで分割して配列に格納する

      # 各検索ワードに対して OR 条件を追加する
      conditions = search_terms.map { "(address LIKE ? OR name LIKE ? OR body LIKE ?)" }.join(" OR ")

      # 各検索ワードに対して複数のプレースホルダーを使用する
      placeholders = search_terms.map { |term| ["%#{term}%", "%#{term}%", "%#{term}%"] }.flatten

      # 条件とプレースホルダーを組み合わせてクエリを作成する
      @hokkaidos = Hokkaido.where(conditions, *placeholders)
      end
    #ここまで

  end

  def top
    @hokkaidos= Hokkaido.all
    @hashtag_list = Hashtag.all

#      @hokkadidos = []
#      params[:tag1_id].each do |key, value|
#        @hokkaidos += Tag1.find_by(tag1_name: key).hokkaido if value == "1"
#      end
#      @hokkaidos.uniq!
#    end



  end

  def new
    @hokkaido = Hokkaido.new
    @hokkaido = current_user.hokkaidos.new
    render 'new'
  end



  def edit
    @hokkaido = Hokkaido.find(params[:id])
    #@tag1_list = @hokkaido.tag1s.pluck(:tag1_name).join(nil)
  end


  def create
    @hokkaido = current_user.hokkaidos.new(hokkaido_params)

    if @hokkaido.save
      redirect_to hokkaidos_path
    else
      redirect_to new_hokkaido_path
    end
  end

  def show
    @hokkaido = Hokkaido.find(params[:id])
    @hokkaidos = Hokkaido.all

    #@address = @hokkaido.update_address_in_database(params[:id])
    #コメント
    @comments = @hokkaido.comments
    @comment = Comment.new
  end

  def update
    hokkaido = Hokkaido.find(params[:id])

    if hokkaido.update(hokkaido_params)
      hokkaido.save
      redirect_to :action => "show", :id => hokkaido.id
    else
      redirect_to :action => "new"
    end
    #tag1_list = params[:hokkaido][:tag1_name].split(nil)
    #if hokkaido.update(hokkaido_params)
     # old_relations = TagMap.where(hokkaido_id: hokkaido.id)
      #old_relations.each do |relation|
       # relation.delete
      #end
      #hokkaido.save_tag1(tag1_list)
      #redirect_to hokkaido_path(hokkaido.id), notice:'投稿完了しました:)'
    #else
    #  redirect_to :action => "edit"
    #end
  end

  # 追加ここから
  def destroy
    hokkaido = Hokkaido.find(params[:id])
    hokkaido.destroy
    redirect_to action: :index
  end

  def search
    #@tag1_list = Tag1.all               # こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    #@tag1 = Tag1.find(params[:tag1_id])  # クリックしたタグを取得
    #@hokkaidos = @tag1.hokkaidos.all           # クリックしたタグに紐付けられた投稿を全て表示
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @hokkaidos = @tag.hokkaidos
    @hokkaidos = @hokkaidos.page(params[:page]).per(24)
  end

  #or検索
  #if params[:tag_ids]
  #  @hokkaidos = []
  #  params[:tag_ids].each do |key, value|
  #    @hokkaidos += Tag.find_by(name: key).hokkaidos if value == "1"
  #  end
  #  @hokkaidos.uniq!
  #end
  #and
  #if params[:tag_ids]
  #  @hokkaidos = []
  #  params[:tag_ids].each do |key, value|
  #    if value == "1"
  #      tag_hokkaidos = Tag.find_by(name: key).hokkaidos
  #      @hokkaidos = @hokkaidos.empty? ? tag_hokkaidos : @hokkaidos & tag_hokkaidos
  #    end
  #  end
  #end

  #if params[:tag]
  #  Tag.create(name: params[:tag])
  #end

  def hokkaido_params
    params.require(:hokkaido).permit(:id, :title, :name, :address, :body, :longitude, :latitude, :hokkaido_id, :image,tag1_ids:[])
  end

 private

  def article_params
    params.require(:article).permit(:name, tag_ids: [])
  end


end
