Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407103815D5
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365070; cv=none; b=JVAL+qmPzXOzLEnR523mXSVyR3+tFUH4LptYU02+AA3lsyLad0BzGEckJFK8iRYPlJB6EbNzsyT1gXS4y86ZaN3mw+4JK19E79DoQmvozNrtwHR6XdxdrqDwmtCk7agsmd4iwu0d+8QkQjzpHkgEQU2lgqVuQaeLYTGVX/0AA04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365070; c=relaxed/simple;
	bh=K4dOvTgZEd0Bx0/BDsPYu2mzGTZ+2d1VtRBgXK0Iufw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYnDQ5B0zllwkcAFZm+vNvoz5i2t/pcn5Lw1ZW5q/LSmUQUVzJqLvCUbBGlf2TU5jsQfOA3KVMPQ/XBLueIXNPGCmXPS5J3zn3psKvB2lOt+LsqiIa4l50zO0bK3Ducif44LeRjlHXe9kUPfXgwK30Qnv1r8zwgGltosFwcU/H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fv1em9uj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fv1em9uj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953f64372aso4428435e9.0
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 01:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365066; x=1784969866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SDnMtCkuMj9Cogsv4cA0KYznv1xBNwp6u1rkofi/6cU=;
        b=fv1em9ujWwLWw92XDlvtntoH5oZGjSOv0QtzKNZ2XY+UZQeIpuMo4IZoppcea+vt56
         /ZhhfTEIsTffA88fhevb5vc0gnGBGMQm/06iJ4bta4eTntHOmo+KIDQYSn9H+GBzE4bG
         sPd9FfZRvnNAjF9f0HmBgkd4fDvDCzn9A5BZVIkbhtCGQdQ8ML0/cVdbQ6srDRLvRVdd
         Uk9+9GNALYReVg67zR1OmuDORV4yYJivqQNq3qNfJVsVoWLJdiGK3n2rrOfy5aOPxkLE
         gr9nNekTBtZhCBhBBTTOKyRK50T0kjCIgZr0N2hnszgFbteKdcteUAX8oJdUdKX2akSX
         78zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365066; x=1784969866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SDnMtCkuMj9Cogsv4cA0KYznv1xBNwp6u1rkofi/6cU=;
        b=Hw0PQ0BpE4JjxJGk9KOjx1Tj6CQmQ9KHUscjbmu6UZHN9GobmsEGEUxJp9bnBYvnAX
         Ml830rYfVVGPOkmxnVe8hz+w06RX4WtXEsJxDdsSdNgSutsC4qNmjVHJjY7KIEF675k7
         bcZGiKbQiIwU6ju++9DgXHC7JB6Q0ig14B8tRze+wOjZgl1lp04HU7WDYuEQiGhernb6
         h/uUpkYeNRUYprHsWJCYx0dwCYsUR75T8JfovL2FQAvQij824QeDpuB83hyRS4sJJENa
         aGEgd2UnM9YLn/F6WhvoARi97F3/ROPj/o/VmrPToJ+dmZU0zP1oaSwD98vL4OHk0rW8
         e3hw==
X-Forwarded-Encrypted: i=1; AHgh+RqRkb0nb4hfGP1s1HwdV5Seid9mkL1jgpZ+bP0qL4UhnSbyByIZ5JgRDtwZ0ECW54kpF/JMqJTTOFFTjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDbtsYXGiWHVpiGFYva7MtpibvSXL3/VupJj7/yjFNirYjscv
	FZqOdWrM0AVDBayAt/pcF2FJ/Vo5qCpVe4DQpF1x1VFbT6BGsouXJ3AC
X-Gm-Gg: AfdE7cmx943Jwpm75VfZuJux4ers6hbhn64JTcOmsOgMASSCw+FsI1Rpao2cAltiVuq
	7QXnKLX/HWLeqXudJpKxj/O9UWzL2ArBJPQyjLH+FmGFtT19Y/8bL5cpHZxAZIqPZk54I1iS8YP
	Jm2FiU/50+mP2Ybd4VUAESl4SbpYWFsnZ2AD811LAKWrObn5InJrhxuD+Fi4uHseD38vOUOsGQd
	0j2LNIf+waPpuAY8Sfak5Mf/GafJqFRLHIJxFBMymGnx7Da6Itt5QVUvJ3roDW8rwTobCCeDobU
	98MepVC47VTriRzONJPU+XpbO4JMuosZZszYxyl9T5kjM0xS6R1nTZnENm0Aw2n5wrRKTwZ2Yqu
	+NdhLfgPosj4MLePCMcCm275jTZOF2jnjr0i14sAtbfKSctFsdUncj0dfvqeT20Bnr9WIcYKalj
	74MMjnkwGP4nn6d0raYc4eAthA2dShGYeHh1/BeLGTa9sdeo54xUTTrlis9ClXfOKk/m/8+tNmh
	DlBddbCW7/ODNS7r8c0
X-Received: by 2002:a05:600c:b8d:b0:493:b6a2:858d with SMTP id 5b1f17b1804b1-4954a51321cmr38761665e9.6.1784365066131;
        Sat, 18 Jul 2026 01:57:46 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:45 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Sat, 18 Jul 2026 10:57:26 +0200
Message-ID: <20260718085728.6797-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260718085728.6797-1-royalnet026@gmail.com>
References: <20260718085728.6797-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synopsys DesignWare HDMI RX controller extracts the audio stream
embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
controller. Expose it as an ALSA capture device by registering the
generic hdmi-codec as a child of the controller, so that a
simple-audio-card in the device tree can bind the HDMI RX audio DAI.

The sample rate is recovered from the ACR N/CTS values together with the
measured TMDS character rate. A periodic worker keeps the local audio
reference clock locked to the source by nudging it in small ppm steps to
hold the audio FIFO fill level near its target, which avoids FIFO
under/overflow and the resulting dropped samples.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Changes in v3:
- restore the v1 audio teardown in remove(): audio_shutdown() already
  stops the worker when the stream closes, so the extra flag clear
  and trailing cancel added in v2 were redundant (Dmitry Osipenko)
- rename the ACR read locals and add a comment documenting the
  register byte packing
- drop the get_dai_id stub so OF-graph cards resolve the DAI index
  from the reg property

Changes in v2:
- register the S/PDIF DAI so the indexes match the binding and reject
  it with -EOPNOTSUPP until wired up (Sebastian Reichel)
- use platform_device_register_data() and drop the fixed 32-bit DMA
  mask (Dmitry Osipenko)
- don't leave an ERR_PTR in audio_pdev on registration failure
- fix teardown ordering in remove()
- stop the worker before reprogramming shared state in hw_params()
- look up the "audio" clock by name instead of indexing clks[1]
- keep the worker on system_unbound_wq when re-arming

 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 271 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 2 files changed, 279 insertions(+)

diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
index 9cceffa..8636944 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
@@ -41,6 +41,8 @@
 #include <media/videobuf2-dma-contig.h>
 #include <media/videobuf2-v4l2.h>
 
+#include <sound/hdmi-codec.h>
+
 #include "snps_hdmirx.h"
 #include "snps_hdmirx_cec.h"
 
@@ -132,6 +134,13 @@ struct snps_hdmirx_dev {
 	struct delayed_work delayed_work_hotplug;
 	struct delayed_work delayed_work_res_change;
 	struct hdmirx_cec *cec;
+	struct platform_device *audio_pdev;
+	struct clk *audio_clk;
+	struct delayed_work audio_work;
+	u32 audio_clkrate;
+	u32 audio_fs;
+	int audio_pre_state;
+	bool audio_streaming;
 	struct mutex phy_rw_lock; /* to protect phy r/w configuration */
 	struct mutex stream_lock; /* to lock video stream capture */
 	struct mutex work_lock; /* to lock the critical section of hotplug event */
@@ -2283,6 +2292,13 @@ static int hdmirx_parse_dt(struct snps_hdmirx_dev *hdmirx_dev)
 	if (hdmirx_dev->num_clks < 1)
 		return -ENODEV;
 
+	for (int i = 0; i < hdmirx_dev->num_clks; i++) {
+		if (!strcmp(hdmirx_dev->clks[i].id, "audio")) {
+			hdmirx_dev->audio_clk = hdmirx_dev->clks[i].clk;
+			break;
+		}
+	}
+
 	hdmirx_dev->resets[HDMIRX_RST_A].id = "axi";
 	hdmirx_dev->resets[HDMIRX_RST_P].id = "apb";
 	hdmirx_dev->resets[HDMIRX_RST_REF].id = "ref";
@@ -2650,6 +2666,253 @@ static int hdmirx_register_cec(struct snps_hdmirx_dev *hdmirx_dev,
 	return 0;
 }
 
+#define HDMIRX_AUDIO_INIT_FIFO_STATE	128
+#define HDMIRX_AUDIO_INIT_STATE		(HDMIRX_AUDIO_INIT_FIFO_STATE * 4)
+
+static const int hdmirx_supported_fs[] = {
+	32000, 44100, 48000, 88200, 96000, 176400, 192000, 768000, -1
+};
+
+static int hdmirx_audio_closest_fs(int fs)
+{
+	int i = 0, fs_t = hdmirx_supported_fs[0];
+
+	while (fs_t > 0) {
+		if (abs(fs - fs_t) <= 2000)
+			return fs_t;
+		fs_t = hdmirx_supported_fs[++i];
+	}
+	return 0;
+}
+
+/* Recover the incoming audio sample rate from the ACR N/CTS + TMDS clock. */
+static u32 hdmirx_audio_fs(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	u64 tmds_clk, fs_audio = 0;
+	u32 acr_cts, acr_n, tmdsqpclk_freq;
+	u32 acr_pb3_0, acr_pb7_4;
+
+	tmdsqpclk_freq = hdmirx_readl(hdmirx_dev, CMU_TMDSQPCLK_FREQ);
+	hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PH2_1);
+	acr_pb3_0 = hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB3_0);
+	acr_pb7_4 = hdmirx_readl(hdmirx_dev, PKTDEC_ACR_PB7_4);
+	/*
+	 * The packet decoder stores the ACR subpacket bytes with packet byte
+	 * 0 in register bits [7:0], so byte-swap each word to line the bytes
+	 * up: CTS is packet bytes 1-3 (PKTDEC_ACR_PB3_0) and N is packet
+	 * bytes 4-6 (PKTDEC_ACR_PB7_4), 20 bits each.
+	 */
+	acr_cts = be32_to_cpu((__force __be32)acr_pb3_0) & 0xfffff;
+	acr_n = (be32_to_cpu((__force __be32)acr_pb7_4) & 0x0fffff00) >> 8;
+	tmds_clk = tmdsqpclk_freq * 4 * 1000U;
+	if (acr_cts != 0) {
+		fs_audio = div_u64((tmds_clk * acr_n), acr_cts);
+		fs_audio /= 128;
+		fs_audio = hdmirx_audio_closest_fs(fs_audio);
+	}
+	return (u32)fs_audio;
+}
+
+/* Nudge the audio reference clock by +/- ppm to keep the FIFO balanced. */
+static void hdmirx_audio_clk_ppm_inc(struct snps_hdmirx_dev *hdmirx_dev, int ppm)
+{
+	int delta, inc;
+	long rate = hdmirx_dev->audio_clkrate;
+
+	if (ppm < 0) {
+		ppm = -ppm;
+		inc = -1;
+	} else {
+		inc = 1;
+	}
+	delta = (int)div64_u64((u64)rate * ppm + 500000, 1000000);
+	delta *= inc;
+	rate = hdmirx_dev->audio_clkrate + delta;
+	clk_set_rate(hdmirx_dev->audio_clk, rate);
+	hdmirx_dev->audio_clkrate = rate;
+}
+
+static int hdmirx_audio_clk_adjust(struct snps_hdmirx_dev *hdmirx_dev,
+				   int total_offset, int single_offset)
+{
+	int schedule_time = 500;
+	int ppm = 10;
+	u32 offset_abs = abs(total_offset);
+
+	if (offset_abs > 200) {
+		ppm += 200;
+		schedule_time -= 100;
+	}
+	if (offset_abs > 100) {
+		ppm += 200;
+		schedule_time -= 100;
+	}
+	if (offset_abs > 32) {
+		ppm += 20;
+		schedule_time -= 100;
+	}
+	if (offset_abs > 16)
+		ppm += 20;
+	if (total_offset > 16 && single_offset > 0)
+		hdmirx_audio_clk_ppm_inc(hdmirx_dev, ppm);
+	else if (total_offset < -16 && single_offset < 0)
+		hdmirx_audio_clk_ppm_inc(hdmirx_dev, -ppm);
+	return schedule_time;
+}
+
+static void hdmirx_audio_fifo_reinit(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_CONTROL, 1);
+	usleep_range(200, 210);
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_CONTROL, 0);
+}
+
+/*
+ * Periodic worker that locks the local audio clock to the source by keeping
+ * the audio FIFO fill level close to its target, avoiding under/overflow.
+ */
+static void hdmirx_audio_work(struct work_struct *work)
+{
+	struct snps_hdmirx_dev *hdmirx_dev =
+		container_of(to_delayed_work(work), struct snps_hdmirx_dev, audio_work);
+	unsigned long delay = 200;
+	int cur, total, single;
+	u32 fifo, fs;
+
+	fs = hdmirx_audio_fs(hdmirx_dev);
+	fifo = hdmirx_readl(hdmirx_dev, AUDIO_FIFO_STATUS2);
+
+	if (fifo & (AFIFO_UNDERFLOW_ST | AFIFO_OVERFLOW_ST)) {
+		if (fs) {
+			clk_set_rate(hdmirx_dev->audio_clk, fs * 128);
+			hdmirx_dev->audio_clkrate = fs * 128;
+			hdmirx_dev->audio_fs = fs;
+		}
+		hdmirx_audio_fifo_reinit(hdmirx_dev);
+		hdmirx_dev->audio_pre_state = 0;
+		goto out;
+	}
+
+	cur = fifo & 0xffff;
+	total = cur - HDMIRX_AUDIO_INIT_STATE;
+	single = cur - hdmirx_dev->audio_pre_state;
+
+	if (fs && abs((int)fs - (int)hdmirx_dev->audio_fs) > 1000) {
+		clk_set_rate(hdmirx_dev->audio_clk, fs * 128);
+		hdmirx_dev->audio_clkrate = fs * 128;
+		hdmirx_dev->audio_fs = fs;
+		hdmirx_audio_fifo_reinit(hdmirx_dev);
+		hdmirx_dev->audio_pre_state = 0;
+		goto out;
+	}
+
+	if (cur != 0)
+		delay = hdmirx_audio_clk_adjust(hdmirx_dev, total, single);
+	hdmirx_dev->audio_pre_state = cur;
+out:
+	/* Only re-arm while streaming; avoids a self-reschedule race with
+	 * the cancel_delayed_work_sync() callers (hw_params and
+	 * audio_shutdown).
+	 */
+	if (READ_ONCE(hdmirx_dev->audio_streaming))
+		queue_delayed_work(system_unbound_wq, &hdmirx_dev->audio_work,
+				   msecs_to_jiffies(delay));
+}
+
+static int hdmirx_audio_hw_params(struct device *dev, void *data,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
+	u32 fs;
+
+	/* Only the I2S interface (DAI 0) is wired up so far. */
+	if (fmt->fmt == HDMI_SPDIF)
+		return -EOPNOTSUPP;
+
+	/*
+	 * Stop the worker before touching the shared audio state; it is
+	 * re-armed below once the new parameters are in place.
+	 */
+	WRITE_ONCE(hdmirx_dev->audio_streaming, false);
+	cancel_delayed_work_sync(&hdmirx_dev->audio_work);
+
+	fs = hdmirx_audio_fs(hdmirx_dev);
+	if (!fs)
+		fs = hparms ? hparms->sample_rate : 48000;
+	if (!fs)
+		fs = 48000;
+
+	hdmirx_dev->audio_fs = fs;
+	hdmirx_dev->audio_clkrate = fs * 128;
+	clk_set_rate(hdmirx_dev->audio_clk, fs * 128);
+
+	hdmirx_audio_fifo_reinit(hdmirx_dev);
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR_PASS, HDMIRX_AUDIO_INIT_FIFO_STATE);
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR,
+		      AFIFO_THR_LOW_QST(0x20) | AFIFO_THR_HIGH_QST(0x160));
+	hdmirx_writel(hdmirx_dev, AUDIO_FIFO_MUTE_THR,
+		      AFIFO_THR_MUTE_LOW_QST(0x8) | AFIFO_THR_MUTE_HIGH_QST(0x178));
+
+	hdmirx_update_bits(hdmirx_dev, AUDIO_PROC_CONFIG0, I2S_EN, I2S_EN);
+	hdmirx_update_bits(hdmirx_dev, GLOBAL_SWENABLE, AUDIO_ENABLE, AUDIO_ENABLE);
+
+	hdmirx_dev->audio_pre_state = 0;
+	WRITE_ONCE(hdmirx_dev->audio_streaming, true);
+	mod_delayed_work(system_unbound_wq, &hdmirx_dev->audio_work,
+			 msecs_to_jiffies(200));
+
+	dev_dbg(dev, "audio hw_params: fs=%u\n", fs);
+	return 0;
+}
+
+static void hdmirx_audio_shutdown(struct device *dev, void *data)
+{
+	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
+
+	WRITE_ONCE(hdmirx_dev->audio_streaming, false);
+	cancel_delayed_work_sync(&hdmirx_dev->audio_work);
+	hdmirx_update_bits(hdmirx_dev, GLOBAL_SWENABLE, AUDIO_ENABLE, 0);
+}
+
+static const struct hdmi_codec_ops hdmirx_audio_codec_ops = {
+	.hw_params = hdmirx_audio_hw_params,
+	.audio_shutdown = hdmirx_audio_shutdown,
+};
+
+static int hdmirx_register_audio_device(struct snps_hdmirx_dev *hdmirx_dev)
+{
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &hdmirx_audio_codec_ops,
+		.i2s = 1,
+		.no_i2s_playback = 1,
+		.max_i2s_channels = 8,
+		/*
+		 * The controller also has an S/PDIF audio interface (DAI 1 in
+		 * the binding). Register it so DAI indexes match the binding,
+		 * but reject its use in hw_params() until it is wired up.
+		 */
+		.spdif = 1,
+		.no_spdif_playback = 1,
+		.data = hdmirx_dev,
+	};
+	struct platform_device *audio_pdev;
+
+	if (!hdmirx_dev->audio_clk)
+		return -ENODEV;
+
+	audio_pdev = platform_device_register_data(hdmirx_dev->dev,
+						   HDMI_CODEC_DRV_NAME,
+						   PLATFORM_DEVID_AUTO,
+						   &codec_data, sizeof(codec_data));
+	if (IS_ERR(audio_pdev))
+		return PTR_ERR(audio_pdev);
+
+	hdmirx_dev->audio_pdev = audio_pdev;
+
+	return 0;
+}
+
 static int hdmirx_probe(struct platform_device *pdev)
 {
 	struct snps_hdmirx_dev *hdmirx_dev;
@@ -2701,6 +2964,7 @@ static int hdmirx_probe(struct platform_device *pdev)
 			  hdmirx_delayed_work_hotplug);
 	INIT_DELAYED_WORK(&hdmirx_dev->delayed_work_res_change,
 			  hdmirx_delayed_work_res_change);
+	INIT_DELAYED_WORK(&hdmirx_dev->audio_work, hdmirx_audio_work);
 
 	hdmirx_dev->cur_fmt_fourcc = V4L2_PIX_FMT_BGR24;
 	hdmirx_dev->timings = cea640x480;
@@ -2769,6 +3033,10 @@ static int hdmirx_probe(struct platform_device *pdev)
 						       V4L2_DEBUGFS_IF_AVI, hdmirx_dev,
 						       hdmirx_debugfs_if_read);
 
+	ret = hdmirx_register_audio_device(hdmirx_dev);
+	if (ret)
+		dev_warn(dev, "failed to register HDMI audio codec: %d\n", ret);
+
 	return 0;
 
 err_unreg_video_dev:
@@ -2788,6 +3056,9 @@ static void hdmirx_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
 
+	if (hdmirx_dev->audio_pdev)
+		platform_device_unregister(hdmirx_dev->audio_pdev);
+
 	v4l2_debugfs_if_free(hdmirx_dev->infoframes);
 	debugfs_remove_recursive(hdmirx_dev->debugfs_dir);
 
diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
index 31b887e..a99f54f 100644
--- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
+++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
@@ -81,6 +81,7 @@
 #define DATAPATH_ENABLE				BIT(12)
 #define PKTFIFO_ENABLE				BIT(11)
 #define AVPUNIT_ENABLE				BIT(8)
+#define AUDIO_ENABLE				BIT(9)
 #define MAIN_ENABLE				BIT(0)
 #define GLOBAL_TIMER_REF_BASE			0x0028
 #define CORE_CONFIG				0x0050
@@ -177,20 +178,27 @@
 #define VPROC_FMT_OVR_VALUE(x)			UPDATE(x, 6, 4)
 #define VPROC_FMT_OVR_EN			BIT(0)
 
+#define AUDIO_FIFO_CONFIG			0x0460
 #define AFIFO_FILL_RESTART			BIT(0)
+#define AUDIO_FIFO_CONTROL			0x0464
 #define AFIFO_INIT_P				BIT(0)
+#define AUDIO_FIFO_THR_PASS			0x0468
+#define AUDIO_FIFO_THR				0x046c
 #define AFIFO_THR_LOW_QST_MASK			GENMASK(25, 16)
 #define AFIFO_THR_LOW_QST(x)			UPDATE(x, 25, 16)
 #define AFIFO_THR_HIGH_QST_MASK			GENMASK(9, 0)
 #define AFIFO_THR_HIGH_QST(x)			UPDATE(x, 9, 0)
+#define AUDIO_FIFO_MUTE_THR			0x0470
 #define AFIFO_THR_MUTE_LOW_QST_MASK		GENMASK(25, 16)
 #define AFIFO_THR_MUTE_LOW_QST(x)		UPDATE(x, 25, 16)
 #define AFIFO_THR_MUTE_HIGH_QST_MASK		GENMASK(9, 0)
 #define AFIFO_THR_MUTE_HIGH_QST(x)		UPDATE(x, 9, 0)
 
+#define AUDIO_FIFO_STATUS2			0x0478
 #define AFIFO_UNDERFLOW_ST			BIT(25)
 #define AFIFO_OVERFLOW_ST			BIT(24)
 
+#define AUDIO_PROC_CONFIG0			0x0480
 #define SPEAKER_ALLOC_OVR_EN			BIT(16)
 #define I2S_BPCUV_EN				BIT(4)
 #define SPDIF_EN				BIT(2)
-- 
2.53.0

