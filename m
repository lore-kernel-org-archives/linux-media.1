Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267981;
	b=piEppXKmrvKsg2kgOLg+Cyh2FNmpDYPOp2boEjHm/7sZ1yJSYyhWcXtNPtpks8jqVqLn
	 CGHsXtf6SdTBKmoznjD+PzzGm4NiSYzXis1BKVO3A2jSiPvC19RGLntRKzkShOlxSlEyg
	 ZQN9VpPcapviNEy0GHBs/fgTqpqWeUQjxirKfnV4OFEJaq4g8opYJXaZHqSKjmJNUZuw6
	 BO5nz7GUuqVV6LYNe4sFzzl+qVRClqw14sIWNndRQKwlDwP+ZU26ExZxGMX5wj2KZzJjX
	 Sz8wrPQ3IQB7eHAKaPzvOtBTbJLJ+5ZNFvD9Vn4D4IArxLkQfdEz0lIdK9GWoU+vY/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VpH7vOBV8zTAkCwE1fdPUsN34Rs/B2a+/bMMRlSHON4=;
	b=u8sellbBbVFhw62vu9p0m5PTXWe8SsKPxPGYiBOVOdCnJUYGXobUV6lEWb0dt6Nnzvva
	 0AEai883zosuPZvIILnAEk0dwGPc2rY9jmUm/FxLudA10zN9Dd7kws93GiBDVwwzCJhQs
	 g3saaTGdGUksbfBzmEHTwmmKaoHKSKQZk4XVK5926vysOvjMOSzzEBQURU0JXJPRYcbPs
	 /kAN5vBzbYPZ/gpLhx7qksAOM3o3oa1iRJ1ThdqVOiCXouiPD/TEnxEG5ceMoMkho8PPz
	 yDADJ4CGv3YtT9u07W1O+zPB1sHwmE/y+VBzJpu3UUTckwrSvw2hTjrmm54xPvcQOrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5DofsG7;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF341606A33F
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF341606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m5DofsG7
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so1676466f8f.3
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267979; x=1795872779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpH7vOBV8zTAkCwE1fdPUsN34Rs/B2a+/bMMRlSHON4=;
        b=m5DofsG7cV/aIgU22NYy3EVCZX7BtBnsald0Ejtjr01c1Qg+HVTSTpW46ooJQP9vwz
         2jZUu/YEhqVeosla5OM6RWbtITXm+j6rsnJCDAjVAYnWH8QvfO9Pm3GWRBaKmgHSfRQb
         RBMmFlM5qS5kKPAoNbtABwxq4bxaUkPhGeCgUIjExu9uwp5BZys2XgkRBSLiQlPuGYUE
         LiYUpFKKrU/t8g7uppModsNnJ9KvagfXkMntpmae77FvTnAvu+AMWWrHX79hF9b4du2l
         5CzjR/r8lJyHT/MXE+FZ2A6yHuVUP9OKoCPV74NOt3Zb0r7+KHLUZ5Y9HprcizPWhgDt
         CV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267979; x=1795872779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpH7vOBV8zTAkCwE1fdPUsN34Rs/B2a+/bMMRlSHON4=;
        b=z9G6OZxT7r3K/El1yVdEBITU4GDEldPTUnuMIF4jwv+DOIrAhe2GJjz5G7W3rS6owU
         yegLSM98DSqZ/Snxn262G1MDXH1HafgxvRspdux2q60cOYJdk/AopyTAfv9zn381sjHq
         OZX9gt9BwnsILMmBr/qnajFOvYA6wPvR6AnuKd5oM2mCWNrnmSU0T29QphTE3NKbuWTn
         wTMBhSffCROXjHJGRFVGiHJk3sSCUdDnJ977q975atj/rFh6QIKqMoRgxle1JECG1f1q
         rvbASmq1uMM+WnqMCFnwHE2JwUYZecdVXFcalB5XrH9MeyLeZHHiLMT3/gUpi8dqRWeb
         Coeg==
X-Gm-Message-State: APuU4Z9MKk8yZc3UfwtlsHTqvS5Ji8Y+uEkWH4RaedtBuKfaD3i6aFqP
	PXHDBuTRb8Jg5aTJM+l2jjgGleNK5auG0zhi+KVpxmW1oK58gE6FF0jmGOaUyg==
X-Gm-Gg: AZFdTZdYqj8G9PgcEMHBQBpHBl8rvahZgRJnN8CMm9tjQX6zeAoLdqJvRPk+CoblPQ6
	CtTn3cohxVIpWjyJgqUhbnbMyHofQ1CrPqIl6PlXd7L82Ec+tf7puq9aSEtYebOn0hyC20FYMcA
	izfyOwpwfWwg+IwIZEbqqBrs6VgiHeXZoZ8tJNSk3V6nuIlJqEVoaTtbo3WAOw0J679mF8Lpbcc
	lffYS678ZlylRdYol334T4Tli3z25ooBeKFrgvi76k/l/Zg/XxrwT0YeYRJpWta1NPZFxTHE4zz
	ScaqWF5CHgQUu53JvhSI8X/NX1QUrh4P1IiDbCxlrk88Stg6Bg7UO3Wo4pp6TKm2MgihtgrGq0E
	/q2jFAyfYzUiHcf/8GKyIsx8Erx5bCAKpd+eA2AFdwMocgwM4TTZbT+X+uhlkB2mucoyLozREQv
	emgKkRPkgF3Vc3Zzv+0mXRcilvDG92EkScir/mwEWV1tC15ZaXBTZBcCorl2eNqCEkeGGsJ9ltA
	0Sk5cdwCrRq2aY4B9J3lGPhLmUePTtIkTE3OTGwfa16GgFxqLmGdOrhNdv/hqUkAnTmdR8n8Yi3
	nESEcv4Rve5PjDDIkWrkEVAYZ9pXMyumo0Ts35IvxQhcTm1KGBL+tQ0IgNSw2cknrH0Phu+a/WE
	VBQg4pSj2lYuV
X-Received: by 2002:a05:600c:5306:b0:4bb:6ac0:6dc1 with SMTP id 5b1f17b1804b1-4bb887c994cmr145819765e9.2.1795267979159;
        Sat, 21 Nov 2026 05:32:59 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:58 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 06/14] media: atomisp: Add Yoga Book camera configuration
Date: Sat, 21 Nov 2026 14:31:36 +0100
Message-ID: <3768f17b328286f4dc3e6a31a265eaa6e484e57a.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d7..56da454f0 100644
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
@@ -359,7 +373,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };
 
-- 
2.53.0


