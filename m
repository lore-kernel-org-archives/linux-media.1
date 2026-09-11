Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98422299943
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 05:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103188; cv=none; b=OuatYssrQLgz3e6dsD9uRs07QfvCnbEJMpPp+V0gaD8rI5DqiTz1zxboF73p4gcoc8IH5Z3BgBP4GBAezZIOghw76iiLulKFgwXSJoz2mhBFsfGVgH/CKCR0x/3BVzWPCQvcQy7iJq04zPBOU6/xlO1gri8131BSBf3YKskVuwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103188; c=relaxed/simple;
	bh=Zkrk8H561//bKn1zq+L7f8BS2bF7z74ybObzphkesK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCe7J7uwh1q/wluNSPcziBA/3i8Ipdp8wIaszpyyLUDhf2V/KlTVWHEuLbZsVTzQ0NHz4C0OlwpuCzTNisb4tXK6LePMGu3F6Yez38qFuiyBlyjT28Kcppp7MA19mzuBChPU2N0ta0lqO+ZRzhrfdLS92PKQpIoplVEG4Y3E7H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOrtOsX7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOrtOsX7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398b3d66515so651271a91.0
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 22:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103187; x=1789707987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdLdPpFYXUzWjeezh3fUTQMRth3r97UKUcvijO9o1bI=;
        b=KOrtOsX7LddM521CkfZbSUsYGjm3SXUUMxEWvKEgmKzWQjtTSrtfY2XwY845MBlMME
         QNF4XAW6DGGyY4//mUyDnGyVZDUvuXT0DCS6K6H4CdloKmv/xIamFesf6ei6iN0UAuXD
         PFGoVKVNZlALWbPmLdgT1R4QmA1DKtV0zvXQvQWNFgro2eE9pRDqDXd87VtsdB0c1NwG
         zRArKfsSpeDuQnXNR1GV9CIjQn0+RPk4tpuWskQ8xG3t+1LWk3pmwf9Ol7EgK+u0eOLV
         BsUEDPre3kwZf5VBzCqgJfP8oZaTGIxVdrlwGFuYqB2A/e+lkdTGBKJWbI2e0QlrABf+
         1GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103187; x=1789707987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdLdPpFYXUzWjeezh3fUTQMRth3r97UKUcvijO9o1bI=;
        b=FpDPUn/JAoVx2HbXdAZbC0jhCqz2bP2RtuEySKjDVbm6POuQr7Rurl1Fo0EvQbvZNH
         cqfG/06kRasAbSUzUsQl5sKsAEE87kl1U+HdDnlJhdC4wREvGCdKvZEpv5PBJypNy8OH
         P+NsWibez8jhQj1oYmp0pVvIb2rIgglAtrpQu9P09DyXkRDD9MRBKn5OLs77XEMa9qkE
         aTJt+4qexCa+v7vGstccaNSqwhj5B8Vy5ViozjKSMxFz9Btu0jFVJlPjrBMRfpZ0obJW
         5txmYwg23bfWA7Az34IpQMF1BW0dZKVdfaIiGH93I+6Qqux3+iXyOFTEWL05Hw8JXpRa
         vBhw==
X-Gm-Message-State: AFuF++nEMrFtqhOTKNu+tnl0XmU4krXbGa9DEDfQQ27bH4tPhCjtxl7f
	RAQ9HOcvjAr1wX+wZGvzg1kNQCMG3ArYnkaxUQ/pRjJ/0+HAYnyDF32JguXa7435NtA=
X-Gm-Gg: AYBFou0KuapoWrO/zR11ma08TJ8umANu3GA17zjHXpSiRjm+DESV2JE1TGvFpB5Lnmm
	fbEsgiMbdzAlSoP8Vueu38y3ndhWh8bWx5zPdqSqvDO5A1Mt5TM1poadUyKjuXwmqCBDWTp40iJ
	56gmUOnZQdVIecB0xchnj38bBrYCAk2CwPavoWp3dlfZTlD2LNuMkAkDa4x6bltGhTWXvYIyCKZ
	gLUTqwX2gsvzEcF2azNlcR8irquttSOAcfZ81l1kNIdbewlk4W86mjxfi8EVd/x4vAeADvzm+bh
	WZdTYh64VNpDZvWeDbVl2XMyIkDecX7gUv5eIMWFq6YwYFUj3WkyGYZ/A45raHQ1Cp4bcanlSQS
	sRPMsZGAHjUwurgCGsVvD1QOa7zAbqNTHLyLiunWNeMZMaNaubCKA1OEcKOcIp5qReTdYYcVedp
	ypOaz+RYTr3b+KlPTAZmpPXlJScTnfX6/XI6Ji6he7iyPrAP2hjx9V+oHW6AMfVfj4RHUiGV90p
	4DAK+pBTTujarqSUFsDLnqVZRIHHm5PB9gwOY8tASunGhKYjzGExq7pM+eWoQ==
X-Received: by 2002:a17:90b:224d:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-39d9b984500mr3979666a91.0.1789103186851;
        Thu, 10 Sep 2026 22:06:26 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:63d1:a611:b433:d4e7:c402])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm2801823a91.2.2026.09.10.22.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:06:26 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH] media: dvb-usb: dib0700: Add Trek ThumbDrive Tuner support
Date: Fri, 11 Sep 2026 13:06:19 +0800
Message-ID: <20260911050619.96465-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Trek ThumbDrive Tuner (0a16:3630) using the existing
STK7700P configuration.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../admin-guide/media/dvb-usb-dib0700-cardlist.rst        | 2 ++
 drivers/media/usb/dvb-usb/dib0700_devices.c               | 8 +++++++-
 include/media/dvb-usb-ids.h                               | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
index 4b76b6f1089b6..d78790562d929 100644
--- a/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
+++ b/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
@@ -132,6 +132,8 @@ dvb-usb-dib0700 cards list
      - 1554:5010
    * - Sony PlayTV
      - 1415:0003
+   * - Trek ThumbDrive Tuner
+     - 0a16:3630
    * - TechniSat AirStar TeleStick 2
      - 14f7:0004
    * - Terratec Cinergy DT USB XS Diversity/ T5
diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 6ddc205133939..97d0e2b32705a 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -3909,6 +3909,7 @@ enum {
 	DIBCOM_STK8096PVR,
 	HAMA_DVBT_HYBRID,
 	MICROSOFT_XBOX_ONE_TUNER,
+	TREK_THUMBDRIVE_TUNER,
 };
 
 struct usb_device_id dib0700_usb_id_table[] = {
@@ -3999,6 +4000,7 @@ struct usb_device_id dib0700_usb_id_table[] = {
 	DVB_USB_DEV(DIBCOM, DIBCOM_STK8096PVR),
 	DVB_USB_DEV(HAMA, HAMA_DVBT_HYBRID),
 	DVB_USB_DEV(MICROSOFT, MICROSOFT_XBOX_ONE_TUNER),
+	DVB_USB_DEV(TREK, TREK_THUMBDRIVE_TUNER),
 	{ }
 };
 
@@ -4052,7 +4054,7 @@ struct dvb_usb_device_properties dib0700_devices[] = {
 			},
 		},
 
-		.num_device_descs = 8,
+		.num_device_descs = 9,
 		.devices = {
 			{   "DiBcom STK7700P reference design",
 				{ &dib0700_usb_id_table[DIBCOM_STK7700P], &dib0700_usb_id_table[DIBCOM_STK7700P_PC] },
@@ -4085,6 +4087,10 @@ struct dvb_usb_device_properties dib0700_devices[] = {
 			{   "Gigabyte U7000",
 				{ &dib0700_usb_id_table[GIGABYTE_U7000], NULL },
 				{ NULL },
+			},
+			{   "TD Tuner",
+				{ &dib0700_usb_id_table[TREK_THUMBDRIVE_TUNER], NULL },
+				{ NULL },
 			}
 		},
 
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index 1b7d10f3d4aa9..e857e1925ca6b 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -81,6 +81,7 @@
 #define USB_VID_TERRATEC			0x0ccd
 #define USB_VID_TERRATEC_2			0x153b
 #define USB_VID_TEVII				0x9022
+#define USB_VID_TREK				0x0a16
 #define USB_VID_TWINHAN 			0x1822
 #define USB_VID_ULTIMA_ELECTRONIC		0x05d8
 #define USB_VID_UNIWILL 			0x1584
@@ -414,6 +415,7 @@
 #define USB_PID_TINYTWIN_3				0x9016
 #define USB_PID_TREKSTOR_DVBT				0x901b
 #define USB_PID_TREKSTOR_TERRES_2_0			0xC803
+#define USB_PID_TREK_THUMBDRIVE_TUNER			0x3630
 #define USB_PID_TURBOX_DTT_2000 			0xd3a4
 #define USB_PID_TWINHAN_VP7021_WARM			0x3208
 #define USB_PID_TWINHAN_VP7041_COLD			0x3201

base-commit: 6e30287eaf3e41b86dfb86df3b811526693d74b4
-- 
2.55.0

