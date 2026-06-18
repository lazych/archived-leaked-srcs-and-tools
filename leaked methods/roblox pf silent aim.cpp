// by mnmmmnmnnmmnm 
// idk if it works because its kinda simple

static bool lastState = false;
    if (gameIdNspace::GameId == gameIdNspace::PF) {
        Globals::LocalPlayer.Head.SetTransparency(1.f);
        bool currentState = (GetAsyncKeyState(VK_LBUTTON) & 0x8000) != 0;

        if (!currentState && lastState) {
            Globals::Camera.SetRotation(rot);
        }

        if (currentState && !lastState) {
            Matrix3x3 camRot = Globals::Camera.GetRotation();
            Matrix3x3 NewRot = camRot;


            NewRot.Data[2] = Rot.Data[2];
            NewRot.Data[5] = Rot.Data[5];
            NewRot.Data[8] = Rot.Data[8];

            Globals::Camera.SetRotation(Rot);
            rot = Globals::Camera.GetRotation();
        }

        lastState = currentState;

    }
