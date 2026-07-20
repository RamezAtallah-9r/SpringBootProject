package com.axsos.Life.services;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;

// NEW SERVICE (not in the assignment): sends the login verification
// code by email through SendGrid.
//
// DEMO MODE: if no real API key is configured (still "placeholder"),
// we don't call SendGrid at all - we PRINT the code in the console
// instead, so the whole flow can be tested with no SendGrid account.
@Service
public class EmailService {

    // @Value reads these from application.properties
    @Value("${sendgrid.api-key}")
    private String apiKey;

    @Value("${sendgrid.from-email}")
    private String fromEmail;

    // True when no real key is configured
    private boolean demoMode() {
        return apiKey == null || apiKey.isBlank() || "placeholder".equals(apiKey);
    }

    // Sends the 6-digit code to the given address.
    // Returns true if the email was sent (or printed in demo mode).
    public boolean sendVerificationCode(String toEmail, String code) {

        // ----- demo mode: print instead of emailing -----
        if (demoMode()) {
            System.out.println("=====================================================");
            System.out.println("[DEMO MODE] Verification code for " + toEmail + ": " + code);
            System.out.println("(Set SENDGRID_API_KEY to send real emails instead.)");
            System.out.println("=====================================================");
            return true;
        }

        // ----- real mode: build and send the email -----
        Email from = new Email(fromEmail, "HealthSync");   // sender (must be verified in SendGrid)
        Email to = new Email(toEmail);                      // recipient
        String subject = code + " is your HealthSync verification code";

        // The HTML body of the email (%s is replaced by the code)
        String html = """
                <div style="font-family:Arial,sans-serif;max-width:460px;margin:auto;
                            padding:24px;border:1px solid #DCE8E3;border-radius:16px">
                  <h2 style="color:#0E6B5C;margin-top:0">HealthSync</h2>
                  <p>Use this code to finish logging in:</p>
                  <p style="font-size:32px;font-weight:bold;letter-spacing:8px;color:#13221E">%s</p>
                  <p style="color:#5C7069;font-size:13px">
                    The code expires in 10 minutes. If you didn't try to log in, ignore this email.
                  </p>
                </div>
                """.formatted(code);

        Mail mail = new Mail(from, subject, to, new Content("text/html", html));
        SendGrid sendGrid = new SendGrid(apiKey);
        Request request = new Request();

        try {
            request.setMethod(Method.POST);        // SendGrid's send API is a POST...
            request.setEndpoint("mail/send");      // ...to the mail/send endpoint
            request.setBody(mail.build());         // the email converted to JSON
            Response response = sendGrid.api(request);

            // 2xx status = SendGrid accepted the email
            boolean ok = response.getStatusCode() >= 200 && response.getStatusCode() < 300;
            if (!ok) {
                // Print WHY it was rejected (wrong key = 401, wrong sender = 403)
                System.err.println("SendGrid rejected the email: HTTP "
                        + response.getStatusCode() + " - " + response.getBody());
            }
            return ok;
        } catch (IOException e) {
            System.err.println("SendGrid error: " + e.getMessage());
            return false;
        }
    }
}
