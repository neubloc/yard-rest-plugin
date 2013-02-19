def init
  sections :header, [:title, :method_signature, T('docstring')]
end

def header
  erb(:header)
end

def title
  erb(:title)
end