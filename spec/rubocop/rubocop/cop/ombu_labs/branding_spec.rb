RSpec.describe RuboCop::Cop::OmbuLabs::Branding, :config do
  subject(:cop) { described_class.new(config) }

  it 'registers an offense when using `Ombu Labs`' do
    expect_offense(<<~RUBY)
      "Ombu Labs"
      ^^^^^^^^^^^ Wrong branding, use "OmbuLabs"
    RUBY
  end

  it 'registers an offense when using `Ombu labs`' do
    expect_offense(<<~RUBY)
      "Ombu labs"
      ^^^^^^^^^^^ Wrong branding, use "OmbuLabs"
    RUBY
  end

  it 'registers an offense when using `Ombulabs`' do
    expect_offense(<<~RUBY)
      "Ombulabs"
      ^^^^^^^^^^ Wrong branding, use "OmbuLabs"
    RUBY
  end

  it 'registers an offense when using `OMBULABS`' do
    expect_offense(<<~RUBY)
      "OMBULABS"
      ^^^^^^^^^^ Wrong branding, use "OmbuLabs"
    RUBY
  end

  it 'does not register an offense when using `OmbuLabs`' do
    expect_no_offenses(<<~RUBY)
      "OmbuLabs"
    RUBY
  end

  it 'registers an offense when using `Ombu Labs`' do
    expect_offense(<<~RUBY)
      "Ombu Labs"
      ^^^^^^^^^^^ Wrong branding, use "OmbuLabs"
    RUBY
  end

  it 'registers an offense when using `Fast ruby`' do
    expect_offense(<<~RUBY)
      "Fast ruby"
      ^^^^^^^^^^^ Wrong branding, use "FastRuby.io"
    RUBY
  end

  it 'registers an offense when using `Fastruby`' do
    expect_offense(<<~RUBY)
      "Fastruby"
      ^^^^^^^^^^ Wrong branding, use "FastRuby.io"
    RUBY
  end

  it 'registers an offense when using `fastruby.io`' do
    expect_offense(<<~RUBY)
      "fastruby.io"
      ^^^^^^^^^^^^^ Wrong branding, use "FastRuby.io"
    RUBY
  end


  it 'does not register an offense when using `FastRuby.io`' do
    expect_no_offenses(<<~RUBY)
      "FastRuby.io"
    RUBY
  end
end
