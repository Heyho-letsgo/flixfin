module MoviesHelper
 def format_total_gross(movie)
   if movie.flop?
    content_tag(:strong, 'Flop!')
   elsif movie.classic_movie?
     content_tag(:strong, 'Classic!')
   else
     content_tag(:strong, number_to_currency(movie.total_gross))
   end
 end
 # Avant paperclip
 # def image_for(movie)
 #   if movie.image_file_name.blank?
 #     image_tag('placeholder.png')
 #   else
 #     image_tag(movie.image_file_name)
 #   end
 # end
 def image_for(movie)
   if movie.image.exists?
     image_tag(movie.image.url(:small))
   else
     image_tag('placeholder.png')
   end
 end

 def format_average_stars(movie)
   if movie.average_stars.nil?
     content_tag(:strong, 'No reviews')
   else
     #pluralize(movie.average_stars, 'star')
     #'*'* movie.average_stars.round
    movie.average_stars.to_i
       end
 end

 def format_maximum_stars(movie)
   if movie.maximum_stars.nil?
     content_tag(:strong, 'No reviews')
   else
    pluralize(number_with_precision(movie.average_stars, precision:1) , 'star')
   end
 end




end
