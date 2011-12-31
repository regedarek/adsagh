module CategoriesHelper
	def nested_categories(categories)
		categories.map do |category, sub_category|
			render(category) + nested_categories(sub_category)
		end.join.html_safe
	end

	def nested_categories_tree(categories)
		categories.map do |category, sub_category|
			c  =("--"*3*category.depth)
			c << category.name + " "
			c << link_to('e', edit_category_path(category))
			c << link_to('d', category, :confirm => 'Are you sure?', :method => :delete) 
			c << link_to("a", new_category_path(:parent_id => category))
			c << "<br/>"
			c << nested_categories_tree(sub_category)
		end.join.html_safe
	end
end
