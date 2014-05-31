MKSecureTextField overcomes a limitation of the UITextField not allowing you to change to a different language if the secureTextEntry is set to true.

It will work for any language, even for composite character languages like Korean.

To use, simply instantiate it and add it to a view:

    MKSecureTextField *f = [[MKSecureTextField alloc] initWithFrame:CGRectMake(35, 100, 250, 40)];
    [self.view addSubview:f];

More information <a href="http://www.uchidacoonga.com/2014/05/secure-uitextfield-with-language-support/">can be found here.</a>

![screen cast](https://github.com/adamk77/MKSecureTextField/blob/master/screenShot.gif?raw=true)
