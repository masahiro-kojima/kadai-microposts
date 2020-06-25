class User < ApplicationRecord
    # User インスタンス（レコード）を保存するその前に、self.email.downcase! を実行する
    before_save { self.email.downcase! }
    # name は、カラを許さず、長さは 50 文字以内
    validates :name, presence: true, length: { maximum: 50 }
    # カラ文字を許さず、長さが 255 文字以内
    validates :email, presence: true, length: { maximum: 255 },
    # 入力されるメールアドレスが正しい形式になっているかを判断する
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                        # 重複を許さずに大小を区別しない
                    uniqueness: { case_sensitive: false }
    # パスワードを暗号化する
    has_secure_password
end
