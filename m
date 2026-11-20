Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140374;
	b=PGJdaU4zflQqlL1k6wg+0h56R1nEa9sGQUnOMXmS7zyV0irI9lvLW48cHsuKHkS4C44Y
	 cWKKoiQTXYg7qmK1UDtT/N1zpB5CL+Koz3G4hSBKvY65kxeI5ifoshUGWFLU7uqdHy4pT
	 521bmxFHGEov3oVWRztwE40LPDbFPWUP8U4RRq53hchunRxAjxRRbE580Bf0YhUI2YfBf
	 Ce5PRM31DWG/gW7e1pxj5E70Lv8cUhNGrULzFo+CZLSn8RaDaGyApjtHXECMfhBhN79wz
	 XV5OiR/hJjc40byiV4DP4RST1QpcPNtA3yAF0RmnggOeSHK9Dqs00ZNYDgQGgHnp51w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sdP7RRdp1w1A5zM5eYdyiY+suswWxqYWSxqLXUGHeAg=;
	b=1q0ZGNKH7TRzwKW+7uC1336pufUYCZY35Jjd7XmymlBDBzWOJqxJrP6Fg76QotaBnxF/
	 cW83xiVgp5r6kJrQJknJA8mYrWB3viUwzcyZncyjpq3Ja83yjKvPztQzxiayGvyclofsI
	 drlwM83347q8NUZACm2NjbqpwMP7b2OanRi2/Zur7DpXE2NTDas0Pb2KPFJrx54LJiylm
	 vIEk8utYo/2MwErxWHRMiFQ65iY+3wJZSAzB99bmLJUQfBRgCwPbrcFQzBydl6fYdRJnx
	 pxU5rL3KnIz4swPXE0X4pqSBDiXxPs0zyRKNsoX4ZI6dKb6FZdfby9kzM4NcjkyWlWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lB7hL0tJ;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E26A606A320
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 02:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E26A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lB7hL0tJ
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso182209a12.3
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 18:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795140373; x=1795745173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdP7RRdp1w1A5zM5eYdyiY+suswWxqYWSxqLXUGHeAg=;
        b=lB7hL0tJLAFSQUylgibtbNSkeCnGoqyWpuq4El0aQqLPqlu5YipilpG9ZO44nATNON
         15+AqX9O4BrkdYCRLXQMP07XT1qqYJPFl7DeIWW8HVsUlgwlwVOP28CorH9d6ea81HSB
         mn5MaLIKgnvFDJP0tty+w5XMpNykj6WNowoQoZbgCsI/v6oYb1vDmPs59L6mtEBXwcQz
         y/LyGNHOdqpeuT2xcowsz4RFEjlUODkvr2lgYQ6ODL4oSoNmWPAM7BAuN1QI5gftFpOe
         nrCkvFNVQmUKEWwKU2I0f/s4sOBzeO/emXG0rlBZswKRk1izRlfg5kZWaPnEasjLXUBF
         uHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140373; x=1795745173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdP7RRdp1w1A5zM5eYdyiY+suswWxqYWSxqLXUGHeAg=;
        b=TsbYmBmojmDhdWWHoZtq4GM7EjdOWAa+8hO149XfbPTYLWPSkGaJ0mpQJAg8ofOmZh
         oIq9KQ1hXGauilSBqo8sc5GDNjAENbTQBe+5vE4sXbDOY9wZNgsrs0js7VgswJnu3Otf
         iuw6DLMAqTd2V8vm+hNNUTOE9EL9ZmfgNcyr3XGnXbFv/OKVY3+A+c92LOUr4TcqXMZ2
         SXCRPLKMlyEM3txDqDg99VZWu5umGmGzSCVX22/eayrGKjViF4/xSGyc4NkgKhxWbrut
         9Jx76wDqy01kAaOQvOgCnCRobBGoMlBy4bkC0Cl9RW7UEO5WDm8WSTCu2ssqag6l4oTn
         GxFQ==
X-Gm-Message-State: APuU4Z9ctdV1F1tJLLNqiDCIt1xHJR0LwMbfdglF+5esL8yq2CpniAbr
	QOurDMCXNGpsouKtWQv1oSVdzyUBUCV4kjTMatRqa98KnaBUTo6anfAS726XzYRZuiM=
X-Gm-Gg: AZFdTZdfb+4L6ZhyWAaILitcgVMwBnCc0DHlBGa+biZxS/cuekrLjB4SgaE70n/37sI
	/RbfDTjkmrY2JZY43L09AkAZo+Oci2HbB6Mafme/tFkMRZ6aZLd6jqyPwK7BVLNruZxdsYHOEHV
	bsqAaxP+OmLLewWE+g9KWl42dgzOd0UqRpEBWB8f1W8OGreK7hxY3+7os3HmGihzWp5KTHCycbI
	tVO61/tdS1TRfZEDJz8kE9B/t81iWkZ0krgjLO5nqGDySgg9K3vQOxiKqhVJGM7O/hL/Z1JtD7B
	dhnuPAfhflALZPXQeoycvO1YyXhtu15hXOD2KUICOrsKDlq8Smxfgv1sL0/fOJTZP2d30/lonNh
	APbrWD1IJjYkWP541U9WGmnzQihQaNj4ySrqy25ufquufDoEbzw1/GUNbreQN1tQvr9q/PfsKMm
	N/0NPQp2AdAY6wUBXySs0bGBkI+Aqyex1I6h4kPicpUj4B42bNU+ICm9kCyWpV2GqT9C3x3AabH
	J0JvwpFJR4W3iobc5iSa5SlMxwfT3tfZ428z9vXuFbzlOnSa2cN5nofzvwOew+cyeksCLY+m02t
	+WKTsDDrkX63jS5WqSa2S++tl9riwjA36X5uCTqvGa3tXprEHTqAyWNyvlzPOi1EHBRrfBVSQQf
	jO5WhioCNP8usf6rIZX7ciFy9xPLUyDyug94VEcR0
X-Received: by 2002:a17:90b:268f:b0:3b3:afdc:2e5 with SMTP id 98e67ed59e1d1-3b41c9cf56bmr876619a91.30.1795140372978;
        Thu, 19 Nov 2026 18:06:12 -0800 (PST)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm1904929a91.12.2026.11.19.18.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:06:12 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: linux-media@vger.kernel.org
Cc: patrick.boettcher@posteo.de,
	Ho Jie Feng <hjf3108@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: dvb-usb: dib0700: Add Trek ThumbDrive Tuner support
Date: Fri, 20 Nov 2026 10:05:51 +0800
Message-ID: <20261120020552.8975-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Trek ThumbDrive Tuner (0a16:3630) using the existing
STK7700P configuration.

It is a DiB7700 demodulator with a MT2060 tuner.

Link: https://web.archive.org/web/20060721211113/http://thumbdrive.com/TDTUNER.htm
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
Changelog v2:
- Reorder to fit within lists better

 .../admin-guide/media/dvb-usb-dib0700-cardlist.rst        | 2 ++
 drivers/media/usb/dvb-usb/dib0700_devices.c               | 8 +++++++-
 include/media/dvb-usb-ids.h                               | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst b/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
index 4b76b6f1089b..f070644e1d39 100644
--- a/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
+++ b/Documentation/admin-guide/media/dvb-usb-dib0700-cardlist.rst
@@ -146,6 +146,8 @@ dvb-usb-dib0700 cards list
      - 0ccd:0062
    * - Terratec Cinergy T USB XXS (HD)/ T3
      - 0ccd:0078, 0ccd:10a0, 0ccd:00ab
+   * - Trek ThumbDrive Tuner
+     - 0a16:3630
    * - Uniwill STK7700P based (Hama and others)
      - 1584:6003
    * - YUAN High-Tech DiBcom STK7700D
diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 6ddc20513393..271d9f4ef6db 100644
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
+			{   "Trek ThumbDrive Tuner",
+				{ &dib0700_usb_id_table[TREK_THUMBDRIVE_TUNER], NULL },
+				{ NULL },
 			}
 		},
 
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index 1b7d10f3d4aa..e857e1925ca6 100644
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

base-commit: aa0f4c41d4870a18e65772a1817af16427200371
-- 
2.55.0

