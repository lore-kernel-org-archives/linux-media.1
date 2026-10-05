Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354C5377EAC
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184247; cv=none; b=mPAYWr+laH7Z6rCB1uWhpqtCsFxvNO5Ha4eS4zlwj2C21rLNSZWa8DM7mcqc9HJMLIHMXisR62I57Ii8E6SfBObZR9/UACqO1XnYkA0B/2qlfR9Y01Y1CtF0MhVWZ/UTtIDblR5JoMFdF2r/t+kCLpwhPTB2B+UxkIy+puonJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184247; c=relaxed/simple;
	bh=DCokXdATGPIggSgFw3/QiZFiz3LeqkJtGjMK9ckNik0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOQ9y3xKo8AiL3FUh0k+DD2asROyyCFX2SBMNwFnA9hUruF5+z4jnDLs2ltgJSY310A35+WGjNC9KRv4H9w+1N+pPe4zXT6R3KDro63zY+NKyL1qt2oqLtUdzp60Ik4gbjEB543LlQy7PKQXhzu2gHlobwZWuoiI+O4DfUyARGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQWh1fjK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQWh1fjK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so7744585e9.2
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184241; x=1791789041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yp/IMZwSWJ7KU6BBKiPJnaYZoJ/BB8B0UGfzVWC27XU=;
        b=VQWh1fjKwaJYFDckIA39+mDWXAkvtbvw+X/y1lS+vncphw/+CrWWxkAq4SccRuCrNH
         ebukjYyCnmxUUI/Q8/n5brX3wxarUmQ846jW0ImC9b2udbecIvoolpcvrHo2xgifJYBn
         /v4jXTnbg0Vtj1Y2+oLk0kHpEHsdqsf/CsEJ+Cd8pVPuZhpbYk62twTWvQA+6ZbFsl1e
         BykjfG1dtd8IB8J5NOH3AyVBwjjKtJJ5xVuUEiZ1Oh5oE9LR10WHPFIEnmKQcJyZ1XNL
         ucqrlT4Dlcz1yb/JUxbI63kd2lggDm1z5OOQ5n17TjCsbttI0i4tiGW8Y3oNiEvIPWIT
         kcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184241; x=1791789041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yp/IMZwSWJ7KU6BBKiPJnaYZoJ/BB8B0UGfzVWC27XU=;
        b=MCH/q/R67QXF+7tFZNEJxTILMs9uQoXWdZ7/DHtO2AZF1VY/KcvGZI6w+5FLM7vdHB
         yy7ZXEYEGt8VdcfNBDGm/r7zQycsiqPlTE8uRTqkMZ5VWb9vqgunXWZiITa9rwESEnX9
         2wwAKTZCZlc3cOpJqzlEhOcSWFxteDbzZIYpmDYSfSahbmNQcEAZuXbWCeMOiRtfmv90
         4KtWK3RvgvdcgERMV0ILT2FnxuwtV9BJbm41yX2QxwLD+yh1thT/0MSLAVUYwMBC00ON
         8eWlEJ76fD8edJW3y95P2OqDIGcgYCQeieuRwm8Z67wbiCEE4n/ANs8vHaPhEPF83G02
         SpgQ==
X-Gm-Message-State: AFuF++nH2RAEu7hrXGI42sJbmsQRrLRjvaTf8FSwUcPO9XTFwJ6NiPz5
	T9Fu0GtK4DmMviIudNgBO8XKE+7ed7r10J3zzWrghvYgI4cEhzohUlXAv5w4fKzl
X-Gm-Gg: AYBFou1wgQV5CHftrDJNtXhSR8mSBl9tHFwjOZ1NfkMuo+3grx2zF1iK3rzHR0tExYi
	SKbV1HyWJLmioQH1ATqwoxdy2KEUt+sTlgmNfTHGfJq+tTinrSS6l+01k1i4t3dJABAVyHSu5ty
	AoCdc2FSBKL9vGmTJAWCKt1jOGXeFBZ0wtU2deRyR4jz89+55vQNiAh5arDTbwvCtMlo6vir3j4
	VhRjDPZmLhCEet1LHhh+9p45HTzvLF0NLMhASVPe3gsbhFZ4ttZXlwW3HmyuNOE05iT1jC36CEa
	xfuDsXMb+o5QClXhegZfEEAWN5so+F2FSYc+mzsWK+C9dFEPk6SdTc+A9s63QnCMoSE3RlbPZYQ
	r/VmnvNCRRf4rXZkfW3n1nVQJBYpSnW9zzLs6oVA19foRxcH0yr0hV2j+v+yRTW327RzyQ/WUb4
	YSwZnuPQKONcWsk8Xocp0rvnalRIi7aPO1qWpXwxRbfk98J+XxD2JOPXb/SHY9xClfdgY2EZEWq
	QKo+jcApOEMhbNMIhnOFeze5KHUSe/WV1YcYX4xWr9Hwbw2ouhCxZ6sWvdErpCek9JhZNFRrpxG
	yO5S0u0QE1I67K75fBsg9UC8pn4aVWyWFoUX
X-Received: by 2002:a05:600c:5391:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a02769a99cmr177202295e9.33.1791184241452;
        Mon, 05 Oct 2026 00:10:41 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm316749855e9.14.2026.10.05.00.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:10:40 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v4 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Mon,  5 Oct 2026 09:10:10 +0200
Message-ID: <20261005071010.7191-4-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005071010.7191-1-robertbozik@gmail.com>
References: <20261005071010.7191-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sensor configuration for the OV32C4, matching the _HID the
sensor enumerates with. Without this entry the bridge does not build a
software node graph for the sensor, so its driver defers probing on the
missing fwnode endpoint forever and the camera never binds.

The SSDB of this sensor declares a VCM, and ipu-bridge would instantiate
a dw9714 client on the sensor's second I2C address. There is no lens
driver there: the address belongs to a register block of the sensor
itself, which the sensor driver claims and needs. A dw9714 client on it
takes the address away from the sensor driver, and dw9714 has no id
register, so it binds to anything. Do not instantiate a VCM for this
sensor, whatever the SSDB says.

Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v4:
- Do not instantiate the VCM the SSDB declares for this sensor; the
  address it names is the sensor's own second address, which the sensor
  driver now claims.

 drivers/media/pci/intel/ipu-bridge.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..a0ba323d4 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV32C4 */
+	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
@@ -217,6 +219,28 @@ static const char * const ipu_vcm_types[] = {
 	"lc898212axb",
 };
 
+/*
+ * Sensors whose second I2C resource is not a lens driver, whatever the SSDB
+ * calls it. The OV32C4 keeps a register block of its own at that address,
+ * part of the sensor and owned by its driver; a VCM client there would take
+ * the address away and leave the notifier waiting for a lens subdev that
+ * never appears.
+ */
+static const char * const ipu_no_vcm_hids[] = {
+	"OVTI32C4",
+};
+
+static bool ipu_bridge_sensor_has_no_vcm(struct acpi_device *adev)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ipu_no_vcm_hids); i++)
+		if (acpi_dev_hid_match(adev, ipu_no_vcm_hids[i]))
+			return true;
+
+	return false;
+}
+
 /*
  * Used to figure out IVSC acpi device by ipu_bridge_get_ivsc_acpi_dev()
  * instead of device and driver match to probe IVSC device.
@@ -435,7 +459,7 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb);
 	sensor->orientation = ipu_bridge_parse_orientation(adev);
 
-	if (ssdb.vcmtype)
+	if (ssdb.vcmtype && !ipu_bridge_sensor_has_no_vcm(adev))
 		sensor->vcm_type = ipu_vcm_types[ssdb.vcmtype - 1];
 
 	return 0;
-- 
2.53.0

