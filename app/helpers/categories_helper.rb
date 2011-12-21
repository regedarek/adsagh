module CategoriesHelper
	def nested_categories(categories)
		categories.map do |category, sub_category|
			render(category) + nested_categories(sub_category)
		end.join.html_safe
	end

	def nested_categories_tree(categories)
		categories.map do |category, sub_category|
			("--"*2*category.depth)+category.name + "<br/>"+ nested_categories_tree(sub_category)
		end.join.html_safe
	end
end
