Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102713;
	b=p4Q41u0SAnXjt7mAUa2kFLwf7eyRnwn9jNnYGxOHsCb2hTzlafTvNoGi2B/rAYMQK+Kj
	 yNMpFOHbP7L3ZM2dz4/NoYgS0pwkYxWaVxpPsMOgcIUKUVmLa4zTxyZhdDLUh7XEdx7m7
	 3K6R1O+1R6zH5kOQXfwZdcQsGH2oiCkuvIKaPT/IzNW0PsMdVicPL5FWtl77/CjodoNwA
	 at62e1dK5GB75egx8nPhKt95HWjb3IW9ef51TJk5EzALPQTC72XeSJE9j8tj4nyIhEgYU
	 IY2hEucw7/kmvHSnkgQxJslm0FZbM91BaU4tD510Ok0b/X4Q+4Cnzl7UyawDlLUQx0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102713;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1YFuRxtKzwnOcKht4qdDod9bjjlWGpLcVsx+RYB/yUE=;
	b=rJ9ysgcEABkEbpR9jyOSHdee1P5hOYLTVp4xOfvWOduO1pYbH66/LK0AGxS6DYEgy1Cy
	 jy6ogLVOY3V3hBI7Nj5GhSqAdCi71/Yf9oKWsCeyv4Y4uP0Ity5MHvaJGr2lBgEqhagPE
	 EhU+okKxhlDSkf/L/QGQzWxLc+AvBVy5+HWo+2gjbEEcugxJfDPyTaiQgGcdKy0YpNad3
	 emOjOZ1NK/W+UIKBlb1f9jUlT6Sn/1TuWy342EzSyoY3Irco3l2qYNlaz4+eAhUdRX+Iq
	 exxSWyJuUGTHuqb17+SOWmbsDPmQiJP82atP7OH+89t+AcUwfJZqKKMDi3cOQ3om+6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=G3WjzbnQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B587360A382B;
	Thu, 19 Nov 2026 15:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B587360A382B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=G3WjzbnQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E1231C0A;
	Thu, 19 Nov 2026 07:38:28 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C19D3F882;
	Thu, 19 Nov 2026 07:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102711; bh=v3ygAwkBGltf6W2A26lTk+YxDSXT4tojh/6RfZUQnsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G3WjzbnQ/ycugARuSANc/chZ0qn04VRj9E+fC6ABCkKVEc38xr+6Qra2YD+WFoyk4
	 6SCoSJ65+73OGfddcsW/UoCK19aPNgeD9yyqsf3GceZ+B4xl7YT18J0g+IhqlWm4Cb
	 HkmZ8khJPKikO7LJZx5txPeBW0oYJyxyI3qQqt/k=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 02/28] media: mali-vpu: add Mali VPU platform driver
Date: Thu, 19 Nov 2026 15:37:32 +0000
Message-ID: <20261119153758.1426673-3-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
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

In preparation for adding H.264 video decode support, add the platform
driver for Arm Mali-VPU.

Add probe and remove operations to acquire and manage the MMIO region,
interrupt, clocks and reset controls. Add the variant data for Mali-V76
and validate the hardware product ID during probe.

Restrict the driver to little-endian kernels, as the firmware interface
uses little-endian shared memory structures accessed in native-byte order.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/Kconfig            |   1 +
 drivers/media/platform/arm/Makefile           |   1 +
 drivers/media/platform/arm/mali-vpu/Kconfig   |  14 ++
 drivers/media/platform/arm/mali-vpu/Makefile  |   6 +
 .../platform/arm/mali-vpu/mali-vpu-device.h   |  38 ++++
 .../platform/arm/mali-vpu/mali-vpu-probe.c    | 215 ++++++++++++++++++
 .../arm/mali-vpu/mali-vpu-registers.h         |  24 ++
 .../arm/mali-vpu/mali-vpu-variant-v76.c       |  21 ++
 .../platform/arm/mali-vpu/mali-vpu-variant.h  |  25 ++
 9 files changed, 345 insertions(+)
 create mode 100644 drivers/media/platform/arm/mali-vpu/Kconfig
 create mode 100644 drivers/media/platform/arm/mali-vpu/Makefile
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h

diff --git a/drivers/media/platform/arm/Kconfig b/drivers/media/platform/arm/Kconfig
index 4f0764c329c74..339969d0ef4ce 100644
--- a/drivers/media/platform/arm/Kconfig
+++ b/drivers/media/platform/arm/Kconfig
@@ -3,3 +3,4 @@
 comment "ARM media platform drivers"
 
 source "drivers/media/platform/arm/mali-c55/Kconfig"
+source "drivers/media/platform/arm/mali-vpu/Kconfig"
diff --git a/drivers/media/platform/arm/Makefile b/drivers/media/platform/arm/Makefile
index 8cc4918725efa..3c38ad267e59a 100644
--- a/drivers/media/platform/arm/Makefile
+++ b/drivers/media/platform/arm/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += mali-c55/
+obj-y += mali-vpu/
diff --git a/drivers/media/platform/arm/mali-vpu/Kconfig b/drivers/media/platform/arm/mali-vpu/Kconfig
new file mode 100644
index 0000000000000..86403d7f424f9
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_MALI_VPU
+	tristate "ARM Mali VPU driver"
+	depends on VIDEO_DEV
+	depends on !CPU_BIG_ENDIAN
+	help
+	  Enable this to support Arm's Mali Video hardware accelerator.
+	  This is a V4L2 driver.
+
+	  Only little-endian kernels are supported. The firmware interface
+	  uses little-endian shared-memory structures.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mali-vpu.
diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
new file mode 100644
index 0000000000000..22acf82e99a88
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+mali-vpu-objs := mali-vpu-probe.o \
+		mali-vpu-variant-v76.o
+
+obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
new file mode 100644
index 0000000000000..04160090e64df
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_DEVICE_H__
+#define __MALI_VPU_DEVICE_H__
+
+#include <linux/device.h>
+
+struct clk_bulk_data;
+struct mali_vpu_variant;
+struct reset_control_bulk_data;
+
+/**
+ * struct mali_vpu_dev - Mali VPU device
+ * @dev: Reference to device structure.
+ * @regs_base: MMIO base address for VPU registers.
+ * @clk_list: List of VPU clocks.
+ * @clk_count: Number of clocks in @clk_list.
+ * @rst_list: List of reset controls.
+ * @rst_count: Number of reset controls in @rst_list.
+ * @irq: IRQ number for VPU.
+ * @variant: Structure describing variant-specific features and capabilities.
+ */
+struct mali_vpu_dev {
+	struct device			*dev;
+	void __iomem			*regs_base;
+	struct clk_bulk_data		*clk_list;
+	unsigned int			clk_count;
+	struct reset_control_bulk_data	*rst_list;
+	unsigned int			rst_count;
+	int				irq;
+
+	const struct mali_vpu_variant	*variant;
+};
+
+#endif /* __MALI_VPU_DEVICE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
new file mode 100644
index 0000000000000..49ecd6ac4554c
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "mali-vpu-device.h"
+#include "mali-vpu-registers.h"
+#include "mali-vpu-variant.h"
+
+/* VPU register access helpers */
+static u32 mali_vpu_read_reg(void __iomem *regs_base, u32 off)
+{
+	return readl(regs_base + off);
+}
+
+static void mali_vpu_read_version(struct mali_vpu_dev *vpu_dev, u32 *product_id, u32 *rev,
+				  u32 *patch)
+{
+	u32 pid_prefix, pid_suffix;
+
+	u32 hwver = mali_vpu_read_reg(vpu_dev->regs_base, MALI_VPU_REG_VERSION);
+
+	pid_prefix = FIELD_GET(MALI_VPU_VERSION_PRODUCT_ID_MASK, hwver);
+	pid_suffix = FIELD_GET(MALI_VPU_PID_SUFFIX_MASK, hwver);
+
+	*product_id	= (pid_prefix << 4) | pid_suffix;
+	*rev		= FIELD_GET(MALI_VPU_VERSION_REVISION_MASK, hwver);
+	*patch		= FIELD_GET(MALI_VPU_VERSION_PATCH_MASK, hwver);
+}
+
+static int mali_vpu_get_clocks(struct mali_vpu_dev *vpu_dev)
+{
+	int ret;
+
+	ret = devm_clk_bulk_get_all(vpu_dev->dev, &vpu_dev->clk_list);
+	if (ret < 0)
+		return dev_err_probe(vpu_dev->dev, ret, "failed to get clocks\n");
+	if (!ret)
+		return dev_err_probe(vpu_dev->dev, -EINVAL, "no clocks found\n");
+
+	vpu_dev->clk_count = ret;
+
+	return 0;
+}
+
+static int mali_vpu_get_resets(struct mali_vpu_dev *vpu_dev)
+{
+	unsigned int i;
+	int ret;
+
+	vpu_dev->rst_count = vpu_dev->variant->num_rsts;
+	if (vpu_dev->rst_count == 0)
+		return 0;
+
+	vpu_dev->rst_list = devm_kcalloc(vpu_dev->dev, vpu_dev->rst_count,
+					 sizeof(*vpu_dev->rst_list), GFP_KERNEL);
+	if (!vpu_dev->rst_list)
+		return -ENOMEM;
+
+	for (i = 0; i < vpu_dev->rst_count; i++)
+		vpu_dev->rst_list[i].id = vpu_dev->variant->rst_names[i];
+
+	ret = devm_reset_control_bulk_get_optional_exclusive(vpu_dev->dev,
+							     vpu_dev->rst_count,
+							     vpu_dev->rst_list);
+	if (ret)
+		return dev_err_probe(vpu_dev->dev, ret, "failed to get reset controls\n");
+
+	return 0;
+}
+
+static int mali_vpu_enable_clk(struct mali_vpu_dev *vpu_dev)
+{
+	return clk_bulk_prepare_enable(vpu_dev->clk_count, vpu_dev->clk_list);
+}
+
+static void mali_vpu_disable_clk(struct mali_vpu_dev *vpu_dev)
+{
+	clk_bulk_disable_unprepare(vpu_dev->clk_count, vpu_dev->clk_list);
+}
+
+static void mali_vpu_assert_reset(struct mali_vpu_dev *vpu_dev)
+{
+	if (!vpu_dev->rst_count)
+		return;
+
+	reset_control_bulk_assert(vpu_dev->rst_count, vpu_dev->rst_list);
+}
+
+static int mali_vpu_deassert_reset(struct mali_vpu_dev *vpu_dev)
+{
+	if (!vpu_dev->rst_count)
+		return 0;
+
+	return reset_control_bulk_deassert(vpu_dev->rst_count, vpu_dev->rst_list);
+}
+
+static int mali_vpu_get_resources(struct mali_vpu_dev *vpu_dev)
+{
+	int ret;
+
+	ret = mali_vpu_get_clocks(vpu_dev);
+	if (ret)
+		return ret;
+
+	return mali_vpu_get_resets(vpu_dev);
+}
+
+static int mali_vpu_probe(struct platform_device *pdev)
+{
+	struct mali_vpu_dev *vpu_dev;
+	u32 pid, rev, patch;
+	int ret;
+
+	vpu_dev = devm_kzalloc(&pdev->dev, sizeof(*vpu_dev), GFP_KERNEL);
+	if (!vpu_dev)
+		return -ENOMEM;
+	vpu_dev->dev = &pdev->dev;
+
+	vpu_dev->variant = of_device_get_match_data(&pdev->dev);
+	if (!vpu_dev->variant)
+		return -ENODEV;
+
+	vpu_dev->regs_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vpu_dev->regs_base))
+		return PTR_ERR(vpu_dev->regs_base);
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+	vpu_dev->irq = ret;
+
+	ret = mali_vpu_get_resources(vpu_dev);
+	if (ret)
+		return ret;
+
+	ret = mali_vpu_enable_clk(vpu_dev);
+	if (ret) {
+		dev_err(vpu_dev->dev, "failed to enable core clock\n");
+		return ret;
+	}
+
+	ret = mali_vpu_deassert_reset(vpu_dev);
+	if (ret) {
+		dev_err(vpu_dev->dev, "failed to deassert reset\n");
+		goto err_clk;
+	}
+
+	mali_vpu_read_version(vpu_dev, &pid, &rev, &patch);
+	dev_info(&pdev->dev, "Mali VPU device product ID: %#x, revision: %#x, patch: %#x\n",
+		 pid, rev, patch);
+
+	if (pid != vpu_dev->variant->expected_hw_pid) {
+		dev_err(vpu_dev->dev, "unexpected hardware product ID: %#x (expected %#x)\n",
+			pid, vpu_dev->variant->expected_hw_pid);
+		ret = -ENODEV;
+		goto err_rst_clk;
+	}
+
+	platform_set_drvdata(pdev, vpu_dev);
+
+	return 0;
+
+err_rst_clk:
+	mali_vpu_assert_reset(vpu_dev);
+err_clk:
+	mali_vpu_disable_clk(vpu_dev);
+
+	return ret;
+}
+
+static void mali_vpu_remove(struct platform_device *pdev)
+{
+	struct mali_vpu_dev *vpu_dev = platform_get_drvdata(pdev);
+
+	mali_vpu_assert_reset(vpu_dev);
+	mali_vpu_disable_clk(vpu_dev);
+
+	platform_set_drvdata(pdev, NULL);
+}
+
+static const struct of_device_id mali_vpu_dt_match[] = {
+	{
+		.compatible = "arm,mali-v76",
+		.data = &mali_vpu_v76_variant,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mali_vpu_dt_match);
+
+static struct platform_driver mali_vpu_driver = {
+	.probe = mali_vpu_probe,
+	.remove = mali_vpu_remove,
+	.driver = {
+		.name = "mali-vpu",
+		.of_match_table = mali_vpu_dt_match,
+	},
+};
+
+module_platform_driver(mali_vpu_driver);
+MODULE_DESCRIPTION("Arm Mali VPU driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
new file mode 100644
index 0000000000000..471a1f2412a7a
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-registers.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_REGISTERS_H__
+#define __MALI_VPU_REGISTERS_H__
+
+#include <linux/bits.h>
+
+/*
+ * Mali VPU register offsets and bitfield definitions.
+ *
+ * Offsets are relative to the VPU MMIO base.
+ */
+#define MALI_VPU_REG_VERSION 0x00000
+
+/* Version register fields */
+#define MALI_VPU_VERSION_PRODUCT_ID_MASK GENMASK(31, 16)
+#define MALI_VPU_VERSION_REVISION_MASK   GENMASK(15, 8)
+#define MALI_VPU_VERSION_PATCH_MASK      GENMASK(7, 0)
+#define MALI_VPU_PID_SUFFIX_MASK         GENMASK(15, 12)
+
+#endif /* __MALI_VPU_REGISTERS_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
new file mode 100644
index 0000000000000..36509d6a1c5d5
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant-v76.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/array_size.h>
+
+#include "mali-vpu-variant.h"
+
+#define MALI_VPU_HW_PID_V76 0x56627
+
+static const char * const mali_v76_rst_names[] = {
+	"warm",
+};
+
+const struct mali_vpu_variant mali_vpu_v76_variant = {
+	.expected_hw_pid = MALI_VPU_HW_PID_V76,
+
+	.rst_names = mali_v76_rst_names,
+	.num_rsts = ARRAY_SIZE(mali_v76_rst_names),
+};
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
new file mode 100644
index 0000000000000..dadfd686275db
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-variant.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_VARIANT_H__
+#define __MALI_VPU_VARIANT_H__
+
+#include <linux/types.h>
+
+/**
+ * struct mali_vpu_variant - Variant-specific hardware capability descriptor.
+ * @rst_names: Array of reset control names for this variant.
+ * @num_rsts: Number of reset controls for this variant.
+ * @expected_hw_pid: Expected hardware product ID read from the version register.
+ */
+struct mali_vpu_variant {
+	const char * const *rst_names;
+	unsigned int num_rsts;
+	u32 expected_hw_pid;
+};
+
+extern const struct mali_vpu_variant mali_vpu_v76_variant;
+
+#endif /* __MALI_VPU_VARIANT_H__ */
-- 
2.43.0

