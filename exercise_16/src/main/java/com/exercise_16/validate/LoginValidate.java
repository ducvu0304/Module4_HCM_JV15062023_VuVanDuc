package com.exercise_16.validate;

import com.exercise_16.dto.SignInForm;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class LoginValidate implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return SignInForm.class.equals(clazz); // cho phép ép kiều
        // từ object về lớp SignInForm
    }

    @Override
    public void validate(Object obj, Errors errors) {
        // ép kiểu từ obj thành SignInForm
        SignInForm signInForm = (SignInForm) obj;
        // kiểm tra trường để trống hay không
        if (signInForm.getUsername().trim().isEmpty() || signInForm.getPassword().trim().isEmpty()){
            errors.rejectValue("username","username","Không được để trống!");
        }
    }
}
