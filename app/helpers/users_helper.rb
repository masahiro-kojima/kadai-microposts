# View は表示の役割を担っているので、複雑なプログラムを含めてしまうとすぐにでも読みづらくなり、表示の崩れなどの原因にもなります。
# gravatar_url メソッドを Helper に実装
# メールアドレスに対して自分のアバター画像を登録するサービス
# Gravatar に登録していないメールアドレスの場合には、デフォルトのアバター画像が表示される

module UsersHelper
    def gravatar_url(user, options = { size: 80 })
        # gravatar_id は、user.email を downcase （全て小文字に変換）したものを更に暗号化（ダイジェスト）した文字列
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        # 画像サイズはデフォルトで 80
        size = options[:size]
        # 最後の URL を返す
        "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    end
end
