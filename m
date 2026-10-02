Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1BF44A414
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929149; cv=pass; b=VoL+4sbrvh9QfnA26/lgEbBRbnz92wa06rXQBvEAGTzRwFzxwSt4tntAEMO+7e5wq3jredfT6LsDdg2VHdvv2XMMDslNbJXppqQ3QikWiEkAhs5Z4CpGVR09CJJn8/lHKuxbJuQ8486Tl17Hki3JFGg3XEvyE3KUsPq+/DKxhQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929149; c=relaxed/simple;
	bh=27hxXloP76JsKfsmk584722mn6NeJkNLSEB2gBVr7Io=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYsNgsiymmIO8IIy3ZqKCd4bv8UrBK4Veoua1lPjWl1u/1H5ZHcJSQGUYt3MbjYnpzlkijv5PBDBH0jKFJDdEILRPyLOukMPJIBVgqBI/mCYuaH+LmMUsKnpCNUJOivDdVRhyxZVQ2PhStdYd0foe4SOxff1R4QrX3FElQleJoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIw6YUR4; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIw6YUR4"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c72bd8a017so4328121eaf.3
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929145; cv=none;
        d=google.com; s=arc-20260327;
        b=IqLFo91B+D0Fn1CLAceqc+R5u00pAzmUnMPc0o85S+PNLx/jMkM10WAGL0p7cf6o5i
         WW5PSwiUd652q6NMJ3bF2Tq25Wof9na7bUm3z85x5ENo8uHb2L9ogKVvQeUux/0up3QC
         9aQdy0kMdi9isG3Uu+5F32NaVJZYjp8WTlarFfPYhDlua1S4bOA4h/zfOwfc5O8N27mI
         QI3WeOxVbcN/5sSJDgOAx8t2GunSZSyFWIgehzRFmhJNoCV9OmRuErxNYBOI+5jqjDi3
         Sq5/G6Ko6Fk6wD0enxjL0GL6JRe0qHgLaaeZNrvjaa+6lLHTdWF0BYggbls1TqHOATU3
         l1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=TBB5VLvsRNqJPLPM7Vv3h3G/5GzyI/UfTCWuNdJZ3fY=;
        fh=bh5G9E0Gj587l2TwnAgfshH/ad9aU1eN+LA7HQd3kx8=;
        b=K0Z4+MwxJ4ifuPqd7PfabJXBRrFHEL0dMz1pjSrIygMG8EQgzIumRhnKGw27q+HXvv
         IGTgRYAp4J6h3LJ1/db73+eCEjiR/8VVWKiIN7M2rBGjHfs6/h2J0Vr0sUDJCeocCvsX
         CmFz/a/+5wrwkpyUTgXnkxDwKn4yrqHjZQGmWwMlj/bauTRkbitW+pM8VvM3BCXmBdof
         MGI0AWrV3uWSDABb1PRYnLzv7/kaUKcLRy9UQsnwY6nc7QVt+o++gnSwWModAsZ5kqJY
         /wy4lDdBtv6LZHvnWSYce617tsZRgmz/4Oj60J9iCKNoeQ3rSnbgzOdTNGRhu6tWXPvN
         lExw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929145; x=1791533945; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBB5VLvsRNqJPLPM7Vv3h3G/5GzyI/UfTCWuNdJZ3fY=;
        b=GIw6YUR4PLSnU7k3/QpEy+7p6Q3AKeaiSTlPw0JC9mquVvTxk6rYt//lUDosqnq6eZ
         4X64nHau+WzDkxkjXZsAt7vbko/+6b7xOszZz2MWnSpnX1s37cWmDZG63xACh/vB+rmj
         ym39Z0vZ7EocyJpOsxcNyNcpKNsRuDPqeUEmWro9fMPZiE7di4qcQOiYf4HxLINDfuID
         huT02nGxe5II48Gk1sL27kPnV2bNbyieT1JOuieyhp5rXu9UuNsay/gVM9qhVLMxdFDe
         E8nYS+I6Z3OLPUUXXX/9Xfcy1dovCHtqLmvYEk45FdI8mz4Yub9VvkF7+cD6GcXlnx/i
         jOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929145; x=1791533945;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBB5VLvsRNqJPLPM7Vv3h3G/5GzyI/UfTCWuNdJZ3fY=;
        b=K+H56RsudKnZxI9Pq1++n7dMEJlRyGdPZx0MDaEO4xVDfDr2JCf4yFl2tCu1+47wNY
         TVgJyo0WXAb4ieYSeSCaF6P4zTCHVOl0N4z7evKA6qYbr6A2YG0h2NXgGrsbfxY2sw3R
         jEWIajsNegyuGDPg4wuoVYTA55QeQIajyZHVAVE+xZKZogqYZ53H1LbIo9mYVzvgLjdZ
         5qZDNC7dQQSNUpyU0G79Ts6bCFbMLGpHWhcFiD+wgS9RTY3zENBr5URpuvd92nkyfHOa
         IrTQ3dxDlTbLbHrAE+OlBKj3MQ9a+xogjFlw3hulP8vY610DbeWcBlvLjdScJrNq8DmH
         J4Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwsAj9fhsBOe5EQQssuWFJ2orDRs2GqGZjUg+bGxUL6qpAnb1kr4lFYZGqpkM5sJTuMnMmwf2OmA39cNg==@vger.kernel.org
X-Gm-Message-State: AFuF++lxFubXJof4AibeQIefamloLXFy0eHw1KvkaAtVPoSLF5mRkj7F
	lrsa2CEJ1FgUtwyFVllyWVhpNgie+cumSHeRGAPPpZBuhyj5bGaM4ETtjP3elsxSjbgloUUSrMF
	oVBKIuhJFtqYnsMuxEVzTie2IpcaPmtw=
X-Gm-Gg: AYBFou3kQVzbdvg9hhH0p2sCaCKqFjfQrnFmWcZs+nYQL4QbhpwGPDgn3k+KrtT8+i2
	EJtBGbk6tq84SnD0GJpYad1lbn7SXIDEiydgTbryUDPQZ/bByAXgO2Mp8xa3GiMTS0ucTavPh17
	R4CdEC84wBS/hCEX3X+0A4ZZqKTPK2Ows9qcC3i/pJKmIM7ulW01W0+LCPQgMsAMNLdiobLbpX7
	NUVtQahIWH2eiKxNxTSG9mC4BwQhLYy36rqJI68E4z6JIDHDVU3lv0zTGZzl6rCU+WZlLqeiMV3
	8MmyAvd3VbR5HKDYVb53bSVrr6PKlD4ocU5TwJtZHJLLbDbTa01VTuK2GIdol1syM6zM007nQ5y
	a9j49dv2WLwH1fewlshI6tfdZw90DT+KqdA==
X-Received: by 2002:a4a:ee83:0:b0:6df:3690:d092 with SMTP id
 006d021491bc7-6df3690d0demr1473997eaf.83.1790929145116; Fri, 02 Oct 2026
 01:19:05 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:19:04 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:19:04 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:19:04 -0700
X-Gm-Features: AclHuK94Z1GzlwpWH9hv5Bi2k_51UO1H2knYbtS1vtyy1-uKsVbUP2Z4wlXl2-8
Message-ID: <CAO7O_xiMnK+dxmGKc5oJsSy8cCgZTWn0upmJ0cxNzJitfGNHVQ@mail.gmail.com>
Subject: [PATCH v8 15/15] media: i2c: Add WV517S lens actuator driver
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Lenovo Yoga Book YB1-X91 rear camera contains a WV517S voice-coil
actuator. Add a V4L2 lens subdevice exposing the standard 10-bit
FOCUS_ABSOLUTE control and the device ringing-control mode.

Use regmap for register access and tie control updates to runtime PM so
the IPU bridge sensor link keeps shared power resources active. Propagate
PM acquisition failures and restore the drive mode and controls after
resume.

The register addresses and drive-mode value are derived from Intel's
GPL-2.0 WV517 driver. Retain the Intel copyright notice and document the
2026 copyright for this V4L2/regmap implementation.

Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/wv517.c
Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 MAINTAINERS                |   1 +
 drivers/media/i2c/Kconfig  |  11 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/wv517s.c | 208 +++++++++++++++++++++++++++++++++++++
 4 files changed, 221 insertions(+)
 create mode 100644 drivers/media/i2c/wv517s.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6bdc32e7c8bf..9b0a6ef0bec8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28656,6 +28656,7 @@ S:	Maintained
 F:	drivers/media/i2c/ak*
 F:	drivers/media/i2c/dw*
 F:	drivers/media/i2c/lm*
+F:	drivers/media/i2c/wv517s.c

 V4L2 CAMERA SENSOR DRIVERS
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index b9961f77f0c4..9ccfa4b881f0 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -991,6 +991,17 @@ config VIDEO_DW9807_VCM
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.

+config VIDEO_WV517S
+	tristate "WV517S lens voice coil support"
+	select REGMAP_I2C
+	help
+	  This is a driver for the WV517S camera lens voice coil. The driver
+	  supports 10-bit focus control and exposes the actuator through the
+	  standard V4L2 lens sub-device interface.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called wv517s.
+
 endif

 menu "Flash devices"
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 351c41ef25f8..6c3b4f06b819 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -178,4 +178,5 @@ obj-$(CONFIG_VIDEO_VP27SMPX) += vp27smpx.o
 obj-$(CONFIG_VIDEO_VPX3220) += vpx3220.o
 obj-$(CONFIG_VIDEO_WM8739) += wm8739.o
 obj-$(CONFIG_VIDEO_WM8775) += wm8775.o
+obj-$(CONFIG_VIDEO_WV517S) += wv517s.o
 obj-$(CONFIG_VIDEO_INTEL_CVS) += cvs/
diff --git a/drivers/media/i2c/wv517s.c b/drivers/media/i2c/wv517s.c
new file mode 100644
index 000000000000..e252a423289d
--- /dev/null
+++ b/drivers/media/i2c/wv517s.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * WV517S voice-coil motor driver
+ *
+ * Copyright (c) 2014 Intel Corporation.
+ * Copyright (C) 2026 Maurizio Casciano <mauriziocasciano7@gmail.com>
+ */
+
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+
+#define WV517S_MAX_FOCUS_POSITION	1023
+#define WV517S_DEFAULT_FOCUS_POSITION	300
+
+#define WV517S_REG_FOCUS		0x41
+#define WV517S_REG_DRIVE_MODE		0x43
+#define WV517S_DRIVE_MODE_12_6_MS	0x0211
+
+struct wv517s_device {
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_subdev sd;
+	struct regmap *regmap;
+	bool resuming;
+};
+
+static inline struct wv517s_device *to_wv517s(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct wv517s_device, sd);
+}
+
+static const struct regmap_config wv517s_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 16,
+	.max_register = WV517S_REG_DRIVE_MODE,
+	.val_format_endian = REGMAP_ENDIAN_BIG,
+};
+
+static int wv517s_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct wv517s_device *wv517s =
+		container_of(ctrl->handler, struct wv517s_device, ctrl_handler);
+	struct device *dev = wv517s->sd.dev;
+	int pm_ret;
+	int ret;
+
+	if (ctrl->id != V4L2_CID_FOCUS_ABSOLUTE)
+		return -EINVAL;
+
+	/*
+	 * Runtime resume restores controls while the PM state is RPM_RESUMING.
+	 */
+	pm_ret = pm_runtime_get_if_active(dev);
+	if (!pm_ret && !wv517s->resuming)
+		return 0;
+	if (pm_ret < 0)
+		return pm_ret;
+
+	ret = regmap_write(wv517s->regmap, WV517S_REG_FOCUS, ctrl->val);
+
+	if (pm_ret > 0)
+		pm_runtime_put(dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops wv517s_ctrl_ops = {
+	.s_ctrl = wv517s_set_ctrl,
+};
+
+static int wv517s_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	return pm_runtime_resume_and_get(sd->dev);
+}
+
+static int wv517s_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	pm_runtime_put(sd->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops wv517s_internal_ops = {
+	.open = wv517s_open,
+	.close = wv517s_close,
+};
+
+static const struct v4l2_subdev_ops wv517s_subdev_ops = { };
+
+static int wv517s_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct wv517s_device *wv517s = to_wv517s(sd);
+	int ret;
+
+	/* Restore the vendor-recommended 12.6 ms ringing-control mode. */
+	ret = regmap_write(wv517s->regmap, WV517S_REG_DRIVE_MODE,
+			   WV517S_DRIVE_MODE_12_6_MS);
+	if (ret)
+		return ret;
+
+	wv517s->resuming = true;
+	ret = v4l2_ctrl_handler_setup(&wv517s->ctrl_handler);
+	wv517s->resuming = false;
+
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(wv517s_pm_ops, NULL, wv517s_resume, NULL);
+
+static int wv517s_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct wv517s_device *wv517s;
+	int ret;
+
+	wv517s = devm_kzalloc(dev, sizeof(*wv517s), GFP_KERNEL);
+	if (!wv517s)
+		return -ENOMEM;
+
+	wv517s->regmap = devm_regmap_init_i2c(client, &wv517s_regmap_config);
+	if (IS_ERR(wv517s->regmap))
+		return dev_err_probe(dev, PTR_ERR(wv517s->regmap),
+				     "failed to initialize regmap\n");
+
+	v4l2_i2c_subdev_init(&wv517s->sd, client, &wv517s_subdev_ops);
+	wv517s->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	wv517s->sd.internal_ops = &wv517s_internal_ops;
+	wv517s->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	v4l2_ctrl_handler_init(&wv517s->ctrl_handler, 1);
+	v4l2_ctrl_new_std(&wv517s->ctrl_handler, &wv517s_ctrl_ops,
+			  V4L2_CID_FOCUS_ABSOLUTE, 0,
+			  WV517S_MAX_FOCUS_POSITION, 1,
+			  WV517S_DEFAULT_FOCUS_POSITION);
+	if (wv517s->ctrl_handler.error) {
+		ret = wv517s->ctrl_handler.error;
+		goto err_free_ctrl_handler;
+	}
+	wv517s->sd.ctrl_handler = &wv517s->ctrl_handler;
+
+	ret = media_entity_pads_init(&wv517s->sd.entity, 0, NULL);
+	if (ret)
+		goto err_free_ctrl_handler;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	ret = wv517s_resume(dev);
+	if (ret)
+		goto err_disable_pm;
+
+	ret = v4l2_async_register_subdev(&wv517s->sd);
+	if (ret)
+		goto err_disable_pm;
+
+	pm_runtime_idle(dev);
+
+	return 0;
+
+err_disable_pm:
+	pm_runtime_disable(dev);
+	media_entity_cleanup(&wv517s->sd.entity);
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
+
+	return ret;
+}
+
+static void wv517s_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct wv517s_device *wv517s = to_wv517s(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	pm_runtime_disable(&client->dev);
+	v4l2_ctrl_handler_free(&wv517s->ctrl_handler);
+	media_entity_cleanup(&sd->entity);
+}
+
+static const struct i2c_device_id wv517s_id_table[] = {
+	{ .name = "wv517s" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, wv517s_id_table);
+
+static struct i2c_driver wv517s_i2c_driver = {
+	.driver = {
+		.name = "wv517s",
+		.pm = pm_ptr(&wv517s_pm_ops),
+	},
+	.probe = wv517s_probe,
+	.remove = wv517s_remove,
+	.id_table = wv517s_id_table,
+};
+module_i2c_driver(wv517s_i2c_driver);
+
+MODULE_AUTHOR("Maurizio Casciano <mauriziocasciano7@gmail.com>");
+MODULE_DESCRIPTION("WV517S VCM driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0



On Fri, 02 Oct 2026 01:15:55 -0700, mauriziocasciano7@gmail.com wrote:
> Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
> an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
> and a WV517S rear-camera lens actuator.
>
> The series adds the missing ACPI and bridge configuration, selects the
> OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
> AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
> capture and adds the sensor controls and actuator driver needed by the
> hardware.
>
> Runtime validation used the same 15-patch content on the current
> media_stage.git master. The final media-committers.git next rebase changes
> only three source line wraps needed by the media 80-column check:
>
> - W=1 builds and sparse builds of all eight affected objects passed both
>   before and after the rebase.
> - A full x86_64 Debian binary package build passed and produced kernel
>   7.3.0-rc1-yogabook-media-v8-20261002-001605.
> - The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
>   8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
>   both sensors bound and AtomISP registered two cameras.
> - OV8858 digital, red and blue gains were changed during streaming and
>   read back correctly. Continuous raw capture produced changing frames
>   from both sensors (6/8 unique rear samples and 8/8 unique front
>   samples), including front-to-rear-to-front switching without OV8858,
>   I2C or CSI errors.
> - Both front and rear cameras were also exercised successfully with
>   Cheese.
> - v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
>   40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
>   control enumeration, stream-parameter and buffer tests. These failures
>   remain a validation limitation; this series does not claim to make the
>   staging AtomISP driver fully compliant.
>
> Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
> 24 MHz paths received build and static-analysis coverage but were not
> tested on separate hardware.
>
> ---
> Changes in v8:
>
> - Keep patch 2's commit message focused on the implementation, remove the
>   invalid review Link and move runtime results to this cover letter.
> - Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
>   tables by their input and link frequencies, and remove platform names
>   from the sensor driver.
> - Explain that V4L2 exposes standard red and blue balance controls but no
>   standard green-balance control, so green remains the unity reference.
> - Replace the per-sensor link-frequency override with the IPU bridge's
>   existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
>   288 MHz entry before the generic 360 MHz fallback. This removes the
>   associated AtomISP hand-off patch and reduces the series to 15 patches.
> - Add the introducing commit to the OV2740 group-hold fix and mark it for
>   stable backporting.
> - Use the documented Assisted-by tag syntax.
> - Keep the padding helper as a normal static function and avoid a
>   single-use raw-format descriptor structure.
> - Retain Andy's Reviewed-by tags only where the corresponding patches did
>   not change materially. In particular, drop the tag from the redesigned
>   IPU bridge frequency patch.
>
> v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/
>
> Maurizio Casciano (15):
>   media: ov8858: Extract digital gain programming
>   media: ov8858: support 19.2 MHz clock and manual white balance
>   media: ov2740: Use C99 initializers for ACPI IDs
>   media: ov2740: Add OVTI2740 ACPI ID
>   media: ov8858: Add INT3477 ACPI ID
>   media: intel: ipu-bridge: Add Yoga Book camera sensors
>   media: atomisp: Add Yoga Book camera configuration
>   media: ov2740: support 288 MHz link frequency
>   media: intel: ipu-bridge: select OV2740 frequency by IPU ID
>   media: atomisp: derive CSI-2 timing from sensor link frequency
>   media: ov2740: release group hold after gain write errors
>   media: ov2740: add manual white balance controls
>   media: atomisp: Use struct v4l2_area for padding
>   media: atomisp: allow raw Bayer capture
>   media: i2c: Add WV517S lens actuator driver
>
>  MAINTAINERS                                   |   1 +
>  drivers/media/i2c/Kconfig                     |  11 +
>  drivers/media/i2c/Makefile                    |   1 +
>  drivers/media/i2c/ov2740.c                    | 114 +++++++--
>  drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
>  drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
>  drivers/media/pci/intel/ipu-bridge.c          |  13 ++
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
>  .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
>  14 files changed, 605 insertions(+), 129 deletions(-)
>  create mode 100644 drivers/media/i2c/wv517s.c
>
>
> base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
>
> With Best Regards,
> Maurizio Casciano
> --
> 2.53.0
