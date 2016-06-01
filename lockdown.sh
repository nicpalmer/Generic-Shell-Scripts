#!/bin/bash

# Bootstrap/baselining script. 

echo -n "Welcome $USER please confirm you have changed the password away from the default? [Y/n]: "
read -r confirmation_answer

if [ "$confirmation_answer" != 'Y' ]; then
        echo "You must change the password from the default."
        exit 1;
else
        echo "Great, you can continue now to the next step"
fi
exit 0;
