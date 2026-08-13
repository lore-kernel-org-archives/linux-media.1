Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4530483BD3;
	Thu, 13 Aug 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633930; cv=none; b=BLhMNcZsJYKgYMD7DbkKyRZ2+HVrNvc5QEE2R6XdtL8TD5NjA10BpBLpxw0Ds1RhP6WQ1nDHDyaNBFVR7Ey/PTkwY0ianQR/kZViTlS5InuVwo0af/uYXH64tFKNa+fS15kjsofI2rzEONiRX+1/XX3ACUGttN3CZW0VRn2oZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633930; c=relaxed/simple;
	bh=yeb+uMHx1Jpm/mxrwDt+UrdiOWlECz9X2pvyZ1PvUPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FvDQQTnlMNSOvgvOGjsKwIILo0ppbJOnFKbdJO0U1DXUSQ8LnuaS9pwKXDIpYp4fhdOqxWaSpgZfk9ktCn6GFZV8fiPNzZR4ed/7iOWxJ9JYzGbRHyBCsUxjXe7kQbVY49RoShRDDp7zTtkyoEMX0gJhTVWOeMS4DFjZ80o3D4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjCHADa5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjCHADa5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC8C1F000E9;
	Thu, 13 Aug 2026 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786633928;
	bh=GLDzoEqbijcciHocc+FcF8VIJxlthvOkaFz27uMlAD0=;
	h=From:Date:Subject:To:Cc;
	b=gjCHADa59h+ENg3Ljdf1O1tfAly1btKOmMjt6WGtkj3uk8YLh4/H/MUh6gx8UtjrV
	 ErDsdIsxRp3ao781HV+1PaSHWARCBz5n3FyOfwEGDXefdWKXGjs++hWBaiKviLSqMR
	 uiEQ63DAmdqNaG1F4GFkm2+7JB3gx4mW3ikinGLQ4m0pVwFn/PZd85ATIaiT/0xCKu
	 NthtFxHHQI5IyQ4+T+/D1H36ONypQI6GT68SA8I0S7o0HaQh2vVa+ejFgNc5sfecYA
	 lzU85GX8SQ74xgMJxzFwRZfBLHGYpCmAzV5Bl+m/LF8wf0w2nia5aysCn+ETUTnY/A
	 iHStCm833Pj5w==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 13 Aug 2026 17:11:56 +0200
Subject: [PATCH] media: i2c: imx219: Implement .get_frame_desc()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-imx219-frame-desc-v1-1-2a22488a0535@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJW8SIVzEu6PQHxwQ0HTUkh
 LtbZPkt3lvIkBVGl2qhjK+aPqcCf6hI7t00gDUVU3Dh5M6+Zh3n4FvuczeCE0y4btBKjM4dJVH
 pXhm9zv/n9bbbPvEBeW8jWtcfaDgKIXUAAAA=
X-Change-ID: 20260813-imx219-frame-desc-35e9cbb004cd
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
 Vaishnav Achath <vaishnav.a@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@linux.dev>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4877;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=bOXRk9tQIfPb9AGipwrv5S++XX8E10yDcmQjgmdqbgg=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqfd7FFmDY8Pyyy9OVe4kkPfgxmFSZiS+5gwQ1q
 VRtsAdpDlmJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCan3exQAKCRAZDR20Zk4Z
 NWfWB/9HL6IdX+5h1tN7Kk5LtzicuT6zdeZIDDJ1YNgOmkOrsVKhqQLiGJ1zPJfDyHRk9DOjlIa
 2C2iwCT15HyclkA9tmsL2vyJVF9/B0lZrji6xa3LWPkSvcCShWh5X3LNdDB6/SPJyebUR+aIMiq
 m8r8oeBKqzTNSTIko0YNeTDUDOOhZQHMQU21IWHN1B0Dy3s/2XBmSLlRRjbFEkyNGhppiZ7E0wK
 jhtmLkfEyv8ldIumrFTyn5jywKfcMrJtpHk7tkDdf7yVQq7TsNAll9JD3WXMZ9Mlj95+CxxQbXY
 CVuvFqBnX9mI5iktF01tN8QJxisFGL7lexmL15h+K4RzlW6W
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

From: Vaishnav Achath <vaishnav.a@ti.com>

The next subdev in the media graph may want to enquire information such
as bus format, virtual channel, bus data type to route the stream from
this sensor correctly.

Add support for sharing this information using the .get_frame_desc()
callback.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
This has been tested on top of linus/master based on commit
3d6d817622b0 ("Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi")

I used a AM69-SK with the Arducam FPD V3Link[1] using
the following device tree overlays:
  ti/k3-am68-sk-v3link-fusion.dtbo ti/k3-v3link-imx219-0-0.dtbo

See TI's documentation about this [2]

This is based on a patch [3] from TI's public vendor tree.

I've tried to polish the patch a bit with the following changes:
* Use existing imx219_get_format_bpp() instead of open coding it
* Use MIPI_CSI2_DT_RAW{,10} instead of magic numbers
* Don't memset(*fd) since already handled by the core
* Simplify frame_desc entries by removing fd->num_entries++
* Add new imx219_get_data_type_by_code() helper and use it
* Add error handling for v4l2_subdev_state_get_format()
* Don't hard-code pad number (is always 0)
* Remove 'ret' variable

[1] https://www.arducam.com/arducam-v3link-camera-kit-for-ti-development-boards.html
[2] https://software-dl.ti.com/jacinto7/esd/processor-sdk-linux-am69/11_00_10_01/exports/docs/linux/Foundational_Components/Kernel/Kernel_Drivers/Camera/CSI2RX.html
[3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit?id=4268e58970c119e8dda8ad951f329d267eacc7a7&dt=2
---
 drivers/media/i2c/imx219.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 223d3753cc93..fc237a2dba60 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -23,11 +23,13 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mediabus.h>
+#include <media/v4l2-subdev.h>
 
 /* Chip ID */
 #define IMX219_REG_CHIP_ID		CCI_REG16(0x0000)
@@ -429,6 +431,24 @@ static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
 	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
 }
 
+static u8 imx219_get_data_type_by_code(__u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return MIPI_CSI2_DT_RAW8;
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		return MIPI_CSI2_DT_RAW10;
+	}
+}
+
 /* -----------------------------------------------------------------------------
  * Controls
  */
@@ -539,6 +559,37 @@ static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
 	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
 }
 
+static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
+	u32 bpp;
+
+	if (pad != 0)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	if (!state)
+		return -EINVAL;
+
+	format = v4l2_subdev_state_get_format(state, pad);
+	bpp = imx219_get_format_bpp(format);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+	fd->entry[0].pixelcode = format->code;
+	fd->entry[0].stream = 0;
+	fd->entry[0].flags = V4L2_MBUS_FRAME_DESC_FL_LEN_MAX;
+	fd->entry[0].length = (format->width * format->height * bpp) / 8;
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = imx219_get_data_type_by_code(format->code);
+
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+
 /* Initialize control handlers */
 static int imx219_init_controls(struct imx219 *imx219)
 {
@@ -994,6 +1045,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = imx219_set_pad_format,
 	.get_selection = imx219_get_selection,
+	.get_frame_desc = imx219_get_frame_desc,
 	.enum_frame_size = imx219_enum_frame_size,
 	.enable_streams = imx219_enable_streams,
 	.disable_streams = imx219_disable_streams,

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260813-imx219-frame-desc-35e9cbb004cd

Best regards,
--  
Mattijs Korpershoek <mkorpershoek@kernel.org>

