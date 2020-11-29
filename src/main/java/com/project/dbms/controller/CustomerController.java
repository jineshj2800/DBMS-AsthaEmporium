package com.project.dbms.controller;

import java.security.Principal;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.dbms.dao.Customerdao;
import com.project.dbms.dao.Offerdao;
import com.project.dbms.dao.Orderdao;
import com.project.dbms.dao.Paymentdao;
import com.project.dbms.dao.Productdao;
import com.project.dbms.dao.Userdao;
import com.project.dbms.model.Cart;
import com.project.dbms.model.Customer;
import com.project.dbms.model.Invoice;
import com.project.dbms.model.Offer;
import com.project.dbms.model.Order;
import com.project.dbms.model.OrderItem;
import com.project.dbms.model.Payment;
import com.project.dbms.model.Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("customer")
public class CustomerController {

    @Autowired
    private Productdao productdao;

    @Autowired
    private Orderdao orderdao;

    @Autowired
    private Offerdao offerdao;

    @Autowired
    private Userdao userdao;

    @Autowired
    private Customerdao customerdao;

    @Autowired
    private Paymentdao paydao;

    @RequestMapping("")
    public String index(Model m,Principal principal, HttpSession session){
        String customerid=principal.getName();
        
        Customer customer = customerdao.getCustomer(customerid);
        String conatct1=null, conatct2=null;
        
        customer.setContact(customerdao.getCustomerContact(customerid));

        conatct1 = customer.getContact().get(0);
        if(customer.getContact().size()>1) conatct2 = customer.getContact().get(1);

        Object error = session.getAttribute("error");
        if(error==null) error="false";
        else session.removeAttribute("error");

        m.addAttribute("customer", customer);
        m.addAttribute("contact1", conatct1);
        m.addAttribute("contact2", conatct2);
        m.addAttribute("error", error);
        return "customerprofile";
    }

    @RequestMapping(value = "/editcustomer", method = RequestMethod.POST)
    public String editcustomer(Principal principal,@ModelAttribute("customer") Customer customer,@RequestParam("mpassword") String password,
                @RequestParam("contact1") String contact1,@RequestParam("contact2") String contact2, Model m, HttpSession session ){

        String id=principal.getName();
        customer.setCustomerID(id);

        String error=null;

        if(!customer.getPassword().equals(password)){
            error = "Confirm Password does not match";
        }

        if((!contact1.matches("[0-9]+")) || (!contact2.isEmpty() && !contact2.matches("[0-9]+"))){
            error = "Invalid Phone Number";
        }

        if(error != null){
            session.setAttribute("error", error);
            return "redirect:/customer";
        }
        
        customerdao.update(customer);
        userdao.update(id, password, "customer");

        customerdao.deleteContact(id);
        customerdao.saveContact(id, contact1);
        if(!contact2.isEmpty() && !contact1.equals(contact2)) customerdao.saveContact(id, contact2);
        return "redirect:/customer";
    }

    @RequestMapping("/orderdetail/{id}")
    public String orderdetail(@PathVariable int id,Model m){
        List<OrderItem> orderlist = orderdao.getItemByOrder(id);
        Order order = orderdao.getOrderByID(id);
        Invoice invoice = orderdao.getInvoicebyID(order.getInvoiceid());
        Payment payment = paydao.getPaymentbyID(order.getPaymentid());
        m.addAttribute("orderlist", orderlist);
        m.addAttribute("invoice", invoice);
        m.addAttribute("payment", payment);

        return "vieworderdetail";
    }

    @RequestMapping("/cart")
    public String viewcart(Principal principal,Model model){
        String customerid = principal.getName();
        List<Cart> list = customerdao.getCartbyID(customerid);

        for(int i=0;i<list.size();i++){
            list.get(i).setProduct(productdao.getProductbyid(list.get(i).getProductid()));
        }
        model.addAttribute("list", list);
        return "viewcart";
    }

    @RequestMapping(value = "/addtocart/{id}")
    public String additem(@PathVariable int id,Principal principal){
        String customerid = principal.getName();
        customerdao.savetocart(customerid, 1, id);
        return "redirect:/product";
    }

    @RequestMapping(value = "/increase/{id}")
    public String increaseitem(@PathVariable int id,@RequestParam int maxvalue,@RequestParam int n ,Principal principal){
        String customerid = principal.getName();
        if(n<maxvalue)
        customerdao.updatetocart(customerid,id,1+n);

        return "redirect:/customer/cart";
    }

    @RequestMapping(value = "/decrease/{id}")
    public String decreaseitem(@PathVariable int id,@RequestParam int n ,Principal principal){
        String customerid = principal.getName();

        if(n>1)
        customerdao.updatetocart(customerid,id,n-1);
        
        return "redirect:/customer/cart";
    }

    @RequestMapping(value = "/deletecart/{id}")
    public String deleteitem(@PathVariable int id,Principal principal){
        String customerid = principal.getName();
        customerdao.deletefromcart(customerid,id);
        return "redirect:/customer/cart";
    }

    @RequestMapping(value = "/payment")
    public String proceedtopay(Principal principal,Model m, HttpSession session){
        String customerid = principal.getName();
        Customer customer = customerdao.getCustomer(customerid);
        List<Cart> list = customerdao.getCartbyID(customerid);
        int bill=0;
        float tax=0,discount=0;
        float offer=0;

        int max=0;
        String offerid=null;

        Object error = session.getAttribute("error");
        Object code = session.getAttribute("code");

        if(code != null){
            session.removeAttribute("code");
            List<Offer> offerlist = offerdao.getOfferForcustomer(customerid);
            for(int i=0;i<offerlist.size();i++){

                offerid = offerlist.get(i).getOfferid();
                if(code.equals(offerid)){
                String k = offerlist.get(i).getDiscount();
                max = Integer.parseInt( k.substring(1+k.lastIndexOf(".")) );
                offer = Float.parseFloat( k.substring(0,k.indexOf("%")) );
                break;
                }
            }
        }

        if(error==null) error="false";
        else session.removeAttribute("error");

        for(int i=0;i<list.size();i++){
            list.get(i).setProduct(productdao.getProductbyid(list.get(i).getProductid()));
            float dis = list.get(i).getProduct().getDiscount();
            int cost=(list.get(i).getProduct().getsellprice())*(list.get(i).getQuantity());
            discount=discount+Math.round(cost*(dis/100));
            bill=bill+cost;
            if(list.get(i).getProduct().getsellprice()<1000) tax=tax+cost/20;
            else tax=tax+(12*cost)/100;
        }

        offer = Math.round(bill*(offer/100));
        if(offer > max) offer = max;

        String mode = "Card";
        m.addAttribute("bill", bill);
        m.addAttribute("list", list);
        m.addAttribute("mode", mode);
        m.addAttribute("tax", Math.round(tax));
        m.addAttribute("discount", Math.round(discount));
        m.addAttribute("offer", Math.round(offer));
        m.addAttribute("offerid", code);
        m.addAttribute("code", code);
        m.addAttribute("customer", customer);
        m.addAttribute("error", error);
        return "placeorder";
    }

    @RequestMapping(value = "/apply")
    public String applycoupon(Principal principal,Model m,@RequestParam String code, HttpSession session){

        code = code.trim();
        if(code.isEmpty()) return "redirect:/customer/payment";

        session.setAttribute("code", code);

        return "redirect:/customer/payment";
    }



    @RequestMapping(value = "/placeorder", method = RequestMethod.POST)
    public String placeorder(@RequestParam int tax,@RequestParam int amount,@RequestParam String mode, @RequestParam int discount , @RequestParam String offerid , @RequestParam String pincode, @ModelAttribute("customer") Customer customer, HttpSession session){
        long millis=System.currentTimeMillis();  
        Date date=new java.sql.Date(millis); 

        Time time=new java.sql.Time(millis); 
        String customerid=customer.getCustomerID();

        System.out.println(offerid);

        if(amount==0) return "redirect:/customer/payment";

        if(!pincode.matches("[0-9]+")){
            session.setAttribute("error", "Invalid Pincode");
				return "redirect:/customer/payment";
        }

        paydao.save(amount+tax, mode, date);
        orderdao.saveInvoice(amount, tax, discount, date, time, customerid);

        int pid=paydao.getlastkey();
        int iid=orderdao.getlastInvoiceID();
        String address=customer.getHouseNo()+", " + customer.getStreet() + ", " + customer.getCity() + " - " + pincode;
        
        orderdao.save(tax+amount-discount, address, "Order Placed", iid, customerid, pid);
        int oid=orderdao.getlastkey();

        List<Cart> cart=customerdao.getCartbyID(customerid);
        for(int i=0;i<cart.size();i++){

            int id = cart.get(i).getProductid();
            orderdao.saveItem(oid, cart.get(i).getQuantity(), id);

            productdao.updateQuantity(id, productdao.getQuantitybyid(id)- cart.get(i).getQuantity());
        }
        
        offerdao.deleteCustomer(customerid, offerid);
        customerdao.deleteCart(customerid);
        return "redirect:/customer/order";
    }



    @RequestMapping("/order")
    public String customerorder(Principal principal,Model m){
        String id = principal.getName();

        List<Order> list = orderdao.getOrderByCustomer(id);

        List<Invoice> invoicelist = new ArrayList<>();;
        List<List<Product>> itemlist = new ArrayList<>();
        List<Boolean> feedback = new ArrayList<>();
        List<Integer> feedbackorder = orderdao.getAllFeedbackByID(id);

        HashMap<Integer, Boolean> map = new HashMap<Integer, Boolean>();

        for(int i=0;i<feedbackorder.size();i++){
            map.put(feedbackorder.get(i),true);
        }

        for(int i=0;i<list.size();i++){
            if(map.containsKey(list.get(i).getOrderid())) feedback.add(true);
            else feedback.add(false);
        }

        for(int i=0;i<list.size();i++){

            List<OrderItem> items = orderdao.getItemByOrder(list.get(i).getOrderid());
            List<Product> products = new ArrayList<>();
            for(int j=0;j<items.size();j++){
                int q = items.get(j).getQuantity();
                Product p = productdao.getProductbyid(items.get(j).getProductid());
                p.setQuantity(q);
                products.add(p);
            }
            itemlist.add(products);
            System.out.println(products.size());
            invoicelist.add(orderdao.getInvoicebyID(list.get(i).getInvoiceid()));
        }

        System.out.println(feedbackorder.size());

        m.addAttribute("list", list);
        m.addAttribute("invoicelist", invoicelist);
        m.addAttribute("itemlist", itemlist);
        m.addAttribute("feedback", feedback);
        return "viewcustomerorder";
    }

    @RequestMapping(value = "/feedback", method = RequestMethod.POST)
    public String givefeedback(Principal principal, @RequestParam int orderid,@RequestParam int rating,@RequestParam String desc){
        String customerid = principal.getName();
        long millis=System.currentTimeMillis();  
        Date date=new java.sql.Date(millis); 
        
        orderdao.saveFeedback(desc, rating, date, orderid, customerid);
        return "redirect:/customer/order";
    }

    @RequestMapping("/offer")
    public String offers(Principal principal, Model m){
        String id = principal.getName();
        List<Offer> offerlist = offerdao.getOfferForcustomer(id);
        long millis=System.currentTimeMillis();  
        Date now=new java.sql.Date(millis); 
        Date date = new java.sql.Date( now.getTime() - 24*60*60*1000);
        System.out.println(date);

        for(int i=0;i<offerlist.size();i++){
            if(date.compareTo(offerlist.get(i).getExpiryDate())>0){
                offerdao.delete(offerlist.get(i).getOfferid());
            }
        }

        offerlist = offerdao.getOfferForcustomer(id);
        m.addAttribute("list", offerlist);
        return "viewofferbycustomer";
    }
}
