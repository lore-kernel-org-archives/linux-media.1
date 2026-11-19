Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102713;
	b=T6bQbwFLIS5t0Jy9PlYyee6SDncJFHLsVIyZrIdOKd87lq2JH1oEskEa7jIgN3txwvyC
	 P1fayDBrUxCPH8jIp5aXSo4UeQT0K2r3Yz0A2ry8oL5xsqNAEJLta4u3tud5g5ohXBc/w
	 cLJgqaTWTtAQfpkP23+ccVGsY6Jw2tFjBvJhb5cF+cjvHHJjaWMxlba8mKGoEXd1Ml5Ou
	 mbFYSyULEIjkqrmXi1YEV+HAugjbAhtqhbReJ6Na9kJuoqyi60UWWSHI6ISaE8Ykly62w
	 FuxpiQxtWequad5jkh21LGGFukJcOzMj0YlqqU6TSmbNzR/PQtFO5PhyjIPNZT6ndHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102713;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YXqd8tbtiVidGHxnazqMDUeGgcKxK/6kHEi2ab2RrA8=;
	b=YAP/CXC2PB2/ZCHhCrHCuDJ2FIWsJWLKGVcoZv7M0kQvMAqIDG3aeVwv13MfkA20kJk0
	 nnK01AJ+ZHMVdJ4A9ZEzIwwBxpqliB90MKFeZGKYzEdzBpIqsJXIUsshgzAG1qmA8BTQ3
	 hBeuNNiyCv1ZhEPo6cZX4/OofHntwLI0HV5AbdsYuMHFsIonUhy+D0gZaJJj8NHQ7OlJ1
	 jr8bUONK1NbJnBNkUlY3lHiXC4ozmYmNLjKBzUB594nDYt6buBaIaGsreGUB2glQtD1kM
	 EfmEoZGy+mnkm4nflahRE8aCw40qN5FHCtp4GePujhPuJEkCFqaUDmF4+kT5/z2jeaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vEjFMJej;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453E5606A32F;
	Thu, 19 Nov 2026 15:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 453E5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vEjFMJej
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFF7F1C01;
	Thu, 19 Nov 2026 07:38:29 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64B633F882;
	Thu, 19 Nov 2026 07:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102712; bh=Spd4kpPtZmPnCsBLnHjpSSENlbzTiFUN4cZdmg12lDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vEjFMJejC63u86kDeyDXUqXV0X8PPzoTqX2DfOvcixEeIhSawwN1ZivIPzju0TPJm
	 lQyRhXUlOYOiFso2raGjfICx/RR3X93wa40RNH1+PlE8sGcR1MyktSx+OjvFAP/whS
	 l8/4XLgJK9HIwPpo2hAyZFk9/heGMFga6cavZ2p0=
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
Subject: [RFC PATCH 03/28] media: mali-vpu: register V4L2 decoder device and add querycap ioctl
Date: Thu, 19 Nov 2026 15:37:33 +0000
Message-ID: <20261119153758.1426673-4-charvi.mehta@arm.com>
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

Register a V4L2 M2M decoder video device for the Mali VPU.
Add open and release file operations that allocate a per-file session.

Implement VIDIOC_QUERYCAP to report the driver and decoder identity.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 drivers/media/platform/arm/mali-vpu/Kconfig   |  1 +
 drivers/media/platform/arm/mali-vpu/Makefile  |  3 +-
 .../platform/arm/mali-vpu/mali-vpu-device.h   | 15 ++++
 .../platform/arm/mali-vpu/mali-vpu-probe.c    | 59 +++++++++++++-
 .../platform/arm/mali-vpu/mali-vpu-session.h  | 26 +++++++
 .../platform/arm/mali-vpu/mali-vpu-vidioc.c   | 78 +++++++++++++++++++
 .../platform/arm/mali-vpu/mali-vpu-vidioc.h   | 15 ++++
 7 files changed, 195 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
 create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h

diff --git a/drivers/media/platform/arm/mali-vpu/Kconfig b/drivers/media/platform/arm/mali-vpu/Kconfig
index 86403d7f424f9..d98872f2b7ec0 100644
--- a/drivers/media/platform/arm/mali-vpu/Kconfig
+++ b/drivers/media/platform/arm/mali-vpu/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_MALI_VPU
 	tristate "ARM Mali VPU driver"
+	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV
 	depends on !CPU_BIG_ENDIAN
 	help
diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media/platform/arm/mali-vpu/Makefile
index 22acf82e99a88..e659101bd0eac 100644
--- a/drivers/media/platform/arm/mali-vpu/Makefile
+++ b/drivers/media/platform/arm/mali-vpu/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 mali-vpu-objs := mali-vpu-probe.o \
-		mali-vpu-variant-v76.o
+		mali-vpu-variant-v76.o \
+		mali-vpu-vidioc.o
 
 obj-$(CONFIG_VIDEO_MALI_VPU) += mali-vpu.o
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
index 04160090e64df..d9b0801cbb520 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-device.h
@@ -7,11 +7,22 @@
 #define __MALI_VPU_DEVICE_H__
 
 #include <linux/device.h>
+#include <media/v4l2-device.h>
+
+#define MALI_VPU_DRV_NAME "mali-vpu"
 
 struct clk_bulk_data;
 struct mali_vpu_variant;
 struct reset_control_bulk_data;
 
+/**
+ * enum mali_vpu_session_role - Mali VPU session role
+ * @MALI_VPU_DECODER: Video decoding session
+ */
+enum mali_vpu_session_role {
+	MALI_VPU_DECODER = 0,
+};
+
 /**
  * struct mali_vpu_dev - Mali VPU device
  * @dev: Reference to device structure.
@@ -22,6 +33,8 @@ struct reset_control_bulk_data;
  * @rst_count: Number of reset controls in @rst_list.
  * @irq: IRQ number for VPU.
  * @variant: Structure describing variant-specific features and capabilities.
+ * @v4l2_dev: V4L2 device structure for mali vpu.
+ * @vdev_dec: Video device structure for decoder.
  */
 struct mali_vpu_dev {
 	struct device			*dev;
@@ -33,6 +46,8 @@ struct mali_vpu_dev {
 	int				irq;
 
 	const struct mali_vpu_variant	*variant;
+	struct v4l2_device		v4l2_dev;
+	struct video_device		*vdev_dec;
 };
 
 #endif /* __MALI_VPU_DEVICE_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
index 49ecd6ac4554c..6d21cb731ee1d 100644
--- a/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-probe.c
@@ -15,10 +15,14 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/string.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
 
 #include "mali-vpu-device.h"
 #include "mali-vpu-registers.h"
 #include "mali-vpu-variant.h"
+#include "mali-vpu-vidioc.h"
 
 /* VPU register access helpers */
 static u32 mali_vpu_read_reg(void __iomem *regs_base, u32 off)
@@ -119,6 +123,44 @@ static int mali_vpu_get_resources(struct mali_vpu_dev *vpu_dev)
 	return mali_vpu_get_resets(vpu_dev);
 }
 
+static int mali_vpu_register_video_device(struct mali_vpu_dev *vpu_dev,
+					  enum mali_vpu_session_role role)
+{
+	struct video_device *vdev;
+	int ret;
+
+	vdev = video_device_alloc();
+	if (!vdev)
+		return -ENOMEM;
+
+	vdev->release		= video_device_release;
+	vdev->fops		= &mali_vpu_fops;
+	vdev->vfl_dir		= VFL_DIR_M2M;
+	vdev->v4l2_dev		= &vpu_dev->v4l2_dev;
+	vdev->device_caps	= V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+
+	if (role == MALI_VPU_DECODER) {
+		strscpy(vdev->name, "mali-vpu-decoder", sizeof(vdev->name));
+		vdev->ioctl_ops		= &mali_vpu_ioctl_ops_dec;
+		vpu_dev->vdev_dec	= vdev;
+	} else {
+		ret = -EINVAL;
+		goto err_vdev_release;
+	}
+
+	video_set_drvdata(vdev, vpu_dev);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		goto err_vdev_release;
+
+	return 0;
+
+err_vdev_release:
+	video_device_release(vdev);
+	return ret;
+}
+
 static int mali_vpu_probe(struct platform_device *pdev)
 {
 	struct mali_vpu_dev *vpu_dev;
@@ -170,10 +212,22 @@ static int mali_vpu_probe(struct platform_device *pdev)
 		goto err_rst_clk;
 	}
 
+	ret = v4l2_device_register(&pdev->dev, &vpu_dev->v4l2_dev);
+	if (ret) {
+		dev_err(vpu_dev->dev, "failed to register V4L2 device\n");
+		goto err_rst_clk;
+	}
+
+	ret = mali_vpu_register_video_device(vpu_dev, MALI_VPU_DECODER);
+	if (ret)
+		goto err_unreg_v4l2;
+
 	platform_set_drvdata(pdev, vpu_dev);
 
 	return 0;
 
+err_unreg_v4l2:
+	v4l2_device_unregister(&vpu_dev->v4l2_dev);
 err_rst_clk:
 	mali_vpu_assert_reset(vpu_dev);
 err_clk:
@@ -186,6 +240,9 @@ static void mali_vpu_remove(struct platform_device *pdev)
 {
 	struct mali_vpu_dev *vpu_dev = platform_get_drvdata(pdev);
 
+	video_unregister_device(vpu_dev->vdev_dec);
+	v4l2_device_unregister(&vpu_dev->v4l2_dev);
+
 	mali_vpu_assert_reset(vpu_dev);
 	mali_vpu_disable_clk(vpu_dev);
 
@@ -205,7 +262,7 @@ static struct platform_driver mali_vpu_driver = {
 	.probe = mali_vpu_probe,
 	.remove = mali_vpu_remove,
 	.driver = {
-		.name = "mali-vpu",
+		.name = MALI_VPU_DRV_NAME,
 		.of_match_table = mali_vpu_dt_match,
 	},
 };
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
new file mode 100644
index 0000000000000..7166c53236f1a
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_SESSION_H__
+#define __MALI_VPU_SESSION_H__
+
+#include <media/v4l2-fh.h>
+
+#include "mali-vpu-device.h"
+
+/**
+ * struct mali_vpu_session - holds per session state and resources.
+ * @vpu_dev: Reference to the parent device structure.
+ * @role: Role of this session.
+ * @fh: V4L2 file handle for this session.
+ */
+struct mali_vpu_session {
+	struct mali_vpu_dev		*vpu_dev;
+	enum mali_vpu_session_role	role;
+
+	struct v4l2_fh		fh;
+};
+
+#endif /* __MALI_VPU_SESSION_H__ */
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
new file mode 100644
index 0000000000000..7a169b7b14bf3
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+
+#include "mali-vpu-session.h"
+#include "mali-vpu-vidioc.h"
+
+static int mali_vpu_open(struct file *filp)
+{
+	struct video_device *vdev	= video_devdata(filp);
+	struct mali_vpu_dev *vpu_dev	= video_drvdata(filp);
+	struct mali_vpu_session *sess;
+	int ret;
+
+	sess = kzalloc_obj(*sess);
+	if (!sess)
+		return -ENOMEM;
+
+	if (vdev == vpu_dev->vdev_dec) {
+		sess->role = MALI_VPU_DECODER;
+	} else {
+		ret = -EINVAL;
+		goto err_free_sess;
+	}
+
+	sess->vpu_dev = vpu_dev;
+
+	v4l2_fh_init(&sess->fh, vdev);
+	v4l2_fh_add(&sess->fh, filp);
+
+	return 0;
+
+err_free_sess:
+	kfree(sess);
+	return ret;
+}
+
+static int mali_vpu_release(struct file *filp)
+{
+	struct mali_vpu_session *sess = container_of(file_to_v4l2_fh(filp),
+						     struct mali_vpu_session, fh);
+
+	v4l2_fh_del(&sess->fh, filp);
+	v4l2_fh_exit(&sess->fh);
+	kfree(sess);
+	return 0;
+}
+
+const struct v4l2_file_operations mali_vpu_fops = {
+	.owner		= THIS_MODULE,
+	.open		= mali_vpu_open,
+	.release	= mali_vpu_release,
+	.unlocked_ioctl = video_ioctl2,
+};
+
+static int mali_vpu_querycap(struct file *filp, void *fh,
+			     struct v4l2_capability *cap)
+{
+	struct video_device *vdev = video_devdata(filp);
+
+	strscpy(cap->driver, MALI_VPU_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, vdev->name, sizeof(cap->card));
+
+	return 0;
+}
+
+const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec = {
+	.vidioc_querycap = mali_vpu_querycap,
+};
diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h
new file mode 100644
index 0000000000000..e1aedea5bbcb6
--- /dev/null
+++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 ARM Limited.
+ */
+
+#ifndef __MALI_VPU_VIDIOC_H__
+#define __MALI_VPU_VIDIOC_H__
+
+struct v4l2_file_operations;
+struct v4l2_ioctl_ops;
+
+extern const struct v4l2_file_operations mali_vpu_fops;
+extern const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec;
+
+#endif /* __MALI_VPU_VIDIOC_H__ */
-- 
2.43.0

