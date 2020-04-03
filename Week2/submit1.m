
function submit1(answer)

response = "Sorry, that's not correct. Your answer should be the 5x5 identity matrix.";
if (size(answer,1) == 5 & size(answer,2) == 5)
  tmp = (answer == eye(5,5));
  if (min(tmp(:)) == 1),
    response = "Congratulations, you have successfully completed assignment 1!";
  end;
end;

disp(response);

