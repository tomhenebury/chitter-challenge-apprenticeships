require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to the database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'exectues a query via PostgreSQL' do
      connection = DatabaseConnection.setup('chitter_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;", [])

      DatabaseConnection.query("SELECT * FROM peeps;")
    end
  end
end
