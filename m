Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0483E49FC
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 23:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872677; cv=none; b=r0cOClNeLwIIJ6J0On+GwmU8NRJIWBI64MEtCdhIsNcg9D7kMpPJLPU4rAk6iTSfJDxDaZsQiA10pKa0s00G24JXpHROR7F/XmS3C8RsG2m4eZT5kR7edQQqSTD4jKPewuMnQfRV2GPkez1mJf2qRmEP/4hFgUVNVnW1/2WhFv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872677; c=relaxed/simple;
	bh=pljKBt0ZqgK/u5wnmw7D7yDX+T1Gj3r0Q4vuQLP73RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLV4CoJQgHrWMsrT7TNjlD9oaeJADvPlr2XSZ/DkXTeqz2Kt/cGspt191d6Sy7C7H0K+j99ewllR0L4pxpNWsk0dfg++g3P4DnzhB74opAENO49tVmyklRWVh9u05iQt6Oxt/HNA1jWSYc3dUn0XGQTpxNsn1liyRBAS+qwlyIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e02eP1kv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e02eP1kv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so2537355e9.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 16:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872674; x=1788477474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhopT/io3eKO7wMhXLgmZimKetvp9lSHGdET2Xvt3oI=;
        b=e02eP1kvbjyHxDPa2snJui0VnGWfUDhp2ja5ddIkJvbFsXJJ00xuKVKWDbes7SUVul
         iiaTT1HxQt5VmqY7lqotm4WcreO4vVEtJ3+nobfCYYfRc/1GZ6hw9lOFMelQmpyRA9kE
         zGXr8PeKIEWVLUG5omDtjO3bzGq200yexN4CXrm3GxsQmBH1LIKifNJbKPMX0Di6ipmO
         d/7hxrw3wXG2ZpcjduXb4T+qB4aNfgNPKwrLW4qj24LQhx5wyPeS18pkNBEVTvNdohrx
         MPBQ0gJj1BNznU1hUMnpvxoZIONF7gb+HDOpxqmFPyBrXR0X0Y98ViXHj3uzraVHSBOV
         x4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872674; x=1788477474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhopT/io3eKO7wMhXLgmZimKetvp9lSHGdET2Xvt3oI=;
        b=igDWR3vvEdFPHuaMa5q2k0Akc6KAMQe1U4596wGQNZXAQGePAFTHm9pOJo8FCe8ncH
         xPK0qLMywL4NEdOzqTRZnB9VyKp+XLJ76H2RVWSH7IYVwb1WGEOSIqTgAqqhUcLemr0z
         INR/vtBX7RTaXsrEl6p1mlOnHbIoYlkX+/Z78vLLSc8hst5us9HB5M+HizpY+OIv2tHj
         DCJBDpVcOLndxQL8RDCAlqpXKp2DBDntZdirpHab5/jRWDb0FJSfrSowuQrRK72+mPuC
         IyLD6ntEDS7jsnF1HgyxpH5dP0msjyNKrGQwArvWQ5yohUJp3b7C6vLA2BKCP8NU9TMl
         TFGg==
X-Gm-Message-State: AFuF++knszBX3D1HCdyPFBgSj4VWiN3yjmksLxvvdZB9jIKb+5Out265
	f59bMZa5x3lq6gi2e80atzc+miqJ9L2OvZrOZmF/yQSo38jjHvbpLmDTVS0jsLFc
X-Gm-Gg: AR+sD13P2mFU0cYwY7CRudyk5Ie3EzBpf6BDE5rk+XlibdWCvtjx5NCB33Q4t6d7asx
	ipgzIpZLj9B7IHyoMq02jHfFv8bqNCwldS0WrjLinJEdOEdgDtmgMG1/ZXPNtfeEvPHhxx2+mtY
	E7J1IdGoaDt+5lSjdnFPcMMEDUcd3HD2iw3kjS+VDaeqLuZmguvEw6D0zT95svPNupBDmTOLQKE
	QvDTq2gqF4vGrCxOxmDjDkHUJvxjGPkqQQ4KkHh2UJhMCCnwoea7oRu4bhHuZ1oWk4a6qPHREUf
	syBFiBkyrb5VgtLa8zA8gbhTc4FyEmAW1vQjuJiMZZYdu2ARBLPD6UpCAsnfwKWXicfpt31ZEco
	FNzXj3xbBsIiru2eEwicJk/ijY07+zd8WfYv7hee/OM8QCen1jXLMsNdi62gzPkAYbtKs8ClFsf
	7h/7xlyC2mC75tpkLe5gRjTpfbFRBX3HUiWN/32ApfphiX3C6+QYZ0TPCnA0ntbNS8OC0hSiT41
	/yvYx1DcO4rpX3oxUsyHSope7WLEqwqmqn5TjSJm0M/
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49b91c2777emr36908955e9.7.1787872673685;
        Thu, 27 Aug 2026 16:17:53 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:52 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 07/12] media: atomisp: Add Yoga Book camera configuration
Date: Fri, 28 Aug 2026 01:17:25 +0200
Message-ID: <73d7c2b008b55c418a556f01d0e19f11e6d71414.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator; front OVTI2740 uses two lanes and no actuator.

Add both sensor configurations and a DMI-scoped two-lane override for
OVTI2740:00. Keep the quirk limited to Lenovo YB1-X91L systems.

Binding and media nodes do not prove streaming; both sensors and the
focus actuator still require physical tests.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..22e0a48f2377 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };
 
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -359,7 +373,12 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
+	/* OV2740 */
+	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false),
 	{}
 };
 
-- 
2.53.0

