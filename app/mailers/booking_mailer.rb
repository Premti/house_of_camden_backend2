class BookingMailer < ApplicationMailer

    def confirmation_email
        @booking = params[:booking]
        mail(to: @booking.email, subject: "Thank you for booking with us " + @booking.name)

    end

    def booking_confirmed
        @booking = params[:booking]
        #@message = params[:message]
        mail(to: @booking.email, subject: "Booking confirmation")
    end

    def reject_bookings
        @booking = params[:booking]
        mail(to: @booking.email, subject: "Update on appointment")
    end
    

end
