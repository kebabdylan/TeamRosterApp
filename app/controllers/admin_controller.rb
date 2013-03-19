class AdminController < ApplicationController
 before_filter :restrict_to_admin

end