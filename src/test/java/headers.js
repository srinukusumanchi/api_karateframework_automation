function fn() {

var env = karate.env; // get java system property 'karate.env'
  var channel = env;

  if (channel == 'AS400') {

	    return {
	        ContentType: 'text/xml',
	        Username: 'sprint1user',
	        Password: 'RULES'
	    };
	  } else if(channel == 'SOL') {
	    return {
        	                ContentType: 'text/xml',
                   	        Username: 'sprint1user',
                   	        Password: 'RULES'
        	    };
      } else if(channel == 'NOVA') {
      	    return {
              	           ContentType: 'application/json',
                           Username: 'sprint1user',
                           Password: 'RULES'
              	    };
	  }else if(channel == 'ORN') {
             	    return {
                     	           ContentType: 'application/json',
                                  Username: 'sprint1user',
                                  Password: 'RULES'
                     	    };
	  }else{
	  return {};
	  }
	}