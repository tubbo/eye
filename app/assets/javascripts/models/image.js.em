# for more details see: http://emberjs.com/guides/models/defining-models/

class Eye.Image extends DS.Model
  title: DS.attr 'string'
  source: DS.attr 'string'
  original: DS.attr 'string'
  thumbnail: DS.attr 'string'
  user: DS.belongsTo 'Eye.User'
