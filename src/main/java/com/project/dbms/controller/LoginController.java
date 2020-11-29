package com.project.dbms.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.dbms.dao.BankDetailsdao;
import com.project.dbms.dao.Courierdao;
import com.project.dbms.dao.Customerdao;
import com.project.dbms.dao.Employeedao;
import com.project.dbms.dao.Orderdao;
import com.project.dbms.dao.Paymentdao;
import com.project.dbms.dao.Productdao;
import com.project.dbms.dao.Supplierdao;
import com.project.dbms.dao.Userdao;
import com.project.dbms.model.BankDetails;
import com.project.dbms.model.Cart;
import com.project.dbms.model.Category;
import com.project.dbms.model.Courier;
import com.project.dbms.model.Customer;
import com.project.dbms.model.Employee;
import com.project.dbms.model.Feedback;
import com.project.dbms.model.Invoice;
import com.project.dbms.model.Order;
import com.project.dbms.model.OrderItem;
import com.project.dbms.model.Product;
import com.project.dbms.model.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class LoginController {

    @Autowired
    private Productdao productdao;

    @Autowired
    private Userdao userdao;

    @Autowired
    private Customerdao customerdao;

    @Autowired
    private Employeedao empdao;

    @Autowired
    private BankDetailsdao bkdao;

    @Autowired
    private Courierdao cordao;

    @Autowired
    private Orderdao orderdao;

    @Autowired
    private Paymentdao paydao;

    @Autowired
    private Supplierdao supdao;


    @RequestMapping("/")
    public String home(Model m) {
        List<Category> list = productdao.getAllCategory();
        m.addAttribute("list",list);
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model m) {
        m.addAttribute("error", "false");
        return "login";
    }

    @RequestMapping(value = "/login_error", method = RequestMethod.GET)
    public String error(Model m){
        System.out.println("true");
        m.addAttribute("error", "true");
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginProcess() {
        return "home";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model, HttpSession session) {
        Customer customer = new Customer();
        model.addAttribute("customer", customer);
        
        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        System.out.println(error);
        model.addAttribute("error", error);
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerProcess(@Validated @ModelAttribute("customer") Customer customer,
            @RequestParam("mpassword") String password,
        @RequestParam("contact1") String contact1,@RequestParam("contact2") String contact2, HttpSession session){
        
        String id=customer.getCustomerID();

        if(userdao.isUser(id)){
            session.setAttribute("error", "Username Already Exsits");
				return "redirect:/register";
        }
        if(!customer.getPassword().equals(password)){
            session.setAttribute("error", "Confirm Password does not match");
				return "redirect:/register";
        }
        if((!contact1.matches("[0-9]+")) || (!contact2.isEmpty() && !contact2.matches("[0-9]+"))){
            session.setAttribute("error", "Invalid Phone Number");
				return "redirect:/register";
        }

        customerdao.save(customer);
        userdao.save(id, password, "customer");
        customerdao.saveContact(id, contact1);
        if(!contact2.isEmpty() && !contact1.equals(contact2)) customerdao.saveContact(id, contact2);
        return "login";
    }

    @RequestMapping(value = "/product")
    public String viewproduct(Model model,Principal principal) {
        List<Product> list = productdao.getAllProducts();
        List<Category> categorylist = productdao.getAllCategory();
        List<String> types = productdao.getAlltype();
        

        String role=null;
        String user=null;
        HashMap<Integer, Boolean> map = new HashMap<Integer, Boolean>();
        if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
            user = principal.getName();
            role = userdao.findUser(user).getRole();
            List<Cart> cart = customerdao.getCartbyID(user);
            for(int i=0;i<cart.size();i++){
                map.put(cart.get(i).getProductid(), true);
            } 
        }
        for(int i=0;i<list.size();i++){
            if(map.containsKey(list.get(i).getProductid())) list.get(i).setIncart(true);
            else list.get(i).setIncart(false);
        }

        System.out.println(list.size());
        String message = "Available Items";
        model.addAttribute("message", message);
        model.addAttribute("list", list);
        model.addAttribute("categorylist", categorylist);
        model.addAttribute("role", role);
        model.addAttribute("types", types);
        return "viewproduct";
    }

    @RequestMapping(value = {"/admin/outofstock", "/employee/outofstock"})
    public String viewoutofstcok(Model model,Principal principal) {
        List<Product> list = productdao.getOutofStock();
        List<Category> categorylist = productdao.getAllCategory();
        List<String> types = productdao.getAlltype();

        String role=null;
        String user=null;
        HashMap<Integer, Boolean> map = new HashMap<Integer, Boolean>();
        if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
            user = principal.getName();
            role = userdao.findUser(user).getRole();
            List<Cart> cart = customerdao.getCartbyID(user);
            for(int i=0;i<cart.size();i++){
                map.put(cart.get(i).getProductid(), true);
            } 
        }
        for(int i=0;i<list.size();i++){
            if(map.containsKey(list.get(i).getProductid())) list.get(i).setIncart(true);
            else list.get(i).setIncart(false);
        }

        System.out.println(list.size());
        String message = "Out Of Stock";
        model.addAttribute("message", message);
        model.addAttribute("list", list);
        model.addAttribute("categorylist", categorylist);
        model.addAttribute("role", role);
        model.addAttribute("types", types);
        return "viewproduct";
    }

    @RequestMapping(value = "/product/{n}")
    public String filterproduct(Model model,Principal principal,@RequestParam String type,@RequestParam("category") int id,@PathVariable int n) {

        if(id == -1 || type.equals("none")) return "redirect:/product";

        List<Product> list = new ArrayList<>();
        List<Category> categorylist = productdao.getAllCategory();
        List<String> types = productdao.getAlltype();
        String message = "Available Items";

        if(n==1){
            list = productdao.getProductbyCategory(id);
            message = productdao.getCategory(id).getName();
        }
        else if(n==2){
            list = productdao.getProductBytype(type);
            message = type;
        }
        
        String role=null;
        String user=null;
        HashMap<Integer, Boolean> map = new HashMap<Integer, Boolean>();
        if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
            user = principal.getName();
            role = userdao.findUser(user).getRole();
            List<Cart> cart = customerdao.getCartbyID(user);
            for(int i=0;i<cart.size();i++){
                map.put(cart.get(i).getProductid(), true);
            } 
        }
        for(int i=0;i<list.size();i++){
            if(map.containsKey(list.get(i).getProductid())) list.get(i).setIncart(true);
            else list.get(i).setIncart(false);
        }

        System.out.println(list.size());
        model.addAttribute("message", message);
        model.addAttribute("list", list);
        model.addAttribute("categorylist", categorylist);
        model.addAttribute("role", role);
        model.addAttribute("types", types);
        return "viewproduct";
    }

    @RequestMapping(value = "/category/{id}")
    public String categoryitem(Model model,Principal principal,@PathVariable int id) {

        List<Product> list = new ArrayList<>();
        List<Category> categorylist = productdao.getAllCategory();
        List<String> types = productdao.getAlltype();

        String message = productdao.getCategory(id).getName();
        list = productdao.getProductbyCategory(id);
        
        String role=null;
        String user=null;
        HashMap<Integer, Boolean> map = new HashMap<Integer, Boolean>();
        if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
            user = principal.getName();
            role = userdao.findUser(user).getRole();
            List<Cart> cart = customerdao.getCartbyID(user);
            for(int i=0;i<cart.size();i++){
                map.put(cart.get(i).getProductid(), true);
            } 
        }
        for(int i=0;i<list.size();i++){
            if(map.containsKey(list.get(i).getProductid())) list.get(i).setIncart(true);
            else list.get(i).setIncart(false);
        }

        System.out.println(list.size());
        model.addAttribute("message", message);
        model.addAttribute("list", list);
        model.addAttribute("categorylist", categorylist);
        model.addAttribute("role", role);
        model.addAttribute("types", types);
        return "viewproduct";
    }    

    @RequestMapping(value = "/productdetail/{id}", method = RequestMethod.GET)
    public String viewproductdetail(Model m,@PathVariable int id,Principal principal) {
        Product product = productdao.getProductbyid(id);
        product.setIncart(false);

        String role=null;
        String user=null;
        if(SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof UserDetails) {
            user = principal.getName();
            role = userdao.findUser(user).getRole();
            List<Cart> cart = customerdao.getCartbyID(user);
            for(int i=0;i<cart.size();i++){
               if(cart.get(i).getProductid() == id) {product.setIncart(true);break;}
            } 
        }

        m.addAttribute("pro", product);
        m.addAttribute("role", role);
        return "viewproductdetail";
    }
    
//////////////////////////////////////   Employeee-Admin /////////////////////////////////////////////

@RequestMapping("/employee")
    public String index(Model m,Principal principal, HttpSession session){
        String id=principal.getName();
        
        Employee employee = empdao.getEmployeebyID(id);
        String conatct1=null, conatct2=null, email1=null, email2=null;
        List<String> contacts = empdao.getEmployeeContact(id);
        List<String> emails = empdao.getEmployeeEmail(id);

        if(contacts.size()>0) conatct1 = contacts.get(0);
        if(contacts.size()>1) conatct2 = contacts.get(1);
        if(emails.size()>0) email1 = emails.get(0);
        if(emails.size()>1) email2 = emails.get(1);

        int bkid = employee.getBankid();
        BankDetails bank = new BankDetails();

        if(bkid>0) bank= bkdao.getBankDetailByID(bkid);

        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        m.addAttribute("employee", employee);
        m.addAttribute("contact1", conatct1);
        m.addAttribute("contact2", conatct2);
        m.addAttribute("email2", email2);
        m.addAttribute("email1", email1);
        m.addAttribute("bank", bank);
        m.addAttribute("error", error);

        return "employeeprofile";
    }

    @RequestMapping(value = "/employee/editemployee", method = RequestMethod.POST)
    public String editEmployee(Principal principal,@ModelAttribute Employee employee,@RequestParam String mpassword,@RequestParam String contact1,
                @RequestParam String contact2,@RequestParam String ifsc,@RequestParam String email1,@RequestParam String email2,
                @RequestParam String bname,@RequestParam String account, Model model, HttpSession session ){

        String id=principal.getName();

        employee.setEmployeeID(id);;
        if(!employee.getPassword().equals(mpassword)){
            session.setAttribute("error", "Password does not match");
            return "redirect:/employee";
        }

        Employee emp = empdao.getEmployeebyID(id);

        if((!contact1.matches("[0-9]+")) || (!contact2.isEmpty() && !contact2.matches("[0-9]+"))){
            session.setAttribute("error", "Invalid Phone Number");
				return "redirect:/employee";
        }

        if(!bname.isEmpty() && !ifsc.isEmpty() && !account.isEmpty())
        {
            if(emp.getBankid()>0) bkdao.delete(emp.getBankid());
            bkdao.save(bname, account, ifsc);
            employee.setBankid(bkdao.getlastkey());
        }
        else if(bname.isEmpty() && ifsc.isEmpty() && account.isEmpty()){

            if(emp.getBankid()>0) bkdao.delete(emp.getBankid());
            Integer k=null;
            employee.setBankid(k);
        }
        else{
            session.setAttribute("error", "Invalid Bank Details");
				return "redirect:/employee";
        }

        empdao.updateByEmp(employee);
        userdao.update(id, mpassword, "employee");

        empdao.deleteEmail(id);
        empdao.deleteContact(id);

        if(!email2.isEmpty() && !email1.equals(email2)) empdao.saveEmail(id, email2);
        if(!email1.isEmpty()) empdao.saveEmail(id, email1);

        if(!contact1.isEmpty()) empdao.saveContact(id, contact1);
        if(!contact2.isEmpty()&& !contact1.equals(contact2)) empdao.saveContact(id, contact2);

        return "redirect:/employee";
    }

    @RequestMapping("/employee/work")
    public String employeesection(){
        return "employeesection";
    }

    @RequestMapping(value={"/admin/feedback","/employee/feedback"})
    public String viewfb(Model model,Principal principal){
        List<Feedback> list = orderdao.getAllFeedbacks();
        String user=null,role=null;
        user = principal.getName();
        role = userdao.findUser(user).getRole();
        model.addAttribute("list",list);
        model.addAttribute("role", role);
        return "viewfeedback";
    }

    @RequestMapping(value="/admin/deletefeedback/{id}",method = RequestMethod.GET)    
    public String deletefb(@PathVariable int id){    
        orderdao.deleteFeedback(id);    
        return "redirect:/admin/feedback";    
    }

/////////////////////////

    private static String UPLOADED_FOLDER = "src/main/webapp/resources/images/";

    @RequestMapping(value = {"/admin/addproduct","/employee/addproduct"}, method = RequestMethod.GET)
    public String addproduct(Model model) {
        Product product = new Product();
        List<Category> c = productdao.getAllCategory();
        List<Supplier> s = supdao.getAllSupplier();
        model.addAttribute("product", product);
        model.addAttribute("categorylist", c);
        model.addAttribute("supplierlist", s);
        return "addproduct";
    }

    @RequestMapping(value = {"/admin/saveproduct","/employee/saveproduct"}, method = RequestMethod.POST)
    public String saveproduct(@Validated @ModelAttribute("product") Product product, @RequestParam MultipartFile file){
        String filename=file.getOriginalFilename();  
          
        try {
            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);

        } catch (IOException e) {
            e.printStackTrace();
        }

        product.setPhoto(filename);

        productdao.save(product);
        return "redirect:/product";
    }


    @RequestMapping(value = {"/admin/editproduct/{id}","/employee/editproduct/{id}"}, method = RequestMethod.GET)
    public String editproduct(@PathVariable int id, Model m){
        Product product=productdao.getProductbyid(id);
        m.addAttribute("product", product);
        return "editproduct";
    }

    @RequestMapping(value={"/admin/editproduct/{id}","/employee/editproduct/{id}"},method = RequestMethod.POST)    
    public String editsaveproduct(@ModelAttribute("product") Product product){    
        productdao.update(product);   
        return "redirect:/product";    
    }   

    @RequestMapping(value="/admin/deleteproduct/{id}",method = RequestMethod.GET)    
    public String deleteproduct(@PathVariable int id){    
        productdao.delete(id);    
        return "redirect:/product";    
    }

    @RequestMapping(value={"/admin/courier","/employee/courier"})
    public String viewcor(Model model, Principal principal){
        List<Courier> list = cordao.getAllCourier();

        for(int i=0;i<list.size();i++){
            list.get(i).setContact(cordao.getCourierContact(list.get(i).getCourierid()));
        }
        for(int i=0;i<list.size();i++){
            list.get(i).setEmail(cordao.getCourierEmail(list.get(i).getCourierid()));
        }
        String user=null,role=null;
        user = principal.getName();
        role = userdao.findUser(user).getRole();
        model.addAttribute("list",list);
        model.addAttribute("role", role);
        return "viewcourier";
    }

    @RequestMapping(value={"/admin/editcourier/{id}","/employee/editcourier/{id}"}, method = RequestMethod.GET)
    public String editcor(Model m, @PathVariable int id, HttpSession session){

        Courier courier = cordao.getCourierByID(id);
        List<String> contacts = cordao.getCourierContact(id);
        List<String> emails = cordao.getCourierEmail(id);
        String conatct1=null, conatct2=null, email1=null, email2=null;

        if(contacts.size()>0) conatct1 = contacts.get(0);
        if(contacts.size()>1) conatct2 = contacts.get(1);
        if(emails.size()>0) email1 = emails.get(0);
        if(emails.size()>1) email2 = emails.get(1);

        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        m.addAttribute("courier", courier);
        m.addAttribute("contact1", conatct1);
        m.addAttribute("contact2", conatct2);
        m.addAttribute("email2", email2);
        m.addAttribute("email1", email1);
        m.addAttribute("error", error);

        return "editcourier";
    }

    @RequestMapping(value = {"/employee/updatecourier","/admin/updatecourier"}, method = RequestMethod.POST)
    public String updatesupplier(@ModelAttribute("courier") Courier courier,
        @RequestParam String contact1,@RequestParam String contact2,
        @RequestParam String email1,@RequestParam String email2, HttpSession session){

        int id = courier.getCourierid();

        if((!contact1.isEmpty() && !contact1.matches("[0-9]+")) || (!contact2.isEmpty() && !contact2.matches("[0-9]+"))){
            session.setAttribute("error", "Invalid Phone Number");
				return "redirect:/admin/editcourier/"+id;
        }

        cordao.update(courier);

        cordao.deleteContact(id);
        cordao.deleteEmail(id);
        
        if(!email2.isEmpty() && !email1.equals(email2)) cordao.saveEmail(id, email2);
        if(!email1.isEmpty()) cordao.saveEmail(id, email1);

        if(!contact1.isEmpty()) cordao.saveContact(id, contact1);
        if(!contact2.isEmpty()&& !contact1.equals(contact2)) cordao.saveContact(id, contact2);


        return "redirect:courier";
    }

/////////////////////////////  ORDER  ///////////////////////////////////////////////////////////////////

    @RequestMapping(value={"/admin/order","/employee/order"})
    public String vieworder(Model model,Principal principal){
        List<Order> list2 = orderdao.getDeliveredOrder();
        List<Order> list1 = orderdao.getPendingOrder();
        String user=null,role=null;
        user = principal.getName();
        role = userdao.findUser(user).getRole();

        for(int i=0;i<list1.size();i++){
            list1.get(i).setPayment(paydao.getPaymentbyID(list1.get(i).getPaymentid()));
        }

        for(int i=0;i<list2.size();i++){
            list2.get(i).setPayment(paydao.getPaymentbyID(list2.get(i).getPaymentid()));
        }

        model.addAttribute("role", role);
        model.addAttribute("list2",list2);
        model.addAttribute("list1",list1);
        return "vieworder";
    }

    @RequestMapping(value={"/admin/orderdetail/{id}","/employee/orderdetail/{id}"})
    public String vieworderbyid(@PathVariable int id,Model m){
        Order order = orderdao.getOrderByID(id);
        Invoice invoice = orderdao.getInvoicebyID(id);
        List<OrderItem> items = orderdao.getItemByOrder(id);
        List<Product> list = new ArrayList<>();
        
        for(int i=0;i<items.size();i++){
            int q = items.get(i).getQuantity();
            Product p = productdao.getProductbyid(items.get(i).getProductid());
            p.setQuantity(q);
            list.add(p);
        }

        m.addAttribute("list", list);
        m.addAttribute("invoice", invoice);
        m.addAttribute("order", order);

        return "vieworderdetail";
    }

    @RequestMapping(value ={"/admin/editorder/{id}","/employee/editorder/{id}"}, method = RequestMethod.GET)
    public String editorder(@PathVariable int id, Model m, HttpSession session){
        Order order = orderdao.getOrderByID(id);
        System.out.println(order.getDate());
        List<Courier> list = cordao.getAllCourier();

        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        m.addAttribute("order", order);
        m.addAttribute("list", list);
        m.addAttribute("error", error);
        return "editorder";
    }

    @RequestMapping(value={"/admin/saveorder","/employee/saveorder"},method = RequestMethod.POST)    
    public String editsaveorder(@ModelAttribute Order order, HttpSession session){ 
        
        if(order.getCourierid() == 0) {
            session.setAttribute("error", "Select Courier Service");
            return "redirect:editorder/"+order.getOrderid();
        }
        orderdao.update(order);    
        return "redirect:order";    
    }   

    @RequestMapping(value="/admin/deleteorder/{id}/{iid}",method = RequestMethod.GET)    
    public String deleteorder(@PathVariable int id,@PathVariable int iid){    
        paydao.delete(id);
        orderdao.deleteInvoice(iid);
        return "redirect:/admin/order";    
    }
}
