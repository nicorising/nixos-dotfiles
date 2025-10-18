{
  services.hyprsunset = {
    enable = true;

    settings.profile = [
      {
        time = "6:00";
        temperature = 6650;
        gamma = 1.0;
      }
      {
        time = "19:00";
        temperature = 6000;
        gamma = 1.0;
      }
      {
        time = "20:00";
        temperature = 5000;
        gamma = 0.95;
      }
      {
        time = "21:00";
        temperature = 4000;
        gamma = 0.9;
      }
      {
        time = "22:00";
        temperature = 3000;
        gamma = 0.85;
      }
    ];
  };
}
