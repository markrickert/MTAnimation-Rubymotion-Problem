class MainController < UIViewController

  attr_accessor :box

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    self.title = "Test"

    @box = UIView.new
    @box.backgroundColor = UIColor.redColor
    @box.frame = CGRectMake(20, 200, 20, 20)

    view.addSubview(@box)
  end

  def viewDidAppear(animated)
    # Doesn't Work
    # main_controller.rb:21:in `viewDidAppear:': uninitialized constant MainController::KMTEaseOutBack (NameError)
    UIView.mt_animateViews(
      Array(@box),
      duration:1.0,
      timingFunction:KMTEaseOutBack,
      animations: lambda {
        @box.transform = CGAffineTransformMakeRotation(270 * Math::PI / 180);
    })



    # Works
    UIView.animateWithDuration(2,
      delay: 0.2,
      options: UIViewAnimationOptionCurveEaseOut,
      animations: lambda {
        @box.transform = CGAffineTransformMakeRotation(270 * Math::PI / 180);
      },
      completion:lambda {|finished|
      }
    )

  end
end
