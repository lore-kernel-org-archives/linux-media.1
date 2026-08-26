Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52226423E87
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750597; cv=none; b=lfoNnFqD8bnR1AUThBMf7B+mIs9Dw/4pSk+xzoxSIxVETbbohX7vbkZ+7uaKwwqhm5pEBKjBjrjWHNZmK52MW5UZSpTKfrsiTQL9I/9Kgm9f6W/rvaAslnomOHdsQGvSjlKKWKdMAnRLIzTGzs9SnaxsChm2kBgb9x4l3LO8X/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750597; c=relaxed/simple;
	bh=zNg9hW5D8DfY6cxbJI9eBWDVBL+I9NugvrjlC/Bu+EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RlrwbNnNBcozERxQSA57TODDYrwqRml2lj0HzxXrcDNVTIZchcuy1pbKFyO/Cl5rVJwXNETHmCRH9SC8yS1K/+hQ63yrZGXYVd7lrWFMzwDTr2LirJld29OP7sdvOECpXKGpal7295S5zg/x4Xx1PkFYr15WXko+TwQ8gYhvg9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhfodGBN; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhfodGBN"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1756502a12.2
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750592; x=1788355392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKiURqLEO6GLiHVAiPzakCM7/0KgqMwtzahpI4nlMQg=;
        b=JhfodGBNpfg6bZscARG9T3kdC9eRU+3iCEBGesniwfjIazOSVnzKiXAwTZgm5uipGU
         x5V/koSRPCNyz9wjjaK8uy9Z7M7bCrTP8l+tFyAgMym/n7IVNZry2kbRoYhs62jLzE4c
         t7JsrXW2JMG1hPcaP8gxm6ofpqap0oHAKa4CHF7ADhbXl10re199NeGf69TGuIxEhUYJ
         ZAnWPI7m129PUha3THIFsD/rsqnaB2rCxSStsm4NMnNrnXGJmKpRLUM12a0NRc/GiU71
         Y5UpkAKC4yC/GRDRZXEfzcGndc7hugm9gwuXFA8++FjxD7snWZuedHko5lGjBEXex6V+
         KeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750592; x=1788355392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKiURqLEO6GLiHVAiPzakCM7/0KgqMwtzahpI4nlMQg=;
        b=fsdHJdjqo/51DpfNM8+YxqIyE+OUkLWOL6lTAjYR3/aPTj71HTlwN76TGo3HbtpySd
         nyi0yoM5vjfuuPA5t06fb3jTBoXaUMx6+rrtdU53vp3H24fCQ6l0OzZ0leggqZCuTkBy
         HLuUdDKONDDr/sEbNyjrxlptYutqYoYOqbUarIJYKUaDd55PWMRmtOXizg6MX4IdqjSf
         fCfCjlSD+GrQ1Z2kN1rVghMlksWrXNuIsD8ZJdz9UPfRFVrdzb8AxR9W++plfDyhDlZJ
         wPl62CvKei8iDvUg7bhRYOzNu0sYdoRkjhMXg7OkyaGpK96lWCiwzlMrJ9hvy3uXESZE
         85dg==
X-Gm-Message-State: AFuF++mY8MNaOiW4kzJS9/W8XYAx/DAN+DefD7MAYqtJPeJ190amL9L8
	/uYjvj6gi1caIcfvY3PXOjp3UNBiKrZ35OXFDOpaGyH9rsqhRms9t2QXFl9mm+Lc
X-Gm-Gg: AR+sD129KHBFgv/2dovuczPly+HAMDdgIg/kvP7apYj7kbFkIUUi9aa1PKTahpSl8m4
	Qw0xc7tbIfW6tFUhT5UR6Ai2lAkEcJPpQFjYXw5vNmqfAmxz3ZqBq0IF1yHLrM3jZpldHuLKX3F
	tFrJ+sJLporrrUCEXZsKInLm+FAEBk7KwtZX535vw3c0iD+RvT5VOvZ2wjIIO9ieI/RyVSycs5W
	cxvWqLw18rh9OWeR1qBLTd5hYltsntZ4hMiVPj1/FjriBBhw7UARik0UnOBKK3YuqOBG/sYkF0L
	Xeh7PxQvwDXfNgVh+Zy8eq3ZsnyZhgWealNsa+FHh51R0SAj+u7klh4g1L6aNjJO/WimYUskKOd
	uFRM/X8v1WIpsRYG8R0mwHl0VU470Bn1wCJ7gZPJqAieKnUlqa8AC/vsmjX5NIk0V+HFOpg3791
	WmW+aYSKkxKYPHQmfObJr55guRH7AkkoZkweGq/q/QHjr57G4hItuEhXqfGzCaiNVue+9TlSNFo
	Vl8sutHonYmja3ze4ZsrNVlpwjftHZNvalLnob8sE4=
X-Received: by 2002:a05:6402:5057:b0:6a5:dd97:23ea with SMTP id 4fb4d7f45d1cf-6a5df65b681mr8136749a12.11.1787750592156;
        Wed, 26 Aug 2026 06:23:12 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:11 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 4/8] media: atomisp: Add Yoga Book camera configuration
Date: Wed, 26 Aug 2026 15:22:52 +0200
Message-ID: <20260826132256.3343451-5-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
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
 .../media/atomisp/pci/atomisp_csi2_bridge.c      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..207ab69385b5 100644
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
@@ -360,6 +374,8 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
 	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false),	/* OV2740 */
 	{}
 };
 
-- 
2.53.0

