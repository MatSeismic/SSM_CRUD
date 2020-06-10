package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){

        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp", employee);
    }

    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkUser(@RequestParam("empName") String empName){
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg", "Username must be combination of letters and/or numbers with length of 6-16!");
        }

        boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg", "Username is already taken!");
        }
    }


    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee emp, BindingResult result){
        Map<String, Object> map = new HashMap<>();
        if(result.hasErrors()){
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError err:errors) {
                map.put(err.getField(), err.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            employeeService.saveEmp(emp);
            return Msg.success();
        }

    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn, 5);
        List<Employee> emps = employeeService.getAll();

        PageInfo page = new PageInfo(emps, 5);
        return Msg.success().add("pageInfo", page);
    }

//    @RequestMapping("/emps")
//    public String getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model){
//        PageHelper.startPage(pn, 5);
//        List<Employee> emps = employeeService.getAll();
//
//        PageInfo page = new PageInfo(emps, 5);
//        model.addAttribute("pageInfo", page);
//
//        return "list";
//    }
}
