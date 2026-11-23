Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432131;
	b=dwlMhUFchQC9I7vaIZsJhexwL7AP13ivbr0xll9eR8Jq8q+sWzlbXjK+Rw7gDnagakUx
	 iF92c5k6dJKa9RNILGAYSgb1vARnTDr8JWiZ5bR+ZSJ7X7oj0TALozDgYfshnnVkYh5Ij
	 V9V7G3Xgi74DUosSDlOgkyZFmfXqUOR/ib2L11MmGn8BuQGRsWUJrCe2hlyx1sETZ+40q
	 Y/IDtfU8nAlBh0G7jqm/oClQl2Bc0BCQoXvCK4dmt8Tcyxs4/WtHbVYW6vdNwci/DDopn
	 m1moTvZ/XambyxuzoA1Nk3uMcteLhUmMzUl9sSD6uclsPE7+cqaryiZkNUw09IC8xAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iH/ZKVDSIWA2WpS0Vrf8JzLH3By39QExTuaudYySF8I=;
	b=GgjCvWQUF0zFYd9jkhmTWKDRIhAKSV4IAzAAVwuasg8x7f6rXImwziRxqGwogt4xBa6C
	 d/TjH6Rd6TWZMEr2gwfQGk1kK7jB3mfiadgLq4Aj/uOMF/nfplRcQaHJFNiCgMJyPLkhw
	 VmXsHcgarbdVnUn4MoGTZ7g0nBCENW2UX4Nmy1TYdXpSvYAoVDhIMRhjYfmh2I5SeJhpx
	 PrCRiM6L1ia3eNFBxzqbiwJgOh3/fyZ4QKLeGcbxhRBA3BsALscf6flTUHY7k4jrPtoHH
	 +LX1S+aANknpavQl4sLACw78jwJHfs2VqIu0wmza4rcjioIIs/ub4f15CdMP+EOCLow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaTUknfa;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80790606A32E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80790606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaTUknfa
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so4313186c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432130; x=1796036930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iH/ZKVDSIWA2WpS0Vrf8JzLH3By39QExTuaudYySF8I=;
        b=qaTUknfaRSGuBWcVCuMW02hxjeUDe0bP+JIuJovDP9E3QaaE/xLt/F6csRoLNH29+R
         u8m1wuvnu0jDGJ0LJoa9pb3TdkHWsnozlJTjajNtZOrXkg5bmdRpXcRFFpU9+ZR1v+Ct
         6wnqtk1ZagN1grSvV5Y3UDtSKRuQ9PiBfxHO4s4P4zEKqRfnK+4PcY4NJffGOS9iUTIa
         OIGH03Z/YHLFWNrbkoILb0/boSpACMymCLkaiIGhIfy6hQyBovQ/0uYgl7nQ03r2c6pH
         EQpqIVJTQWe29UqyF5Pkwy7l0JUVLdnVF6pKsxtj5PMn4g5NZ18Nr08vyzlflWmE7apg
         i/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432130; x=1796036930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iH/ZKVDSIWA2WpS0Vrf8JzLH3By39QExTuaudYySF8I=;
        b=pQTaoD/ivr3678kyePtNyuiVva7TIjvNPzAgs7oIrD0HDEhM/JtC1oW5GFcv1go5Jw
         w21ruIZRigHkIi6dqP86l30nXGwKfyuxNvp/BE+a5fApqaXmNM5Lxe6b1xxDCvXrY9VY
         7MJw01iN6tmymkKfltZcnNWIfcx4W7cTH0Tscrz04Jjjkp6afUTbrTJXjfGLKHFqNivT
         YAE6PdEvzzIJIVx6H4uWXp0FZrOBAQM3NKY8gibsnHBa6Gfv3RwSCcEVgiRYf2qYRCpC
         0DFKWmGKjxA1gb+QFoo395VVGK51vcJrhguF+OjThO5lS1VqCao4Vtg+KrhtieG9f7By
         7fSQ==
X-Forwarded-Encrypted: i=1; AL+hErF6lfbLqaICOWOCMadVbQ6OXM6rtQTfK3ADqsvK1JL/AptnRbBIWZ+BcO0oFMJSioUeLgb4cW1wUmFC2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8lu5MHEXThZiUtgReandXJT01181So9VmTonhvr4mc6SCZ0Toy
	9078jscSnRqy5p9HgkyFhNFltZ2lSaUQzx1AhIM0PqtjG5VMTZaQtam6
X-Gm-Gg: AZFdTZeunloo8rzW5Rm7ZhYo70snELifcKbjrhtoz2FWSKLZTWM3RD/31IKTR6uuOn7
	VeTzQdl5umHmTgxGSoIvZRs9rgBqY9ia55yZtR0LUFLSbldQ5NVHksz4d93ASRBF1vKGLXYh0Ut
	XGGSFCPU6W8Xt2JrVKzIeWfDanCkMqkjA5ugvn41oWVDa5AEY+uxssej5bma0EaCLfXbRcFB5MD
	gv2DYatH0qvx/HZEQoo2yoDy2g4U9Hi8Q1L7KFz+WePqRY+t2YCkS8gM74c8aE7PbgaY30f/hlh
	8m6CyfR6Y8mWU7Z9EIQoZMAshvF8fTnTm/XpDMzl/cpIrL+sBy96eKZtqC2cgN/BO4fY5hnnir7
	ny5+qgM9t5yzFUtME1Bgv9vr60An861kWNBMHffe9qFxYv3KKDaqV21Fl2xnI6H6tibGXzC1uiT
	BdcsY1HzKJZFAn5sDwnZwNBI5XVDI/Bj9x3REskhCqbYBPxwu67Rz2G7c1uCaQpJa0Mk/Of05uY
	EWzBKfKn0QSuODEkDKHG7t6qVvOO46Dc5RP+Sh2UzsWuS7zdZGvTyrVkcQkrK0simLzEeB4FGeU
	I59F+RUSIWJUa92j5FWp8Ti/LvG9CcSF9wAMihrYHtccpw==
X-Received: by 2002:a05:7022:299:10b0:1b5:7329:90a8 with SMTP id a92af1059eb24-1b57329918fmr2821087c88.38.1795432129449;
        Mon, 23 Nov 2026 03:08:49 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:49 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 5/6] media: i2c: add ov12a10 image sensor driver
Date: Mon, 23 Nov 2026 18:08:04 +0700
Message-ID: <20261123110805.119610-6-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Add V4L2 subdev driver for the OmniVision OV12A10 12MP MIPI CSI-2 image
sensor supporting 1280x720 binned raw10 capture.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/media/i2c/Kconfig   |  13 +
 drivers/media/i2c/Makefile  |   1 +
 drivers/media/i2c/ov12a10.c | 720 ++++++++++++++++++++++++++++++++++++
 3 files changed, 734 insertions(+)
 create mode 100644 drivers/media/i2c/ov12a10.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 3a0a041a4c2b..fd2928de223d 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -454,6 +454,19 @@ config VIDEO_OV08X40
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov08x40.
 
+config VIDEO_OV12A10
+	tristate "OmniVision OV12A10 sensor support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV12A10 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov12a10.
+
 config VIDEO_OV13858
 	tristate "OmniVision OV13858 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index f93d7205817d..27830499333f 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
 obj-$(CONFIG_VIDEO_OV02E10) += ov02e10.o
 obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
 obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
+obj-$(CONFIG_VIDEO_OV12A10) += ov12a10.o
 obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
 obj-$(CONFIG_VIDEO_OV13B10) += ov13b10.o
 obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
diff --git a/drivers/media/i2c/ov12a10.c b/drivers/media/i2c/ov12a10.c
new file mode 100644
index 000000000000..87823fe8fbe1
--- /dev/null
+++ b/drivers/media/i2c/ov12a10.c
@@ -0,0 +1,720 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/unaligned.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define OV12A10_CHIP_ID_REG		0x300a
+#define OV12A10_CHIP_ID			0x5612
+#define OV12A10_REG_MODE_SELECT		0x0100
+#define OV12A10_MODE_STANDBY		0x00
+#define OV12A10_MODE_STREAMING		0x01
+#define OV12A10_REG_VTS			0x380e
+#define OV12A10_REG_EXPOSURE		0x3501
+#define OV12A10_REG_ANALOG_GAIN		0x3508
+#define OV12A10_REG_TEST_PATTERN		0x5080
+#define OV12A10_XVCLK_FREQ		24000000
+#define OV12A10_LINK_FREQ_216MHZ		216000000ULL
+#define OV12A10_PIXEL_RATE		144000000ULL
+
+struct ov12a10_reg { u16 address;
+u8 val;
+};
+struct ov12a10_mode {
+	u32 width, height, hts_def, vts_def, vts_min, num_regs;
+	const struct ov12a10_reg *regs;
+};
+
+static const char * const ov12a10_supply_names[] = { "avdd", "dvdd", "dovdd" };
+#define OV12A10_NUM_SUPPLIES ARRAY_SIZE(ov12a10_supply_names)
+
+static const struct ov12a10_reg ov12a10_common_regs[] = {
+	{ 0x0103, 0x01 },
+	{ 0x0302, 0x49 },
+	{ 0x0303, 0x00 },
+	{ 0x0304, 0x00 },
+	{ 0x0305, 0x01 },
+	{ 0x0312, 0x11 },
+	{ 0x030b, 0x06 },
+	{ 0x030c, 0x02 },
+	{ 0x030d, 0x88 },
+	{ 0x030e, 0x02 },
+	{ 0x0313, 0x05 },
+	{ 0x3002, 0x21 },
+	{ 0x3012, 0x40 },
+	{ 0x3013, 0x72 },
+	{ 0x3016, 0x72 },
+	{ 0x301b, 0xd0 },
+	{ 0x301d, 0xf0 },
+	{ 0x301f, 0xd0 },
+	{ 0x3021, 0x23 },
+	{ 0x3022, 0x01 },
+	{ 0x3106, 0x15 },
+	{ 0x3107, 0x23 },
+	{ 0x3500, 0x00 },
+	{ 0x3501, 0xd0 },
+	{ 0x3502, 0x00 },
+	{ 0x3505, 0x83 },
+	{ 0x3508, 0x02 },
+	{ 0x3509, 0x00 },
+	{ 0x3600, 0x43 },
+	{ 0x3611, 0x8a },
+	{ 0x3613, 0x97 },
+	{ 0x3620, 0x80 },
+	{ 0x3624, 0x2c },
+	{ 0x3625, 0xa0 },
+	{ 0x3626, 0x00 },
+	{ 0x3631, 0x60 },
+	{ 0x3632, 0x00 },
+	{ 0x3641, 0x80 },
+	{ 0x3642, 0x12 },
+	{ 0x3644, 0x78 },
+	{ 0x3645, 0xa7 },
+	{ 0x364e, 0x44 },
+	{ 0x364f, 0x44 },
+	{ 0x3650, 0x11 },
+	{ 0x3654, 0x00 },
+	{ 0x3657, 0x31 },
+	{ 0x3659, 0x0c },
+	{ 0x365f, 0x07 },
+	{ 0x3661, 0x17 },
+	{ 0x3662, 0x17 },
+	{ 0x3663, 0x17 },
+	{ 0x3664, 0x17 },
+	{ 0x3666, 0x08 },
+	{ 0x366b, 0x20 },
+	{ 0x366c, 0xa4 },
+	{ 0x366d, 0x20 },
+	{ 0x366e, 0xa4 },
+	{ 0x3680, 0x00 },
+	{ 0x3714, 0x24 },
+	{ 0x371a, 0x3e },
+	{ 0x3737, 0x04 },
+	{ 0x3739, 0x12 },
+	{ 0x3765, 0x20 },
+	{ 0x3767, 0x00 },
+	{ 0x37a1, 0x3e },
+	{ 0x37a8, 0x4d },
+	{ 0x37ab, 0x2c },
+	{ 0x37c2, 0x04 },
+	{ 0x37d8, 0x03 },
+	{ 0x37d9, 0x0c },
+	{ 0x37e0, 0x00 },
+	{ 0x37e1, 0x0a },
+	{ 0x37e2, 0x14 },
+	{ 0x37e3, 0x04 },
+	{ 0x37e4, 0x2a },
+	{ 0x37e5, 0x03 },
+	{ 0x37e6, 0x04 },
+	{ 0x3800, 0x00 },
+	{ 0x3801, 0x00 },
+	{ 0x3802, 0x00 },
+	{ 0x3803, 0x00 },
+	{ 0x3804, 0x10 },
+	{ 0x3805, 0x0f },
+	{ 0x3806, 0x0c },
+	{ 0x3807, 0x0f },
+	{ 0x3808, 0x10 },
+	{ 0x3809, 0x00 },
+	{ 0x380a, 0x0c },
+	{ 0x380b, 0x00 },
+	{ 0x380c, 0x04 },
+	{ 0x380d, 0x28 },
+	{ 0x380e, 0x0d },
+	{ 0x380f, 0x12 },
+	{ 0x3811, 0x0a },
+	{ 0x3813, 0x08 },
+	{ 0x3814, 0x01 },
+	{ 0x3815, 0x01 },
+	{ 0x3816, 0x01 },
+	{ 0x3817, 0x01 },
+	{ 0x3820, 0xa8 },
+	{ 0x3821, 0x00 },
+	{ 0x3822, 0x91 },
+	{ 0x3823, 0x18 },
+	{ 0x3826, 0x00 },
+	{ 0x3827, 0x00 },
+	{ 0x3829, 0x03 },
+	{ 0x3832, 0x08 },
+	{ 0x3833, 0x30 },
+	{ 0x3c80, 0x00 },
+	{ 0x3c87, 0x01 },
+	{ 0x3c8c, 0x1a },
+	{ 0x3c8d, 0x68 },
+	{ 0x3c97, 0x02 },
+	{ 0x3cc0, 0x40 },
+	{ 0x3cc1, 0x54 },
+	{ 0x3cc2, 0x34 },
+	{ 0x3cc3, 0x04 },
+	{ 0x3cc4, 0x00 },
+	{ 0x3cc5, 0x00 },
+	{ 0x3cc6, 0x00 },
+	{ 0x3cc7, 0x00 },
+	{ 0x3cc8, 0x00 },
+	{ 0x3cc9, 0x00 },
+	{ 0x3d8c, 0x73 },
+	{ 0x3d8d, 0xc0 },
+	{ 0x4001, 0x2b },
+	{ 0x4008, 0x02 },
+	{ 0x4009, 0x0f },
+	{ 0x4011, 0xff },
+	{ 0x4013, 0x08 },
+	{ 0x4014, 0x08 },
+	{ 0x4015, 0x08 },
+	{ 0x4017, 0x08 },
+	{ 0x401a, 0x58 },
+	{ 0x4050, 0x04 },
+	{ 0x4051, 0x0b },
+	{ 0x405e, 0x20 },
+	{ 0x4501, 0x00 },
+	{ 0x4503, 0x00 },
+	{ 0x450a, 0x04 },
+	{ 0x4601, 0x30 },
+	{ 0x4800, 0x24 },
+	{ 0x481f, 0x30 },
+	{ 0x4837, 0x0d },
+	{ 0x483c, 0x0f },
+	{ 0x484b, 0x01 },
+	{ 0x4d00, 0x05 },
+	{ 0x4d01, 0x19 },
+	{ 0x4d02, 0xfd },
+	{ 0x4d03, 0xd1 },
+	{ 0x4d04, 0xff },
+	{ 0x4d05, 0xff },
+	{ 0x5000, 0x09 },
+	{ 0x5001, 0x42 },
+	{ 0x5002, 0x45 },
+	{ 0x5005, 0x00 },
+	{ 0x5081, 0x04 },
+	{ 0x5180, 0x00 },
+	{ 0x5181, 0x10 },
+	{ 0x5182, 0x02 },
+	{ 0x5183, 0x0f },
+	{ 0x5185, 0x6c },
+	{ 0x5200, 0x03 },
+	{ 0x5203, 0x7c },
+	{ 0x5204, 0x1f },
+	{ 0x5205, 0x41 },
+	{ 0x520b, 0x07 },
+	{ 0x520c, 0x0f },
+	{ 0x0300, 0x02 },
+	{ 0x0302, 0x53 },
+	{ 0x380c, 0x04 },
+	{ 0x380d, 0x90 },
+	{ 0x380e, 0x0c },
+	{ 0x380f, 0xe6 },
+	{ 0x4837, 0x10 },
+};
+
+static const struct ov12a10_reg ov12a10_1280x720_regs[] = {
+	{ 0x0300, 0x06 },
+	{ 0x0301, 0x02 },
+	{ 0x0302, 0x48 },
+	{ 0x0307, 0x01 },
+	{ 0x0303, 0x01 },
+	{ 0x030b, 0x06 },
+	{ 0x030c, 0x02 },
+	{ 0x030d, 0x88 },
+	{ 0x0312, 0x11 },
+	{ 0x0313, 0x09 },
+	{ 0x3642, 0x10 },
+	{ 0x3666, 0x00 },
+	{ 0x366b, 0xa4 },
+	{ 0x366c, 0x20 },
+	{ 0x366d, 0xa4 },
+	{ 0x366e, 0x20 },
+	{ 0x3714, 0x28 },
+	{ 0x371a, 0x3e },
+	{ 0x3737, 0x08 },
+	{ 0x3739, 0x20 },
+	{ 0x37c2, 0x14 },
+	{ 0x37d9, 0x0c },
+	{ 0x37e3, 0x08 },
+	{ 0x37e4, 0x36 },
+	{ 0x37e6, 0x08 },
+	{ 0x3800, 0x03 },
+	{ 0x3801, 0x20 },
+	{ 0x3802, 0x03 },
+	{ 0x3803, 0x68 },
+	{ 0x3804, 0x0d },
+	{ 0x3805, 0x3f },
+	{ 0x3806, 0x09 },
+	{ 0x3807, 0x27 },
+	{ 0x3808, 0x05 },
+	{ 0x3809, 0x00 },
+	{ 0x380a, 0x02 },
+	{ 0x380b, 0xd0 },
+	{ 0x380c, 0x04 },
+	{ 0x380d, 0x28 },
+	{ 0x380e, 0x03 },
+	{ 0x380f, 0x4c },
+	{ 0x3810, 0x00 },
+	{ 0x3811, 0x08 },
+	{ 0x3813, 0x08 },
+	{ 0x3814, 0x03 },
+	{ 0x3816, 0x03 },
+	{ 0x3820, 0xab },
+	{ 0x4009, 0x0d },
+	{ 0x4050, 0x04 },
+	{ 0x4051, 0x0b },
+	{ 0x4501, 0x00 },
+	{ 0x4837, 0x1b },
+	{ 0x5001, 0x42 },
+	{ 0x5002, 0x45 },
+	{ 0x3501, 0x34 },
+	{ 0x3502, 0x00 },
+	{ 0x4800, 0x24 },
+};
+
+static const struct ov12a10_mode supported_modes[] = {
+	{
+		.width = 1280, .height = 720, .hts_def = 1440,
+		.vts_def = 3376, .vts_min = 844,
+		.num_regs = ARRAY_SIZE(ov12a10_1280x720_regs),
+		.regs = ov12a10_1280x720_regs,
+	},
+};
+
+static const s64 link_freq_menu_items[] = { OV12A10_LINK_FREQ_216MHZ };
+
+struct ov12a10 {
+	struct device *dev;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct clk *xvclk;
+	struct gpio_desc *reset_gpio, *vana_gpio, *pwdn_gpio;
+	struct regulator_bulk_data supplies[OV12A10_NUM_SUPPLIES];
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *link_freq, *pixel_rate, *vblank, *hblank, *exposure;
+	const struct ov12a10_mode *cur_mode;
+	/* Serialize access to sensor registers and streaming state */
+	struct mutex mutex;
+	bool streaming;
+};
+
+static inline struct ov12a10 *to_ov12a10(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ov12a10, sd);
+}
+
+static int ov12a10_read_reg(struct ov12a10 *ov12a10, u16 reg, u32 len, u32 *val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov12a10->sd);
+	struct i2c_msg msgs[2];
+	u8 addr_buf[2], data_buf[4] = { 0 };
+	int ret;
+
+	put_unaligned_be16(reg, addr_buf);
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0;
+	msgs[0].len = 2;
+	msgs[0].buf = addr_buf;
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD;
+	msgs[1].len = len;
+	msgs[1].buf = &data_buf[4 - len];
+	ret = i2c_transfer(client->adapter, msgs, 2);
+	if (ret != 2)
+		return ret < 0 ? ret : -EIO;
+	*val = get_unaligned_be32(data_buf);
+	return 0;
+}
+
+static int ov12a10_write_reg(struct ov12a10 *ov12a10, u16 reg, u32 len, u32 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov12a10->sd);
+	u8 buf[6];
+	int ret;
+
+	put_unaligned_be16(reg, buf);
+	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
+	ret = i2c_master_send(client, buf, len + 2);
+	return ret == len + 2 ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+static int ov12a10_write_regs(struct ov12a10 *ov12a10, const struct ov12a10_reg *regs, u32 len)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < len; i++) {
+		ret = ov12a10_write_reg(ov12a10, regs[i].address, 1, regs[i].val);
+		if (!ret && regs[i].address == 0x0103)
+			usleep_range(5000, 6000);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static int ov12a10_power_on(struct device *dev)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(dev_get_drvdata(dev));
+	int ret;
+
+	if (ov12a10->vana_gpio)
+		gpiod_set_value_cansleep(ov12a10->vana_gpio, 1);
+
+	ret = regulator_bulk_enable(OV12A10_NUM_SUPPLIES, ov12a10->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(ov12a10->xvclk);
+	if (ret) {
+		regulator_bulk_disable(OV12A10_NUM_SUPPLIES, ov12a10->supplies);
+		return ret;
+	}
+
+	msleep(35);
+	if (ov12a10->pwdn_gpio)
+		gpiod_set_value_cansleep(ov12a10->pwdn_gpio, 0);
+	if (ov12a10->reset_gpio) {
+		gpiod_set_value_cansleep(ov12a10->reset_gpio, 1);
+		usleep_range(3000, 5000);
+		gpiod_set_value_cansleep(ov12a10->reset_gpio, 0);
+		msleep(35);
+	}
+	return 0;
+}
+
+static int ov12a10_power_off(struct device *dev)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(dev_get_drvdata(dev));
+
+	if (ov12a10->reset_gpio)
+		gpiod_set_value_cansleep(ov12a10->reset_gpio, 1);
+	if (ov12a10->pwdn_gpio)
+		gpiod_set_value_cansleep(ov12a10->pwdn_gpio, 1);
+	if (ov12a10->vana_gpio)
+		gpiod_set_value_cansleep(ov12a10->vana_gpio, 0);
+	clk_disable_unprepare(ov12a10->xvclk);
+	regulator_bulk_disable(OV12A10_NUM_SUPPLIES, ov12a10->supplies);
+	return 0;
+}
+
+static int ov12a10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov12a10 *ov12a10 = container_of(ctrl->handler, struct ov12a10, ctrl_handler);
+	int ret = 0;
+
+	if (!pm_runtime_get_if_in_use(ov12a10->dev))
+		return 0;
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ov12a10_write_reg(ov12a10, OV12A10_REG_ANALOG_GAIN, 2, ctrl->val);
+	break;
+	case V4L2_CID_EXPOSURE:
+		ret = ov12a10_write_reg(ov12a10, 0x3500, 3, ctrl->val << 4);
+	break;
+	case V4L2_CID_VBLANK:
+		ret = ov12a10_write_reg(ov12a10, OV12A10_REG_VTS, 2,
+				ov12a10->cur_mode->height + ctrl->val);
+	break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov12a10_write_reg(ov12a10, OV12A10_REG_TEST_PATTERN, 1, ctrl->val);
+	break;
+	}
+	pm_runtime_put(ov12a10->dev);
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ov12a10_ctrl_ops = { .s_ctrl = ov12a10_set_ctrl };
+static const char * const ov12a10_test_pattern_menu[] = {
+	"Disabled",
+	"Solid Color",
+	"100% Color Bars",
+	"Fade to Grey",
+	"PN9",
+};
+
+static int ov12a10_init_controls(struct ov12a10 *ov12a10)
+{
+	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl_handler *hdl = &ov12a10->ctrl_handler;
+	s64 hblank = ov12a10->cur_mode->hts_def - ov12a10->cur_mode->width;
+	int ret = v4l2_ctrl_handler_init(hdl, 8);
+
+	if (ret)
+		return ret;
+	hdl->lock = &ov12a10->mutex;
+	ov12a10->link_freq = v4l2_ctrl_new_int_menu(hdl, &ov12a10_ctrl_ops, V4L2_CID_LINK_FREQ,
+			0, 0, link_freq_menu_items);
+	if (ov12a10->link_freq)
+		ov12a10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ov12a10->pixel_rate = v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			OV12A10_PIXEL_RATE, OV12A10_PIXEL_RATE, 1, OV12A10_PIXEL_RATE);
+	ov12a10->vblank = v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_VBLANK, 124,
+			0x7fff - ov12a10->cur_mode->height, 1, 2656);
+	ov12a10->hblank = v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_HBLANK, hblank,
+			hblank, 1, hblank);
+	if (ov12a10->hblank)
+		ov12a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN, 0x80, 0x7ff, 1, 0x300);
+	ov12a10->exposure = v4l2_ctrl_new_std(hdl, &ov12a10_ctrl_ops, V4L2_CID_EXPOSURE, 4,
+			3360, 1, 2400);
+	v4l2_ctrl_new_std_menu_items(hdl, &ov12a10_ctrl_ops, V4L2_CID_TEST_PATTERN, 4, 0, 0,
+			ov12a10_test_pattern_menu);
+	if (hdl->error) {
+		ret = hdl->error;
+		goto err;
+	}
+	ret = v4l2_fwnode_device_parse(ov12a10->dev, &props);
+	if (ret)
+		goto err;
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, &ov12a10_ctrl_ops, &props);
+	if (ret)
+		goto err;
+	ov12a10->sd.ctrl_handler = hdl;
+	return 0;
+err:
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static void ov12a10_update_pad_format(const struct ov12a10_mode *mode,
+		struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->code = MEDIA_BUS_FMT_SRGGB10_1X10;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+}
+
+static int ov12a10_get_format(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+		struct v4l2_subdev_format *fmt)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(sd);
+
+	fmt->format = (fmt->which == V4L2_SUBDEV_FORMAT_TRY) ? *v4l2_subdev_state_get_format(sd_state,
+			fmt->pad) : fmt->format;
+	if (fmt->which != V4L2_SUBDEV_FORMAT_TRY)
+		ov12a10_update_pad_format(ov12a10->cur_mode, &fmt->format);
+	return 0;
+}
+
+static int ov12a10_set_format(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+		struct v4l2_subdev_format *fmt)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(sd);
+
+	ov12a10_update_pad_format(&supported_modes[0], &fmt->format);
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	else
+		ov12a10->cur_mode = &supported_modes[0];
+
+	return 0;
+}
+
+static int ov12a10_enum_mbus_code(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+		struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+	code->code = MEDIA_BUS_FMT_SRGGB10_1X10;
+	return 0;
+}
+
+static int ov12a10_enum_frame_size(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
+		struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes) ||
+	    fse->code != MEDIA_BUS_FMT_SRGGB10_1X10)
+		return -EINVAL;
+	fse->min_width = fse->max_width = supported_modes[fse->index].width;
+	fse->min_height = fse->max_height = supported_modes[fse->index].height;
+	return 0;
+}
+
+static int ov12a10_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(sd);
+	int ret = 0;
+
+	mutex_lock(&ov12a10->mutex);
+	if (ov12a10->streaming == enable) {
+		mutex_unlock(&ov12a10->mutex);
+		return 0;
+	}
+	if (enable) {
+		ret = pm_runtime_resume_and_get(ov12a10->dev);
+		if (ret < 0)
+			goto out;
+		ret = ov12a10_write_regs(ov12a10, ov12a10_common_regs,
+				ARRAY_SIZE(ov12a10_common_regs));
+		if (!ret)
+			ret = ov12a10_write_regs(ov12a10, ov12a10->cur_mode->regs,
+					ov12a10->cur_mode->num_regs);
+		if (!ret)
+			ret = __v4l2_ctrl_handler_setup(ov12a10->sd.ctrl_handler);
+		if (!ret) {
+			static const struct ov12a10_reg stream_on_regs[] = {
+				{ 0x0100, 0x01 },
+			};
+			usleep_range(10000, 12000);
+			ret = ov12a10_write_regs(ov12a10, stream_on_regs,
+					ARRAY_SIZE(stream_on_regs));
+		}
+		if (ret) {
+			pm_runtime_put(ov12a10->dev);
+			goto out;
+		}
+	} else {
+		ov12a10_write_reg(ov12a10, OV12A10_REG_MODE_SELECT, 1, OV12A10_MODE_STANDBY);
+		pm_runtime_put(ov12a10->dev);
+	}
+	ov12a10->streaming = enable;
+out:
+	mutex_unlock(&ov12a10->mutex);
+	return ret;
+}
+
+static int ov12a10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct ov12a10 *ov12a10 = to_ov12a10(sd);
+
+	mutex_lock(&ov12a10->mutex);
+	ov12a10_update_pad_format(&supported_modes[0], v4l2_subdev_state_get_format(fh->state,
+			0));
+	mutex_unlock(&ov12a10->mutex);
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops ov12a10_video_ops = { .s_stream = ov12a10_set_stream };
+
+static int ov12a10_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = 1280;
+		sel->r.height = 720;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_subdev_pad_ops ov12a10_pad_ops = {
+	.get_selection = ov12a10_get_selection,
+	.set_fmt = ov12a10_set_format, .get_fmt = ov12a10_get_format,
+	.enum_mbus_code = ov12a10_enum_mbus_code, .enum_frame_size = ov12a10_enum_frame_size,
+};
+static const struct v4l2_subdev_ops ov12a10_subdev_ops = {
+	.video = &ov12a10_video_ops,
+	.pad = &ov12a10_pad_ops,
+};
+static const struct media_entity_operations ov12a10_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+static const struct v4l2_subdev_internal_ops ov12a10_internal_ops = { .open = ov12a10_open };
+
+static int ov12a10_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ov12a10 *ov12a10;
+	u32 val = 0;
+	unsigned int i;
+	int ret;
+
+	ov12a10 = devm_kzalloc(dev, sizeof(*ov12a10), GFP_KERNEL);
+	if (!ov12a10)
+		return -ENOMEM;
+	ov12a10->dev = dev;
+	v4l2_i2c_subdev_init(&ov12a10->sd, client, &ov12a10_subdev_ops);
+	ov12a10->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(ov12a10->xvclk))
+		return dev_err_probe(dev, PTR_ERR(ov12a10->xvclk), "xvclk\n");
+	clk_set_rate(ov12a10->xvclk, OV12A10_XVCLK_FREQ);
+	ov12a10->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	ov12a10->vana_gpio = devm_gpiod_get_optional(dev, "vana", GPIOD_OUT_LOW);
+	ov12a10->pwdn_gpio = devm_gpiod_get_optional(dev, "pwdn", GPIOD_OUT_HIGH);
+	if (IS_ERR(ov12a10->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ov12a10->reset_gpio), "reset\n");
+	for (i = 0; i < OV12A10_NUM_SUPPLIES; i++)
+		ov12a10->supplies[i].supply = ov12a10_supply_names[i];
+	ret = devm_regulator_bulk_get(dev, OV12A10_NUM_SUPPLIES, ov12a10->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "regulators\n");
+	ret = ov12a10_power_on(dev);
+	if (ret)
+		return ret;
+	ret = ov12a10_read_reg(ov12a10, OV12A10_CHIP_ID_REG, 2, &val);
+	if (ret || val != OV12A10_CHIP_ID) {
+		dev_err(dev, "failed to identify ov12a10 (ret=%d, id=0x%04x)\n", ret, val);
+		ret = ret ? ret : -ENXIO;
+		goto err_power;
+	}
+	dev_info(dev, "identified OmniVision OV12A10 sensor (0x%04x)\n", val);
+	mutex_init(&ov12a10->mutex);
+	ov12a10->cur_mode = &supported_modes[0];
+	ret = ov12a10_init_controls(ov12a10);
+	if (ret)
+		goto err_mutex;
+	ov12a10->sd.internal_ops = &ov12a10_internal_ops;
+	ov12a10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov12a10->sd.entity.ops = &ov12a10_entity_ops;
+	ov12a10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ov12a10->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&ov12a10->sd.entity, 1, &ov12a10->pad);
+	if (ret)
+		goto err_ctrl;
+	ov12a10->sd.state_lock = &ov12a10->mutex;
+	ret = v4l2_subdev_init_finalize(&ov12a10->sd);
+	if (ret)
+		goto err_media;
+	ret = v4l2_async_register_subdev_sensor(&ov12a10->sd);
+	if (ret)
+		goto err_media;
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+	return 0;
+err_media: media_entity_cleanup(&ov12a10->sd.entity);
+err_ctrl: v4l2_ctrl_handler_free(ov12a10->sd.ctrl_handler);
+err_mutex: mutex_destroy(&ov12a10->mutex);
+err_power: ov12a10_power_off(dev);
+	return ret;
+}
+
+static void ov12a10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov12a10 *ov12a10 = to_ov12a10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	mutex_destroy(&ov12a10->mutex);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov12a10_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static const struct dev_pm_ops ov12a10_pm_ops = { SET_RUNTIME_PM_OPS(ov12a10_power_off,
+		ov12a10_power_on, NULL) };
+static const struct of_device_id ov12a10_of_match[] = { { .compatible = "ovti,ov12a10" }, { } };
+MODULE_DEVICE_TABLE(of, ov12a10_of_match);
+static struct i2c_driver ov12a10_i2c_driver = {
+	.driver = { .name = "ov12a10", .pm = &ov12a10_pm_ops, .of_match_table = ov12a10_of_match },
+	.probe = ov12a10_probe, .remove = ov12a10_remove,
+};
+module_i2c_driver(ov12a10_i2c_driver);
+MODULE_DESCRIPTION("Samsung OV12A10 5MP sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.47.3

