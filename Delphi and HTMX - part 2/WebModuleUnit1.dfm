object WebModule1: TWebModule1
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      MethodType = mtGet
      Name = 'HelloWorld'
      PathInfo = '/helloworld'
      OnAction = WebModule1HelloWorldAction
    end
    item
      MethodType = mtGet
      Name = 'Edit'
      PathInfo = '/edit'
      OnAction = WebModule1EditAction
    end
    item
      MethodType = mtPost
      Name = 'Submit'
      PathInfo = '/submit'
      OnAction = WebModule1SubmitAction
    end>
  Height = 230
  Width = 415
end
