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
distances = dist(movies[2:20], method="euclidean")
clusterMovies = hclust(distances, method="ward.D")

#plot dendogram
plot(clusterMovies)

#Looking at the dendogram and the need of the application
#we believe that around 10 clusters will appropriately define
#clustering so
clusterGroups = cutree(clusterMovies, k = 10)

#Now each entry in the data set is labelled to be belonging to one of these clusters
#We can name the clusters as well

tapply(movies$Action, clusterGroups, mean)

