# Copyright 2012, Mohd Nadeem Akhtar
# Licensed under the MIT license
# See http://www.opensource.org/licenses/mit-license.php

class WelcomeController < ApplicationController
  def index
    redirect_to '/login'
  end
end
