Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71425223DE7
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 00:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122476; cv=none; b=DUfBh56iOnsoJOzOw5RmBlPjxoaw3CI/lAABd24vlu43sk40qW20G6LRKt2x3giXCvL+aQ0JD2Lh/fLD/LA11TH85qOlcFpC1P7jlqpJ3vHzL5KEuUJQ9hFfpG4KzhkOVmcgslxlN2pgzfKM0aQM0kkxxelg0/talnSSi2xpcH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122476; c=relaxed/simple;
	bh=V8p7f+anGnSoL+KBB359kqfJ1ldhGnObhu2HYkCbO4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZQEEA/BQfRJ578X/GIkqVybfvtJ0FZ8SIc1JfbUOcEfL6cvKMM2Zm2x1nnn3bN6B1X1bP94gud/Rf32KX3aByqAIEMIWM9o36pjA3x1W1w6hoQrRjy+npxdKqZ9SdypK8teQQnX/k1GAlAFY8M2IZ1utNCieoJ8/n75ho0dFX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNg7j1ua; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNg7j1ua"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so3503595e9.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122472; x=1790727272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yr4Xk59A6nBEe9AXu0gZsAXZVCEOldu1UBAKss+kKik=;
        b=QNg7j1uaGJNTgGrKq3IfIhTNSoWGpTa+9sPXhG8Dj8tVDHDfmxvFlL8cF2TxhJTzS9
         YzvuOIsPwqkHjeNKsmfSDxOBRtrJm9RGPpFBi9WZ28wHznC4quLOZyerDD8tgsZakUmQ
         HAhBo1pXSsMxIVZDEUZ63WfEXD9l9DVpTvWeimJJP2zYGAiolmiFGgqQ61J6YmYq8jxh
         jjRrmcBF/ZtFZnGAJpqWinANuN2mqY5IkslVDOQSh33UaMr9V2aJ89EBuCj2q5TGVMsx
         C8y0cIW0jh44ppb94B5SszGzltuoswkhUWj4XS7OcFxerbXcOIZQHCYKZZPGMe+/g9Vf
         ePzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122472; x=1790727272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yr4Xk59A6nBEe9AXu0gZsAXZVCEOldu1UBAKss+kKik=;
        b=xnHXUc9eyYYE86sIqYAmSUxVzQh6L9I2z78DuQ5JEPwp76sboCyrHtCeS4MQY5LQIx
         ZFQmLo9HjUsXjpMjL1nxkae/KmJY57DA12jdLFd7QivYA2OyPWf+w2LfWSH82GlI6IMM
         I4ettL/bupmVbJvNevo1VH5ThDsHxSPdxsVE49+8M2kFa1LBm4CPVeLNOIoPNAwckH9Z
         FYExKa4eVKQHoiSuM2diZZYQJZsgQbGTSw0B0/Z2ME3jqY7JX8EaheH7I1p1diUBTVtV
         5NBepdrDWfR3wGNyf/Li3/U97617DsOwfT0IsuXflg93M7tBX1EIK9BA4Za9x1Wnx4cW
         0Jog==
X-Gm-Message-State: AFuF++lUk4kamsZR8HDzu085HrA6aC6x87Dh7AgTOEjvQfoSYpLNHNTU
	oFt3MWrNFssc2Xs6V9DnUa/kwqPX8mtu8ZLMMjIShQlP3z7z1B+JKtXvlnbbISKU2JE=
X-Gm-Gg: AYBFou1ksS2M8ho3XmhKRd7QVXtebRWmMqWp82gvgoFIoloBGDZdU1z3ADbutSVGZWj
	2fKq8VAItJ7w/dPZPvA0nnc1ep50csle6GLJ/PpPzMC6QGxOBV44wW9Wr6laghEPXw6J+gI0h+V
	HHu9h0PuQR6gE3xq2scoiWPf123YejplQoIywfeGjQFrWM0EW/8bk3LAeo9XS7QElSngGpxFqsX
	35MzucXMw4vdjc3o4xr2y4IL9e9triy9G+Vi9efrkkDOSY9PHJIcwtWYCwoAma2yRCfzGUCYTOr
	cxMMPkukUWITELmeQhRNsFo3L/QY+D/LlIIlgfPEw/PBt+NK5YpQ5V9UD7ErKiz8FD51+KmSCa3
	uUWfxTwjqRTpe4btET7gR+USaND0+/Q0AV1HyS30BdPttye2xcEa6Kbn2CoDCQECRLgNZ/CnmQa
	Kp22lcGAh5/vIzaEyg/fMyF0lgV8+dWMviLCw2h0/GGiU3U5675nP9KII1moxmSE1rM+RJP1YZn
	xoBL86uJ3dx0O4mb+PQzy49w5kyV6jp5XxzK1zUtQiK0KwE5Ct8GAt4CbtgJv1Ycw8xKZbipWdf
	baKjDEbx3rCYJYB2di0RmMMWKzSqa1gUiZixX0IIvoCW8UbBXNLrWtxaeHlKT6W0yYNvTZpLe8w
	tP3hhhzAPbPHxj/yLNqYRPkmwV9GIDDfB
X-Received: by 2002:a05:600c:8b86:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49fdeffe2bemr9153455e9.12.1790122472466;
        Tue, 22 Sep 2026 17:14:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:31 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/6] media: az6007: fix CAM status polling after disconnect
Date: Wed, 23 Sep 2026 02:14:05 +0200
Message-ID: <20260923001410.30297-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
References: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

az6007_ci_poll_slot_status() returns -EIO when the status request fails.
dvb_ca_en50221 treats the return value as a bitmask, so -EIO is
interpreted as CAM_PRESENT|CAM_CHANGED. The CA state machine then
handles a CAM change for every failed poll, without sleeping in between.

After an unplug, every poll fails this way and the CA thread can spin
forever in dvb_ca_en50221_thread_state_machine(), preventing the USB
disconnect from completing. This happened when unplugging a TechniSat
CableStar Combo HD CI with a CAM inserted, and rcu_sched reported a
stall.

Report no CAM when the status request or buffer allocation fails, and
only inspect the status byte when the request returned data. A read
error while a CAM is present is then treated as a removal and the CAM is
reinitialised after the next successful poll.

Fixes: 962f8f67e486 ("[media] Add CI support to az6007 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 65ef045b74ca..4ce1afe01c3b 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -526,7 +526,7 @@ static int az6007_ci_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int o
 
 	b = kmalloc(12, GFP_KERNEL);
 	if (!b)
-		return -ENOMEM;
+		return 0;
 	mutex_lock(&state->ca_mutex);
 
 	req = 0xC5;
@@ -535,16 +535,18 @@ static int az6007_ci_poll_slot_status(struct dvb_ca_en50221 *ca, int slot, int o
 	blen = 1;
 
 	ret = az6007_read(d, req, value, index, b, blen);
-	if (ret < 0) {
+	if (ret < 0)
 		pr_warn("usb in operation failed. (%d)\n", ret);
-		ret = -EIO;
-	} else
-		ret = 0;
 
-	if (!ret && b[0] == 1) {
+	/*
+	 * The return value is a mask of DVB_CA_EN50221_POLL_* flags, not an
+	 * error code, so report no CAM when the status cannot be read.
+	 */
+	if (ret > 0 && b[0] == 1)
 		ret = DVB_CA_EN50221_POLL_CAM_PRESENT |
 		      DVB_CA_EN50221_POLL_CAM_READY;
-	}
+	else
+		ret = 0;
 
 	mutex_unlock(&state->ca_mutex);
 	kfree(b);
-- 
2.54.0 (Apple Git-157)

