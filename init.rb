require 'redmine_pour_plus'

Redmine::Plugin.register :redmine_pour_plus do
  name 'Redmine Pour Plus plugin'
  author 'OZAWA Yasuhiro'
  description 'Add to the end of the description comments.'
  version '0.0.1'
  url 'https://github.com/ameya86/redmine_pour_plus'
  author_url 'https://github.com/ameya86'

  settings :default => {
    'delimiter' => "\n\n", # 説明に追記する前に挟む空白文字
  }
end
