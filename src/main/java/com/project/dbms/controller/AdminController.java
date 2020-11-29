package com.project.dbms.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.dbms.dao.BankDetailsdao;
import com.project.dbms.dao.Courierdao;
import com.project.dbms.dao.Customerdao;
import com.project.dbms.dao.Employeedao;
import com.project.dbms.dao.Offerdao;
import com.project.dbms.dao.OfflineSaledao;
import com.project.dbms.dao.Paymentdao;
import com.project.dbms.dao.Productdao;
import com.project.dbms.dao.Supplierdao;
import com.project.dbms.dao.Userdao;
import com.project.dbms.model.BankDetails;
import com.project.dbms.model.BuyingDetail;
import com.project.dbms.model.Category;
import com.project.dbms.model.Courier;
import com.project.dbms.model.Customer;
import com.project.dbms.model.Employee;
import com.project.dbms.model.EmployeeAttendance;
import com.project.dbms.model.Offer;
import com.project.dbms.model.OfflineSale;
import com.project.dbms.model.Payment;
import com.project.dbms.model.Product;
import com.project.dbms.model.SalaryPaid;
import com.project.dbms.model.SoldOffline;
import com.project.dbms.model.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private Productdao productdao;

    @Autowired
    private Offerdao offerdao;

    @Autowired
    private Userdao userdao;

    @Autowired
    private Customerdao custdao;

    @Autowired
    private Employeedao empdao;

    @Autowired
    private BankDetailsdao bkdao;

    @Autowired
    private Courierdao cordao;

    @Autowired
    private OfflineSaledao saledao;

    @Autowired
    private Paymentdao paydao;

    @Autowired
    private Supplierdao supdao;

    @RequestMapping(value = "" , method = RequestMethod.GET)
    public String adminsection(Model model) {
        return "admin";
    }

    //////////////////// EMPLOYEE //////////////////////////////////////////////////

    @RequestMapping("/emp")
    public String viewemp(Model m) {
        List<Employee> list = empdao.getAllEmployees();

        m.addAttribute("list", list);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setContact(empdao.getEmployeeContact(list.get(i).getEmployeeID()));
            list.get(i).setEmail(empdao.getEmployeeEmail(list.get(i).getEmployeeID()));
            list.get(i).setBank(bkdao.getBankDetailByID(list.get(i).getBankid()));
        }



        return "viewemployee";
    }

    @RequestMapping("/emp/{id}")
    public String viewempByid(@PathVariable String id, Model m) {
        Employee emp = empdao.getEmployeebyID(id);
        emp.setContact(empdao.getEmployeeContact(id));
        emp.setEmail(empdao.getEmployeeEmail(id));
        m.addAttribute("emp", emp);
        return "employeeprofile";
    }

    @RequestMapping(value = "/addemp",  method = RequestMethod.GET)
    public String addemp(Model m, HttpSession session) {
        
        Employee emp = new Employee();
        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        System.out.println(error);

        m.addAttribute("emp", emp);
        m.addAttribute("error", error);
        return "addemployee";
    }

    @RequestMapping(value = "/registeremp", method = RequestMethod.POST)
    public String registeremp(@Validated @ModelAttribute("emp") Employee emp, HttpSession session) {

        String id = emp.getEmployeeID();
        if (userdao.isUser(id)) {
            session.setAttribute("error", "Username exists");
            return "redirect:/admin/addemp";
        }
        empdao.save(emp);
        userdao.save(id, emp.getPassword(), "employee");

        return "redirect:/admin/emp";
    }

    @RequestMapping(value = "/editemp/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable String id, Model m, HttpSession session) {
        Employee emp = empdao.getEmployeebyID(id);

        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        m.addAttribute("emp", emp);
        m.addAttribute("error", error);
        return "editemployee";
    }

    @RequestMapping(value = "/editemp/{id}", method = RequestMethod.POST)
    public String saveemp(@ModelAttribute("emp") Employee emp) {
        System.out.println(emp.getEmployeeID());
        empdao.update(emp);
        return "redirect:/admin/emp";
    }

    @RequestMapping(value = "/deleteemp/{id}/{bid}", method = RequestMethod.GET)
    public String delete(@PathVariable String id,@PathVariable int bid) {
        empdao.delete(id);
        userdao.delete(id);
        bkdao.delete(bid);
        return "redirect:/admin/emp";
    }

    @RequestMapping(value = "/markattendance")
    public String markAttendance(Model m) {
        List<Employee> list = empdao.getAllEmployees();

        EmployeeAttendance emp = new EmployeeAttendance();
        emp.setEmp(list);
        long millis = System.currentTimeMillis();
        Date date1 = new java.sql.Date(millis);

        String date = date1.toString();
        String check = empdao.getLastDate();
        List<String> mark = new ArrayList<>();
        int id = 2;
        
        if (check != null && check.equals(date))
            id = 1;

        if( id == 2){
            for(int i = 0; i < list.size(); i++)
            mark.add("absent");
        }
        else{
            List<EmployeeAttendance> emplist = empdao.getAttendanceByDate(date1);
            for(int i=0; i<emplist.size();i++)
            mark.add(emplist.get(i).getAttendance());

            
        }

        emp.setMark(mark);

        m.addAttribute("list", emp);
        m.addAttribute("id", id);

        return "markAttendance";
    }

    @RequestMapping(value = "/saveattendance", method = RequestMethod.POST)
    public String saveAttendance(Model m, @ModelAttribute("list") EmployeeAttendance emp, @RequestParam("id") int id) {
        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);

        List<Employee> list = empdao.getAllEmployees();
        List<String> mark = emp.getMark();

        if (id == 1) {

            for (int i = 0; i < mark.size(); i++) {
                empdao.updateAttendance(list.get(i).getEmployeeID(), date, mark.get(i));
            }
        } else {
            for (int i = 0; i < mark.size(); i++) {
                empdao.saveAttendance(list.get(i).getEmployeeID(), date, mark.get(i));
            }
        }

        return "redirect:/admin/attendance";
    }

    @RequestMapping(value = "/attendance")
    public String viewattendance(Model m) {
        List<Employee> list = empdao.getAllEmployees();

        long millis = System.currentTimeMillis();
        Date date = new java.sql.Date(millis);
        List<EmployeeAttendance> emplist = empdao.getAttendanceByDate(date);
        for(int i=0;i<emplist.size();i++) emplist.get(i).setEmployee(empdao.getEmployeebyID(emplist.get(i).getEmployeeid()));

        m.addAttribute("list", list);
        m.addAttribute("date", date);
        m.addAttribute("emplist", emplist);
        m.addAttribute("message", date);
        return "viewattendance";
    }

    @RequestMapping(value = "/attendance/{id}", method = RequestMethod.GET)
    public String getattendance(Model m, @RequestParam("date") Date date, @RequestParam("employee") String emp,
            @PathVariable int id) {
        List<Employee> list = empdao.getAllEmployees();
        List<EmployeeAttendance> emplist;
        if (id == 1) {
            emplist = empdao.getAttendanceByID(emp);
            m.addAttribute("message", emp);
        } else {
            emplist = empdao.getAttendanceByDate(date);
            m.addAttribute("message", date);
        }

        for (int i = 0; i < emplist.size(); i++) {
            emplist.get(i).setEmployee(empdao.getEmployeebyID(emplist.get(i).getEmployeeid()));
        }

        m.addAttribute("list", list);
        m.addAttribute("date", date);
        m.addAttribute("emplist", emplist);
        return "viewattendance";
    }

    ///////////////////// CATEGORY  ///////////////////// ////////////////////////////////////////////////////////////////////

    @RequestMapping(value = "/category")
    public String viewcategory(Model model) {
        List<Category> list = productdao.getAllCategory();
        model.addAttribute("list", list);
        return "viewcategory";
    }

    @RequestMapping(value = "/addcategory", method = RequestMethod.GET)
    public String addcategory(Model model) {
        Category category = new Category();
        model.addAttribute("category", category);
        return "addcategory";
    }

    @RequestMapping(value = "/savecategory", method = RequestMethod.POST)
    public String savecategory(@Validated @ModelAttribute("category") Category category) {
        productdao.saveCategory(category);
        return "redirect:/admin/category";
    }

    @RequestMapping(value = "/editcategory/{id}", method = RequestMethod.GET)
    public String editcategory(@PathVariable int id, Model m) {
        Category category = productdao.getCategory(id);
        System.out.println(category.getVariety());
        m.addAttribute("category", category);
        return "editcategory";
    }

    @RequestMapping(value = "/editcategory/{id}", method = RequestMethod.POST)
    public String editsavecategory(@Validated @ModelAttribute("category") Category category) {
        System.out.println(category.getCategoryid());
        System.out.println(category.getVariety());
        productdao.updateCategory(category);
        return "redirect:/admin/category";
    }

    @RequestMapping(value = "/deletecategory/{id}", method = RequestMethod.GET)
    public String deletecategory(@PathVariable int id) {
        productdao.deleteCategory(id);
        return "redirect:/admin/category";
    }

///////////////////// OFFER  ///////////////////// ////////////////////////////////////////////////////////////////////

    @RequestMapping(value = "/offer")
    public String viewoffer(Model model) {
        long millis=System.currentTimeMillis();  
        Date now=new java.sql.Date(millis); 
        Date date = new java.sql.Date( now.getTime() - 24*60*60*1000);
        System.out.println(date);
        List<Offer> list = offerdao.getAllOffer();

        for(int i=0;i<list.size();i++){
            if(date.compareTo(list.get(i).getExpiryDate())>0){
                offerdao.delete(list.get(i).getOfferid());
            }
        }

        list = offerdao.getAllOffer();
        model.addAttribute("list", list);
        return "viewoffer";
    }

    @RequestMapping(value = "/addoffer", method = RequestMethod.GET)
    public String addoffer(Model model, HttpSession session) {
        List<String> list = custdao.getAllCustomerID();

        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        model.addAttribute("list", list);
        model.addAttribute("error", error);
        return "addoffer";
    }

    @RequestMapping(value = "/customeroffer")
    public String viewcustomeroffer(Model model) {
        List<Offer> list = offerdao.getAllOffer();
        List<List<String>> customers = new ArrayList<>();
        for(int i=0; i<list.size();i++){
            customers.add(offerdao.getCustomers(list.get(i).getOfferid()));
        }
        model.addAttribute("list", list);
        model.addAttribute("customers", customers);
        return "viewcustomeroffer";
    }

    @RequestMapping(value = "/delcustomer/{cid}/{id}", method = RequestMethod.GET)
    public String deleteoffer(@PathVariable String id,@PathVariable String cid) {
        offerdao.deleteCustomer(cid,id);
        return "redirect:/admin/customeroffer";
    }

    @RequestMapping(value = "/saveoffer", method = RequestMethod.POST)
    public String saveoffer(@RequestParam String desc,@RequestParam int discount,@RequestParam int max, @RequestParam String code, @RequestParam Date date, @RequestParam List<String> customers,HttpSession session){

        if(offerdao.isCode(code)) {
            session.setAttribute("error", "Coupon Code Already Exits");
            return "redirect:/admin/addoffer";
        }

        long millis=System.currentTimeMillis();  
        Date now=new java.sql.Date(millis); 
        Date today = new java.sql.Date( now.getTime() - 24*60*60*1000);
        if(today.compareTo(date)>0){
            session.setAttribute("error", "Invalid Expire Date");
            return "redirect:/admin/addoffer";
        }

        
        Offer offer = new Offer();
        offer.setOfferid(code);
        offer.setDesc(desc);
        offer.setDiscount(discount+"% Off on purchase upto Rs."+max);
        offer.setExpiryDate(date);

        System.out.println(customers);
        offerdao.save(offer);
        for(int i=0;i<customers.size();i++){
            offerdao.saveCustomer(code, customers.get(i));
        }

        return "redirect:/admin/offer";
    }

    @RequestMapping(value = "/deleteoffer/{id}", method = RequestMethod.GET)
    public String deleteoffer(@PathVariable String id) {
        offerdao.delete(id);
        return "redirect:/admin/offer";
    }


/////////////////////////   CUSTOMER  /////////////////////////////////////////////////////////

    @RequestMapping(value="/customer")
    public String viewcustomer(Model model){
        List<Customer> list = custdao.getAllCustomer();
        for(int i=0;i<list.size();i++){
            System.out.println(list.get(i).getCustomerID());
            list.get(i).setContact(custdao.getCustomerContact(list.get(i).getCustomerID()));
        }
        model.addAttribute("list",list);
        return "viewcustomer";
    }

    @RequestMapping(value="/deletecustomer/{id}",method = RequestMethod.GET)    
    public String deletecustomer(@PathVariable String id){    
        custdao.delete(id);    
        userdao.delete(id);
        return "redirect:/admin/customer";    
    }     

////////////////////      SUPPLIER      ////////////////////////////////////////////////////////////////////////

    @RequestMapping(value="/supplier")
    public String viewsup(Model model){
        List<Supplier> list = supdao.getAllSupplier();
        for(int i=0;i<list.size();i++){
            list.get(i).setContact(supdao.getSupplierContact(list.get(i).getSupplierid()));
            list.get(i).setEmail(supdao.getSupplierEmail(list.get(i).getSupplierid()));
            list.get(i).setBank(bkdao.getBankDetailByID(list.get(i).getBankid()));
        }
        model.addAttribute("list",list);
        return "viewsupplier";
    }

    @RequestMapping(value="/addsupplier", method = RequestMethod.GET)
    public String addsupplier(Model model, HttpSession session ){
        Supplier supplier=new Supplier();

        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        model.addAttribute("supplier",supplier);
        model.addAttribute("error",error);
        return "addsupplier";
    }
    
    @RequestMapping(value = "/savesupplier", method=RequestMethod.POST)
    public String savesupplier(@Validated @ModelAttribute("supplier") Supplier supplier,
        @RequestParam("contact1") String contact1,@RequestParam("contact2") String contact2,
        @RequestParam("email1") String email1,@RequestParam("email2") String email2,@RequestParam("ifsc") String ifsc,
        @RequestParam("bname") String bname,@RequestParam("account") String account, HttpSession session){

        
        if((!contact1.matches("[0-9]+")) || (!contact2.isEmpty() && !contact2.matches("[0-9]+"))){
            session.setAttribute("error", "Invalid Phone Number");
				return "redirect:/admin/addsupplier";
        }

        if(!bname.isEmpty() && !ifsc.isEmpty() && !account.isEmpty())
        {
            bkdao.save(bname, account, ifsc);
            supplier.setBankid(bkdao.getlastkey());
        }
        else if(bname.isEmpty() && ifsc.isEmpty() && account.isEmpty()){
            Integer k=null;
            supplier.setBankid(k);
        }
        else{
            session.setAttribute("error", "Invalid Bank Details");
				return "redirect:/admin/addsupplier";
        }

        supdao.save(supplier);

        int id=supdao.getlastkey();
        System.out.println(id);
        if(!email2.isEmpty() && !email1.equals(email2)) supdao.saveEmail(id, email2);
        if(!email1.isEmpty()) supdao.saveEmail(id, email1);

        if(!contact1.isEmpty()) supdao.saveContact(id, contact1);
        if(!contact2.isEmpty()&& !contact1.equals(contact2)) supdao.saveContact(id, contact2);


        return "redirect:/admin/supplier";
    }

    @RequestMapping(value = "/editsupplier/{id}", method=RequestMethod.GET )
    public String editsupplier(@PathVariable int id, Model m, HttpSession session){
        Supplier supplier = supdao.getSupplierByID(id);
        List<String> contacts = supdao.getSupplierContact(id);
        List<String> emails = supdao.getSupplierEmail(id);
        String conatct1=null, conatct2=null, email1=null, email2=null;

        if(contacts.size()>0) conatct1 = contacts.get(0);
        if(contacts.size()>1) conatct2 = contacts.get(1);
        if(emails.size()>0) email1 = emails.get(0);
        if(emails.size()>1) email2 = emails.get(1);

        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        BankDetails bank = new BankDetails();
        if(supplier.getBankid()>0) bank = bkdao.getBankDetailByID(supplier.getBankid());

        m.addAttribute("supplier", supplier);
        m.addAttribute("contact1", conatct1);
        m.addAttribute("contact2", conatct2);
        m.addAttribute("email2", email2);
        m.addAttribute("email1", email1);
        m.addAttribute("bank", bank);
        m.addAttribute("error", error);

        return "editsupplier";
    }

    @RequestMapping(value = "/updatesupplier", method = RequestMethod.POST)
    public String updatesupplier(@ModelAttribute("supplier") Supplier supplier,
        @RequestParam String contact1,@RequestParam String contact2,
        @RequestParam String email1,@RequestParam String email2,@RequestParam String ifsc,
        @RequestParam String bname,@RequestParam String account, HttpSession session){

        int id = supplier.getSupplierid();
        Supplier sup = supdao.getSupplierByID(id);

        if(((!contact1.matches("[0-9]+")) || (!contact2.isEmpty() && !contact2.matches("[0-9]+")))){
            session.setAttribute("error", "Invalid Phone Number");
				return "redirect:/admin/editsupplier/"+id;
        }

        if(!bname.isEmpty() && !ifsc.isEmpty() && !account.isEmpty())
        {
            if(sup.getBankid()>0) bkdao.delete(sup.getBankid());
            bkdao.save(bname, account, ifsc);
            supplier.setBankid(bkdao.getlastkey());
        }
        else if(bname.isEmpty() && ifsc.isEmpty() && account.isEmpty()){

            if(sup.getBankid()>0) bkdao.delete(sup.getBankid());
            Integer k=null;
            supplier.setBankid(k);
        }
        else{
            session.setAttribute("error", "Invalid Bank Details");
				return "redirect:/admin/editsupplier/"+id;
        }

        supdao.update(supplier);

        supdao.deleteContact(id);
        supdao.deleteEmail(id);
        
        if(!email2.isEmpty() && !email1.equals(email2)) supdao.saveEmail(id, email2);
        if(!email1.isEmpty()) supdao.saveEmail(id, email1);

        if(!contact1.isEmpty()) supdao.saveContact(id, contact1);
        if(!contact2.isEmpty()&& !contact1.equals(contact2)) supdao.saveContact(id, contact2);


        return "redirect:/admin/supplier";
    }

    @RequestMapping(value="/deletesupplier/{id}/{bid}",method = RequestMethod.GET)    
    public String deletesupplier(@PathVariable int id,@PathVariable int bid){    
        supdao.delete(id);    
        bkdao.delete(bid);
        return "redirect:/admin/supplier";    
    }

///////////////////////////    COURIER    ///////////////////////////////////////////////////////////

    @RequestMapping(value="/addcourier", method = RequestMethod.GET)
    public String addcourier(Model model, HttpSession session ){
        Courier courier=new Courier();
        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        model.addAttribute("courier",courier);
        model.addAttribute("error", error);
        return "addcourier";
    }
    
    @RequestMapping(value = "/savecourier", method=RequestMethod.POST)
    public String savecourier(@Validated @ModelAttribute("courier") Courier courier,
        @RequestParam("contact1") String contact1,@RequestParam("contact2") String contact2,
        @RequestParam("email1") String email1,@RequestParam("email2") String email2, Model model, HttpSession session){
        
        if((!contact1.isEmpty() && !contact1.matches("[0-9]+")) || (!contact2.isEmpty() && !contact2.matches("[0-9]+"))){
            session.setAttribute("error", "Invalid Phone Number");
				return "redirect:/admin/addcourier";
        }
        
            cordao.save(courier);

        int id=cordao.getlastkey();
        if(!email2.isEmpty() && !email1.equals(email2)) cordao.saveEmail(id, email2);
        if(!email1.isEmpty() ) cordao.saveEmail(id, email1);

        if(!contact1.isEmpty() ) cordao.saveContact(id, contact1);
        if(!contact2.isEmpty() && !contact1.equals(contact2)) cordao.saveContact(id, contact2);

        return "redirect:/admin/courier";
    }

    @RequestMapping(value="/deletecourier/{id}",method = RequestMethod.GET)    
    public String deletecourier(@PathVariable int id){    
        cordao.delete(id);    
        return "redirect:/admin/courier";    
    }

////////////////////////     OFFLINE SALE     //////////////////////////////////////////////////////////////

    @RequestMapping(value="/sale")
    public String viewsale(Model model){
        List<OfflineSale> list = saledao.getAllSale();
        for(int i=0;i<list.size();i++){
             list.get(i).setMode(paydao.getPaymentbyID(list.get(i).getPaymentid()).getMode());
        }
        model.addAttribute("list",list);
        return "viewsale";
    }

    @RequestMapping(value = "/addsale", method = RequestMethod.GET)
    public String addsale(Model m, HttpSession session){
        OfflineSale sale=new OfflineSale();

        long millis=System.currentTimeMillis();  
        Date date=new java.sql.Date(millis); 

        sale.setDate(date);

        List<Product> list = new ArrayList<>();
        sale.setItems(list);

        m.addAttribute("sale", sale);

        String mode="select";
        int bill=0;
        float tax=0,discount=0;

        m.addAttribute("mode", mode);
        m.addAttribute("bill", bill);
        m.addAttribute("tax", Math.round(tax));
        m.addAttribute("discount", Math.round(discount));
        m.addAttribute("error", "false");
        return "addsale";
    }

    @RequestMapping(value="/additem", method = RequestMethod.GET)
    public String additem(@RequestParam("id") int id,@RequestParam("n") int n, @ModelAttribute("sale") OfflineSale sale,Model m){

        List<Product> list;
        String error = "false";

        if(sale.getItems()==null){
            list = new ArrayList<>();
        }
        else{
            list = sale.getItems();
        }

        if(productdao.isProduct(id)){
            Product pro=productdao.getProductbyid(id);  
            if(pro.getQuantity()>=n){
                pro.setQuantity(n);
                list.add(pro);
            }
            else error = "Invalid Quantity";
        }
        else error = "Invalid ProductID";

        sale.setItems(list);
        m.addAttribute("sale", sale);

        int bill=0;
        float tax=0,discount=0;

        for(int i=0;i<list.size();i++){

            float dis = list.get(i).getDiscount();
            int cost=(list.get(i).getsellprice())*(list.get(i).getQuantity());
            discount=discount+Math.round(cost*(dis/100));
            bill=bill+cost;
            if(list.get(i).getsellprice()<1000) tax=tax+cost/20;
            else tax=tax+(12*cost)/100;
        }

        String mode="select";
        m.addAttribute("mode", mode);
        m.addAttribute("bill", bill);
        m.addAttribute("tax", Math.round(tax));
        m.addAttribute("discount", Math.round(discount));
        m.addAttribute("error", error);
        return "addsale";
    }

    @RequestMapping(value="/savesale",method = RequestMethod.POST)    
    public String savesale(@Validated @ModelAttribute("sale") OfflineSale sale){ 

        if(sale.getItems()==null){
            return "redirect:/admin/addsale";
        }

        paydao.save(sale.getBill(),sale.getMode(), sale.getDate());
        List<Product> list=sale.getItems();

        int pid=paydao.getlastkey();
        sale.setPaymentid(pid);
        saledao.save(sale);
        int saleid = saledao.getlastkey();
        for(int i=0;i<list.size();i++){
            int id = list.get(i).getProductid();
            int q = productdao.getQuantitybyid(id);
            productdao.updateQuantity(id, q-list.get(i).getQuantity());
            saledao.saveProduct(list.get(i).getProductid(), saleid, list.get(i).getQuantity());
        }
        return "redirect:/admin/sale";    
    }   

    @RequestMapping(value="/saledetail/{id}")    
    public String saledetails(@PathVariable int id, Model m){ 

        OfflineSale sale = saledao.getSaleById(id);
        List<SoldOffline> items = saledao.getAllItembySale(id);
        List<Product> list = new ArrayList<>();
        
        for(int i=0;i<items.size();i++){
            int q = items.get(i).getQuantity();
            Product p = productdao.getProductbyid(items.get(i).getProductid());
            p.setQuantity(q);
            list.add(p);
        }

        m.addAttribute("list", list);
        m.addAttribute("sale", sale);
        
        return "viewsaledetail";    
    }   
    
    

    @RequestMapping(value="/deletesale/{pid}",method = RequestMethod.GET)    
    public String deletesale(@PathVariable int pid){
        paydao.delete(pid);   
        return "redirect:/admin/sale";    
    }

///////////////////////////////////////    SALARY PAYMENT     ///////////////////////////////////////////////////////

    @RequestMapping(value="/salarypaid")
    public String viewsalary(Model model){
        List<SalaryPaid> list= paydao.getAllSalaryPaid();

        for(int i=0;i<list.size();i++)
        {
            SalaryPaid p=list.get(i);
            Employee emp=empdao.getEmployeebyID(p.getEmployeeid());
            Payment pay=paydao.getPaymentbyID(p.getPaymentid());
            p.setEmployee(emp);
            p.setPayment(pay);
        }

        model.addAttribute("list",list);
        return "viewsalarypaid";
    }

    @RequestMapping(value = "/addpay", method = RequestMethod.GET)
    public String addpay(Model model){
        Payment pay=new Payment();
        String mode="Cash";
        List<Employee> list=empdao.getAllEmployees();
        model.addAttribute("payment",pay);
        model.addAttribute("list", list);
        model.addAttribute("mode", mode);
        return "addsalarypaid";
    } 

    @RequestMapping(value = "/savepay", method = RequestMethod.POST)
    public String savepay(@ModelAttribute("payment") Payment pay,@RequestParam("employee") String empid){
        paydao.save(-pay.getAmount(), pay.getMode(), pay.getDate());
        int id=paydao.getlastkey();
        paydao.saveSalaryPaid(id, empid);
        return "redirect:/admin/salarypaid";
    }

    @RequestMapping(value="/deletepay/{id}",method = RequestMethod.GET)    
    public String deletesalarypaid(@PathVariable int id){
        paydao.delete(id);     
        return "redirect:/admin/salarypaid";    
    }

////////////////////////////////////       BUYING DETAILS        ///////////////////////////////////////////////////

    @RequestMapping(value="/buydetails")
    public String viewbuy(Model model){
        List<BuyingDetail> list= supdao.getAllBuyingDetail();

        for(int i=0;i<list.size();i++)
        {
            BuyingDetail p=list.get(i);
            Supplier sup=supdao.getSupplierByID(p.getSupplierid());
            Payment pay=paydao.getPaymentbyID(p.getPaymentid());
            p.setSupplier(sup);
            p.setPayment(pay);
        }

        model.addAttribute("list",list);
        return "viewbuydetails";
    }

    @RequestMapping(value = "/addbuy", method = RequestMethod.GET)
    public String addbuy(Model model){
        BuyingDetail buy=new BuyingDetail();
        String mode="Check";
        List<Supplier> list=supdao.getAllSupplier();
        model.addAttribute("buy",buy);
        model.addAttribute("list", list);
        model.addAttribute("mode", mode);
        return "addbuydetails";
    } 

    @RequestMapping(value = "/savebuy", method = RequestMethod.POST)
    public String savebuy(@RequestParam("mode") String mode,@ModelAttribute("buy") BuyingDetail buy){
        paydao.save(-buy.getBill(),mode,buy.getDate());
        int id=paydao.getlastkey();
        buy.setPaymentid(id);
        supdao.saveBuydetail(buy);
        return "redirect:/admin/buydetails";
    }

    @RequestMapping(value="/deletebuy/{pid}",method = RequestMethod.GET)    
    public String deletebuy(@PathVariable int pid){
        paydao.delete(pid);     
        return "redirect:/admin/buydetails";    
    }

    @RequestMapping("/payments")
    public String payhistory(Model m){
        List<Payment> list = paydao.getAllPayment();
        m.addAttribute("list", list);
        return "viewpayment";
    }


}
