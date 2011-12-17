module CategoriesHelper
	def nested_categories(categories)
		categories.map do |category, sub_category|
			render(category) + content_tag(:div, nested_categories(sub_category), :class=>"nested_categories root-#{category.root_id} nested_depth-#{category.depth}")
		end.join.html_safe
	end
end
