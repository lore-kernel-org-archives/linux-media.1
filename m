Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939B63CA4BB
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722170; cv=none; b=iCdtrKLFCZTT+cwoUdfze62uJFW2qcfmXW1kc8nkTHXy1cBd17sHcLVntlAhndMcQPxuOpzUMkWQd2Ez9VgIyL3reNTR6SVB7f56FB60YmVPVCk6Wsf/pPx9OLYXFzRitiQLJ0eWjhWca9yWMG6MrXQJQvrfPDlUEYLek7Rj4L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722170; c=relaxed/simple;
	bh=rHF7FxEKPLHv+ul1lvBKjnzQtZ3iV1w703eEWeOf+r4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BE8gNleENsIEwulZ0jQAY+7Dehnbx6kh8ncFEfG/rvOiu4xQTVNLsNSGNEp0Eg2+UjvreTngvLB761ueOLtnQkDgeWBx84PhOtGVzcsr4766GKrMTHxCsnm07BDyRzWOl1OdFcGLDyE79P4Uvsi8igr/k737bEg+7i/0ijDFvC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrkvCG9C; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrkvCG9C"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so1237697f8f.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 15:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783722167; x=1784326967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1rEqkwx4V0NFLkR2YBs/2MlkQcFbdA+/8dkPLDeFmtU=;
        b=rrkvCG9CJyPovaxK6mruTG8Hla7iXR89Orf08tnxAu+ywV+D2zcNDRo1z5aBFMIJQI
         meijFz4FpKHOv/LPekTQqesKqAddTeoGHdOC+bIBmPHhI5WLsrtIIY0ofeLZH7EG+dRG
         Uy3MK0H7RPlh0nXW9U3m7gCLKKiID5R+GO+D40mrnUyDHFPStMLVN/5P/J7VERNXHIpg
         xOfGisZU0nBhOzKTRRHZIBuCNXX0TKra6ummVvbA2iwa/Hm19LGx+8QVwIAjUArqqLRi
         XEbdcyesJhVKziifiAAylgeWk1vDf8xo+nO5g63KDHXHL1r4/vmK9/P/7XdFaHuKsYoS
         HX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783722167; x=1784326967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rEqkwx4V0NFLkR2YBs/2MlkQcFbdA+/8dkPLDeFmtU=;
        b=eojg/249Mg/UafUJAUEmZOLPx6EQepjZu8ZGYgB1Ut22tQcoODE7b2yutj/x2FXaZN
         3YvSkQe3lqFxrm5b6CbpiQFyxadPXSlq3HTNT1WkobJi9xTP07LFYTxQX63YZBe8KFMT
         YiYRd72i06wiLcvsGRHMAi3YI/iCAVUX0XEL25CDLObSY47KA7ywkihNVw0k7bW+kN8R
         xSl1CT5qJXoWpPidRbhDct4WioN++NDTwJQaDmk/tPjg+H7JRE2FHtKMjyGj6SI7118w
         dILikrQYvz9r3G8mOkQWk8PhZeo0K4Swl8vTShUON1A3rc9Tca+AqaWmiGvAHx8HrlME
         N9TQ==
X-Gm-Message-State: AOJu0YwIMgG9Q4Pvk5H2Nl1dBKCRe0B9EVdHUo75WdWX6azvksVRjMzE
	SYzP/1FhY3PNsZZ2gYELwOeOV2LaJiaWBZeiKmlYbsOQ6yet6x3R26s7jaKAtAIyUaE=
X-Gm-Gg: AfdE7cn3NL/r5Wx2/yLuYI44ALt3TZl2bjLj+hTFBPS8GDGq+imQwtgLUIut9KQuwFF
	qIjL6tk/VvJUjIMhPQRPYFDeW2OZVXW+PAcnAy2b1l7CJnbFoR4SDqSnF2/fILDQ0NlcDt8D9II
	slrO8+aipFzX3r5yDumR4naRM1GrDytLQJH7k5Glt/49u8tKhlJG9uMUpoNBLaj1orjT+UAB3Vp
	Zpq+dQfj/PFfRbiUcPZvVtdeBVbYKMg5YBjv2a4CHEHCh7RdtdWdzdsCxrzAAmeuu9ISE+EZxAK
	x2F5XOWcvhmk+pb22EJ8QbNFG7AT257KGNBHCTJ2N46p1cVgNnkImWCkn++AVEkWDWTFM3Ws7bl
	Gy9Qvhrj93pX50ykDwMztM49OG348LFl+5wM/x62A5aeWGRrQqtb7fzninqSYllwgqu40dNuLN7
	/I5nJmz0Xw+LG6NXz/w7JfdaA=
X-Received: by 2002:a5d:5f83:0:b0:44a:be4:d0e4 with SMTP id ffacd0b85a97d-47f2dccb3bemr537962f8f.25.1783722166681;
        Fri, 10 Jul 2026 15:22:46 -0700 (PDT)
Received: from do-customapps.home ([2a02:587:5fb8:1e00:aefc:2869:e952:16a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm68611733f8f.9.2026.07.10.15.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:22:46 -0700 (PDT)
From: Dimitris Kerasiotis <dkerasiotis@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dimitris Kerasiotis <dkerasiotis@gmail.com>
Subject: [PATCH] media: af9035: add support for AVerMedia A918R Express DVB-T
Date: Sat, 11 Jul 2026 01:21:25 +0300
Message-ID: <20260710222125.1778230-1-dkerasiotis@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AVerMedia A918R Express DVB-T (USB ID 07ca:0918) is an
ExpressCard DVB-T receiver based on the AF9035 USB bridge, AF9033
demodulator and NXP TDA18218 tuner, the same combination as the
AVerMedia AVerTV Volar HD (A835).

Besides the device ID, the board requires a GPIO power-up sequence
for its tuner/antenna front end, otherwise the device probes,
firmware loads and the tuner accepts programming, but the
demodulator never sees any signal. The required sequence was
identified by capturing the USB traffic of the vendor Windows
driver and is identical to the one this driver already uses for
the MXL5007T based AVerMedia devices (GPIOs 0x00d8e0/0x00d8e1/
0x00d8df and 0x00d8b4/0x00d8b5/0x00d8b3), so it is applied for
this USB ID only.

With this change the device locks and successfully scans all
DVB-T multiplexes receivable in Attica, Greece.

Signed-off-by: Dimitris Kerasiotis <dkerasiotis@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/af9035.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/af9035.c b/drivers/media/usb/dvb-usb-v2/af9035.c
index 17062672e..0fdf3dcde 100644
--- a/drivers/media/usb/dvb-usb-v2/af9035.c
+++ b/drivers/media/usb/dvb-usb-v2/af9035.c
@@ -1476,6 +1476,49 @@ static int af9035_tuner_attach(struct dvb_usb_adapter *adap)
 				tuner_addr, &af9035_mxl5007t_config[adap->id]);
 		break;
 	case AF9033_TUNER_TDA18218:
+		if (le16_to_cpu(d->udev->descriptor.idVendor) ==
+				USB_VID_AVERMEDIA &&
+		    le16_to_cpu(d->udev->descriptor.idProduct) == 0x0918) {
+			/*
+			 * AVerMedia A918R Express DVB-T: the tuner/antenna
+			 * front end is powered up through GPIOs, using the
+			 * same sequence as the MXL5007T based AVerMedia
+			 * devices above. Sequence captured from the vendor
+			 * Windows driver.
+			 */
+			ret = af9035_wr_reg(d, 0x00d8e0, 1);
+			if (ret < 0)
+				goto err;
+
+			ret = af9035_wr_reg(d, 0x00d8e1, 1);
+			if (ret < 0)
+				goto err;
+
+			ret = af9035_wr_reg(d, 0x00d8df, 0);
+			if (ret < 0)
+				goto err;
+
+			msleep(30);
+
+			ret = af9035_wr_reg(d, 0x00d8df, 1);
+			if (ret < 0)
+				goto err;
+
+			msleep(300);
+
+			ret = af9035_wr_reg(d, 0x00d8b4, 1);
+			if (ret < 0)
+				goto err;
+
+			ret = af9035_wr_reg(d, 0x00d8b5, 1);
+			if (ret < 0)
+				goto err;
+
+			ret = af9035_wr_reg(d, 0x00d8b3, 1);
+			if (ret < 0)
+				goto err;
+		}
+
 		/* attach tuner */
 		fe = dvb_attach(tda18218_attach, adap->fe[0],
 				&d->i2c_adap, &af9035_tda18218_config);
@@ -2122,6 +2165,8 @@ static const struct usb_device_id af9035_id_table[] = {
 		&af9035_props, "TerraTec Cinergy T Stick (rev. 2)", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, 0x0337,
 		&af9035_props, "AVerMedia HD Volar (A867)", NULL) },
+	{ DVB_USB_DEVICE(USB_VID_AVERMEDIA, 0x0918,
+		&af9035_props, "AVerMedia A918R Express DVB-T", NULL) },
        { DVB_USB_DEVICE(USB_VID_GTEK, USB_PID_EVOLVEO_XTRATV_STICK,
 	       &af9035_props, "EVOLVEO XtraTV stick", NULL) },
 
-- 
2.47.3

