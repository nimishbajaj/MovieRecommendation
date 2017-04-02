#Preparing data
movies = read.table("movieRatings.txt", header = FALSE, sep = '|', quote = "\"")
colnames(movies) = c("ID","Title","ReleaseDate","VideoReleaseDate", "IMDB", "Unknown",
                     "Action", "Adventure", "Animation", "Childrens", "Comedy", "Crime",
                     "Documentary", "Drama", "Fantasy", "FilmNoir", "Horror", "Musical",
                     "Mystery", "Romance", "SciFi", "Thriller", "War", "Western" )
movies$ID = NULL
movies$ReleaseDate = NULL
movies$VideoReleaseDate = NULL
movies$IMDB = NULL
movies = unique(movies)

#Clustering Data