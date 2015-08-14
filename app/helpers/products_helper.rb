module ProductsHelper
	def products_count
		puts "the params #{params[:from]}"
		if params[:from]
			return (Date.parse(params[:from])..Date.parse(params[:to])).map { |date|  [date.strftime('%d %b'), Product.where(created_at: (
  			date.beginning_of_day..date.end_of_day)).count]}
		else
			return (3.weeks.ago.to_date..Date.today).map { |date| [ date.strftime('%d %b'), Product.where(created_at: (date.beginning_of_day..date.end_of_day)).count]}
		end
	end

	def test
		[2,5,9,3]
	end
end
