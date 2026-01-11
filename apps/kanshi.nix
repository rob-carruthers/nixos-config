{
  services.kanshi = {
    enable = true;
    systemdTarget = "";
    settings = [
      {
        profile.name = "default";
        profile.outputs = [
          {
            criteria = "Lenovo Group Limited LEN G24-10 U5B3RM9A";
            mode = "1920x1080@143.998993";
          }
        ];
      }
    ];
  };
}
