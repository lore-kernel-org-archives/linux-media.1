Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1988F33A70A
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809372; cv=none; b=Tj1eOd4fbiJnx2vPdJ/pLOGNjPgGC/ypN7Mz0abcOzxnlHzwEt6OVzVhWgW5uW7bJy4u9jJwGOgs5uLyn+DX0KnpTbP2BCg+2ZgHeNZ2WnkiQXBhvBTF9MbxiMUjTmNEbAl/TInG/yBMhDXS9bpVN7bipI4CPVg1Nnq2YKZ7K9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809372; c=relaxed/simple;
	bh=rXAs9+aVIBAPrt+bfFfL9IJ0WbONL5srRezlbViejm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u2gGZZa2yppBlQnp8tIRw7dwEQnZDV3fkh56bQGWHvxmMkA2Ellxy9dqys35oc0sVwdPUwJKMUeK13BOmB+SZsKOoT0yCJda7N0xFBJKZ8zMrkuCD/LjooJPrrUExdGVDM0/cy9Yfz/XIHfiZeFWZsUrdr8bpvSIndd30jmJLPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc2oIKi3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc2oIKi3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e623eda81cso10811075ad.0
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 05:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791809370; x=1792414170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZNrlQs8T9Osdnxqtjbb53jT8KTI+Hy98jmEDPLKnXVg=;
        b=Xc2oIKi3qqxOvoBgbn0M9ObYj449wl4yI0DQpCMsZnRuCu0btTQt4Rf23YO7wnBi79
         CrWlupBPSkqluKelPSQDTg5ivGRd+tqqYj7Y1m4nB8iKEanmspkKc7KOk7KexWL4De62
         R55MOJ8szKCD+iuHTqqTt/6C1gkpNZWtCtkvkwoZWF5XgB+6oSnzm4YdAPknACvdEBuh
         t6m2i2DR5CM65FyGea81pRCA3YnG716i5xN7V8+AX1eNgA0g1SlJ4Nht6q0cGrnzR3WP
         kcjc7G9qOna3N1NuZZ4MY1+CtJWZKjn7RPdrhViuFeWelbfcOYmmPoFwkN1mGVsLQK8J
         pLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809370; x=1792414170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNrlQs8T9Osdnxqtjbb53jT8KTI+Hy98jmEDPLKnXVg=;
        b=Dz/6CS7PrjYEdWy1/0Rrb0B8HPmCs3fi+w8cjP+Bi1byFxL2JNsvf2nvUe7IewGHYQ
         LEgkZHZbIVhCiKRlsDi83HVXn2IplWfF0VxZ6pR5V4lYpZVOsrRIaifHxHZnOMQZQ+BY
         qBOMmKvNG28tsswKPsaoV7ahGUwssXZSnFVIC3qxABmjmfwjubIss6GPZeSklnxoqdFr
         bItgYGHFjvElLTJi4dlj+OqI9Fs4eG0T3rMb/w3Qbu17djxPVfK8VYcV4Etl4taWn/4Z
         yJrYrLbEAsq5YtTNA1R67uVyrXHElQc2v2LQhbC7MOBA/acsFXwUf8yJBWjxE4VrNbQ2
         WO8A==
X-Gm-Message-State: AFq9FYI6odZW64vjE3/fNUoy331+kZtkQ/KaxC56TVGWFo7WxyD7yJqw
	3QH7YfqOdGSC2ZOUvUNqHu+4XsiMaW19k0Z31g6mtbqED7yZ6tjs71zV83IeypP8
X-Gm-Gg: AYBFou2kz7yC7B7vlBF74tiI+5BDh76P9FxbNdNVLnrYIDkk3rJcBzeKov1QLUlTLgj
	2At+m8wHq783qXAYcpevXm27/Ky5cqiS7Yhg3Lz0XdMtSNqWaVcBVoDei73sb++ghFpkCiCgO+p
	DxJ7jmhUYkwdivfQtDyrf1cgmDrspPHqCAZgnMtY01cR8GbMVuPLKE7ql1g/LJsy2Z+4f+du73Q
	Gn0IDwbx7Cqups+wT0h9co6eq25RnGfX2yCzv/Q2ZXn1QVzvJNAEv5EHGeLr3Wp0Ht0wm8tnFjP
	lYaxmRUG1Y5+uLHFbcTnwpGAbPkcuFf9gp+mAcd23gQsH2NBK8DSD7E6L0kxSrYMbVqKI+1alm8
	nBEeEXsNKg9jNQ8JrR3gDmXlPH9tpjs62ktfA32LBvilOyqO4pSChT8HVmOzHsvqDOR0/EgehOT
	2R8YaTRJIbTkziJhbwm7w6t0eoVyozYdSRIBh9bsxJVHXmWsIHLf4y52JK4B3wj4UGSlh8WP7yk
	Pqcwb5tDFJveSxtelGMoZy+h0KpPeJugkHdCinVwFFjBtuoxA==
X-Received: by 2002:a17:902:dac3:b0:2e2:d20d:fe61 with SMTP id d9443c01a7336-2e842837141mr69075915ad.2.1791809370315;
        Mon, 12 Oct 2026 05:49:30 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:a144:150d:733a:5ba2])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e8422e4eb2sm43832355ad.74.2026.10.12.05.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:49:29 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-media@vger.kernel.org
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] media: dvb-usb: dib0700: Add Trek ThumbDrive Tuner support
Date: Mon, 12 Oct 2026 20:49:21 +0800
Message-ID: <20261012124922.56201-1-hjf3108@gmail.com>
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
index 6ddc205133939..b468c17c8bdf3 100644
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
+			{   "ThumbDrive Tuner",
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

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.55.0

