Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDD71E9919
	for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 09:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082044; cv=none; b=GDWWgqzA3Q8MvuWyDoK2z/0GwFjKiBj9rgKRwBnsvGfW8yGEke+fOeHXY1Td/GVUIdhaRqtKuFz2R674f0dKDWagxC0ro1O+aHY6eDsHbYJrANaJBugFFMMbNKIpYoc2JPapiGNQtEULrPLT7HJVII1/1CXO0rBxu/lsE6o7aiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082044; c=relaxed/simple;
	bh=hatNoNGA+YXnGlMiiRKGzTz5dNJ8bwEIiS0xjj5GM4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgnvmSeLix4VK4bwDVbfjEPmjwTzuBITqXx7RsbwdkYhGHGSBicRbcyE6c24DR+ZQ9IV9gKuvwhhXiFkrSZ97onSqzGcuqQ0BUBdiirvzIf2e/FbEumh0xDt3Tfi3gEKee4LBOgzx0DewoHyzCURWEmWelj0068gufM9GCvinTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHDDJO7T; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHDDJO7T"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1616014a12.3
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 02:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788082042; x=1788686842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4mD5bCpSQ2dBdYny3erqq3V+bcIJgzXOhiWs/uhQvjc=;
        b=VHDDJO7TpbcP9nh3eF8Ip2ARgkSrcHqwLG65ExCKV87GsIvtQ028LNg88d/2DGPjfj
         nu5TzrjaS0xolRthtgv1NFQ9tHoEBPdtR/0sQWXOjfEcPM07JT2ne2fmRr6bh99+IDb6
         L4S6jccoYmJ4/rP/ers+ZmTcx8bRodmS7bgIyXvCoJSYyjuCvytFzPlbk3DPY9R05V2c
         km6TgVxWoIScpfExbnvpHLoNnEmqnbQ1vJC+FWAn/ai6qvVusRopzKK5fxtqmAdBoWbc
         VIkVovcgwZPge5kKLz/G9T2E8j+X8FOOhCkAPIJFNunafbmarpOycNtFdBR4+uL1EpOv
         7BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788082042; x=1788686842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4mD5bCpSQ2dBdYny3erqq3V+bcIJgzXOhiWs/uhQvjc=;
        b=HgS+CflEQmIA04TZIqMZpxtV+wMFqW8QMCUOt3hsWsi1j3XFjIYI57bvO6ghv1bmR4
         R47oJp7aKOm97h2IGjzOoM9gqemZhl6LEj2vSx/V5ySlu9GZxdkfQ/Vgi/Cl4dR1+7uV
         yznWBjuBMAsN9Y/yFHPgVWQhgpROnisdmogzSmN2xjYPbXb+XDRpxs7ohdchy/KqNPeN
         33IQW0Df+/hRfGwGUqE9AqhLO1Ms+8FZvEDHOmsFZXOxdswxMGVY8Xh1SDTzqKhQ+z/w
         R8/fylWIAcJeYe1UAGnBWdYYJ3HKixOyt2QebFTMMllj09iqI1GTcYHZ/0XzHxapUxEj
         m7cA==
X-Forwarded-Encrypted: i=1; AHgh+Rph/llaSDbcgtUsKou0+0Ij+ECpUg+lwDJ1lFqV7+R+B+R6IHP2hS+V8g3yaNDmkpJ0x4PLG91TOlYfkA==@vger.kernel.org
X-Gm-Message-State: AFuF++mpv+IsybRPT5dQwJovw9WB/JxRHcKhO2KTes/ZpyFnNF++w4rB
	milzw0Lh0ADDxeRL41PPFez3bzJ8NfwIB/7wcGZPpKKy09I3spbA3v/l
X-Gm-Gg: AR+sD128q1GvaLujsc44/DjtXG2aNtX019FTWyUlHqm2F+PJHKDj5j4PlljbHUIFH4M
	re/4UAEv6aM5GWNoRuYbZTxp00QgceUL5nL6w/wWUx3QgLMOtH+13Crk75bvQJJc9SlOar63FIE
	6Nsop1TQUB1aOM6m+ljME1Fcqdf4EmJt4HqENVRMsEav7U3zDjvUsbi0Igc1YO/cHdJWPd1HBVh
	hgA1/nYf7rJ3NDXJoFKIy9holsZ3DJp6QCYqPeaixRYdcVdAjvIF9Vy/B2Q1KHnc6m6GcE/HDRC
	ZD2puVMowre+LBF23ER79klp87fMnRXHCO32xGON3R88cSzPPfO0vdkHgLoFEqAZda31pCVOd5V
	618giKTNUPSfWd7krgIpg5dJjppyLulG0OXGfi3LayEAiTscLHDiddAkjp8PvDPMIawp13hkBwF
	MOlkuCiDZd4TxLs+PAhOfpuSyh4yFF05AqTi35ioV1Jlv3y2sNLoOT3O0FQUkTlvBncfg7zprns
	GNd5zDbkEYI80j6qxbp1JW09KE+CcxWaHAX+nw04y/8XiuhGrmtYg==
X-Received: by 2002:a05:6a21:3947:b0:3cc:9288:99aa with SMTP id adf61e73a8af0-3d26329db5amr33871221637.0.1788082042513;
        Sun, 30 Aug 2026 02:27:22 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:35a3:71a0:a824:96db])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2512628a12.11.2026.08.30.02.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 02:27:21 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: enelsonmoore@gmail.com,
	sakari.ailus@linux.intel.com,
	johan@kernel.org,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
Subject: [PATCH] media: gspca: don't call stopN/stop0 after device disconnect
Date: Sun, 30 Aug 2026 14:57:12 +0530
Message-ID: <20260830092712.19452-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gspca_stream_off() calls the sub-driver's stopN() and stop0()
callbacks unconditionally. These issue USB requests using
gspca_dev->dev, which becomes a dangling pointer once the USB device
has been disconnected and freed, causing a use-after-free when the
video device fd is closed after disconnect.

Add a gspca_dev->present check before calling stopN() and stop0(),
matching the existing check already used for gspca_input_create_urb()
in the same function.

Fixes: 1f5965c4dfd7 ("media: gspca: convert to vb2")
Reported-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=537b5eb78cebbff5ea70
Tested-by: syzbot+537b5eb78cebbff5ea70@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/usb/gspca/gspca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 594d73e50b9f..5c33cf397f3d 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -733,14 +733,14 @@ static void gspca_stream_off(struct gspca_dev *gspca_dev)
 {
 	gspca_dev->streaming = false;
 	gspca_dev->usb_err = 0;
-	if (gspca_dev->sd_desc->stopN)
+	if (gspca_dev->present && gspca_dev->sd_desc->stopN)
 		gspca_dev->sd_desc->stopN(gspca_dev);
 	destroy_urbs(gspca_dev);
 	gspca_input_destroy_urb(gspca_dev);
 	gspca_set_alt0(gspca_dev);
 	if (gspca_dev->present)
 		gspca_input_create_urb(gspca_dev);
-	if (gspca_dev->sd_desc->stop0)
+	if (gspca_dev->present && gspca_dev->sd_desc->stop0)
 		gspca_dev->sd_desc->stop0(gspca_dev);
 	gspca_dbg(gspca_dev, D_STREAM, "stream off OK\n");
 }
-- 
2.43.0

