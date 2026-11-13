Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537731;
	b=j2g4qiHssRNSzmCAkiMtecOZraZO41ZJAcDusMr4dj4nsMxmhl4sxvA6mL6iZPYosFyz
	 Tcv9Ga3lS6UQrfvZhEslXkdm8q78KnD7PciyPdoADfiuNj4YiUrHSOUux6eLWyPLdRtVx
	 RfFeBbLDQlAt29xx4jaPfTz7ZRfMjFv8zJ+b3qb85j8Of0L/RCQoVstj1xwCxYGoOCJBB
	 wH5RPEVkg0It3bZJP8LphlJqhpcw2QY1XCt3jO/JD4gR4LxM05sRt012GguFjv1mrztw9
	 RePCAamt5//il9mrbJvnNX5adinx2fUin2P/ZqmOH0+Fga87p7PMsbkHfIHBiCgeX6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J9bo27w1tv3uLc7xIWUJEZ/K3SLyBdVdWXM+xU9HBfw=;
	b=bBjHLu5cSlebEjxmBO0BagBYuntpe/ZFK+3O0Sx5XtDM/eW6zuIHnGCsGzM3wk0Ba4L2
	 xRiSPOrTv+LAdjbSF3/Js5hg7TJsuTxLHSO/7YBjuySrzBlNN6qGmYAalYSxBSm3E32eq
	 RwSg7D5eAWDeZ0QI0o8f1OdzUIgxgJ9K7os9CQH1VT5j1dKTYUVdN604cp77bGEH2gTsI
	 ENRewaJQ5W7BJaWSd9MBbbT7BCCW9ZDdwLp2yxwBJUXlhe28fUphwHeX9VAx9DjInUFxx
	 2Qz5yCG6gJ17UKYTZHmTSvjjqkD7R9DS5iAnh9gnqXmJoFSg5LOHg57cepUFxPmqIFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZhAgQtd1;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B3A60A2608
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 02:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17B3A60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZhAgQtd1
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dc4797082so60974eec.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537730; x=1795142530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9bo27w1tv3uLc7xIWUJEZ/K3SLyBdVdWXM+xU9HBfw=;
        b=ZhAgQtd1DgbyePNCAx4ShfZbat3pMUWupyCr+sIK5tekpz6uXxvS7GV0X5IItQawJL
         bi0gwOK809id9Hxfo9oGcO5tX9biL3A9HWU+ntj+EYJSkDhvf9gp3PMPzjn/qWeSVBq1
         0fU3nErKMMiP/94fkZ1S1DGfoaEhTHGoyBB7NsA21laQfjp9q4v6l5KZ/kX5ArYweZVS
         38HQP4wrA/tJf9D2Gmz6iXhU+O3x4Bc9cIf29cBmCuMe1+lQy8qPyJKC5vHBEUlIsSe6
         A2p3SnFhQtrT42tSiJKp/UljLxdReWg34NPQ/2ZFJuiPQI8FSZPi5wPBd1UkMw7ibLf9
         v81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537730; x=1795142530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9bo27w1tv3uLc7xIWUJEZ/K3SLyBdVdWXM+xU9HBfw=;
        b=fPvArfkZriAuKgK+COzDrf9HX1Eajqk8cNORcqpAd+78rggykpjPAieauSpAbxHaHL
         SEUsBvKcTTT4sGJDklEqqWIabcKSmRy1TZjTE32q9TqQOeHr4x5c2VR1++syOBEB7kju
         PMhJnDo1FMem+DFU0XXlWvgxdw1746buBvsgznfcVxqDZxyIZ32RC0qy8MMvmdwuB9Mv
         WnMnEqTcFdIAUPwRwVDdJi1i0wse8TwhsuVP/QH0nPOJ9LifWnURW3UpH7ujyHwbbjyA
         Q5gyU6dO6Ijy5f6K1qj44xj/zDyOXCof5yf9td0UOUqN6Mkc/ufcvKifu8UYp+PtDdoS
         vrxA==
X-Gm-Message-State: APuU4Z8zqPZ0nbxWg0SO+dHHzdMvhDMv7bIxSvgdzo2galBkzDT//CX6
	xmkYZxTmGBlm0kPe8o9r+rlSB0x5fUL1jMuauZL9qEablyP49TEl61dTQYT2CyZFar690pGL
X-Gm-Gg: AYBFou12EpI83HisSIetBuV9zIv59pOgBe2MKu5sJ+NCeVmZMP+1JPm8Q+wQjUZMZT/
	mfygvZoFIsoONpKEgWfY+K0uQZjVtlotIKePZgxoL+EoXi2+rlNMz6IgUIYmoglNrY8oUIrlwIl
	iCmwXJAKDRQqaBG3fWFu9GM9CMWHCo+xsvJdMxTCOH8yfwwmBoZxdtegXO9ZDe4v3+ZY4ShAXCM
	kI//UORo87Ge4rGQqtlXQk5IRKp5ESokaqKXKDcltCEBd0UXpYujMEUFrI8r2zliTwhJnVjlO5s
	QmndvZXCLlEFs0Ah1gC/MbjP9dNO8rJpaUjQ4A+OnavK6ygsqw42QdPb/8xEeP1k0+QuYchuiGD
	QQBgb70ycti+FSQMUQVe3dRjGnbNYCmQL+6H5+H3xnMIq1pFougCx+Q65gUTKR5J/2/kyJtQVHf
	sRLjrU61hOftXW9tNBynh91UllL4RanKmM/+t4i6vqhGCH6S3FpSHJ5Lx/rAOC1VmkgFigxSHm4
	+VvTaVlsO22u0A1L86Pzd3Did7IN3B9yyLnsW6n31JB142X3UfSletJ34ppFDKXMhxMj/zwjxRP
	kCXh6M2OxIvIDzArUgHJoG+LAbkfXVVaX0Kwik9j0DW0oYRM/y6NRTHHwTX5DIuvmhlCn24F351
	O9LbmL25Iimp6mM8d18o2X+otOalrh4v6FfK/aMGnbcXYohonvXisdRX9xBU/F6N2y/adE/qfih
	IUnYs2xQg9mg==
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr1903689eec.2.1794537729999;
        Thu, 12 Nov 2026 18:42:09 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:42:09 -0800 (PST)
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
Subject: [PATCH v3 9/9] media: ipu-bridge: Add a rotation quirk for the Surface Book 2 and Pro 7+
Date: Fri, 13 Nov 2026 11:40:59 +0900
Message-ID: <20261113024059.1087031-10-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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
reporting a rotation of 0 [1], so the Pro 7+ gets an entry too.

Tested on a 13 inch Surface Book 2 (SKU Surface_Book_1832) with a
7.2.12 kernel: V4L2_CID_CAMERA_SENSOR_ROTATION on the OV7251 reads 90
instead of 0, the colour sensors still read 180 and the orientation
controls are unchanged.

Link: https://lore.kernel.org/linux-media/6ae0f151.0f9a9df6.1cace3.5239@mx.google.com/ [1]
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 31 ++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 5e419c7b9287..cdc6c8fe30af 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -303,6 +303,32 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
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
@@ -496,6 +522,11 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
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

