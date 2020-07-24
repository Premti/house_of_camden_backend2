class BookingsController < ApplicationController

    def index
        @booking = Booking.all
        render json: { response: @booking }
    end

    def reject_bookings
        @booking = Booking.find(params[:id])
        @booking.update(message: params[:message])
        if @booking.message != ""
            BookingMailer.with(booking: @booking).reject_bookings.deliver_later
            render json: { message: "Booking created succesfully" }
        else
            render json: { error: "Problem creating booking", messages: @booking.errors.full_messages }
        end
    end
   
    def confirm_bookings
        @booking = Booking.find(params[:id])
        @booking.update(confirmed: true)

        if @booking.confirmed
            BookingMailer.with(booking: @booking).booking_confirmed.deliver_later
            #byebug
            render json: { message: "Booking created succesfully" }
        else
            render json: { error: "Problem creating booking", messages: @booking.errors.full_messages }
        end
    end

    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            BookingMailer.with(booking: @booking).confirmation_email.deliver_later
            render json: { message: "Booking created succesfully" }
        else
            render json: { error: "Problem creating booking", messages: @booking.errors.full_messages }
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:appointment_type, :date, :time, :phone_number, :email, :name, :confirmed )
    end

end
