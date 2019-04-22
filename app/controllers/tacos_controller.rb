class TacosController < ApplicationController
  def new
    shop = {
      name: 'Magic Tacos',
      address: '123 Taco Street, Tacoland, OR, 97701'
    }
    shell = {
      type: :corn,
      soft: false
    }
    @taco = Taco.new(shell: shell, shop: shop)
  end
end