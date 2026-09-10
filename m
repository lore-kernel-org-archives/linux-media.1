Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219FB3DDDDE
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032375; cv=none; b=AyFeuqig2N6+7mkLPDn9bVxsvik8LymWB8Oeb71r57tYUYM10QqZTbdSg97/WYWwH7ybV6LsitRuny8btQCDLo++BFPxRfQ5r8869NqYfh/reG6I5W5/iBlrOI9NGYDBXj6W/45v8n1nVjIKm+j0hZ1cNlft/RT+CeqEKRwkE3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032375; c=relaxed/simple;
	bh=lwOiub16b1We2UpOBJ4acgLfMZlgJ8NoANgbycpNG1M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=HaPvJvdYkZ2jcMNrvP8Il/Uyibvs+jcECk4E0VkbXlnVzXhB/jrr1fHv3HAYh1jbEmZsCNlktNxLbpm8jk+bogao0Ljx137iHMqBmCp3EP2rYobNSpvGDGIqnKNU+2h9n4aN5yW85a7B/AwpYEBrIY4dFTSBmqFIGgwh8aWWp9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yr/V75d6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yr/V75d6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA0A1F000FF;
	Thu, 10 Sep 2026 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032369;
	bh=una7e9ulC1alHeWrv+SYRIE8wUzZyKcy4h79n4QCYZ8=;
	h=Date:From:Subject:To:Cc;
	b=Yr/V75d67Dt43lKX9nJWFJ0g2quJrUNriVCLebJPGX0HLm1+rRrszmQzoEpLXSvhe
	 +G29wFfTUbTWMHbn4D5LRLSMWT5bCZFGeZ3Y5L+HFoF7R+ozpUJGuIHOTU1Q+hNSME
	 xgWKBYk/AiDMA9n6OXKTiEqgyfo5OKKh3fpLBozKY2CwK+WNvDlz5UvMI8XrbbWUT+
	 SypDellw7Six+09JHxxIwtYG/iiwqqBMIGDDwKaVjvuP5OW+UY8GQZVzW6DAb3sfuD
	 2uZ+eqTX7pppwsMMKZzcpTnWGZfsIqX189NEzX4X+PbkmbvdcQ1mTnNnQDeuh8B8bs
	 waOdWxZyahlLg==
Message-ID: <41b79883-680c-4975-aa44-c38a5f49de24@kernel.org>
Date: Thu, 10 Sep 2026 11:26:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] media: i2c/platform: add V4L2_SET_EDID_HPD_LOW_JIFFIES define
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Tim Harvey <tharvey@gateworks.com>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

HDMI receivers need to pull the HPD pin low for at least 100 ms to
indicate that a new EDID is available. In practice, HZ / 7 is a good
value for that as this gives enough slack for video sources to detect
this situation. Due to clock frequency differences and imprecise
video source implementations using exactly 100 ms (or even a bit more)
may still cause this to be missed by the video source.

Over many years HZ / 7 (143 ms) has proven to be a good safe value
for this.

Add a new #define to v4l2-dv-timings.h and modify the various drivers
that do this to use this define. Most already used HZ / 7, but some
were a bit longer.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/adv7604.c                        |  2 +-
 drivers/media/i2c/adv7842.c                        | 10 ++++++----
 drivers/media/i2c/it6625.c                         |  2 +-
 drivers/media/i2c/tc358743.c                       |  2 +-
 drivers/media/i2c/tda1997x.c                       |  2 +-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c   |  4 ++--
 include/media/v4l2-dv-timings.h                    | 14 ++++++++++++++
 7 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 231edd3797ab..2a169d379ee4 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2449,7 +2449,7 @@ static int adv76xx_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *edid)
 	cec_s_phys_addr(state->cec_adap, parent_pa, false);

 	/* enable hotplug after 143 ms */
-	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 7);
+	schedule_delayed_work(&state->delayed_work_enable_hotplug, V4L2_SET_EDID_HPD_LOW_JIFFIES);
 	return 0;
 }

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 3cfae89ce944..5e5bb78a85bc 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -747,8 +747,9 @@ static int edid_write_vga_segment(struct v4l2_subdev *sd)
 		return -EIO;
 	}

-	/* enable hotplug after 200 ms */
-	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 5);
+	/* enable hotplug after 143 ms */
+	schedule_delayed_work(&state->delayed_work_enable_hotplug,
+			      V4L2_SET_EDID_HPD_LOW_JIFFIES);

 	return 0;
 }
@@ -830,8 +831,9 @@ static int edid_write_hdmi_segment(struct v4l2_subdev *sd, u8 port)
 	}
 	cec_s_phys_addr(state->cec_adap, parent_pa, false);

-	/* enable hotplug after 200 ms */
-	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 5);
+	/* enable hotplug after 143 ms */
+	schedule_delayed_work(&state->delayed_work_enable_hotplug,
+			      V4L2_SET_EDID_HPD_LOW_JIFFIES);

 	return 0;
 }
diff --git a/drivers/media/i2c/it6625.c b/drivers/media/i2c/it6625.c
index da17e5d5ce9e..0565fe900bc9 100644
--- a/drivers/media/i2c/it6625.c
+++ b/drivers/media/i2c/it6625.c
@@ -760,7 +760,7 @@ static void it6625_disable_hpd(struct it6625 *it6625)

 static void it6625_enable_hpd(struct it6625 *it6625)
 {
-	schedule_delayed_work(&it6625->hpd_delayed_work, HZ / 7);
+	schedule_delayed_work(&it6625->hpd_delayed_work, V4L2_SET_EDID_HPD_LOW_JIFFIES);
 }

 static void it6625_hpd_delayed_work(struct work_struct *work)
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index ce75812cbf72..6a29bab24bd8 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -453,7 +453,7 @@ static void tc358743_enable_edid(struct v4l2_subdev *sd)

 	/* Enable hotplug after 143 ms. DDC access to EDID is also enabled when
 	 * hotplug is enabled. See register DDC_CTL */
-	schedule_delayed_work(&state->delayed_work_enable_hotplug, HZ / 7);
+	schedule_delayed_work(&state->delayed_work_enable_hotplug, V4L2_SET_EDID_HPD_LOW_JIFFIES);

 	tc358743_enable_interrupts(sd, true);
 	tc358743_s_ctrl_detect_tx_5v(sd);
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index afa1d6f34c9c..e8176b29fae4 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -590,7 +590,7 @@ static void tda1997x_enable_edid(struct v4l2_subdev *sd)
 	v4l2_dbg(1, debug, sd, "%s\n", __func__);

 	/* Enable hotplug after 143ms */
-	schedule_delayed_work(&state->delayed_work_enable_hpd, HZ / 7);
+	schedule_delayed_work(&state->delayed_work_enable_hpd, V4L2_SET_EDID_HPD_LOW_JIFFIES);
 }

 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 978bc91d3257..66191ddfbe78 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -515,9 +515,9 @@ static void hdmirx_hpd_ctrl(struct snps_hdmirx_dev *hdmirx_dev, bool en)
 	hdmirx_writel(hdmirx_dev, CORE_CONFIG,
 		      hdmirx_dev->hpd_trigger_level_high ? en : !en);

-	/* 100ms delay as per HDMI spec + extra 50ms to cover internal delay */
+	/* 100ms delay as per HDMI spec + extra 43ms to cover internal delay */
 	if (!en)
-		msleep(100 + 50);
+		msleep(jiffies_to_msecs(V4L2_SET_EDID_HPD_LOW_JIFFIES));
 }

 static void hdmirx_write_edid_data(struct snps_hdmirx_dev *hdmirx_dev,
diff --git a/include/media/v4l2-dv-timings.h b/include/media/v4l2-dv-timings.h
index 2b42e5d81f9e..de5ef825a6c6 100644
--- a/include/media/v4l2-dv-timings.h
+++ b/include/media/v4l2-dv-timings.h
@@ -252,6 +252,20 @@ v4l2_hdmi_rx_colorimetry(const struct hdmi_avi_infoframe *avi,
 			 const struct hdmi_vendor_infoframe *hdmi,
 			 unsigned int height);

+/*
+ * The time in milliseconds that the HPD should be pulled low when writing
+ * a new EDID. This will tell the HDMI source that the EDID was changed and
+ * that it has to be re-read.
+ *
+ * The source is supposed to re-read the EDID if the HPD is low for more than
+ * 100 ms, but in practice the sink should pull it low for a bit longer due
+ * to clock differences and imprecise video source implementations.
+ *
+ * Practice has shown that setting the delay to HZ / 7 (approx 143 ms) works
+ * well.
+ */
+#define V4L2_SET_EDID_HPD_LOW_JIFFIES (HZ / 7)
+
 unsigned int v4l2_num_edid_blocks(const u8 *edid, unsigned int max_blocks);
 u16 v4l2_get_edid_phys_addr(const u8 *edid, unsigned int size,
 			    unsigned int *offset);
-- 
2.53.0

