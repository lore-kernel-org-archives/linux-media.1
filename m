Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E5643E068
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565520; cv=none; b=IkWsqA+FvcqHvSqzHHoCbokHE9HJC0bFZWEwxNRVxAZywcGO6mGbewZCcURWQC/ZBwvgho9xK9Gjys1ZOG+FCYq6+pbPJbrKgvALULd40HwBrpsNwECPaUftqmpv4nywr0A0FYlSaGjYF+aalU651hLORsC/BtJJNbe94iK1Lgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565520; c=relaxed/simple;
	bh=/E4JZW3jDM5GUAK41+FuL3LL+1nKExqpNHn60e1vrGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gWh1u81awflBL0j30oV8kgjodPpPMiLR2mTMxBA2SOQcs3MWTqSoiprs5YY98Qd7K6vOFKaVUMAgdl0hOOPX77neQdICulmMhEH9Mt+OB5k4II/fzKtDrsv7gMSMgJm6e4hV9d99bXb9e0FHxFavbjg6RY55XTI6xs1HkoPLRzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiwUoq/1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiwUoq/1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47db714766aso2250323f8f.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784565516; x=1785170316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KhQUN7+DqlY5NuKQZAeeshI54ay0kd3WmgziqyHq2w=;
        b=hiwUoq/1dMwaXlF6z76R0WAP0fuOKHm7YUBYnATIFByl/WbkxHqyFJHK5IxZCwrMjJ
         jQ5T3iOpVeIOoJb6mMpdVo9JBNSOI+8DY4kqHNqm8CJ2e7cRpIO5wIvCPYH/SiNs7mPY
         MGc9+2N2guLG89swtLJb2CyJmoQnVSkQcYYj1bjAFD5AVC21gTEwRmV2iOn7kf6W6cfe
         WbaTgs8gdwlRHzE4u9Py5oNA0TZD/CzjZIyXUhB1Ey/DKSfaUEgMm+R+9jYIuLyKtDUj
         4xr81Ze+4u3OJYCDyVmetLXH7gzr3JZKIU5Kn+wZ8MARwEBvV4SvLjDUWGEY8vKdNm6r
         3ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565516; x=1785170316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5KhQUN7+DqlY5NuKQZAeeshI54ay0kd3WmgziqyHq2w=;
        b=Z/TIQcIN0ys7cU43UG/MELBIVlaXBL6sm5t2YRWMy96AlqMA8Zoy142P5v0XL6EBjy
         rWyp8G3kadqrCqLZAYComZehnXsGLFqhdkh0W83zFtkld7eGNjf6oE6HoVCjsQ3l0woD
         qsKKWzQyWli87me+WCZkXSvKif7DrTDnDbJRIfudVabuE/6k5FaFWKCwa+GPv4xmlFWq
         0ZwTu700IgdE2CQ9M4VgYiy3QSGiv2T5jicDMLZgi7Ke9OM+pVu3JuEAoPmaLWiJxsmr
         R1cXTG5DBTudo+6mckljSjUWMiCk29UVLS1XvlDJGFFaGlGbjXqTGrSHqkOLKmtKHFaa
         1z5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoG1mZvsxnGCNCdgEIlcj0ubT4ObrmzM0rRkK2QZurlp3F9HX/GYFvbxQZd2OoE1ndu58tUSlnIYxFwfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Z91StwskwBy51yWj+grcrxVYY/SlTYuxH8HOZMs5tkZ8gqll
	+6atnlhokbwsfwaivUueoR/x+uD3JuTWg1RFpnk7VKaZ/Lt13z9HX22f
X-Gm-Gg: AfdE7clzoaeisrRGDTgeX85eu88c8q7L/ZRgWon4zM/0L5eaGud5nl1vUSkQhaoWuuG
	Bsf9HYGVRY8IVPiXq1j/3vdTX+q6tx+ZSVNfV4nVC7EaYoATKInC2JNvoErW3ubiAbom0iqWoYG
	047QApKanmLNJdVklz+hUOsiBScjfmBGzqc/jb+Px+BVv1GjRGpsZVB5xkVs5bP23p5/VT5gC5D
	urcZhoNJmFopWwaRJeyojjzMvEnpIT5n8dOXtQC6lecEd2mg86oO4M/tYU/VLKZMjmsDmoS+1eA
	zGODIzeHYgaZ/datCGsAkKtPj5ihBO4juCMZCQT0Ab3BpRTMbESaBpvIc6z1KFGlGqY/Xj4gSsa
	yvombN5VHo0HDu52Qd3Y+FgAGWFGeIGHcIGBh2E7WoZPV+31W1r/lrp9LVrP+Ei+0EaNgFgZp4H
	ccY1LCmBFEXPnhRoSaWiL/eZzB0Ko=
X-Received: by 2002:a05:600c:c178:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-4955d6d9f9bmr61667515e9.0.1784565516090;
        Mon, 20 Jul 2026 09:38:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:4352:bba7:6d7f:5f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565373608sm2105325e9.6.2026.07.20.09.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:38:35 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v3 4/4] media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6
Date: Mon, 20 Jul 2026 18:38:19 +0200
Message-ID: <20260720163819.104130-5-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720163819.104130-1-fernandorimoli11@gmail.com>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov5693 (INT33BE / OVTI5693) needs its MIPI clock lane gated while
idle for the IPU6 CSI-2 receiver to lock onto the link; otherwise the
sensor streams but capture times out and no frames arrive. The sensor
driver gates the clock lane when the endpoint requests a non-continuous
clock, so the bridge has to supply that property.

The same sensor works with a free-running clock on the IPU3, and other
sensors are unaffected, so add the "clock-noncontinuous" endpoint
property only for the ov5693 and only when the bridge sits on an IPU6
(matched against ipu6_pci_tbl). Non-PCI bridge instances (e.g. the IVSC
mei_csi path) are skipped.

Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 30 ++++++++++++++++++++++++++++
 include/media/ipu-bridge.h           |  2 +-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index b70d61099..98773a99a 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -8,6 +8,7 @@
 #include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/mei_cl_bus.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -15,6 +16,7 @@
 #include <linux/workqueue.h>
 
 #include <media/ipu-bridge.h>
+#include <media/ipu6-pci-table.h>
 #include <media/v4l2-fwnode.h>
 
 #define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))
@@ -383,6 +385,25 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 }
 EXPORT_SYMBOL_NS_GPL(ipu_bridge_parse_ssdb, "INTEL_IPU_BRIDGE");
 
+/*
+ * The ov5693 (INT33BE / OVTI5693, on Microsoft Surface devices) only locks
+ * onto the IPU6 CSI-2 receiver when its clock lane is gated while idle, which
+ * the sensor driver does when the endpoint requests a non-continuous clock.
+ * The same sensor works with a free-running clock on the IPU3, so only request
+ * the non-continuous clock on the IPU6 variants, keyed off the bridge's PCI ID.
+ */
+static bool ipu_bridge_needs_ncont_clock(struct ipu_bridge *bridge,
+					 const struct ipu_sensor_config *cfg)
+{
+	if (strcmp(cfg->hid, "INT33BE") && strcmp(cfg->hid, "OVTI5693"))
+		return false;
+
+	if (!dev_is_pci(bridge->dev))
+		return false;
+
+	return !!pci_match_id(ipu6_pci_tbl, to_pci_dev(bridge->dev));
+}
+
 static void ipu_bridge_create_fwnode_properties(
 	struct ipu_sensor *sensor,
 	struct ipu_bridge *bridge,
@@ -463,6 +484,15 @@ static void ipu_bridge_create_fwnode_properties(
 			cfg->link_freqs,
 			cfg->nr_link_freqs);
 
+	/*
+	 * This must stay after the link-frequencies above: the property array
+	 * is NULL-terminated, so the entry only takes effect when a preceding
+	 * slot is populated. All IPU6 ov5693 configs define a link frequency.
+	 */
+	if (ipu_bridge_needs_ncont_clock(bridge, cfg))
+		sensor->ep_properties[4] =
+			PROPERTY_ENTRY_BOOL("clock-noncontinuous");
+
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
 					bridge->data_lanes, sensor->lanes);
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac7654..48eb1e270 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -141,7 +141,7 @@ struct ipu_sensor {
 	const char *vcm_type;
 
 	struct ipu_property_names prop_names;
-	struct property_entry ep_properties[5];
+	struct property_entry ep_properties[6];
 	struct property_entry dev_properties[5];
 	struct property_entry ipu_properties[3];
 	struct property_entry ivsc_properties[1];
-- 
2.43.0

