module LocaleHelper
  def current_locale
    R18n.get.locale.code
  end
end
