module RedminePourPlus
  class Hook < Redmine::Hook::ViewListener
    # 追記フラグのチェックボックス
    render_on :view_issues_edit_notes_bottom, :partial => 'redmine_pour_plus/issues_edit_notes_bottom'

    def controller_issues_edit_before_save(context = {})
      params = context[:params] || {}
      # チェックが付いている場合のみ追加
      issue_description_pour_plus(context[:issue], context[:journal]) if '1' == params[:pour_plus]
    end

    # チケットの説明の末尾に注記を追加する
    def issue_description_pour_plus(issue, journal)
      # 注記が無い場合は飛ばす
      return if journal && journal.notes.blank?

      # 空行が入っていれば削る
      description = issue.description.chomp("")
      delimiter = Setting.plugin_redmine_pour_plus['delimiter'].presence || "\n\n"
      issue.description = description + delimiter + journal.notes
    end
  end
end
