Pod::Spec.new do |s|

    s.name      = "NRSlidingPlaceholderTextField"
    s.version   = "2.0.0"
    s.license   =  { :type => 'MIT', :file => 'LICENSE' }
    s.summary   = "TextField with placeholder's horizontal slide animation."
    s.homepage  = "https://github.com/najeeb-ur-rehman/NRSlidingPlaceholderTextField.git"
    s.author    = { "Najeeb Ur Rehman" => "najeeburrehmanf13@gmail.com" }
    s.social_media_url   = "https://twitter.com/najeeb_dev"
    s.platform     = :ios, '8.0'
    s.source       = { :git => "https://github.com/najeeb-ur-rehman/NRSlidingPlaceholderTextField.git", :tag => "#{s.version}" }
    s.source_files = "NRSlidingPlaceholderTextField/Source/*"

end
