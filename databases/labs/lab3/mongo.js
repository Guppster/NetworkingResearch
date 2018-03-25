db.actors.insert( { actor: "Richard Gere",  born:1949, movies: ['Pretty Woman', 'Runaway Bride', 'Chicago'] });
db.actors.insert( { actor: "Julia Roberts", born:1967, movies: ['Pretty Woman', 'Runaway Bride', 'Osage County'] });
db.actors.insert( { actor: "Meryl Streep",  born:1948, movies: ['The Devil Wears Prada', 'Osage County', 'The Iron Lady', 'The Manchurian Candidate'] });

db.actors.find();
db.actors.find({born: {$gt: 1940}});
db.actors.find({born: 1949});
db.actors.find({born: {$eq: 1949}});
db.actors.find({born: {$in: [1949, 1948]}});

db.actors.update({actor: 'Richard Gere'}, {gender: 'male'});
db.actors.update( { gender: 'male'}, { actor: "Richard Gere",  born:1949, movies: ['Pretty Woman', 'Runaway Bride', 'Chicago'] });
db.actors.update( {_id: ObjectId("---put-record-id-here---")}, { actor: "Richard Gere",  born:1949, movies: ['Pretty Woman', 'Runaway Bride', 'Chicago'] });

db.actors.update({actor: 'Meryl Streep'}, {$inc: {born: 1}});
db.actors.update({actor: 'Richard Gere'}, {$set: {actor: 'Richard Gere III'}});

db.actors.update({actor: 'Meryl Streep'}, {$set: {gender: 'Female'}});
db.actors.update({actor: 'Meryl Streep'}, {$push: {movies: 'Out of Africe'}});

db.actors.find({}, {actor: 1});
db.actors.find().sort({born: 1, actor: -1});
db.actors.find().sort({born: 1, actor: 1});


map = function()
{
  for(var i in this.movies)
  {
    key = { movie: this.movies[i] };
    value = { actors: [ this.actor ] };
    emit(key, value);
  }
}
  
reduce = function(key, values) 
{
  actor_list = { actors: [] };
  
  for(var i in values) 
  {
    actor_list.actors = values[i].actors.concat(actor_list.actors);
  }
  
  return actor_list;
};

db.actors.mapReduce(map, reduce, "movies");
db.movies.find();
 

