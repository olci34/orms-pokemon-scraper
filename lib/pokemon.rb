class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize (name:, type:, db: @db, id: nil)
        self.name = name
        self.type = type
        self.id = id
        self.db = db
    end

    def self.save(name, type, db = @db)
        insert_new_pokemon = db.prepare("INSERT INTO pokemon (name, type) VALUES (?,?)")
        insert_new_pokemon.execute(name, type)
    end

    def self.find(id, db = @db)
        sql = <<-SQL
        SELECT * FROM pokemon WHERE id = ?
        SQL
        row = db.execute(sql, id)[0]
        self.new(id: row[0], name: row[1], type: row[2])
    end


end
