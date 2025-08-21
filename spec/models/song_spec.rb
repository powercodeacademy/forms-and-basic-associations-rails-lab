require 'rails_helper'

RSpec.describe Song, type: :model do
  describe 'associations' do
    it 'belongs to an artist' do
      song = Song.new
      expect(song).to respond_to(:artist)
    end

    it 'belongs to a genre' do
      song = Song.new
      expect(song).to respond_to(:genre)
    end

    it 'is valid without an artist' do
      song = Song.new(title: 'Song 1', genre: Genre.new(name: 'Genre 1'))
      expect(song).to be_valid
    end

    it 'is valid without a genre' do
      song = Song.new(title: 'Song 1', artist: Artist.new(name: 'Artist 1'))
      expect(song).to be_valid
    end
  end

  describe 'artist_name' do
    it 'returns the artist name' do
      song = Song.new
      song.build_artist(name: 'Rock Hudson')
      expect(song.artist_name).to eq 'Rock Hudson'
    end
  end

  describe 'artist_name=' do
    it 'sets the artist to the artist of the specified name' do
      song = Song.new
      song.artist_name = 'Rock Hudson'
      expect(song.artist.name).to eq 'Rock Hudson'
    end
  end

  describe 'note_contents' do
    it 'returns an array with the contents for all the song notes' do
      song = Song.new
      song.notes << Note.new(content: 'Content 1')
      song.notes << Note.new(content: 'Content 2')
      expect(song.note_contents).to eq ['Content 1', 'Content 2']
    end
  end

  describe 'note_contents=' do
    it 'takes an array of note content strings and assigns new notes with that content to the song' do
      song = Song.new
      song.note_contents = ['Content 1', 'Content 2']
      expect(song.notes).to include(
        have_attributes(class: Note, content: 'Content 1'),
        have_attributes(class: Note, content: 'Content 2')
      )
    end
  end
end
