/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validation;

import java.security.SecureRandom;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Customer;

/**
 *
 * @author TienP
 */
public class EmailService {

    public String generateOTP() {
        SecureRandom secureRandom = new SecureRandom();
        int otp = secureRandom.nextInt(1000000); // Generates a number between 0 and 999999
        return String.format("%06d", otp); // Formats the number as a 6-digit string
    }

    public void send(String recipientEmail, String sendStatus) {
        //provide sender's email ID
        String fromEmail = "quangtienhoihop@gmail.com";
        String fromPassword = "pxsz tvwv ckqj vqkt";

        //provide Mailtrap's host address
        String host = "smtp.gmail.com";
        //configure Mailtrap's SMTP server details
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        //create the Session object
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, fromPassword);
            }
        });

        try {
            //create a MimeMessage object
            Message message = new MimeMessage(session);

            //set From email field
            message.setFrom(new InternetAddress(fromEmail));

            //set To email field
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(recipientEmail));
            if (sendStatus.equals("register")) {
                //set email subject field
                message.setSubject("Welcome to Stylus - Confirm Your Email");

                // Set the content of the email message
                message.setContent("<div\n"
                        + "      style=\"\n"
                        + "      width: 50vw;\n"
                        + "      margin: 0 auto;\n"
                        + "      padding: 20px;\n"
                        + "      text-align: center; \n"
                        + "      border: 3px solid black; \n"
                        + "      border-radius: 10px\n"
                        + "      \"\n"
                        + "    >\n"
                        + "    <h1>Welcome to Stylus!</h1>\n"
                        + "      <h3>Thank you for joining our community of fashion enthusiasts.</h3>\n"
                        + "      <small\n"
                        + "        >Please enter this code on our website to confirm your email address and start your shopping journey.</small>\n"
                        + "      <div\n"
                        + "        style=\"\n"
                        + "          background-color: #F0F0F0;\n"
                        + "          border-radius: 10px;\n"
                        + "          padding: 10px;\n"
                        + "          width: 30%;\n"
                        + "          margin: 20px auto;\n"
                        + "          letter-spacing: 10px;\">\n"
                        + "        <h1>" +"" + "</h1>\n"
                        + "      </div>\n"
                        + "      <small\n"
                        + "        >If you did not sign up for a Stylus account, please disregard this email.</small\n"
                        + "      >\n"
                        + "      <button\n"
                        + "        style=\"\n"
                        + "          padding: 10px;\n"
                        + "          border-radius: 10px;\n"
                        + "          display: block;\n"
                        + "          margin: 20px auto;\n"
                        + "          background-color: #337ab7; color: white; border: none;\"\n"
                        + "      >\n"
                        + "        <a style=\"text-decoration: none; color: white;\" href=\"http://localhost:8080/ProjectStylus/VerifyOTP?email="+recipientEmail+"\">Verify Your Email</a>\n"
                        + "      </button>\n"
                        + "    </div>",
                        "text/html");
            } else {
                message.setSubject("Stylus Password Reset Request");

                // Set the content of the email message
                message.setContent("<div\n"
                        + "      style=\"\n"
                        + "      width: 50vw;\n"
                        + "      margin: 0 auto;\n"
                        + "      padding: 20px;\n"
                        + "      text-align: center; \n"
                        + "      border: 3px solid black; \n"
                        + "      border-radius: 10px\n"
                        + "      \"\n"
                        + "    >\n"
                        + "    <h1>Password Reset Instructions</h1>\n"
                        + "      <h3>Your request to reset your password has been received.</h3>\n"
                        + "      <small\n"
                        + "        >Please click on the link below to reset your password. This link will expire in 24 hours.</small>\n"
                        +"      <h1>"   + "</h1>\n"
                        + "      <div\n"
                        + "        style=\"\n"
                        + "          background-color: #F0F0F0;\n"
                        + "          border-radius: 10px;\n"
                        + "          padding: 20px;\n"
                        + "          width: 50%;\n"
                        + "          margin: 20px auto;\n"
                        + "          \">\n"
                        + "        <a style=\"text-decoration: none; color: #337ab7; font-size: 18px;\" href=\"http://localhost:8080/ProjectStylus/ResetPass?email=" +recipientEmail+ "\">Reset My Password</a>\n"
                        + "      </div>\n"
                        + "      <small\n"
                        + "        >If you did not request a password reset, please ignore this email or contact support if you have concerns.</small\n"
                        + "      >\n"
                        + "    </div>",
                        "text/html");
            }

            //send the email message
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}