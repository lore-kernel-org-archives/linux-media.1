Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013055;
	b=cDVrC/L6h2Q9Sb6fQ/A3hq522MutB0DFwaqfUJ72AdWGvUqOSdCHA/qV3VrAC8NFByHi
	 GNPVNeR+IB1JI5RU1cqRmUMFL0SSSm07AAJl0UnIZJjsJqnz56uZtH1rmhCpsNC2HRTd3
	 PFFvCdrFn6qM+jZhl3qMuHrkoFItR5SbfQzz24vHw9pTqEcLTvQWdhl84Mco6d2DEaiaC
	 gvhGD4zZ03caEOwRirGn8DPLMS4agBf6b6bDBPblE6nNIhBwabpbVVDmJMlWM+H7ubaLu
	 ONd4K8rov5xU+hFB0f6IDMITjwGtGEaixx8lnyCEdt3JkxMkwTwgLAan7xQLAyYjKQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QW8Fe3Jy6z90WxbTUI3UawGawxgOjRW4umx/OGSsESQ=;
	b=PQoxdj7xKwvA1lNkEKKIWw8Ry07gqvI3YNtnZeBOg0hrvwpiiQ42fPbsm3kj9OGuHI1g
	 HvpQnlKNk8Ifaaq6OHtdO/MGaxPaLvgNE3DVBrLD3n5N4aeu/gkWGE0hwyM6b7yBlUSz0
	 U7DwR1C4/xABhjGxxR/qzA+N7kezqGuEdhFtbq8A5yKiO/yvpZ7IoDryv8lowcLaFNj7b
	 sGv2R4MNi9z6peVPmaZLl+7oqbrcxgdyZeyPDqW1QlasMnjYOBgeWPg3OCM0mlnshAaGN
	 rlv2A15tqmf63lAU4gLuez6dX+eTGzn9wEyO5EUxsz1U0pR131bI3/h6elL1rwB7G2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ow+gqurj;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A222606D88D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A222606D88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ow+gqurj
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac6971aaebso325285a91.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013055; x=1793617855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QW8Fe3Jy6z90WxbTUI3UawGawxgOjRW4umx/OGSsESQ=;
        b=Ow+gqurjbg8zk/N2U40hrZhhO90PZ8XpY524EBVLU/qKQ5k2GcDjNNN9r5uDjc8cxt
         sH8ZkvfFzXGv9nuqC7ujdKSTSPOXYChlNzRlxoIgyBfsPK4zVXz996rxeEwL8mc0+x0v
         xV7h5N8/WeYiPmpkkfuL2XQ537/wdIwuHdisNakfQ8V47s+aYpZmqnjG07g8kYrvijP+
         3Ysl50akL5H/UPr5VbUZlXMJUPFlFL5yCrILp3doRWhVWhMgapWG8kamDJezbEXCOLAq
         CPVwPp8513u0WPKNcwwz4w9IeRZxemrP4G3L6BTioIWnLCYKAMQHaxnxJHvRdZJK+aDK
         jNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013055; x=1793617855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QW8Fe3Jy6z90WxbTUI3UawGawxgOjRW4umx/OGSsESQ=;
        b=xp3R9rwKUoB5m5LvTr6/ZFWxZqXi1nHFw7GdZmcKrXTp6DXnD/M4RM133JdnEAIlJp
         2HpVDDJaZO+/XtslYWdbRE/qJ2rhyDUX/nnXRXx7Y8in/1ezh5nDnmRmmrQn7rkCIgU0
         tfytdiF0rWpn38+VVjvLTdWds+aTHX+CtkdpvUvSkm+spjooXMu11R3HehNkbowQRBWe
         LyTY/jwwh8RDP3X7otXDs5G0vgBIWsTfrqW6w6uO0UHGcGmlzEEIbyJS3v2xfSCcJAur
         V4X2lvEAI66HgkiwfHghpz4bHoNkAEGmbAAXeejTTHjfhvK0lP6ImTLueoiFMaXJbnxR
         x49A==
X-Gm-Message-State: AFq9FYIs6zNmiNi2XCt2Ww1Tp5QXrUc3Q+MfYVnUApztTAtsYH4rSZ5U
	lfC29ojI49g3/BYtooUCFQfv5gSDgFRkW+wH0RX1xGb+FZ4DWrMz3WbTjFjmgYdVzM4=
X-Gm-Gg: AYBFou38hobTzaIEelkPZ3CDSgn54h1yZRmbTT0QY10VTYQYkIejGVxxgl3G/VE/TdA
	VVSLRjLyfhoMWzRlZUy1DILWWywPyh0cmt6zZOhToPSQTok1xZ9FY32wvqrla1DQr+h8+W+cujX
	MWjSUGXjiY9NnRLPJEe9P+WA/pRQjRZUxaZTj6d1e60GSt6lNeRUXjCXVaiJcFHeF1BnuvR1tNf
	Gxvt+aWNl0ZgoZDCIK9TWImmOuICjiWP8F7+SSrbZ56INdfWdygVYwII5fo2N8SY8EgPDG9Sa31
	rG6+jvOtUwLHiEDvKqv71W7K/bNmNrUTahjeR/VlxIHIFOnS/mS8SKN58s8mgkeBC2wDc1pcQHb
	+ZDmBii40opKpr5Erg0jAAL3pT6iHhob3h1AwihCuFMPOniesooGFa0s57GEqdXtaNFsrFCVVlB
	Bhofj3PcOFST8J85gaRsRR3KlUt3ACQ4+yrxB17ndAf5SmMET0/AvoCoyMoLMUz5OON6o+k56Su
	5anoi4rTQ60lAH+L3kKlvmMuXtuEpjSXrBNu5EVxm7ma/bahitiuzt6kfHi6u22QoIQgdCs/1qQ
	wQ8odZjaSMW88RD847kHQhRdze5P+F2ylcEbCi0adpTpebb50ae5e/YGHoEpcpLCg51hMVUAKDi
	zxyLmRzWjCNikhzU/ZwTHUdjc4Uo3LPPDDEkxLqWweuNM1HA=
X-Received: by 2002:a17:90b:55ce:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3adeb15d0ddmr8631899a91.6.1793013054865;
        Mon, 26 Oct 2026 04:10:54 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:54 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 7/7] media: ipu-bridge: Add a 90 degree rotation quirk for Surface Book 2
Date: Mon, 26 Oct 2026 20:10:32 +0900
Message-ID: <20261026111032.88355-8-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

The infrared camera of the Microsoft Surface Book 2, an OmniVision
OV7251 with ACPI ID INT347E, is mounted rotated by 90 degrees. An
upright scene appears rotated 90 degrees clockwise in its frames, with
the top of the scene at the right edge of the image, while a frame
taken at the same moment by the colour camera next to it shows the
scene upright. The degree field of the sensor's SSDB buffer in the ACPI
tables is 0, and so is the rotation field of its _PLD, so
ipu_bridge_parse_rotation() sets the rotation property to 0 and
userspace has no way to know that the image needs correcting.

The firmware is wrong here, and ipu-bridge is where the firmware data
is turned into the rotation property: it already carries DMI (Desktop
Management Interface) quirks for sensors mounted upside down without
the firmware saying so. Add a second table for sensors rotated by 90
degrees, checked the same way, with one entry for the Surface Book 2
infrared sensor. Following V4L2_CID_CAMERA_SENSOR_ROTATION, 90 is the
counter-clockwise rotation to apply to correct the image. The entry
matches on the SKU of the 13 inch model, the one checked; the 15 inch
model has its own SKU and has not been checked. The colour sensors of
this machine (INT33BE and INT347A) already report 180 degrees and are
unchanged.

Tested on a 13 inch Surface Book 2 (SKU Surface_Book_1832) with a
7.2.12 kernel: V4L2_CID_CAMERA_SENSOR_ROTATION on the OV7251 reads 90
instead of 0, the colour sensors still read 180 and the orientation
controls are unchanged.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8..51ed4283ce 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -281,6 +281,23 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 	{} /* Terminating entry */
 };
 
+/*
+ * DMI matches for laptops which have their sensor mounted rotated by 90 degrees
+ * without reporting it in the SSDB.
+ */
+static const struct dmi_system_id rotated_90_sensor_dmi_ids[] = {
+	{
+		/* Microsoft Surface Book 2 13 inch, infrared sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR,
+					"Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Book_1832"),
+		},
+		.driver_data = "INT347E",
+	},
+	{} /* Terminating entry */
+};
+
 static const struct ipu_property_names prop_names = {
 	.clock_frequency = "clock-frequency",
 	.rotation = "rotation",
@@ -474,6 +491,11 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
 			return 180;
 
+	for (dmi_id = dmi_first_match(rotated_90_sensor_dmi_ids); dmi_id;
+	     dmi_id = dmi_first_match(dmi_id + 1))
+		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
+			return 90;
+
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
 		return 0;
-- 
2.56.0

