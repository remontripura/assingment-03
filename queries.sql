
    -- Query 01
select
    bookings.booking_id,
    users.name as customer_name,
    vehicles.name as vehicle_name,
    start_date,
    end_date,
    bookings.status
from
    bookings
    inner join users using (user_id)
    inner join vehicles using (vehicle_id)
    --  Query 02
select
    *
from
    Vehicles as v
where
    not exists (
        select
            1
        from
            Bookings b
        where
            b.vehicle_id = v.vehicle_id
    );

--  Query 03
select
    *
from
    vehicles
where
    status = 'available'
    and type = 'car'
    -- Query 04 
select
    name
from
    bookings
select
    v.name as vehicle_name,
    count(b.booking_id) as total_bookings
from
    Vehicles v
    inner join Bookings as b on v.vehicle_id = b.vehicle_id
group by
    v.vehicle_id,
    v.name
having
    count(b.booking_id) > 2;