module EventsHelper
  # 送られてきたデータを日本語で表示するためにja.ymlファイルで参照する
  def display_cooking_number(event)
    I18n.t("activerecord.attributes.event.cooking_numbers.#{event.cooking_number}")
  end
end
