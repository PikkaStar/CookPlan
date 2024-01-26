module EventsHelper
  def display_cooking_number(event)
    I18n.t("activerecord.attributes.event.cooking_numbers.#{event.cooking_number}")
  end
end
