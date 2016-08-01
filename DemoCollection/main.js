
require('UIView, UIColor, UIButton, UIWebView, NSURL, NSURLRequest, UIScreen')

defineClass('JSPatchVC',
            {
            viewDidLoad: function() {
            
            console.log('viewDidLoad')
            self.ORIGviewDidLoad();
            
            self.tipsLabel().setText("使用了线下的js文件");
            

            var onlineButton = UIButton.buttonWithType(0);
            onlineButton.setFrame({x: 0, y: 200, width: 100, height: 50});
            onlineButton.addTarget_action_forControlEvents(self, 'toWebView', 1<<6);
            onlineButton.setTitle_forState("GO", 0);
            onlineButton.setTitleColor_forState(UIColor.whiteColor(), 0);
            onlineButton.setBackgroundColor(UIColor.orangeColor());
            self.view().addSubview(onlineButton);
            
            },
            
            viewWillAppear: function(animated) {

            self.ORIGviewWillAppear(animated);
            self.setTitle("线下");
            console.log('viewWillAppear')

            },
            
            toWebView: function() {
            
            console.log('went')
            
            }
            
            
            }
            )