
require 'rails'
require 'mega_lotto/helper'

module MegaLotto
  class Railtie < Rails::Railtie
    initializer "mega_lotto.action_view" do
      ActiveSupport.on_load(:action_view) do
        include MegaLotto::Helper
      end
    end
    initializer "mega_lotto.action_controller" do
      ActiveSupport.on_load(:action_controller) do
        include MegaLotto::Helper
      end
    end

    rake_tasks do
      load "mega_lotto/tasks/mega_lotto.rake"
    end
  end
end
