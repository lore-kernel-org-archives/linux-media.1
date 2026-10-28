Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186546;
	b=RUdm/6FSBXEYowX1R2A3hE3x+4tpbft2NPt6IqNYDSlw8yJv87xacDGsiuIO9BE+eXIn
	 f6nz0388mN5vN0MRvFwEpkKVU1S5GSI8DmMC31z3iTLKTh/exUeO0PHkZb44FmJzwQD03
	 /KscNgmHbmMrRqS4sBy2xv969zCYd1Y2ohEtTW4Bb2WEDXL7YeW18cHQ6dzH9Jg4vp2kh
	 ++Rp0BAPs84nX/1ff6bjORp1wLc0/l850I/+4qDQ8PuFuMGkxWGK7p2BalL4+2Ym1wjso
	 8Fgyg6tueIf1QL/MlLfs9Ok9jvvfgl9VuP/SgXXAw7sWmbXEWZLzP7gHg3HSuGpsAuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HA8x356X2rHAFXxIztH0/QMR8pHLzCZg63CGgLWRSjM=;
	b=HBwQuZHbLZxIy6pmIyv9Z4TjV2Zbx0Vl4y5NhscJ+nfoeXfkxvCBmwNcqyyD8avTawnB
	 iGtD39oRcYCf+/2NVokPscjBsVur1TXcd7YiJM0SQcMp39T6F6BShWNE6Cqme6XOkkL2r
	 szCH16cnpLrZvS2Lit8kMzYHmiU8Jl0Wloxnl6YeSdolX/2NsZHd8iBiXsIE32+zlomv2
	 6JpO4aO16qQ5JIf8G6ow3haxZ1KdOpia4xmYHM1gHhmmgrYXkNKFBwDBl8JoWR6CFat/2
	 pAg1wjcwNuGkDrYcnUpX5ip7dpUu3DDwHaHngFbVx2JFZJqUhMiXofRByzLncguP7uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qabGGD3g;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D675560A2624
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D675560A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qabGGD3g
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d01548ac96so1581345ad.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186545; x=1793791345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HA8x356X2rHAFXxIztH0/QMR8pHLzCZg63CGgLWRSjM=;
        b=qabGGD3gIS/WhzY9u1lpL/KtIWoVID8b/hfBCmdosf3En+HdoIxQxQsTzAXYvkiZtX
         HgW0WXI3lqx2xlyJzSV2EK5lZ/OWe9RwifYz5zAQx9W8XmCZnX1ZTa1+0GyoQCb/yJ6x
         behH79xhlA5QrTBmbEdu9QMgqo3V6NiN41meKCpVNG0PyJO9+fPWy0JkKLQgApwFUGCI
         iC4pjC5bpnYTSQN4H6RXRb0zNntt6AFWbDGQPcCKjBcgLgCnYY9uoJtdnmK/szlJgssQ
         LO2iHe80WBYH3nuZb+QkLOtcqI99TcBK7S+SF9OI3H1WuycfiP1iYw7iuCQtsY9awzpS
         WaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186545; x=1793791345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HA8x356X2rHAFXxIztH0/QMR8pHLzCZg63CGgLWRSjM=;
        b=GnHCTaF92JX6MhyKRg3ln5EdDR2On1S5RDb5kGih1URASjVDdQSHiHV1XpatQiOjus
         m+TpSrLRNRfFvpcfiQ2dB1el4Cb9dsSvZMpqUolAMYzUhA4bx+u2Fq2IdqhgRCMKcCyn
         oOs8As7dLSLKriIwauhjRo/5Zr5+fCGv07mbvy5cZVVr3S/MMfxfMeHzyg93kMSI2yee
         n1KUH/4bJFr6jElzQCTdEOlUiLxTn22r3DidthL9uZf3XmGEB5MAJ3i3JmJPyxUHBxBm
         mwiAiTx1I8hVe9fssg/VcFyf0FG6jy7w3FDPBeTW+KPffID1oacFCuJrmtHOi2NJntV+
         c3gw==
X-Gm-Message-State: AFq9FYIq3tfkUBTGRyps7NDGpptNFEKvboMZ1t3eyfgRwmAXGoxVwenS
	D2G47t6Vvf9Y4zV3SGy8vcKvxtMwEwaj41jeODabzVfW6uTUHkuE4sa4rxhWPrcLOrY=
X-Gm-Gg: AYBFou19NQ8dL/O5RIDVMS7c2TCu1QKHw6fTqnq3yo0rG0r19BiAbR0ehyMJIEiCXQY
	66EsBZsh9gYE6h9iQfjbxm7H8rWbMvWreS2vH54q6ANsbTPer5ziggamaXjSirtlA1HrgDNq1j5
	NP4AvXxWAxs2NmkbFYOzWFLyVUuQwqKzuClLZvqZLrKDqMKs70PX6pF7trEyl/nLnZpSd/duvhE
	IATJwxmBuaOgV9la/DzspOKF93cLZFEwozEoqA4KprydUXgmWPlxv+MLLX1gbYj2XlB+xhhx7Rc
	mR5ERILIsPiLLdzRewDBa3kPsbaooESoVqMTPcdRvrUtcPW1SeEgc0VMLm+h5Ae80x0Qpr8NeNP
	Z81w9JX/pz+8Oanyy8FPLTLs5wNWePshSVcOFqPO9fkrcty7YDZOFQk5n1sNR95UtF0DlYqh8i3
	KuH04njThdRIQQVECuLX5pyRl8Cqa7mTD02PoYFoV5/stKi9WJ2IDktWwEOoXfTC+v1WcmTCMtm
	Mv+rU75Uvke+kpH8py80vhZni0Mhnb0p2pFJa/h0Dy7GFnoZZK7qJlwBn7/ubKGwOFWun70+rZH
	btN/bSsmaUhaffiJgyYCNtyG1FQbxOFWC0wBFcUGnr0ALr+9cyu8y7eKlhE6yMx33rc7ZWhGIRy
	iC+JGUDiS5oWMmxZ0pBjM9HZrXJWsvCZaJlf7JC98asCXQQwfnMHMzhp2HNJ96BPuCSOd47c43L
	SyjKb/SWAKvF4mc0oOfK8=
X-Received: by 2002:a17:902:fda7:b0:2e8:3cf2:49a0 with SMTP id d9443c01a7336-2eb002d8a60mr33561575ad.1.1793186545094;
        Wed, 28 Oct 2026 04:22:25 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:24 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] media: ipu-bridge: Add a rotation quirk for the Surface Book 2 and Pro 7+
Date: Wed, 28 Oct 2026 20:21:54 +0900
Message-ID: <20261028112154.855185-10-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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
degrees, checked the same way, with entries for the Surface Book 2 and
Surface Pro 7+ infrared sensors. Following
V4L2_CID_CAMERA_SENSOR_ROTATION, 90 is the counter-clockwise rotation
to apply to correct the image. The Book 2 entry matches on the SKU of
the 13 inch model, the one checked; the 15 inch model has its own SKU
and has not been checked. The colour sensors of this machine (INT33BE
and INT347A) already report 180 degrees and are unchanged.

D. Manresa measured the same rotation on a Surface Pro 7+ (IPU6), whose
infrared sensor is also an INT347E: an upright scene comes out rotated
90 degrees clockwise, with both flip controls at 0 and the firmware
reporting a rotation of 0, so the Pro 7+ gets an entry too.

Tested on a 13 inch Surface Book 2 (SKU Surface_Book_1832) with a
7.2.12 kernel: V4L2_CID_CAMERA_SENSOR_ROTATION on the OV7251 reads 90
instead of 0, the colour sensors still read 180 and the orientation
controls are unchanged.

Link: https://lore.kernel.org/linux-media/6ae0f151.0f9a9df6.1cace3.5239@mx.google.com/
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8c4..8fbcd8c5b245 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -281,6 +281,32 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
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
+	{
+		/* Microsoft Surface Pro 7+, infrared sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR,
+					"Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Pro_7+_1960"),
+		},
+		.driver_data = "INT347E",
+	},
+	{} /* Terminating entry */
+};
+
 static const struct ipu_property_names prop_names = {
 	.clock_frequency = "clock-frequency",
 	.rotation = "rotation",
@@ -474,6 +500,11 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
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

