function validateform() {
      
         if( document.getElementsByName('fullname')[0].value.length < 3) {
            alert( "Please provide your full name (greater than 3chars)" );
            return false;
         }

          if( document.getElementsByName('idno')[0].value.length < 3) {
            alert( "Invalid Id number !" );
            return false;
         }
         
          if( document.getElementsByName('no_adults')[0].value <1) {
            alert( "At least one adult required" );
            return false;
         }
          if( document.getElementsByName('mobile')[0].value.length < 10) {
            alert( "mobile number cannot be less than 10 digits" );
            return false;
         }

          if( document.getElementsByName('room')[0].value<1) {
            alert( "select atleast 1 room" );
            return false;
         }
      }