package cn.jamesxia.java.freemarker_study.model;

import freemarker.template.SimpleNumber;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.util.List;

public class CompMethod implements TemplateMethodModelEx {
    @Override
    public Object exec(List arguments) throws TemplateModelException {
        int num1 = ((SimpleNumber)arguments.get(0)).getAsNumber().intValue();
        int num2 = ((SimpleNumber)arguments.get(1)).getAsNumber().intValue();


        return num1 > num2 ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE;
    }
}
