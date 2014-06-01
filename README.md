MKSecureTextField overcomes a limitation of the UITextField not allowing you to change to a different language if the secureTextEntry is set to true.

It will work for any language, even for composite character languages like Korean.  Languages like Korean (Hangul) has a composite character where each letter is composed of multiple symbols. For example, ‘ㅁ’, ‘ㅏ’ and ‘ㄴ’ are all individual characters, but when combined, it becomes ‘만’, which is treated as a single letter.

To use, copy te MKSecureTextField.h and MKSecureTextField.m into your project. Then simply instantiate it and add it to a view:

    #import "MKSecureTextField.h"
    ...
    MKSecureTextField *f = [[MKSecureTextField alloc] initWithFrame:CGRectMake(35, 100, 250, 40)];
    [self.view addSubview:f];

More information <a href="http://www.uchidacoonga.com/2014/05/secure-uitextfield-with-language-support/">can be found here.</a>

![screen cast](https://github.com/adamk77/MKSecureTextField/blob/master/screenShot.gif?raw=true)
