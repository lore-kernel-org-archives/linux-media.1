Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721210;
	b=UN619Fxd78yZyUqxMeJVVosKDze497p3plIQqaRe4NYpZLkpBo3MUuDY+j2O3lJ4y16u
	 SdzOHhRepy9IIl8hUpHoneoSDJYhbjR/tYwv6n80SWIYLno/JPNtdXyKvLIQLm/8Xgcce
	 h86O4vJKco4Ez3YM8L91O4OS42XS+UruVSDg0DENiKW6l7oltiaP/nFezMlzRvinQWMQV
	 GGrxc+mSsNc6LANupb0Bp5kAdYaWySrfLJttF7CwfTLr+Wd4NHSajWXDBBlNoubq5mm8n
	 eGScJiCsvXwjegGDoHEFB0sl797S6D1vdcqwFQtcxYvUwiOVW8oLXqbul8lDBfkPpeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QOWQN6KK00fNNA4WnFOnqK7uxhM/XkYooxesvFiwoQo=;
	b=zq865wQB0KJj8f0Bygsu9nIUZT+LYYc1OX2+JRuBur4dHK5O3mxsMf5im8ILi7dDD189
	 Dqsq1N/xjc4xp8Lk51bi+9PefOdYlQ/ko1UQbilJTktUyez6O3M5ybUK+LJlvihtxt2mV
	 nrlwjmesrYuwRtJfnJt/kdS1ByEwtxgFe1d3APkf2kMtfuEP0e0XCw9KWYXhBJQJuIvZF
	 uxLkUzGJ/IaqSBPpNXb84aRZRCh//4EApORkkWxaonbX96dJ2ObaF4tvUZUcBggyZVGbQ
	 R67AiHjm1eEDfNQ9tFi0pSCgnq7gWGJ9Eq3sy3ZTNpQhBBgo46YhNO99Zfj+AmiK+Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MyGZzUlA;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE17606D81E
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE17606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MyGZzUlA
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a599e9110eso22165695e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721208; x=1794326008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QOWQN6KK00fNNA4WnFOnqK7uxhM/XkYooxesvFiwoQo=;
        b=MyGZzUlAm7mGaAffU7lQ5/xQVxY15KLM+smR4NBoA3b9fUecWINdq5vcshpM6GfHDP
         HSgOoheRqoDZqlrDML6cFrQ/aitRqflHVURMNeo9ujCgKp1PLCh7DdE0FHB3ttnVHHnC
         aSt1h/PmOWmJ8KLDGlJgoZ3d9H+yG3OH9E0kLt/A/wB5dGqMUB5XYyVTvOjuXvc5lC5W
         mv6Fu5kXB8/IpGIh5Q4icplFOTnM4IK7b7F3gAdzH2SYJ0LqC9G3v7Cprox26CTBIH8d
         uz0vXwRe6EXzrSspMTf9yG/tEquga/zO6vVBUlnRo7aKv+0BBIpCfpJd4sIIWE6hVSim
         w+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721208; x=1794326008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QOWQN6KK00fNNA4WnFOnqK7uxhM/XkYooxesvFiwoQo=;
        b=IGoKS4nIuM/76Gf6Tt64HXpeXNWsM1wM3bLP6vCYZRqphfWoI3c+1qTcxJVV8ZV7hx
         yL1BDlVqtdybuaBOTmsQ7CzdseokE64QkwkWrpRusJzyuyUflT6Gias0d5R6V4Xcoexa
         4HMVMK2tJ8rAfjRzDOrpEswItkY47YsN0bzVNGxC9wKQtIwsakl49c2YhSUCN3P3PodV
         wIQlB7ghuWBowv+5ZLaByoBpNZ/kMREq4yCkxd4FvjLV+zOlpATLe2X1K5q6adA36TCM
         9LOdbxtWfl6hf2kUcS0DrsS2Pa8R7+QbDiodIrQeA0SIpTlIMqXmUlCN/iLftyAN6YD0
         rVXA==
X-Forwarded-Encrypted: i=1; AKwUvBz8QsaFTKFlU5ITtL0uQcBEhDADEbx48BFbC+c06Ql6KzEaKftKJqRBoywizZSqcGkns452KAH1cUfC+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zYKIcwsgxWIn4I3wPzc5/4nJ0GBoeC3Bn9TfSYZn491VK24dR
	2ri1MMQrFE9kJXzEsguXvCfMOIz82VUKMTWrMg/474b+WmzmkBDEJNw4
X-Gm-Gg: AYBFou2HB+quzn+yWh11PF/7WH6Woo//n3E27I1NVo1gd3p5IafLBZxqrJR9GoWrR5F
	JsBrclbvJNtl2Nx4yYA0qZqewmoK1XD1Ln/WVkoYuA6uQKL2Fks1uBE6PQVqG5XwH0FBvJDtqPB
	mi4hMbcf3AGb3KWC+2U49m7J13OPDLwswM4B8a9IwV31MJbp+9SJhEwZifza3oElP+Hvn1cxPy8
	kRn/GqddA8o6ucvQTa6c2MGkwe2xXF5gggdgAfJ8OrybLSg5jA5M+nLziRwugB2KCAfBdNfCjfe
	ngCV+DMmvTc0vMT2b/Lg1b29Jdc+T6Z6Tca8UCmoKND98NyMmt6aXVVtNPdqNb4n/fuTf5EW5qm
	IckYKU2Sg+jBpErt6x8vqJxe8YdaNegtbSgWsp9ldHryZwLiiFe/mgN/u2e2bZUn1Ffzbu1uM8F
	Z9Mc/F4tI+yzagoSBp+YC85ra975ujr6OSS117aSYh/HYaLpzU8eZ1d5BmXpXD9JSqvy20S59Yw
	/qEv8KB1mCfuANGgN70x+3g0u3GBj1YaVm4OXy1YxVyooJj83S0BdZW1/I4xe5eip5rgWY10S/H
	sSCpWaXO/8kca+SoX+/PrkfcQ+c//7VvGWnAlbJip9H9X0Da29lAa92F5YCeNlUj3JmLvJuf
X-Received: by 2002:a05:600c:a010:b0:4a1:7dcf:be1f with SMTP id 5b1f17b1804b1-4ac166ee4d6mr304046925e9.1.1793721208244;
        Tue, 03 Nov 2026 07:53:28 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:27 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Caspar Adriani <caspar.adriani@proton.me>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [RFC PATCH 2/3] platform/x86: amd_isp4: add the OV13B10 (OMNI13B1) board configuration
Date: Tue,  3 Nov 2026 18:53:12 +0300
Message-ID: <20261103155313.114347-3-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
References: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
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

The rear camera of the ASUS ROG Flow Z13 (GZ302EA) is an OmniVision
OV13B10 behind the AMD ISP 4.1.1, exposed in ACPI as \_SB.CAMB with
_HID "OMNI13B1". Like the OV05C10 reference platform, its ACPI device
has no resources and no endpoint graph, so add a platform
configuration with the software-node graph for it:

- I2C address 0x10, where the sensor answers on the ISP's I2C bus (the
  camera's _DSM also returns this value);
- a 24 MHz sensor clock, the rate declared for the OV05C10 reference
  platform;
- four CSI-2 lanes at 560 MHz, the link of the ov13b10 driver's
  full-resolution mode.

If the host ov13b10 driver binds to the sensor, it currently accepts
only a 19.2 MHz external clock, so it does not probe with this
configuration until it supports 24 MHz. The sensor's reset GPIO is
registered by amdgpu together with the other ISP GPIOs.

Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
 drivers/platform/x86/amd/amd_isp4.c | 127 ++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
index 0d4948995..6b850e0fc 100644
--- a/drivers/platform/x86/amd/amd_isp4.c
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -19,10 +19,13 @@
 #define AMDISP_OV05C10_I2C_ADDR		0x10
 #define AMDISP_OV05C10_HID		"OMNI5C10"
 #define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
+#define AMDISP_OV13B10_I2C_ADDR		0x10
+#define AMDISP_OV13B10_HID		"OMNI13B1"
 #define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
 
 static const struct software_node isp4_mipi1_endpoint_node;
 static const struct software_node ov05c10_endpoint_node;
+static const struct software_node ov13b10_endpoint_node;
 
 /*
  * AMD ISP platform info definition to initialize sensor
@@ -245,8 +248,132 @@ static const struct amdisp_platform_info ov05c10_platform_config = {
 	.swnodes = amd_isp4_nodes,
 };
 
+/*
+ * ASUS ROG Flow Z13 (GZ302EA) rear camera.  Its ACPI camera device has no
+ * resources or endpoint graph, so provide the same complete software-node
+ * graph used by the reference OV05C10 platform.  The ISP supplies the
+ * sensor clock at 24 MHz, as on that platform; four CSI-2 lanes at 560 MHz
+ * are the link of the ov13b10 driver's full-resolution mode.
+ */
+static const struct software_node ov13b10_amd_camera_node = {
+	.name = "amd_camera",
+};
+
+static const struct software_node ov13b10_isp4_node = {
+	.name = "isp4",
+	.parent = &ov13b10_amd_camera_node,
+};
+
+static const struct software_node ov13b10_isp4_ports = {
+	.name = "ports",
+	.parent = &ov13b10_isp4_node,
+};
+
+static const struct software_node ov13b10_isp4_port_node = {
+	.name = "port@0",
+	.parent = &ov13b10_isp4_ports,
+};
+
+static const struct software_node_ref_args ov13b10_isp4_refs[] = {
+	SOFTWARE_NODE_REFERENCE(&ov13b10_endpoint_node),
+};
+
+static const struct property_entry ov13b10_isp4_endpoint_props[] = {
+	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov13b10_isp4_refs),
+	{ }
+};
+
+static const struct software_node ov13b10_isp4_endpoint_node = {
+	.name = "endpoint",
+	.parent = &ov13b10_isp4_port_node,
+	.properties = ov13b10_isp4_endpoint_props,
+};
+
+static const struct property_entry ov13b10_i2c1_props[] = {
+	PROPERTY_ENTRY_U32("clock-frequency", 1 * HZ_PER_MHZ),
+	{ }
+};
+
+static const struct software_node ov13b10_i2c1_node = {
+	.name = "i2c1",
+	.parent = &ov13b10_amd_camera_node,
+	.properties = ov13b10_i2c1_props,
+};
+
+static const struct property_entry ov13b10_camera_props[] = {
+	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
+	{ }
+};
+
+static const struct software_node ov13b10_camera_node = {
+	.name = AMDISP_OV13B10_HID,
+	.parent = &ov13b10_i2c1_node,
+	.properties = ov13b10_camera_props,
+};
+
+static const struct software_node ov13b10_ports = {
+	.name = "ports",
+	.parent = &ov13b10_camera_node,
+};
+
+static const struct software_node ov13b10_port_node = {
+	.name = "port@0",
+	.parent = &ov13b10_ports,
+};
+
+static const struct software_node_ref_args ov13b10_refs[] = {
+	SOFTWARE_NODE_REFERENCE(&ov13b10_isp4_endpoint_node),
+};
+
+static const u64 ov13b10_link_freqs[] = {
+	560 * HZ_PER_MHZ,
+};
+
+static const u32 ov13b10_data_lanes[] = {
+	1, 2, 3, 4,
+};
+
+static const struct property_entry ov13b10_endpoint_props[] = {
+	PROPERTY_ENTRY_U32("bus-type", 4),
+	PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov13b10_data_lanes,
+				     ARRAY_SIZE(ov13b10_data_lanes)),
+	PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov13b10_link_freqs,
+				     ARRAY_SIZE(ov13b10_link_freqs)),
+	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov13b10_refs),
+	{ }
+};
+
+static const struct software_node ov13b10_endpoint_node = {
+	.name = "endpoint",
+	.parent = &ov13b10_port_node,
+	.properties = ov13b10_endpoint_props,
+};
+
+static const struct software_node *ov13b10_amd_isp4_nodes[] = {
+	&ov13b10_amd_camera_node,
+	&ov13b10_isp4_node,
+	&ov13b10_isp4_ports,
+	&ov13b10_isp4_port_node,
+	&ov13b10_isp4_endpoint_node,
+	&ov13b10_i2c1_node,
+	&ov13b10_camera_node,
+	&ov13b10_ports,
+	&ov13b10_port_node,
+	&ov13b10_endpoint_node,
+	NULL
+};
+
+static const struct amdisp_platform_info ov13b10_platform_config = {
+	.board_info = {
+		.dev_name = "ov13b10",
+		I2C_BOARD_INFO("ov13b10", AMDISP_OV13B10_I2C_ADDR),
+	},
+	.swnodes = ov13b10_amd_isp4_nodes,
+};
+
 static const struct acpi_device_id amdisp_sensor_ids[] = {
 	{ AMDISP_OV05C10_HID, (kernel_ulong_t)&ov05c10_platform_config },
+	{ AMDISP_OV13B10_HID, (kernel_ulong_t)&ov13b10_platform_config },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
-- 
2.56.0

