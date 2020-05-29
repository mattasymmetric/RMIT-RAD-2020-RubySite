module StaticPagesHelper
end
module StaticPagesHelper

  def home_button_class(display, button_value)
    if display == button_value
      "active-button"
    else
      ""
    end
  end

end