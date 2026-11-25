Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636272;
	b=tUnzb4+2sqo4Fm0cKkKLvb7oQtgv8+ydlLfjaNcxpU0oitdI1UjwReAC7hrofpoha9/T
	 q41Nd0ab6nveDKfNZrp2uUHR/xKKwvRslok1nvQMo2/OrCFdz2hMR4fVlHmOk+7x3eM51
	 /+Mr+qylpRdQr6QX3sfSRAfLyj6RVmV+e3Fd9bnUQOyBhuX+8gDNxV+7Xk0VJArQSzLqD
	 rI1BAwpiwks7z8i0a3bGAcWMq7n+X3J9ScuO7eW3KtE6Fe8gfBaU2NPqH8yC/kF6wLyln
	 qyWBVPKAaKr1sInxZ5kOTKUGSVPT3gkqSd9VWT11l0IRFeBkDvaoLoarVjXhecSl2Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EtU4y6zpeJ9BK+RuRbwwoSIJ1Q2A6tAfvOU4m/yC7x0=;
	b=odIGtRW+qhZsel+/Eyh8I5+Az47rG1Hlk1YfkPaYsGQ9B2PGViGPDyeVZ5QKYBkJU0Hn
	 gl2wMNwQxqKEeET3pO84LUfcftNrQIMF/fLjBloE6awCIX6MENTa4hFcQTdMcaWUQUaHl
	 0Ht0kX4ioeuNilMs7eoozcZXEKBtaMTMmuFjmTEvqLmR8pfU5y5n3Be5WqvYrbpWuCGYR
	 sASRR0v73BB//p/nD0lRwraqjxnc63tLha8cESOXeYBibhUfv0IiZLbh+nMd3yKnQJvcO
	 j1nCynciO4dgJjLqT7HTdwGCJK+POfjGyzlvRCH537U5A0fbEKCqd2atF8HGMS8pqIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=blQ68I5p;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6CB606A338
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED6CB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=blQ68I5p
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-57728d859e9so2647714b6e.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636270; x=1796241070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtU4y6zpeJ9BK+RuRbwwoSIJ1Q2A6tAfvOU4m/yC7x0=;
        b=blQ68I5p56uRJ/uTjGXkQmxaTrfCZg5zPjrlcdqq7ibFKmLxIsiG/DQVVZeMW4kzSL
         YiHy0gV4GtqvAICrDbaG1+xTC0yElqwxVjPfVLYB5+4n3pRFxY69yAdfL19KMyVbIqAh
         zYIHIA0cW4YaZuT6ldQ6wKP9N0uhX/+tTYNyJJbjaxY1Hs3biUaahja7owXbY1vsn267
         5ymyTkcHtiJBb7iLTwmeFBuSxYm4WJoZRaK+D7AmM7yE0bmekuHBzvY+yw+4Bi6vho+v
         ZBIZw1FTo8Acvzr/3Vs5QYp9dcvxVIgH0bVr6d6p6Zol0JykHXP3aSeM6cJpgyFk5Qvv
         DRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636270; x=1796241070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EtU4y6zpeJ9BK+RuRbwwoSIJ1Q2A6tAfvOU4m/yC7x0=;
        b=bzAuVFl6rNDbTgEqBSdywQpa2QP5smh4OLfEC2xEv7evq8ZVj0t0QKMfPPsH/Zm4oA
         qVvl9zR8KHGapBIMh7hPy9M462vLDHHUjmBtq56AOsFD7f3LIURJKtmMKUHF+A/zuBiv
         tSltzSRGFRUwVsBN+cfoh+MVXVVhYOSnWUl9eUewIpN9aN1897gtRrbi3rJsgRZsRlI7
         7fA0G1fsoOnhkRs+q76kgOgVZhpkKr/Hp4Ay/D/LbVELin9rBl66nLjwZ9kJ7M0cbqt4
         FSr9b61z8c2uxeH9eElBD0umgAmqTVkGSS/7Fp0LeJJIwRcoXuOuOuNqg77x05H/qiTl
         jClg==
X-Forwarded-Encrypted: i=1; AL+hErF0NkE4w3wDaZzRtOoQKe0FlFhXh9Uvas+tDPZx4jgWUTOR7RevirWncFRTDSGlLB/VcsBP16NBtwnApw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZsdgYAttjbhHUX/1cCth59jm2LQnQSLQSFrfVaZEzUDlU70wU
	ua1ZUd79hCbu4halFN/hhSeh1WNr3jcp88pLeK8YMgIfySb6y7bTka4=
X-Gm-Gg: AZFdTZfIm+occKE9VdHJWKObO0u4O5zmbpjqmXl61NLslcCv/aBAmbKCAHs21z8u4Fk
	GZgLred+DZslk6AN2ggFYvxIVrNlBh+9rj7SKfd7MAajRMwK35pr4PFj5Wmisy4S74TKpTuRkPr
	L+nxkvkzzkwKAZJfI9mk1wUFYXVBXRk7QU302WLrymZQu9jkAr8wOY46O0XOGeWHqsHDAHZANOT
	c1pCSGJOkQK3yffpW3exP+VzNleTSCRqMS8uYzZsIM7MgQRyB2wgX1RzWwITtXj7+GPEiON/01N
	Mvubg4ySmVnVPjOGldUGGfg7wBrnfUrILJJqbp2MPWtlng9Gd2zg/wkwFiWOFHX4sg2qCzYoe9e
	P0fQj7CfFdIaeSzVJ0Kr7HGgVxSE5M/0oTpKU7ck517RkxIDJ8dVGIDAT12Zk+MJNvyLElslmsG
	+5QP7ekfoxAHnQrymMe2glmJe/A2IfeY7iRzQmrJw6q9X6m91OXeqiBFVNZsNBpZ40XBoWmrjYH
	yd1oaW0Utkf05+erZSrCYaR+TL0PjkqIZIk+N0LoHxCurBIUc53tTcHqOCZck5de2/dblHgbmeI
	Qr0M1yjn63gkAjektEH5OHueiZPHCcM+e7/TsPrkSDTLsh4x34mS7pC3
X-Received: by 2002:a05:6808:f07:b0:571:846e:6f08 with SMTP id 5614622812f47-57a06c1b05bmr19244383b6e.5.1795636269401;
        Wed, 25 Nov 2026 11:51:09 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:51:08 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 12/12] media: add driver for StarTech USB3HDCAP
Date: Wed, 25 Nov 2026 13:49:51 -0600
Message-ID: <20261125194951.19072-13-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

Add a V4L2 driver for the StarTech USB3HDCAP video capture device. This is
a popular capture card based on the MST3367 HDMI receiver and TW9900
composite video decoder. Support is included for the composite, S-Video,
component, and HDMI inputs, and these inputs have been tested at various
resolutions. Audio support is provided by an ALSA device.

Also includes preliminary support for the Micomsoft XCAPTURE-1 hardware
variant. All inputs have been tested on that variant as well except for
component.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 MAINTAINERS                                   |    6 +
 drivers/media/usb/Kconfig                     |    1 +
 drivers/media/usb/Makefile                    |    1 +
 drivers/media/usb/usb3hdcap/Kconfig           |   15 +
 drivers/media/usb/usb3hdcap/Makefile          |    8 +
 drivers/media/usb/usb3hdcap/usb3hdcap-audio.c |  323 +++++
 .../media/usb/usb3hdcap/usb3hdcap-composite.c |  212 +++
 drivers/media/usb/usb3hdcap/usb3hdcap-core.c  | 1148 +++++++++++++++++
 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c  |  200 +++
 drivers/media/usb/usb3hdcap/usb3hdcap-video.c |  499 +++++++
 drivers/media/usb/usb3hdcap/usb3hdcap.h       |  238 ++++
 11 files changed, 2651 insertions(+)
 create mode 100644 drivers/media/usb/usb3hdcap/Kconfig
 create mode 100644 drivers/media/usb/usb3hdcap/Makefile
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-audio.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-composite.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-core.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-video.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6cbe402ee9da..478557056947 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26880,6 +26880,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
 F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
 
+STARTECH USB3HDCAP VIDEO CAPTURE DRIVER
+M:	Matthew Laux <matthew.laux@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/usb/usb3hdcap/
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/media/usb/Kconfig b/drivers/media/usb/Kconfig
index 813171d25ac5..9fd043459613 100644
--- a/drivers/media/usb/Kconfig
+++ b/drivers/media/usb/Kconfig
@@ -16,6 +16,7 @@ if MEDIA_CAMERA_SUPPORT
 source "drivers/media/usb/gspca/Kconfig"
 source "drivers/media/usb/pwc/Kconfig"
 source "drivers/media/usb/s2255/Kconfig"
+source "drivers/media/usb/usb3hdcap/Kconfig"
 source "drivers/media/usb/usbtv/Kconfig"
 source "drivers/media/usb/uvc/Kconfig"
 
diff --git a/drivers/media/usb/Makefile b/drivers/media/usb/Makefile
index 6d171beea20d..a9b7a398addb 100644
--- a/drivers/media/usb/Makefile
+++ b/drivers/media/usb/Makefile
@@ -29,4 +29,5 @@ obj-$(CONFIG_VIDEO_GO7007) += go7007/
 obj-$(CONFIG_VIDEO_HDPVR) += hdpvr/
 obj-$(CONFIG_VIDEO_PVRUSB2) += pvrusb2/
 obj-$(CONFIG_VIDEO_STK1160) += stk1160/
+obj-$(CONFIG_VIDEO_USB3HDCAP) += usb3hdcap/
 obj-$(CONFIG_VIDEO_USBTV) += usbtv/
diff --git a/drivers/media/usb/usb3hdcap/Kconfig b/drivers/media/usb/usb3hdcap/Kconfig
new file mode 100644
index 000000000000..b2c841448eb1
--- /dev/null
+++ b/drivers/media/usb/usb3hdcap/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_USB3HDCAP
+	tristate "StarTech USB3HDCAP video capture support"
+	depends on VIDEO_DEV && I2C && SND
+	depends on GPIOLIB && PM
+	select SND_PCM
+	select VIDEOBUF2_VMALLOC
+	select VIDEO_MST3367
+	select VIDEO_TW9900
+	help
+	  This is a video4linux2 driver for the StarTech USB3HDCAP and
+	  Micomsoft XCAPTURE-1 USB 3.0 HD video capture devices.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called usb3hdcap
diff --git a/drivers/media/usb/usb3hdcap/Makefile b/drivers/media/usb/usb3hdcap/Makefile
new file mode 100644
index 000000000000..f8d833ea530a
--- /dev/null
+++ b/drivers/media/usb/usb3hdcap/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+usb3hdcap-y := usb3hdcap-core.o \
+	usb3hdcap-video.o \
+	usb3hdcap-composite.o \
+	usb3hdcap-hdmi.o \
+	usb3hdcap-audio.o
+
+obj-$(CONFIG_VIDEO_USB3HDCAP) += usb3hdcap.o
diff --git a/drivers/media/usb/usb3hdcap/usb3hdcap-audio.c b/drivers/media/usb/usb3hdcap/usb3hdcap-audio.c
new file mode 100644
index 000000000000..61c28cd76f21
--- /dev/null
+++ b/drivers/media/usb/usb3hdcap/usb3hdcap-audio.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB3HDCAP audio support - CS53L21 init + ALSA capture device
+ *
+ * Audio is embedded in the isochronous video stream as 48kHz stereo
+ * 16-bit LE PCM. Each video line contains 8, 12, or 16 bytes of audio data.
+ */
+
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+
+#include "usb3hdcap.h"
+
+#define HDCAP_AUDIO_BUFSZ	(64 * 1024)
+
+static const struct snd_pcm_hardware snd_hdcap_hw = {
+	.info = SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP_VALID,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rates = SNDRV_PCM_RATE_48000,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.channels_min = 2,
+	.channels_max = 2,
+	.period_bytes_min = 1024,
+	.period_bytes_max = 65536,
+	.periods_min = 2,
+	.periods_max = 128,
+	.buffer_bytes_max = HDCAP_AUDIO_BUFSZ,
+};
+
+/* ------------------------------------------------------------------ */
+/* PCM ops                                                            */
+/* ------------------------------------------------------------------ */
+
+static int snd_hdcap_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	hdcap->snd_substream = substream;
+	substream->runtime->hw = snd_hdcap_hw;
+
+	return 0;
+}
+
+static int snd_hdcap_pcm_close(struct snd_pcm_substream *substream)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	atomic_set(&hdcap->snd_stream, 0);
+	WRITE_ONCE(hdcap->snd_substream, NULL);
+
+	return 0;
+}
+
+static int snd_hdcap_prepare(struct snd_pcm_substream *substream)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	hdcap->snd_buffer_pos = 0;
+	hdcap->snd_period_pos = 0;
+
+	return 0;
+}
+
+static int snd_hdcap_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		atomic_set(&hdcap->snd_stream, 1);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		atomic_set(&hdcap->snd_stream, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static snd_pcm_uframes_t snd_hdcap_pointer(struct snd_pcm_substream *substream)
+{
+	struct usb3hdcap *hdcap = snd_pcm_substream_chip(substream);
+
+	return hdcap->snd_buffer_pos;
+}
+
+static const struct snd_pcm_ops snd_hdcap_pcm_ops = {
+	.open = snd_hdcap_pcm_open,
+	.close = snd_hdcap_pcm_close,
+	.prepare = snd_hdcap_prepare,
+	.trigger = snd_hdcap_trigger,
+	.pointer = snd_hdcap_pointer,
+};
+
+/* ------------------------------------------------------------------ */
+/* Audio data feed                                                    */
+/* ------------------------------------------------------------------ */
+
+void usb3hdcap_audio_data(struct usb3hdcap *hdcap, const u8 *data, int len)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_pcm_runtime *runtime;
+	size_t frame_bytes, nframes;
+	size_t buffer_pos, period_pos;
+	unsigned long flags;
+
+	substream = READ_ONCE(hdcap->snd_substream);
+	if (!substream)
+		return;
+
+	snd_pcm_stream_lock_irqsave(substream, flags);
+
+	if (!atomic_read(&hdcap->snd_stream))
+		goto out;
+
+	runtime = substream->runtime;
+	if (!runtime || !runtime->dma_area)
+		goto out;
+
+	frame_bytes = runtime->frame_bits >> 3;
+	nframes = len / frame_bytes;
+	if (!nframes)
+		goto out;
+
+	buffer_pos = hdcap->snd_buffer_pos;
+	period_pos = hdcap->snd_period_pos;
+
+	/* Copy into ALSA ring buffer, handling wrap */
+	if (buffer_pos + nframes >= runtime->buffer_size) {
+		size_t cnt = (runtime->buffer_size - buffer_pos) * frame_bytes;
+
+		memcpy(runtime->dma_area + buffer_pos * frame_bytes, data, cnt);
+		memcpy(runtime->dma_area, data + cnt, nframes * frame_bytes - cnt);
+	} else {
+		memcpy(runtime->dma_area + buffer_pos * frame_bytes, data,
+		       nframes * frame_bytes);
+	}
+
+	buffer_pos += nframes;
+	period_pos += nframes;
+
+	if (buffer_pos >= runtime->buffer_size)
+		buffer_pos -= runtime->buffer_size;
+
+	hdcap->snd_buffer_pos = buffer_pos;
+
+	if (period_pos >= runtime->period_size) {
+		hdcap->snd_period_pos = period_pos - runtime->period_size;
+		snd_pcm_period_elapsed_under_stream_lock(substream);
+	} else {
+		hdcap->snd_period_pos = period_pos;
+	}
+
+out:
+	snd_pcm_stream_unlock_irqrestore(substream, flags);
+}
+
+/* ------------------------------------------------------------------ */
+/* CS53L21 codec init                                                 */
+/* ------------------------------------------------------------------ */
+
+int usb3hdcap_cs53l21_init(struct usb3hdcap *hdcap)
+{
+	bool is_xcapture =
+		le16_to_cpu(hdcap->usb_dev->descriptor.idProduct) == XCAPTURE1_PID;
+	u8 in_sel = 0x00;
+	u8 ch_mixer = 0x00;
+	int ret;
+
+	if (is_xcapture) {
+		/*
+		 * composite/S-Video audio is on AIN2A/AIN2B, and for the other inputs
+		 * the ADC channels are swapped
+		 */
+		if (hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO)
+			in_sel = 0x50;
+		else
+			ch_mixer = 0x0f;
+	}
+
+	/* MIC power control: power down mic B, mic A, and bias */
+	/* SPEED = "10 - Half-Speed Mode (HSM) - 12.5 to 25 kHz sample rates" */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_MIC_PWR_CTL, 0x4e);
+	if (ret)
+		return ret;
+
+	/* interface: I2S, master */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_IFACE_CTL, 0x44);
+	if (ret)
+		return ret;
+
+	/* ADC input select: AIN1x, or AIN2x for XCAPTURE-1 SD inputs */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADC_IN_SEL, in_sel);
+	if (ret)
+		return ret;
+
+	/* ALC/PGA: 0 dB */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ALC_PGAA, 0x00);
+	if (ret)
+		return ret;
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ALC_PGAB, 0x00);
+	if (ret)
+		return ret;
+
+	/* ADC attenuators: 0 dB */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADCA_ATT, 0x00);
+	if (ret)
+		return ret;
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADCB_ATT, 0x00);
+	if (ret)
+		return ret;
+
+	/* ALC enable and attack rate = fastest attack */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ALC_EN_ATK, 0xc0);
+	if (ret)
+		return ret;
+
+	/* interface: "SPE Processed ADC data to ADC serial port, SDOUT data." */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_IFACE_CTL, 0x46);
+	if (ret)
+		return ret;
+
+	/* SPE control: SPE enable, "Soft Ramp" turned on */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_SPE_CTL, 0x42);
+	if (ret)
+		return ret;
+
+	/* ADC mixer volume: +2.5 dB */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADCA_MIX_VOL, 0x05);
+	if (ret)
+		return ret;
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_ADCB_MIX_VOL, 0x05);
+	if (ret)
+		return ret;
+
+	/* channel mixer: off, or ADCA/ADCB swapped */
+	ret = u3hc_i2c_write(hdcap, ADDR_CS53L21, CS53L21_CH_MIXER, ch_mixer);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* ALSA card init / teardown                                          */
+/* ------------------------------------------------------------------ */
+
+static void usb3hdcap_snd_free(struct snd_card *card)
+{
+	struct usb3hdcap *hdcap = card->private_data;
+
+	v4l2_device_put(&hdcap->v4l2_dev);
+}
+
+int usb3hdcap_audio_init(struct usb3hdcap *hdcap)
+{
+	int ret;
+	struct snd_card *card;
+	struct snd_pcm *pcm;
+
+	atomic_set(&hdcap->snd_stream, 0);
+
+	ret = snd_card_new(hdcap->dev, SNDRV_DEFAULT_IDX1, "usb3hdcap",
+			   THIS_MODULE, 0, &card);
+	if (ret < 0)
+		return ret;
+
+	strscpy(card->driver, "usb3hdcap", sizeof(card->driver));
+	strscpy(card->shortname, "USB3HDCAP Audio", sizeof(card->shortname));
+	snprintf(card->longname, sizeof(card->longname),
+		 "USB3HDCAP Audio at bus %d device %d",
+		 hdcap->usb_dev->bus->busnum, hdcap->usb_dev->devnum);
+
+	hdcap->snd = card;
+	card->private_data = hdcap;
+	card->private_free = usb3hdcap_snd_free;
+	v4l2_device_get(&hdcap->v4l2_dev);
+
+	ret = snd_pcm_new(card, "USB3HDCAP Audio", 0, 0, 1, &pcm);
+	if (ret < 0)
+		goto err;
+
+	strscpy(pcm->name, "USB3HDCAP Audio Input", sizeof(pcm->name));
+	pcm->info_flags = 0;
+	pcm->private_data = hdcap;
+
+	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_hdcap_pcm_ops);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS, NULL,
+				       HDCAP_AUDIO_BUFSZ, HDCAP_AUDIO_BUFSZ);
+
+	ret = snd_card_register(card);
+	if (ret)
+		goto err;
+
+	dev_info(hdcap->dev, "ALSA audio device registered\n");
+	return 0;
+
+err:
+	hdcap->snd = NULL;
+	snd_card_free(card);
+	return ret;
+}
+
+void usb3hdcap_audio_free(struct usb3hdcap *hdcap)
+{
+	if (hdcap->snd && hdcap->usb_dev) {
+		snd_card_free_when_closed(hdcap->snd);
+		hdcap->snd = NULL;
+	}
+}
diff --git a/drivers/media/usb/usb3hdcap/usb3hdcap-composite.c b/drivers/media/usb/usb3hdcap/usb3hdcap-composite.c
new file mode 100644
index 000000000000..dfc773776e5d
--- /dev/null
+++ b/drivers/media/usb/usb3hdcap/usb3hdcap-composite.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB3HDCAP composite video init - CPLD + TW9900 setup, signal lock
+ */
+
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/usb.h>
+#include <media/i2c/mst3367.h>
+#include <media/i2c/tw9900.h>
+#include <media/v4l2-ctrls.h>
+
+#include "usb3hdcap.h"
+
+/* Main TW9900 configuration */
+static const struct tw9900_regval tw9900_init_regs[] = {
+	{ TW9900_ACNTL_I, 0x00 },
+	{ TW9900_OPFORM, 0xa7 },
+	{ TW9900_OPCNTL_I, 0x01 },
+	{ TW9900_VDELAY_LO, 0x14 },
+	{ TW9900_VACTIVE_LO, 0xf2 },
+	{ TW9900_HDELAY_LO, 0x0b },
+	{ TW9900_HACTIVE_LO, 0xd2 },
+	{ TW9900_VBICNTL, 0x57 },
+	{ TW9900_ACNTL_II, 0x0f },
+	{ TW9900_OPCNTL_II, 0x00 },
+	{ TW9900_SDT, 0x07 }, /* auto-detect */
+	{ TW9900_VCNTL1, 0x0c },
+	{ TW9900_VCNTL2, 0x03 },
+	{ TW9900_MISC1, 0x07 },
+	{ TW9900_MISC2, 0x06 },
+	{ TW9900_ANAPLLCTL, 0x01 },
+	{ TW9900_VVBI, 0x00 },
+	{ TW9900_HSBEGIN, 0x26 },
+	{ TW9900_HSEND, 0x36 },
+	{ TW9900_OVSDLY, 0xf0 },
+	{ TW9900_OVSEND, 0x28 },
+	{ TW9900_ACNTL_I, 0x80 },
+	/* "internal current reference 2" */
+	{ TW9900_ACNTL_I, 0x40 },
+};
+
+/* Adjust for PAL vs NTSC */
+static const struct tw9900_regval tw9900_pal_regs[] = {
+	{ TW9900_CROP_HI, 0x12 },
+	{ TW9900_VDELAY_LO, 0x19 },
+	{ TW9900_VACTIVE_LO, 0x20 },
+	{ TW9900_HDELAY_LO, 0x0a },
+	{ TW9900_HACTIVE_LO, 0xd0 },
+	{ TW9900_VVBI, 0x00 },
+	{ TW9900_CNTRL2, 0x00 },
+	{ TW9900_SDT_NOISE, 0x11 },
+	{ TW9900_LUMA_CTL, 0x00 },
+};
+
+static const struct tw9900_regval tw9900_ntsc_regs[] = {
+	{ TW9900_CROP_HI, 0x02 },
+	{ TW9900_VDELAY_LO, 0x14 },
+	{ TW9900_VACTIVE_LO, 0xf2 },
+	{ TW9900_HDELAY_LO, 0x10 },
+	{ TW9900_HACTIVE_LO, 0xd0 },
+	{ TW9900_VVBI, 0x10 },
+	{ TW9900_CNTRL2, 0x00 },
+	{ TW9900_SDT_NOISE, 0x11 },
+	{ TW9900_LUMA_CTL, 0x00 },
+};
+
+static struct tw9900_platform_data tw9900_pdata = {
+	.init_regs = tw9900_init_regs,
+	.n_init_regs = ARRAY_SIZE(tw9900_init_regs),
+	.ntsc_regs = tw9900_ntsc_regs,
+	.n_ntsc_regs = ARRAY_SIZE(tw9900_ntsc_regs),
+	.pal_regs = tw9900_pal_regs,
+	.n_pal_regs = ARRAY_SIZE(tw9900_pal_regs),
+};
+
+static struct i2c_board_info tw9900_info = {
+	I2C_BOARD_INFO("tw9900", ADDR_TW9900 >> 1),
+	.platform_data = &tw9900_pdata,
+};
+
+int usb3hdcap_composite_register(struct usb3hdcap *hdcap)
+{
+	hdcap->sd_tw9900 = v4l2_i2c_new_subdev_board(&hdcap->v4l2_dev,
+						     &hdcap->i2c_adap,
+						     &tw9900_info, NULL);
+	if (!hdcap->sd_tw9900) {
+		dev_warn(hdcap->dev, "Could not register TW9900\n");
+		return -ENODEV;
+	}
+
+	hdcap->ctrl_brightness = v4l2_ctrl_find(&hdcap->ctrl,
+						V4L2_CID_BRIGHTNESS);
+	hdcap->ctrl_contrast = v4l2_ctrl_find(&hdcap->ctrl, V4L2_CID_CONTRAST);
+	hdcap->ctrl_saturation = v4l2_ctrl_find(&hdcap->ctrl,
+						V4L2_CID_SATURATION);
+	hdcap->ctrl_hue = v4l2_ctrl_find(&hdcap->ctrl, V4L2_CID_HUE);
+	hdcap->ctrl_sharpness = v4l2_ctrl_find(&hdcap->ctrl,
+					       V4L2_CID_SHARPNESS);
+	if (!hdcap->ctrl_brightness || !hdcap->ctrl_contrast ||
+	    !hdcap->ctrl_saturation || !hdcap->ctrl_hue ||
+	    !hdcap->ctrl_sharpness)
+		return -ENODEV;
+
+	v4l2_ctrl_s_ctrl(hdcap->ctrl_brightness, -9);
+	v4l2_ctrl_s_ctrl(hdcap->ctrl_contrast, 0x79);
+	v4l2_ctrl_s_ctrl(hdcap->ctrl_sharpness, 0x02);
+
+	return 0;
+}
+
+int usb3hdcap_composite_querystd(struct usb3hdcap *hdcap, v4l2_std_id *std)
+{
+	v4l2_std_id detected = V4L2_STD_UNKNOWN;
+	int ret;
+
+	*std = V4L2_STD_UNKNOWN;
+
+	ret = v4l2_subdev_call(hdcap->sd_tw9900, video, querystd, &detected);
+	if (ret == -ETIMEDOUT)
+		return 0;
+	if (ret < 0)
+		return ret;
+
+	if (detected & V4L2_STD_NTSC)
+		*std = V4L2_STD_NTSC;
+	else if (detected & V4L2_STD_PAL)
+		*std = V4L2_STD_PAL;
+	return 0;
+}
+
+/* Make std the current standard and derive the capture format from it */
+int usb3hdcap_composite_set_std(struct usb3hdcap *hdcap, v4l2_std_id std)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	int full_h = (std & V4L2_STD_PAL) ? PAL_HEIGHT : NTSC_HEIGHT;
+	int half_h = full_h / 2;
+	int ret;
+
+	ret = v4l2_subdev_call(hdcap->sd_tw9900, video, s_std, std);
+	if (ret < 0)
+		return ret;
+
+	hdcap->std = std;
+	hdcap->width = SD_WIDTH;
+	hdcap->height = half_h;
+	hdcap->bpl = hdcap->width * 2;
+
+	ret = v4l2_subdev_call(hdcap->sd_tw9900, pad, get_fmt, NULL, &fmt);
+	hdcap->interlaced = !(ret >= 0 && fmt.format.height == half_h);
+
+	dev_dbg(hdcap->dev, "%s %d%s\n",
+		(std & V4L2_STD_PAL) ? "PAL" : "NTSC",
+		hdcap->interlaced ? full_h : half_h,
+		hdcap->interlaced ? "i" : "p");
+	return 0;
+}
+
+int usb3hdcap_composite_init(struct usb3hdcap *hdcap)
+{
+	v4l2_std_id std = V4L2_STD_UNKNOWN;
+	int k, ret;
+	u32 status = 0;
+
+	/* disable MST3367 */
+	v4l2_subdev_call(hdcap->sd_mst3367, video, s_routing,
+			 MST3367_INPUT_NONE, 0, 0);
+
+	/* select TW9900 input of cpld? */
+	/* from windows driver */
+	if (u3hc_i2c_read(hdcap, ADDR_CPLD, 0x3b) != 0)
+		u3hc_i2c_write(hdcap, ADDR_CPLD, 0x3b, 0x80);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x05);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x00, 0x01);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x10, hdcap->has_mcu ? 0xfc : 0xfe);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x75);
+
+	ret = v4l2_subdev_call(hdcap->sd_tw9900, video, s_routing,
+			       hdcap->input == INPUT_SVIDEO ?
+			       TW9900_INPUT_SVIDEO : TW9900_INPUT_COMPOSITE,
+			       0, 0);
+	if (ret < 0)
+		return ret;
+
+	for (k = 0; k < 10; k++) {
+		ret = v4l2_subdev_call(hdcap->sd_tw9900, video, g_input_status,
+				       &status);
+		if (ret >= 0 && !status) {
+			dev_dbg(hdcap->dev, "Signal locked (%d ms)\n", k * 100);
+			break;
+		}
+		msleep(100);
+	}
+
+	if (k < 10) {
+		ret = usb3hdcap_composite_querystd(hdcap, &std);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(hdcap->dev, "No signal lock after 1s (status=0x%02x)\n",
+			status);
+	}
+
+	hdcap->no_signal = std == V4L2_STD_UNKNOWN;
+	if (hdcap->no_signal)
+		std = V4L2_STD_NTSC;
+
+	return usb3hdcap_composite_set_std(hdcap, std);
+}
diff --git a/drivers/media/usb/usb3hdcap/usb3hdcap-core.c b/drivers/media/usb/usb3hdcap/usb3hdcap-core.c
new file mode 100644
index 000000000000..27b73d97d3d7
--- /dev/null
+++ b/drivers/media/usb/usb3hdcap/usb3hdcap-core.c
@@ -0,0 +1,1148 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarTech USB3HDCAP USB 3.0 HD Video Capture Driver
+ * a.k.a. YUAN High-Tech Development Co., Ltd UB530
+ *
+ * Supported inputs are composite, S-Video, component, and HDMI. I haven't
+ * attempted to support DVI or VGA.
+ *
+ * Tested video modes (all at 60fps):
+ *     composite 240p and 480i
+ *     S-Video 240p and 480i
+ *     component 240p, 480i, 480p, 720p, 1080i
+ *     HDMI 1080p
+ *
+ * Other video modes will probably "just work" if the appropriate entries
+ * are added in the mode tables and code is added to disambiguate using
+ * htotal if necessary.
+ *
+ * Audio is supported and should work with all inputs.
+ *
+ * Also partially supports the Micomsoft XCAPTURE-1 for composite, S-Video,
+ * and HDMI... component is untested but should work.
+ *
+ * Based on USBPcap analysis and reverse engineering of CY3014.X64.SYS
+ *   (version 1.1.0.193 of Fri, 04 Jun 2021 09:37:45 UTC)
+ * MST3367 HDMI path based on hdcapm by Steven Toth
+ * Driver structure based heavily on usbtv
+ */
+
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/kref.h>
+#include <linux/uaccess.h>
+#include <linux/usb.h>
+#include <linux/vmalloc.h>
+#include <linux/mutex.h>
+#include <media/i2c/mst3367.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-dv-timings.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-vmalloc.h>
+
+#include "usb3hdcap.h"
+
+/* ------------------------------------------------------------------ */
+/* USB control transfer helpers                                       */
+/* ------------------------------------------------------------------ */
+
+static int vendor_out(struct usb3hdcap *hdcap, u8 request, u16 value,
+		      u16 index, u8 *data, u16 len)
+{
+	int ret;
+	u8 *buf = NULL;
+
+	if (len > 0) {
+		buf = kmemdup(data, len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
+	ret = usb_control_msg(hdcap->usb_dev,
+			      usb_sndctrlpipe(hdcap->usb_dev, 0),
+			      request,
+			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      value, index, buf, len, 1000);
+
+	kfree(buf);
+
+	if (ret < 0) {
+		dev_err(hdcap->dev, "%s 0x%02x val=0x%04x idx=0x%04x: %d\n",
+			__func__, request, value, index, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int vendor_in(struct usb3hdcap *hdcap, u8 request, u16 value, u16 index,
+		     u8 *data, u16 len)
+{
+	u8 *buf;
+	int ret;
+
+	buf = kmalloc(len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = usb_control_msg(hdcap->usb_dev,
+			      usb_rcvctrlpipe(hdcap->usb_dev, 0),
+			      request,
+			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      value, index, buf, len, 1000);
+
+	if (ret >= 0 && ret < len) {
+		dev_err(hdcap->dev,
+			"%s 0x%02x val=0x%04x idx=0x%04x: short read %d/%d\n",
+			__func__, request, value, index, ret, len);
+		ret = -EIO;
+	}
+	if (ret >= 0)
+		memcpy(data, buf, len);
+
+	kfree(buf);
+	return ret;
+}
+
+/* ------------------------------------------------------------------ */
+/* MCU I2C tunnel (XCAPTURE-1)                                        */
+/*                                                                    */
+/* The Nuvoton NUC100 MCU intercepts I2C traffic. Transactions are    */
+/* tunneled through a different USB vendor protocol:                  */
+/*   Write: bRequest=0xC0, wValue=0x5066 or addr|0x5000               */
+/*   Read:  two-phase write+read, always through wValue=0x5066        */
+/*                                                                    */
+/* Some addresses need the 0x66 "gateway" (target addr in payload),   */
+/* others use the I2C addr directly in wValue with 0x5000 flag.       */
+/* ------------------------------------------------------------------ */
+
+static bool mcu_use_gateway(u8 addr)
+{
+	return ((u8)(addr + 0x78) & 0xeb) || addr == 0x8c;
+}
+
+static int mcu_i2c_write(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 val)
+{
+	u8 buf[3];
+	u16 wvalue;
+	int len;
+	int ret;
+
+	if (mcu_use_gateway(addr)) {
+		buf[0] = addr;
+		buf[1] = reg;
+		buf[2] = val;
+		wvalue = 0x5066;
+		len = 3;
+	} else {
+		buf[0] = reg;
+		buf[1] = val;
+		wvalue = addr | 0x5000;
+		len = 2;
+	}
+
+	mutex_lock(&hdcap->mcu_lock);
+	ret = vendor_out(hdcap, REQ_I2C, wvalue, 0, buf, len);
+	mutex_unlock(&hdcap->mcu_lock);
+	return ret;
+}
+
+static int mcu_i2c_read(struct usb3hdcap *hdcap, u8 addr, u8 reg)
+{
+	u8 tx[3] = { addr | 1, 1, reg };
+	u8 val;
+	int ret;
+
+	mutex_lock(&hdcap->mcu_lock);
+
+	/* send target addr, rx length, and register */
+	ret = vendor_out(hdcap, REQ_I2C, 0x5066, 0, tx, 3);
+	if (ret < 0)
+		goto out;
+
+	/* Retrieve the result */
+	ret = vendor_in(hdcap, REQ_I2C, 0x5066, 0, &val, 1);
+	if (ret < 0) {
+		dev_err(hdcap->dev, "%s 0x%02x reg 0x%02x: %d\n",
+			__func__, addr, reg, ret);
+		goto out;
+	}
+	ret = val;
+
+out:
+	mutex_unlock(&hdcap->mcu_lock);
+	return ret;
+}
+
+int u3hc_i2c_write(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 val)
+{
+	if (addr == ADDR_MST3367 && reg == 0x00)
+		hdcap->mst_current_bank = val;
+
+	if (hdcap->has_mcu) {
+		if (addr == ADDR_MST3367 && reg != 0x00)
+			mcu_i2c_write(hdcap, ADDR_MST3367, 0x00, hdcap->mst_current_bank);
+		return mcu_i2c_write(hdcap, addr, reg, val);
+	}
+	return vendor_out(hdcap, REQ_I2C, addr, reg, &val, 1);
+}
+
+int u3hc_i2c_read(struct usb3hdcap *hdcap, u8 addr, u8 reg)
+{
+	u8 val;
+	int ret;
+
+	if (hdcap->has_mcu)
+		return mcu_i2c_read(hdcap, addr, reg);
+
+	ret = vendor_in(hdcap, REQ_I2C, addr, reg, &val, 1);
+	if (ret < 0) {
+		dev_err(hdcap->dev, "%s 0x%02x reg 0x%02x: %d\n",
+			__func__, addr, reg, ret);
+		return ret;
+	}
+
+	return val;
+}
+
+int u3hc_i2c_rmw(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 mask, u8 bits)
+{
+	int val = u3hc_i2c_read(hdcap, addr, reg);
+
+	if (val < 0)
+		return val;
+	return u3hc_i2c_write(hdcap, addr, reg, (val & mask) | bits);
+}
+
+/* ------------------------------------------------------------------ */
+/* I2C adapter for the TW9900 and MST3367 sub-devices                 */
+/* ------------------------------------------------------------------ */
+
+static int usb3hdcap_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+				unsigned short flags, char read_write,
+				u8 command, int size,
+				union i2c_smbus_data *data)
+{
+	struct usb3hdcap *hdcap = i2c_get_adapdata(adap);
+	int ret;
+
+	if (!hdcap->usb_dev)
+		return -ENODEV;
+
+	if (size != I2C_SMBUS_BYTE_DATA)
+		return -EOPNOTSUPP;
+
+	if (read_write == I2C_SMBUS_WRITE)
+		return u3hc_i2c_write(hdcap, addr << 1, command, data->byte);
+
+	ret = u3hc_i2c_read(hdcap, addr << 1, command);
+	if (ret < 0)
+		return ret;
+
+	data->byte = ret;
+	return 0;
+}
+
+static u32 usb3hdcap_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_SMBUS_BYTE_DATA;
+}
+
+static const struct i2c_algorithm usb3hdcap_i2c_algo = {
+	.smbus_xfer = usb3hdcap_smbus_xfer,
+	.functionality = usb3hdcap_i2c_functionality,
+};
+
+static int usb3hdcap_i2c_register(struct usb3hdcap *hdcap)
+{
+	hdcap->i2c_adap.owner = THIS_MODULE;
+	hdcap->i2c_adap.algo = &usb3hdcap_i2c_algo;
+	hdcap->i2c_adap.dev.parent = hdcap->dev;
+	strscpy(hdcap->i2c_adap.name, "usb3hdcap", sizeof(hdcap->i2c_adap.name));
+	i2c_set_adapdata(&hdcap->i2c_adap, hdcap);
+
+	return i2c_add_adapter(&hdcap->i2c_adap);
+}
+
+/* CheckIsMCUExist() */
+static void usb3hdcap_probe_mcu(struct usb3hdcap *hdcap)
+{
+	u8 tx[5] = { 0xab, 0x03, 0x12, 0x34, 0x57 };
+	u8 rx[3] = {};
+	int k, ret;
+
+	hdcap->has_mcu = 0;
+
+	/* Assert CPLD GPIO 0x39 to wake MCU? */
+	vendor_out(hdcap, REQ_GPIO, 0xc039, 0, NULL, 0);
+	vendor_out(hdcap, REQ_GPIO, 0x4134, 0, NULL, 0);
+
+	/* Poll GPIO 0x39 until MCU signals ready */
+	for (k = 0; k < 50; k++) {
+		msleep(20);
+		ret = vendor_in(hdcap, REQ_GPIO, 0x39, 0, rx, 1);
+		if (ret >= 0 && rx[0] == 1)
+			break;
+	}
+	dev_dbg(hdcap->dev, "MCU freed, wait count=%d\n", k);
+
+	/* repeatedly send {0x12, 0x34, 0x57} until response received */
+	for (k = 0; k < 200; k++) {
+		ret = vendor_out(hdcap, REQ_I2C, 0x5066, 0, tx, sizeof(tx));
+		if (ret < 0)
+			return;
+
+		memset(rx, 0, sizeof(rx));
+		ret = vendor_in(hdcap, REQ_I2C, 0x5066, 0, rx, 3);
+		if (ret < 0)
+			return;
+
+		if (rx[0] == 'Q' && rx[1] == 0x10) {
+			hdcap->has_mcu = 1;
+			dev_info(hdcap->dev,
+				 "Nuvoton NUC100 MCU detected after %d tries\n",
+				 k + 1);
+			return;
+		}
+
+		/* still starting up, ask again in 100 ms */
+		if (rx[0] != 0x33 || rx[1] != 0x44 || rx[2] != 0x55)
+			break;
+		msleep(100);
+	}
+
+	if (k == 200)
+		dev_warn(hdcap->dev, "MCU never became ready\n");
+	else
+		dev_info(hdcap->dev,
+			 "Unrecognized MCU probe response: %02x %02x %02x\n",
+			 rx[0], rx[1], rx[2]);
+}
+
+/* Device-level init + GPIO pin state? shared between all inputs */
+static int usb3hdcap_device_init(struct usb3hdcap *hdcap)
+{
+	bool is_xcapture =
+		le16_to_cpu(hdcap->usb_dev->descriptor.idProduct) == XCAPTURE1_PID;
+
+	if (is_xcapture) {
+		/*
+		 * XCAPTURE-1: The Windows driver reads REQ_INIT and
+		 * sends this when the read fails or returns non-zero, purpose unknown
+		 */
+		u8 unk_ec[] = {
+			0xb8, 0x22, 0xb1, 0xd2, 0x03, 0xc0, 0xff, 0x00, 0x00, 0xca,
+		};
+		u8 state = 0;
+
+		if (vendor_in(hdcap, REQ_INIT, 0x0000, 0, &state, 1) < 0 || state)
+			vendor_out(hdcap, REQ_UNK_EC, 0x0000, 0,
+				   unk_ec, sizeof(unk_ec));
+	}
+
+	vendor_out(hdcap, REQ_INIT,   0x0000, 0, NULL, 0);
+	vendor_out(hdcap, REQ_UNK_C7, 0x0064, 0, NULL, 0);
+	/* Windows driver does this but is always fails? */
+	/* vendor_out(hdcap, 0xc5, 0x0000, 0, NULL, 0); */
+
+	/*
+	 * just replay what the windows driver does:
+	 *	FUN_14022e3f4(param_1,0x402d);
+	 *	FUN_14022e3f4(param_1,0x12d);
+	 *	FUN_140001220(0x32);
+	 *	FUN_14022e3f4(param_1,0x2d);
+	 *	FUN_140001220(0x32);
+	 *	FUN_14022e3f4(param_1,0x12d);
+	 *	FUN_140001220(0x32);
+	 *	FUN_14022e3f4(param_1,0x802d);
+	 */
+
+	vendor_out(hdcap, REQ_GPIO, 0x402d, 0, NULL, 0);
+	vendor_out(hdcap, REQ_GPIO, 0x012d, 0, NULL, 0);
+	msleep(50);
+	vendor_out(hdcap, REQ_GPIO, 0x002d, 0, NULL, 0);
+	msleep(50);
+	vendor_out(hdcap, REQ_GPIO, 0x012d, 0, NULL, 0);
+	msleep(50);
+	vendor_out(hdcap, REQ_GPIO, 0x802d, 0, NULL, 0);
+
+	if (!hdcap->has_mcu && is_xcapture)
+		usb3hdcap_probe_mcu(hdcap);
+
+	return 0;
+}
+
+/*
+ * Route the current input and make it the current standard/timings.
+ * Fall back to a default if there is no signal.
+ * Only fails if the hardware can't be set up.
+ */
+static int usb3hdcap_hw_init(struct usb3hdcap *hdcap)
+{
+	usb3hdcap_cs53l21_init(hdcap);
+
+	switch (hdcap->input) {
+	case INPUT_HDMI:
+		return usb3hdcap_hdmi_init(hdcap);
+	case INPUT_COMPONENT:
+		return usb3hdcap_component_init(hdcap);
+	case INPUT_COMPOSITE:
+	case INPUT_SVIDEO:
+	default:
+		return usb3hdcap_composite_init(hdcap);
+	}
+}
+
+/* ------------------------------------------------------------------ */
+/* V4L2 ioctls                                                        */
+/* ------------------------------------------------------------------ */
+
+static int usb3hdcap_querycap(struct file *file, void *priv,
+			      struct v4l2_capability *cap)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	strscpy(cap->driver, "usb3hdcap", sizeof(cap->driver));
+	strscpy(cap->card, hdcap->has_mcu ?
+		"Micomsoft XCAPTURE-1" : "StarTech USB3HDCAP",
+		sizeof(cap->card));
+	usb_make_path(hdcap->usb_dev, cap->bus_info, sizeof(cap->bus_info));
+	return 0;
+}
+
+static int usb3hdcap_enum_input(struct file *file, void *priv,
+				struct v4l2_input *i)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (i->index > INPUT_HDMI)
+		return -EINVAL;
+
+	i->type = V4L2_INPUT_TYPE_CAMERA;
+	/* as of the last S_INPUT, QUERYSTD or QUERY_DV_TIMINGS */
+	if (i->index == hdcap->input && hdcap->no_signal)
+		i->status = V4L2_IN_ST_NO_SIGNAL;
+	switch (i->index) {
+	case INPUT_COMPOSITE:
+		strscpy(i->name, "Composite", sizeof(i->name));
+		i->std = USB3HDCAP_V4L2_STDS;
+		i->capabilities = V4L2_IN_CAP_STD;
+		break;
+	case INPUT_SVIDEO:
+		strscpy(i->name, "S-Video", sizeof(i->name));
+		i->std = USB3HDCAP_V4L2_STDS;
+		i->capabilities = V4L2_IN_CAP_STD;
+		break;
+	case INPUT_COMPONENT:
+		strscpy(i->name, "Component", sizeof(i->name));
+		i->std = 0;
+		i->capabilities = V4L2_IN_CAP_DV_TIMINGS;
+		break;
+	case INPUT_HDMI:
+		strscpy(i->name, "HDMI", sizeof(i->name));
+		i->std = 0;
+		i->capabilities = V4L2_IN_CAP_DV_TIMINGS;
+		break;
+	}
+	return 0;
+}
+
+static int usb3hdcap_enum_fmt_vid_cap(struct file *file, void  *priv,
+				      struct v4l2_fmtdesc *f)
+{
+	if (f->index > 0)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_PIX_FMT_YUYV;
+	return 0;
+}
+
+static int usb3hdcap_fmt_vid_cap(struct file *file, void *priv,
+				 struct v4l2_format *f)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	f->fmt.pix.width = hdcap->width;
+	f->fmt.pix.height = hdcap->height;
+	f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
+	f->fmt.pix.field = hdcap->interlaced ?
+		V4L2_FIELD_ALTERNATE : V4L2_FIELD_NONE;
+	f->fmt.pix.bytesperline = hdcap->bpl;
+	f->fmt.pix.sizeimage = hdcap->bpl * hdcap->height;
+	if (hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO ||
+	    hdcap->mst_bt601)
+		f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
+	else
+		f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
+
+	return 0;
+}
+
+static int usb3hdcap_g_std(struct file *file, void *priv, v4l2_std_id *norm)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (!(hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO))
+		return -ENODATA;
+
+	*norm = hdcap->std;
+	return 0;
+}
+
+static int usb3hdcap_s_std(struct file *file, void *priv, v4l2_std_id norm)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (!(hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO))
+		return -ENODATA;
+
+	if (!(norm & USB3HDCAP_V4L2_STDS))
+		return -EINVAL;
+
+	if (norm == hdcap->std)
+		return 0;
+
+	if (vb2_is_busy(&hdcap->vb2q))
+		return -EBUSY;
+
+	return usb3hdcap_composite_set_std(hdcap, norm);
+}
+
+static int usb3hdcap_querystd(struct file *file, void *priv, v4l2_std_id *norm)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+	int ret;
+
+	if (!(hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO))
+		return -ENODATA;
+
+	ret = usb3hdcap_composite_querystd(hdcap, norm);
+	if (ret < 0)
+		return ret;
+
+	hdcap->no_signal = *norm == V4L2_STD_UNKNOWN;
+	return 0;
+}
+
+/* ------------------------------------------------------------------ */
+/* DV timings (HDMI + HD component)                                   */
+/* ------------------------------------------------------------------ */
+
+static unsigned int usb3hdcap_mst3367_pad(struct usb3hdcap *hdcap)
+{
+	return hdcap->input == INPUT_HDMI ?
+		MST3367_PAD_HDMI : MST3367_PAD_COMPONENT;
+}
+
+static bool usb3hdcap_component_timings_supported(const struct v4l2_dv_timings *t,
+						  void *handle)
+{
+	struct usb3hdcap *hdcap = handle;
+	struct v4l2_enum_dv_timings e = { .pad = MST3367_PAD_COMPONENT };
+
+	while (!v4l2_subdev_call(hdcap->sd_mst3367, pad, enum_dv_timings, &e)) {
+		if (v4l2_match_dv_timings(t, &e.timings, 0, false))
+			return true;
+		e.index++;
+	}
+	return false;
+}
+
+static bool usb3hdcap_hdmi_timings_supported(const struct v4l2_dv_timings *t,
+					     void *handle)
+{
+	/* The 4:2:2 line conversion works on two-pixel groups */
+	return !(t->bt.width & 1);
+}
+
+static int usb3hdcap_g_dv_timings(struct file *file, void *priv,
+				  struct v4l2_dv_timings *timings)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
+		return -ENODATA;
+
+	*timings = hdcap->timings;
+	return 0;
+}
+
+static int usb3hdcap_s_dv_timings(struct file *file, void *priv,
+				  struct v4l2_dv_timings *timings)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+	struct v4l2_dv_timings_cap cap = {};
+	bool valid;
+	int ret;
+
+	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
+		return -ENODATA;
+
+	cap.pad = usb3hdcap_mst3367_pad(hdcap);
+	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, dv_timings_cap, &cap);
+	if (ret < 0)
+		return ret;
+
+	if (hdcap->input == INPUT_COMPONENT)
+		valid = v4l2_valid_dv_timings(timings, &cap,
+					      usb3hdcap_component_timings_supported,
+					      hdcap);
+	else
+		valid = v4l2_valid_dv_timings(timings, &cap,
+					      usb3hdcap_hdmi_timings_supported,
+					      NULL);
+
+	if (!valid)
+		return -ERANGE;
+
+	if (v4l2_match_dv_timings(timings, &hdcap->timings, 0, false))
+		return 0;
+
+	if (vb2_is_busy(&hdcap->vb2q))
+		return -EBUSY;
+
+	return usb3hdcap_hd_set_timings(hdcap, timings);
+}
+
+static int usb3hdcap_enum_dv_timings(struct file *file, void *priv,
+				     struct v4l2_enum_dv_timings *timings)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+	int ret;
+
+	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
+		return -ENODATA;
+
+	timings->pad = usb3hdcap_mst3367_pad(hdcap);
+	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, enum_dv_timings, timings);
+	timings->pad = 0;
+	return ret;
+}
+
+static int usb3hdcap_dv_timings_cap(struct file *file, void *priv,
+				    struct v4l2_dv_timings_cap *cap)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+	int ret;
+
+	/* if you're not on HDMI/component, DV timings are not supported */
+	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
+		return -ENODATA;
+
+	cap->pad = usb3hdcap_mst3367_pad(hdcap);
+	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, dv_timings_cap, cap);
+	cap->pad = 0;
+	return ret;
+}
+
+static int usb3hdcap_query_dv_timings(struct file *file, void *priv,
+				      struct v4l2_dv_timings *timings)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+	int ret;
+
+	if (!(hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI))
+		return -ENODATA;
+
+	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, query_dv_timings, 0,
+			       timings);
+	hdcap->no_signal = ret < 0;
+	return ret;
+}
+
+static void usb3hdcap_activate_ctrls(struct usb3hdcap *hdcap,
+				     enum usb3hdcap_input input)
+{
+	bool is_tw9900 = input == INPUT_COMPOSITE || input == INPUT_SVIDEO;
+
+	v4l2_ctrl_activate(hdcap->ctrl_brightness, is_tw9900);
+	v4l2_ctrl_activate(hdcap->ctrl_contrast, is_tw9900);
+	v4l2_ctrl_activate(hdcap->ctrl_saturation, is_tw9900);
+	v4l2_ctrl_activate(hdcap->ctrl_hue, is_tw9900);
+	v4l2_ctrl_activate(hdcap->ctrl_sharpness, is_tw9900);
+}
+
+static int usb3hdcap_g_input(struct file *file, void *priv, unsigned int *i)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	*i = hdcap->input;
+	return 0;
+}
+
+/* Everything that selecting an input changes */
+struct usb3hdcap_input_state {
+	enum usb3hdcap_input input;
+	v4l2_std_id std;
+	struct v4l2_dv_timings timings;
+	bool no_signal;
+	bool mst_bt601;
+	int width;
+	int height;
+	int interlaced;
+	int bpl;
+};
+
+static void usb3hdcap_save_input(struct usb3hdcap *hdcap,
+				 struct usb3hdcap_input_state *state)
+{
+	state->input = hdcap->input;
+	state->std = hdcap->std;
+	state->timings = hdcap->timings;
+	state->no_signal = hdcap->no_signal;
+	state->mst_bt601 = hdcap->mst_bt601;
+	state->width = hdcap->width;
+	state->height = hdcap->height;
+	state->interlaced = hdcap->interlaced;
+	state->bpl = hdcap->bpl;
+}
+
+static void usb3hdcap_restore_input(struct usb3hdcap *hdcap,
+				    const struct usb3hdcap_input_state *state)
+{
+	hdcap->input = state->input;
+	hdcap->std = state->std;
+	hdcap->timings = state->timings;
+	hdcap->no_signal = state->no_signal;
+	hdcap->mst_bt601 = state->mst_bt601;
+	hdcap->width = state->width;
+	hdcap->height = state->height;
+	hdcap->interlaced = state->interlaced;
+	hdcap->bpl = state->bpl;
+}
+
+static int usb3hdcap_init_input(struct usb3hdcap *hdcap)
+{
+	int ret;
+
+	ret = usb3hdcap_hw_init(hdcap);
+	hdcap->hw_inited = !ret;
+	if (ret < 0)
+		return ret;
+
+	usb3hdcap_activate_ctrls(hdcap, hdcap->input);
+
+	if (hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO)
+		hdcap->video_dev.tvnorms = USB3HDCAP_V4L2_STDS;
+	else
+		hdcap->video_dev.tvnorms = 0;
+
+	return 0;
+}
+
+static int usb3hdcap_s_input(struct file *file, void *priv, unsigned int i)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+	struct usb3hdcap_input_state old;
+	int ret;
+
+	if (i > INPUT_HDMI)
+		return -EINVAL;
+	if (vb2_is_busy(&hdcap->vb2q))
+		return i == hdcap->input ? 0 : -EBUSY;
+
+	usb3hdcap_save_input(hdcap, &old);
+	hdcap->input = i;
+
+	ret = usb3hdcap_init_input(hdcap);
+	if (ret < 0) {
+		/* the hardware is in an unknown state, STREAMON will fail */
+		usb3hdcap_restore_input(hdcap, &old);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int usb3hdcap_enum_framesizes(struct file *file, void *priv,
+				     struct v4l2_frmsizeenum *fsize)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (fsize->index > 0)
+		return -EINVAL;
+	if (fsize->pixel_format != V4L2_PIX_FMT_YUYV)
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
+	fsize->discrete.width = hdcap->width;
+	fsize->discrete.height = hdcap->height;
+	return 0;
+}
+
+static void fill_timeperframe(struct usb3hdcap *hdcap, struct v4l2_fract *tf)
+{
+	/*
+	 * using the frame rate here even for interlaced, spec isn't super
+	 * clear on what to do, but adv7180.c does it this way
+	 */
+
+	if (hdcap->input == INPUT_COMPONENT || hdcap->input == INPUT_HDMI) {
+		const struct v4l2_bt_timings *bt = &hdcap->timings.bt;
+		u32 htotal = V4L2_DV_BT_FRAME_WIDTH(bt);
+		u32 vtotal = V4L2_DV_BT_FRAME_HEIGHT(bt);
+
+		tf->numerator = htotal * vtotal;
+		tf->denominator = (u32)bt->pixelclock;
+		v4l2_simplify_fraction(&tf->numerator, &tf->denominator, 8, 333);
+	} else if (hdcap->std & V4L2_STD_625_50) {
+		tf->numerator = 1;
+		tf->denominator = 25;
+	} else {
+		tf->numerator = 1001;
+		tf->denominator = 30000;
+	}
+}
+
+static int usb3hdcap_g_parm(struct file *file, void *priv,
+			    struct v4l2_streamparm *sp)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (sp->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	sp->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	fill_timeperframe(hdcap, &sp->parm.capture.timeperframe);
+	sp->parm.capture.readbuffers = 4;
+	return 0;
+}
+
+static int usb3hdcap_s_parm(struct file *file, void *priv,
+			    struct v4l2_streamparm *sp)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (sp->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	/* fixed framerate - just report what we have */
+	sp->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
+	fill_timeperframe(hdcap, &sp->parm.capture.timeperframe);
+	sp->parm.capture.readbuffers = 4;
+	return 0;
+}
+
+static int usb3hdcap_enum_frameintervals(struct file *file, void *priv,
+					 struct v4l2_frmivalenum *fival)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	if (fival->index > 0)
+		return -EINVAL;
+	if (fival->pixel_format != V4L2_PIX_FMT_YUYV)
+		return -EINVAL;
+	if (fival->width != hdcap->width || fival->height != hdcap->height)
+		return -EINVAL;
+
+	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
+	fill_timeperframe(hdcap, &fival->discrete);
+	return 0;
+}
+
+static int usb3hdcap_log_status(struct file *file, void *priv)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+
+	dev_info(hdcap->dev,
+		 "status: iso_cbs=%u iso_bytes=%lu markers=%u frames=%u ",
+		 hdcap->iso_cb_count, hdcap->iso_bytes,
+		 hdcap->markers_found, hdcap->frames_delivered);
+	dev_info(hdcap->dev,
+		 "parse_len=%d frame_line=%d synced=%d was_blanking=%d ",
+		 hdcap->parse_len, hdcap->frame_line,
+		 hdcap->synced, hdcap->was_blanking);
+	dev_info(hdcap->dev, "cur_buf=%p\n", hdcap->cur_buf);
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops usb3hdcap_ioctl_ops = {
+	.vidioc_querycap = usb3hdcap_querycap,
+	.vidioc_enum_input = usb3hdcap_enum_input,
+	.vidioc_enum_fmt_vid_cap = usb3hdcap_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap = usb3hdcap_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = usb3hdcap_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = usb3hdcap_fmt_vid_cap,
+	.vidioc_g_std = usb3hdcap_g_std,
+	.vidioc_s_std = usb3hdcap_s_std,
+	.vidioc_querystd = usb3hdcap_querystd,
+	.vidioc_g_dv_timings = usb3hdcap_g_dv_timings,
+	.vidioc_s_dv_timings = usb3hdcap_s_dv_timings,
+	.vidioc_enum_dv_timings = usb3hdcap_enum_dv_timings,
+	.vidioc_dv_timings_cap = usb3hdcap_dv_timings_cap,
+	.vidioc_query_dv_timings = usb3hdcap_query_dv_timings,
+	.vidioc_g_input = usb3hdcap_g_input,
+	.vidioc_s_input = usb3hdcap_s_input,
+	.vidioc_g_parm = usb3hdcap_g_parm,
+	.vidioc_s_parm = usb3hdcap_s_parm,
+	.vidioc_enum_framesizes = usb3hdcap_enum_framesizes,
+	.vidioc_enum_frameintervals = usb3hdcap_enum_frameintervals,
+	.vidioc_log_status = usb3hdcap_log_status,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static int usb3hdcap_open(struct file *file)
+{
+	struct usb3hdcap *hdcap = video_drvdata(file);
+	int ret;
+
+	if (mutex_lock_interruptible(&hdcap->lock))
+		return -ERESTARTSYS;
+
+	if (!hdcap->usb_dev) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
+	ret = v4l2_fh_open(file);
+	if (ret < 0)
+		goto unlock;
+
+	/* For applications that never call S_INPUT... */
+	if (v4l2_fh_is_singular_file(file) && !hdcap->hw_inited)
+		usb3hdcap_init_input(hdcap);
+
+unlock:
+	mutex_unlock(&hdcap->lock);
+	return ret;
+}
+
+static const struct v4l2_file_operations usb3hdcap_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+	.open = usb3hdcap_open,
+	.release = vb2_fop_release,
+	.read = vb2_fop_read,
+	.poll = vb2_fop_poll,
+};
+
+static void usb3hdcap_notify(struct v4l2_subdev *sd, unsigned int notification,
+			     void *arg)
+{
+	struct usb3hdcap *hdcap = container_of(sd->v4l2_dev,
+		struct usb3hdcap, v4l2_dev);
+
+	switch (notification) {
+	case MST3367_HOTPLUG:
+		usb3hdcap_hdmi_hotplug(hdcap, *(bool *)arg);
+		break;
+	default:
+		break;
+	}
+}
+
+static void usb3hdcap_release(struct v4l2_device *v4l2_dev)
+{
+	struct usb3hdcap *hdcap = container_of(v4l2_dev,
+		struct usb3hdcap, v4l2_dev);
+
+	v4l2_ctrl_handler_free(&hdcap->ctrl);
+	v4l2_device_unregister(&hdcap->v4l2_dev);
+	i2c_del_adapter(&hdcap->i2c_adap);
+	kfree(hdcap);
+}
+
+static int video_init(struct usb3hdcap *hdcap)
+{
+	int ret;
+
+	mutex_init(&hdcap->lock);
+	mutex_init(&hdcap->mcu_lock);
+	spin_lock_init(&hdcap->buflock);
+	INIT_LIST_HEAD(&hdcap->bufs);
+
+	hdcap->vb2q.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	hdcap->vb2q.io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
+	hdcap->vb2q.drv_priv = hdcap;
+	hdcap->vb2q.buf_struct_size = sizeof(struct hdcap_buf);
+	hdcap->vb2q.ops = &usb3hdcap_vb2_ops;
+	hdcap->vb2q.mem_ops = &vb2_vmalloc_memops;
+	hdcap->vb2q.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	hdcap->vb2q.min_queued_buffers = 2;
+	hdcap->vb2q.lock = &hdcap->lock;
+	ret = vb2_queue_init(&hdcap->vb2q);
+	if (ret < 0) {
+		dev_warn(hdcap->dev, "Could not initialize videobuf2 queue\n");
+		return ret;
+	}
+
+	/* 5 controls inherited from tw9900.c */
+	v4l2_ctrl_handler_init(&hdcap->ctrl, 5);
+	ret = hdcap->ctrl.error;
+	if (ret < 0) {
+		dev_warn(hdcap->dev, "Could not initialize controls\n");
+		goto v4l2_fail;
+	}
+
+	hdcap->v4l2_dev.ctrl_handler = &hdcap->ctrl;
+	hdcap->v4l2_dev.release = usb3hdcap_release;
+	hdcap->v4l2_dev.notify = usb3hdcap_notify;
+	ret = v4l2_device_register(hdcap->dev, &hdcap->v4l2_dev);
+	if (ret < 0) {
+		dev_warn(hdcap->dev, "Could not register v4l2 device\n");
+		goto v4l2_fail;
+	}
+
+	usb3hdcap_device_init(hdcap);
+
+	ret = usb3hdcap_i2c_register(hdcap);
+	if (ret < 0) {
+		dev_warn(hdcap->dev, "Could not register I2C adapter\n");
+		goto vdev_fail;
+	}
+
+	ret = usb3hdcap_composite_register(hdcap);
+	if (ret < 0)
+		goto subdev_fail;
+
+	ret = usb3hdcap_hdmi_register(hdcap);
+	if (ret < 0)
+		goto subdev_fail;
+
+	strscpy(hdcap->video_dev.name, "usb3hdcap", sizeof(hdcap->video_dev.name));
+	hdcap->video_dev.v4l2_dev = &hdcap->v4l2_dev;
+	hdcap->video_dev.release = video_device_release_empty;
+	hdcap->video_dev.fops = &usb3hdcap_fops;
+	hdcap->video_dev.ioctl_ops = &usb3hdcap_ioctl_ops;
+	hdcap->video_dev.tvnorms = USB3HDCAP_V4L2_STDS;
+	hdcap->video_dev.queue = &hdcap->vb2q;
+	hdcap->video_dev.lock = &hdcap->lock;
+	hdcap->video_dev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_READWRITE |
+				  V4L2_CAP_STREAMING;
+	video_set_drvdata(&hdcap->video_dev, hdcap);
+	ret = video_register_device(&hdcap->video_dev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_warn(hdcap->dev, "Could not register video device\n");
+		goto subdev_fail;
+	}
+
+	dev_info(hdcap->dev, "%s: registered as %s\n",
+		 __func__, video_device_node_name(&hdcap->video_dev));
+
+	return 0;
+
+subdev_fail:
+	v4l2_device_unregister(&hdcap->v4l2_dev);
+	i2c_del_adapter(&hdcap->i2c_adap);
+	goto v4l2_fail;
+
+vdev_fail:
+	v4l2_device_unregister(&hdcap->v4l2_dev);
+
+v4l2_fail:
+	v4l2_ctrl_handler_free(&hdcap->ctrl);
+	return ret;
+}
+
+static int usb3hdcap_probe(struct usb_interface *intf,
+			   const struct usb_device_id *id)
+{
+	struct device *dev;
+	struct usb3hdcap *hdcap;
+	int ret, is_xcapture;
+
+	/* not using the interrupt interface, just data */
+	if (intf->cur_altsetting->desc.bInterfaceNumber != 0)
+		return -ENODEV;
+
+	/* none, Mult=0 for SD, Mult=1 for HD */
+	if (intf->num_altsetting != 3)
+		return -ENODEV;
+
+	dev = &intf->dev;
+
+	hdcap = kzalloc_obj(*hdcap, GFP_KERNEL);
+	if (!hdcap)
+		return -ENOMEM;
+
+	hdcap->dev = dev;
+	hdcap->usb_dev = usb_get_dev(interface_to_usbdev(intf));
+	hdcap->input = INPUT_COMPOSITE;
+	hdcap->std = V4L2_STD_NTSC;
+	hdcap->width = SD_WIDTH;
+	hdcap->height = NTSC_HEIGHT / 2;
+	hdcap->bpl = DEFAULT_BPL;
+
+	usb_set_intfdata(intf, hdcap);
+
+	ret = video_init(hdcap);
+	if (ret < 0)
+		goto video_fail;
+
+	ret = usb3hdcap_audio_init(hdcap);
+	if (ret < 0)
+		dev_warn(dev, "audio init failed: %d (continuing without audio)\n", ret);
+
+	is_xcapture = le16_to_cpu(hdcap->usb_dev->descriptor.idProduct) == XCAPTURE1_PID;
+	dev_info(dev, "%s USB 3.0 HD Video Capture Device",
+		 is_xcapture ? "Micomsoft XCAPTURE-1" : "StarTech USB3HDCAP");
+
+	return 0;
+
+video_fail:
+	usb_set_intfdata(intf, NULL);
+	usb_put_dev(hdcap->usb_dev);
+	kfree(hdcap);
+	return ret;
+}
+
+static void usb3hdcap_disconnect(struct usb_interface *intf)
+{
+	struct usb3hdcap *hdcap = usb_get_intfdata(intf);
+
+	usb_set_intfdata(intf, NULL);
+
+	if (!hdcap)
+		return;
+
+	vb2_video_unregister_device(&hdcap->video_dev);
+	usb3hdcap_audio_free(hdcap);
+	v4l2_device_disconnect(&hdcap->v4l2_dev);
+
+	mutex_lock(&hdcap->lock);
+	i2c_lock_bus(&hdcap->i2c_adap, I2C_LOCK_ROOT_ADAPTER);
+	usb_put_dev(hdcap->usb_dev);
+	hdcap->usb_dev = NULL;
+	i2c_unlock_bus(&hdcap->i2c_adap, I2C_LOCK_ROOT_ADAPTER);
+	mutex_unlock(&hdcap->lock);
+
+	/* hdcap is freed by usb3hdcap_release when last user closes fd */
+	v4l2_device_put(&hdcap->v4l2_dev);
+}
+
+static const struct usb_device_id usb3hdcap_id_table[] = {
+	{ USB_DEVICE(USB3HDCAP_VID, USB3HDCAP_PID) },
+	{ USB_DEVICE(USB3HDCAP_VID, XCAPTURE1_PID) },
+	{ },
+};
+MODULE_DEVICE_TABLE(usb, usb3hdcap_id_table);
+
+MODULE_AUTHOR("Matthew Laux <matthew.laux@gmail.com>");
+MODULE_DESCRIPTION("StarTech USB3HDCAP Driver");
+MODULE_LICENSE("GPL");
+
+static struct usb_driver usb3hdcap_usb_driver = {
+	.name = "usb3hdcap",
+	.id_table = usb3hdcap_id_table,
+	.probe = usb3hdcap_probe,
+	.disconnect = usb3hdcap_disconnect,
+};
+module_usb_driver(usb3hdcap_usb_driver);
diff --git a/drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c b/drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c
new file mode 100644
index 000000000000..8f7ea642cb12
--- /dev/null
+++ b/drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB3HDCAP MST3367 support: HDMI and component
+ */
+
+#include <linux/kernel.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/usb.h>
+#include <linux/v4l2-dv-timings.h>
+#include <media/i2c/mst3367.h>
+#include <media/v4l2-dv-timings.h>
+
+#include "usb3hdcap.h"
+
+static struct i2c_board_info mst3367_info = {
+	I2C_BOARD_INFO("mst3367", ADDR_MST3367 >> 1),
+};
+
+int usb3hdcap_hdmi_register(struct usb3hdcap *hdcap)
+{
+	hdcap->sd_mst3367 = v4l2_i2c_new_subdev_board(&hdcap->v4l2_dev,
+						      &hdcap->i2c_adap,
+						      &mst3367_info, NULL);
+	if (!hdcap->sd_mst3367) {
+		dev_warn(hdcap->dev, "Could not register MST3367\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+void usb3hdcap_hdmi_hotplug(struct usb3hdcap *hdcap, bool hotplug)
+{
+	if (!hdcap->has_mcu)
+		return;
+
+	if (hotplug)
+		u3hc_i2c_rmw(hdcap, ADDR_CPLD, 0x01, 0xfd, 0x01);
+	else
+		u3hc_i2c_rmw(hdcap, ADDR_CPLD, 0x01, 0xff, 0x03);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x11, 0xfc);
+}
+
+static void cpld_init(struct usb3hdcap *hdcap, u8 mux_val)
+{
+	int k, status;
+
+	/*
+	 * cVar3 = i2c_read(param_1,0x98,0x3b,0);
+	 * if (cVar3 != '\0') {
+	 *   uVar5 = *(uint *)(param_1 + 0x6840);
+	 *   if ((uVar5 == 2) || (uVar5 == 3)) {
+	 *     local_res8[0] = -0x80;
+	 *     i2c_write(param_1,0x98,0x3b,local_res8,1);
+	 *     uVar5 = *(uint *)(param_1 + 0x6840);
+	 *   }
+	 *   if (uVar5 < 2) {
+	 *     local_res8[0] = '\x02';
+	 *     i2c_write(param_1,0x98,0x3b,local_res8,1);
+	 *   }
+	 * }
+	 */
+
+	if (u3hc_i2c_read(hdcap, ADDR_CPLD, 0x3b) != 0)
+		u3hc_i2c_write(hdcap, ADDR_CPLD, 0x3b, mux_val);
+
+	/*
+	 * local_res8[0] = '\x05';
+	 * i2c_write(param_1,0x98,0x20,local_res8,1);
+	 * cVar3 = FUN_140226fc4(param_1);
+	 * local_res8[0] = '\x01';
+	 * i2c_write(param_1,0x98,0,local_res8,1);
+	 * local_res8[0] = (-(cVar3 != '\0') & 0xfeU) - 2;
+	 * i2c_write(param_1,0x98,0x10,local_res8,1);
+	 */
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x05);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x00, 0x01);
+
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x10, hdcap->has_mcu ? 0xfc : 0xfe);
+
+	for (k = 0; k < 50; k++) {
+		status = u3hc_i2c_read(hdcap, ADDR_CPLD, 0x01);
+		if (status >= 0x03)
+			break;
+		msleep(20);
+	}
+
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x01, hdcap->has_mcu ? 0x03 : 0x02);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x11, 0xfc);
+}
+
+/* Make timings the current timings and derive the capture format from them */
+int usb3hdcap_hd_set_timings(struct usb3hdcap *hdcap,
+			     struct v4l2_dv_timings *timings)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = MST3367_PAD_SOURCE,
+	};
+	int ret;
+
+	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, s_dv_timings, 0, timings);
+	if (ret < 0)
+		return ret;
+
+	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, get_fmt, NULL, &fmt);
+	if (ret < 0)
+		return ret;
+
+	hdcap->mst_bt601 = fmt.format.colorspace == V4L2_COLORSPACE_SMPTE170M;
+
+	hdcap->timings = *timings;
+	hdcap->width = timings->bt.width;
+	hdcap->interlaced = timings->bt.interlaced;
+	hdcap->height = timings->bt.interlaced
+		? timings->bt.height / 2 : timings->bt.height;
+	hdcap->bpl = hdcap->width * 2;
+
+	return 0;
+}
+
+/* Start out with what is connected, default to 720p60 if no signal */
+static void usb3hdcap_hd_detect(struct usb3hdcap *hdcap,
+				struct v4l2_dv_timings *timings)
+{
+	static const struct v4l2_dv_timings def = V4L2_DV_BT_CEA_1280X720P60;
+	int ret;
+
+	ret = v4l2_subdev_call(hdcap->sd_mst3367, pad, query_dv_timings, 0,
+			       timings);
+	hdcap->no_signal = ret < 0;
+	if (hdcap->no_signal) {
+		dev_dbg(hdcap->dev, "no timings detected (%d)\n", ret);
+		*timings = def;
+	}
+
+	dev_dbg(hdcap->dev, "%dx%d%s\n", timings->bt.width, timings->bt.height,
+		timings->bt.interlaced ? "i" : "p");
+}
+
+/* ------------------------------------------------------------------ */
+/* Main HDMI init entry point                                         */
+/* ------------------------------------------------------------------ */
+
+int usb3hdcap_hdmi_init(struct usb3hdcap *hdcap)
+{
+	struct v4l2_dv_timings timings;
+	int ret;
+
+	/* CPLD init with HDMI input mux */
+	cpld_init(hdcap, 0x02);
+
+	ret = v4l2_subdev_call(hdcap->sd_mst3367, video, s_routing,
+			       MST3367_INPUT_HDMI, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	usb3hdcap_hd_detect(hdcap, &timings);
+
+	return usb3hdcap_hd_set_timings(hdcap, &timings);
+}
+
+/* ------------------------------------------------------------------ */
+/* Main component init entry point                                    */
+/* ------------------------------------------------------------------ */
+
+int usb3hdcap_component_init(struct usb3hdcap *hdcap)
+{
+	struct v4l2_dv_timings timings;
+	int ret;
+
+	/* CPLD init with component input mux */
+	cpld_init(hdcap, 0x80);
+
+	ret = v4l2_subdev_call(hdcap->sd_mst3367, video, s_routing,
+			       MST3367_INPUT_COMPONENT, 0, 0);
+	if (ret < 0)
+		return ret;
+
+	/* Component CPLD routing, bit 4 = component input? */
+	u3hc_i2c_read(hdcap, ADDR_CPLD, 0x20);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x15);
+
+	/*
+	 * Wait for ADC to stabilize, windows driver does this but might be able
+	 * to decrease wait
+	 */
+	msleep(1000);
+
+	/* Final CPLD verify */
+	u3hc_i2c_read(hdcap, ADDR_CPLD, 0x20);
+	u3hc_i2c_write(hdcap, ADDR_CPLD, 0x20, 0x15);
+
+	usb3hdcap_hd_detect(hdcap, &timings);
+
+	u3hc_i2c_rmw(hdcap, ADDR_CPLD, 0x00, 0xff, 0x02);
+
+	return usb3hdcap_hd_set_timings(hdcap, &timings);
+}
diff --git a/drivers/media/usb/usb3hdcap/usb3hdcap-video.c b/drivers/media/usb/usb3hdcap/usb3hdcap-video.c
new file mode 100644
index 000000000000..3a861db36d6c
--- /dev/null
+++ b/drivers/media/usb/usb3hdcap/usb3hdcap-video.c
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * USB3HDCAP video streaming - stream parser, ISO URB handling, vb2 ops
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+#include <media/v4l2-ctrls.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "usb3hdcap.h"
+
+/* ------------------------------------------------------------------ */
+/* Stream parser                                                      */
+/* ------------------------------------------------------------------ */
+
+static void vyuy_to_yuyv(u8 *dst, const u8 *src, int len)
+{
+	int k;
+
+	/* VYUY: V Y0 U Y1 -> YUYV: Y0 U Y1 V */
+	for (k = 0; k < len; k += 4) {
+		dst[k + 0] = src[k + 1]; /* Y0 */
+		dst[k + 1] = src[k + 2]; /* U */
+		dst[k + 2] = src[k + 3]; /* Y1 */
+		dst[k + 3] = src[k + 0]; /* V */
+	}
+}
+
+static struct hdcap_buf *get_next_buf(struct usb3hdcap *hdcap)
+{
+	struct hdcap_buf *buf = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&hdcap->buflock, flags);
+	if (!list_empty(&hdcap->bufs)) {
+		buf = list_first_entry(&hdcap->bufs, struct hdcap_buf, list);
+		list_del(&buf->list);
+	}
+	spin_unlock_irqrestore(&hdcap->buflock, flags);
+
+	return buf;
+}
+
+static void deliver_frame(struct usb3hdcap *hdcap)
+{
+	struct hdcap_buf *buf = hdcap->cur_buf;
+	u8 *vaddr;
+	int k;
+
+	if (!buf)
+		return;
+
+	hdcap->frames_delivered++;
+
+	/* Pad remaining lines with black */
+	vaddr = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+	while (hdcap->frame_line < hdcap->height) {
+		u8 *row = vaddr + hdcap->frame_line * hdcap->bpl;
+
+		for (k = 0; k < hdcap->bpl; k += 4) {
+			row[k + 0] = 0x10;
+			row[k + 1] = 0x80;
+			row[k + 2] = 0x10;
+			row[k + 3] = 0x80;
+		}
+		hdcap->frame_line++;
+	}
+
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0,
+			      hdcap->bpl * hdcap->height);
+	buf->vb.vb2_buf.timestamp = ktime_get_ns();
+	if (hdcap->interlaced) {
+		bool bottom = hdcap->field_f;
+
+		if (!bottom && hdcap->top_done)
+			hdcap->sequence++;
+		buf->vb.field = bottom ? V4L2_FIELD_BOTTOM : V4L2_FIELD_TOP;
+		buf->vb.sequence = hdcap->sequence;
+		hdcap->top_done = !bottom;
+		if (bottom)
+			hdcap->sequence++;
+	} else {
+		buf->vb.field = V4L2_FIELD_NONE;
+		buf->vb.sequence = hdcap->sequence++;
+	}
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	hdcap->cur_buf = NULL;
+}
+
+/*
+ * Process one video line (shared between composite and HDMI).
+ * 'video' points to the XY byte followed by pixel data.
+ */
+static void process_video_line(struct usb3hdcap *hdcap, const u8 *video)
+{
+	u8 sav_xy = video[0];
+	int blanking = sav_xy & BT656_V_BIT;
+
+	/* Blanking -> active transition */
+	if (!blanking && hdcap->was_blanking) {
+		if (!hdcap->synced)
+			hdcap->synced = 1;
+		if (hdcap->cur_buf && hdcap->frame_line >= 100)
+			deliver_frame(hdcap);
+		hdcap->frame_line = 0;
+		if (!hdcap->cur_buf)
+			hdcap->cur_buf = get_next_buf(hdcap);
+		/* Dropping a field ends the frame */
+		if (!hdcap->cur_buf && hdcap->top_done) {
+			hdcap->top_done = 0;
+			hdcap->sequence++;
+		}
+	}
+	hdcap->was_blanking = blanking;
+
+	if (!hdcap->synced || !hdcap->cur_buf || blanking)
+		return;
+
+	/* Deliver when field is full */
+	if (hdcap->frame_line >= hdcap->height) {
+		deliver_frame(hdcap);
+		hdcap->frame_line = 0;
+		hdcap->cur_buf = get_next_buf(hdcap);
+		if (!hdcap->cur_buf)
+			return;
+	}
+
+	if (hdcap->frame_line == 0) {
+		hdcap->field_f = !!(sav_xy & BT656_F_BIT);
+		/* skip bottom field where the top was dropped */
+		if (hdcap->interlaced && hdcap->field_f && !hdcap->top_done)
+			return;
+	}
+
+	vyuy_to_yuyv(vb2_plane_vaddr(&hdcap->cur_buf->vb.vb2_buf, 0)
+			+ hdcap->frame_line * hdcap->bpl,
+		     video, hdcap->bpl);
+	hdcap->frame_line++;
+}
+
+static void process_data(struct usb3hdcap *hdcap)
+{
+	u8 *buf = hdcap->parse_buf;
+	int line_size = SAV_LEN + hdcap->bpl;
+	int pos = 0;
+
+	while (pos + 3 <= hdcap->parse_len) {
+		if (buf[pos] != 0xff || buf[pos + 1] != 0x00) {
+			pos++;
+			continue;
+		}
+
+		if (buf[pos + 2] == 0x00) {
+			/* SAV: video line */
+			if (pos + line_size > hdcap->parse_len)
+				break;
+			/* -1 because XY byte occupies the first pixel's V position */
+			process_video_line(hdcap, buf + pos + SAV_LEN - 1);
+			pos += line_size;
+		} else if (buf[pos + 2] == 0xff) {
+			u8 type;
+			int alen;
+
+			if (pos + MARKER_LEN > hdcap->parse_len)
+				break;
+			type = buf[pos + 3];
+			if (type < 0x02 || type > 0x04) {
+				pos++;
+				continue;
+			}
+			alen = type * 4;
+			if (pos + MARKER_LEN + alen > hdcap->parse_len)
+				break;
+			hdcap->markers_found++;
+			usb3hdcap_audio_data(hdcap, buf + pos + MARKER_LEN, alen);
+			pos += MARKER_LEN + alen;
+		} else {
+			pos++;
+		}
+	}
+
+	/* Shift unconsumed data to front */
+	if (pos > 0) {
+		hdcap->parse_len -= pos;
+		if (hdcap->parse_len > 0)
+			memmove(buf, buf + pos, hdcap->parse_len);
+	}
+}
+
+/* ------------------------------------------------------------------ */
+/* Isochronous URB handling                                           */
+/* ------------------------------------------------------------------ */
+
+static void usb3hdcap_iso_cb(struct urb *urb)
+{
+	struct usb3hdcap *hdcap = urb->context;
+	int k, ret;
+
+	switch (urb->status) {
+	case 0:
+		break;
+	case -ENODEV:
+	case -ENOENT:
+	case -ECONNRESET:
+	case -ESHUTDOWN:
+		return;
+	default:
+		dev_warn(hdcap->dev, "ISO URB status %d\n", urb->status);
+		goto resubmit;
+	}
+
+	hdcap->iso_cb_count++;
+
+	for (k = 0; k < urb->number_of_packets; k++) {
+		int status = urb->iso_frame_desc[k].status;
+		int len = urb->iso_frame_desc[k].actual_length;
+		u8 *data = urb->transfer_buffer +
+			   urb->iso_frame_desc[k].offset;
+
+		if (status != 0 || len == 0)
+			continue;
+
+		if (hdcap->parse_len + len > hdcap->parse_buf_size)
+			hdcap->parse_len = 0;
+
+		memcpy(hdcap->parse_buf + hdcap->parse_len, data, len);
+		hdcap->parse_len += len;
+		hdcap->iso_bytes += len;
+
+		process_data(hdcap);
+	}
+
+resubmit:
+	ret = usb_submit_urb(urb, GFP_ATOMIC);
+	/* endpoint going away when stopping is expected */
+	if (ret < 0 && ret != -ENOENT)
+		dev_warn(hdcap->dev, "ISO URB resubmit: %d\n", ret);
+}
+
+static struct urb *usb3hdcap_alloc_urb(struct usb3hdcap *hdcap, int npkts)
+{
+	struct urb *urb;
+	int size = hdcap->iso_size;
+	int k;
+
+	urb = usb_alloc_urb(npkts, GFP_KERNEL);
+	if (!urb)
+		return NULL;
+
+	urb->dev = hdcap->usb_dev;
+	urb->context = hdcap;
+	urb->pipe = usb_rcvisocpipe(hdcap->usb_dev, EP_VIDEO);
+	urb->interval = 1;
+	urb->transfer_flags = URB_ISO_ASAP;
+	/* __NOWARN because it retries with fewer packets */
+	urb->transfer_buffer = kcalloc(npkts, size, GFP_KERNEL | __GFP_NOWARN);
+	if (!urb->transfer_buffer) {
+		usb_free_urb(urb);
+		return NULL;
+	}
+	urb->complete = usb3hdcap_iso_cb;
+	urb->number_of_packets = npkts;
+	urb->transfer_buffer_length = size * npkts;
+	for (k = 0; k < npkts; k++) {
+		urb->iso_frame_desc[k].offset = size * k;
+		urb->iso_frame_desc[k].length = size;
+	}
+
+	return urb;
+}
+
+static void usb3hdcap_free_urbs(struct usb3hdcap *hdcap)
+{
+	int k;
+
+	for (k = 0; k < NUM_XFERS; k++) {
+		struct urb *urb = hdcap->isoc_urbs[k];
+
+		if (!urb)
+			continue;
+		usb_kill_urb(urb);
+		kfree(urb->transfer_buffer);
+		usb_free_urb(urb);
+		hdcap->isoc_urbs[k] = NULL;
+	}
+}
+
+static int usb3hdcap_alloc_urbs(struct usb3hdcap *hdcap)
+{
+	int npkts, k;
+
+	/* Retry allocations until one succeeds */
+	for (npkts = NUM_ISO_PKTS; npkts >= MIN_ISO_PKTS; npkts /= 2) {
+		for (k = 0; k < NUM_XFERS; k++) {
+			hdcap->isoc_urbs[k] = usb3hdcap_alloc_urb(hdcap, npkts);
+			if (!hdcap->isoc_urbs[k])
+				break;
+		}
+		if (k == NUM_XFERS)
+			return 0;
+		usb3hdcap_free_urbs(hdcap);
+	}
+
+	return -ENOMEM;
+}
+
+static void usb3hdcap_return_bufs(struct usb3hdcap *hdcap,
+				  enum vb2_buffer_state buf_state)
+{
+	unsigned long flags;
+
+	/* Return any in-progress buffer */
+	if (hdcap->cur_buf) {
+		vb2_buffer_done(&hdcap->cur_buf->vb.vb2_buf, buf_state);
+		hdcap->cur_buf = NULL;
+	}
+
+	spin_lock_irqsave(&hdcap->buflock, flags);
+	while (!list_empty(&hdcap->bufs)) {
+		struct hdcap_buf *buf = list_first_entry(&hdcap->bufs,
+						struct hdcap_buf, list);
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, buf_state);
+	}
+	spin_unlock_irqrestore(&hdcap->buflock, flags);
+}
+
+static void usb3hdcap_stop(struct usb3hdcap *hdcap,
+			   enum vb2_buffer_state buf_state)
+{
+	usb3hdcap_free_urbs(hdcap);
+	usb_set_interface(hdcap->usb_dev, 0, 0);
+
+	if (hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO)
+		v4l2_subdev_call(hdcap->sd_tw9900, video, s_stream, 0);
+
+	usb3hdcap_return_bufs(hdcap, buf_state);
+
+	kvfree(hdcap->parse_buf);
+	hdcap->parse_buf = NULL;
+}
+
+static int usb3hdcap_start(struct usb3hdcap *hdcap)
+{
+	struct usb_host_endpoint *ep;
+	int maxp, burst, mult;
+	int k, ret, alt;
+
+	if (!hdcap->hw_inited) {
+		/* the last attempt to set up the input failed */
+		ret = -EIO;
+		goto fail;
+	}
+
+	hdcap->parse_len = 0;
+	hdcap->frame_line = 0;
+	hdcap->synced = 0;
+	hdcap->was_blanking = 0;
+	hdcap->field_f = 0;
+	hdcap->top_done = 0;
+	hdcap->cur_buf = NULL;
+
+	if (hdcap->input == INPUT_COMPOSITE || hdcap->input == INPUT_SVIDEO) {
+		ret = v4l2_subdev_call(hdcap->sd_tw9900, video, s_stream, 1);
+		if (ret < 0)
+			goto fail;
+	}
+
+	/*
+	 * Select alt setting based on bandwidth:
+	 * alt 1: maxp=1024 burst=16 mult=1 -> 16KB/pkt (SD)
+	 * alt 2: maxp=1024 burst=16 mult=2 -> 32KB/pkt (HD)
+	 */
+	alt = (hdcap->width > 720 || hdcap->height > 576) ? 2 : 1;
+	dev_info(hdcap->dev, "%s: setting alt %d\n", __func__, alt);
+	ret = usb_set_interface(hdcap->usb_dev, 0, alt);
+
+	if (ret < 0) {
+		dev_err(hdcap->dev, "%s: usb_set_interface failed: %d\n",
+			__func__, ret);
+		goto fail;
+	}
+
+	/* Compute ISO packet size from SS endpoint companion descriptor */
+	ep = usb_pipe_endpoint(hdcap->usb_dev,
+			       usb_rcvisocpipe(hdcap->usb_dev, EP_VIDEO));
+	if (!ep || !usb_endpoint_xfer_isoc(&ep->desc)) {
+		dev_err(hdcap->dev, "ISO endpoint 0x%02x not found\n",
+			EP_VIDEO);
+		ret = -ENODEV;
+		goto fail;
+	}
+
+	maxp = usb_endpoint_maxp(&ep->desc);
+	burst = ep->ss_ep_comp.bMaxBurst;
+	mult = USB_SS_MULT(ep->ss_ep_comp.bmAttributes);
+	hdcap->iso_size = maxp * (burst + 1) * mult;
+
+	hdcap->parse_buf_size = hdcap->iso_size + SAV_LEN + hdcap->bpl;
+	hdcap->parse_buf = kvmalloc(hdcap->parse_buf_size, GFP_KERNEL);
+	if (!hdcap->parse_buf) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
+	ret = usb3hdcap_alloc_urbs(hdcap);
+	if (ret < 0)
+		goto fail;
+
+	for (k = 0; k < NUM_XFERS; k++) {
+		ret = usb_submit_urb(hdcap->isoc_urbs[k], GFP_KERNEL);
+		if (ret < 0)
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	usb3hdcap_stop(hdcap, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+/* ------------------------------------------------------------------ */
+/* vb2 ops                                                            */
+/* ------------------------------------------------------------------ */
+
+static int usb3hdcap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				 unsigned int *nplanes, unsigned int sizes[],
+	struct device *alloc_devs[])
+{
+	struct usb3hdcap *hdcap = vb2_get_drv_priv(vq);
+	unsigned int img_size = hdcap->bpl * hdcap->height;
+
+	if (*nplanes) {
+		dev_info(hdcap->dev, "queue_setup: recheck sizes[0]=%u vs %u\n",
+			 sizes[0], img_size);
+		return sizes[0] < img_size ? -EINVAL : 0;
+	}
+	*nplanes = 1;
+	sizes[0] = img_size;
+
+	return 0;
+}
+
+static int usb3hdcap_buf_prepare(struct vb2_buffer *vb)
+{
+	struct usb3hdcap *hdcap = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (vb2_plane_size(vb, 0) < hdcap->bpl * hdcap->height)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void usb3hdcap_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct usb3hdcap *hdcap = vb2_get_drv_priv(vb->vb2_queue);
+	struct hdcap_buf *buf = container_of(vbuf, struct hdcap_buf, vb);
+	unsigned long flags;
+
+	spin_lock_irqsave(&hdcap->buflock, flags);
+	list_add_tail(&buf->list, &hdcap->bufs);
+	spin_unlock_irqrestore(&hdcap->buflock, flags);
+}
+
+static int usb3hdcap_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct usb3hdcap *hdcap = vb2_get_drv_priv(vq);
+	int ret;
+
+	/* read() on fd that outlived the disconnect */
+	if (!hdcap->usb_dev) {
+		usb3hdcap_return_bufs(hdcap, VB2_BUF_STATE_QUEUED);
+		return -ENODEV;
+	}
+
+	hdcap->sequence = 0;
+	ret = usb3hdcap_start(hdcap);
+	return ret;
+}
+
+static void usb3hdcap_stop_streaming(struct vb2_queue *vq)
+{
+	struct usb3hdcap *hdcap = vb2_get_drv_priv(vq);
+
+	usb3hdcap_stop(hdcap, VB2_BUF_STATE_ERROR);
+}
+
+const struct vb2_ops usb3hdcap_vb2_ops = {
+	.queue_setup = usb3hdcap_queue_setup,
+	.buf_prepare = usb3hdcap_buf_prepare,
+	.buf_queue = usb3hdcap_buf_queue,
+	.start_streaming = usb3hdcap_start_streaming,
+	.stop_streaming = usb3hdcap_stop_streaming,
+};
diff --git a/drivers/media/usb/usb3hdcap/usb3hdcap.h b/drivers/media/usb/usb3hdcap/usb3hdcap.h
new file mode 100644
index 000000000000..b0679da8c6ba
--- /dev/null
+++ b/drivers/media/usb/usb3hdcap/usb3hdcap.h
@@ -0,0 +1,238 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef USB3HDCAP_H
+#define USB3HDCAP_H
+
+#include <linux/i2c.h>
+#include <linux/usb.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-ctrls.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+struct dentry;
+struct snd_card;
+struct snd_pcm_substream;
+
+#define USB3HDCAP_V4L2_STDS (V4L2_STD_NTSC | V4L2_STD_PAL)
+
+/* NTSC SD frame format */
+#define SD_WIDTH       720
+#define NTSC_HEIGHT    480
+/* YUYV = 4 bytes/2 pixels */
+#define DEFAULT_BPL    (SD_WIDTH * 2)
+/* PAL SD frame format */
+#define PAL_HEIGHT    576
+
+enum usb3hdcap_input {
+	INPUT_COMPOSITE = 0,
+	INPUT_SVIDEO    = 1,
+	INPUT_COMPONENT = 2,
+	INPUT_HDMI      = 3,
+};
+
+/* I2C 8-bit addresses */
+#define ADDR_MST3367 0x9c
+#define ADDR_TW9900  0x88
+#define ADDR_CS53L21 0x94
+#define ADDR_CPLD    0x98
+#define ADDR_MCU     0x64 /* Nuvoton NUC100 on XCAPTURE-1 */
+
+/* TW9900 registers */
+#define TW9900_CSTATUS    0x01
+#define TW9900_INFORM     0x02
+#define TW9900_OPFORM     0x03
+#define TW9900_OPCNTL_I   0x05
+#define TW9900_ACNTL_I    0x06
+#define TW9900_CROP_HI    0x07
+#define TW9900_VDELAY_LO  0x08
+#define TW9900_VACTIVE_LO 0x09
+#define TW9900_HDELAY_LO  0x0a
+#define TW9900_HACTIVE_LO 0x0b
+#define TW9900_CNTRL2     0x0d
+#define TW9900_SDT_NOISE  0x0e
+#define TW9900_LUMA_CTL   0x0f
+#define TW9900_BRIGHT     0x10
+#define TW9900_CONTRAST   0x11
+#define TW9900_SHARPNESS  0x12
+#define TW9900_SAT_U      0x13
+#define TW9900_SAT_V      0x14
+#define TW9900_HUE        0x15
+#define TW9900_VBICNTL    0x19
+#define TW9900_ACNTL_II   0x1a
+#define TW9900_OPCNTL_II  0x1b
+#define TW9900_SDT        0x1c
+#define TW9900_SDTR       0x1d
+#define TW9900_VCNTL1     0x28
+#define TW9900_VCNTL2     0x29
+#define TW9900_MISC1      0x2d
+#define TW9900_MISC2      0x2f
+#define TW9900_CSTATUS_II 0x31
+#define TW9900_ANAPLLCTL  0x4c
+#define TW9900_VVBI       0x55
+#define TW9900_HSBEGIN    0x6b
+#define TW9900_HSEND      0x6c
+#define TW9900_OVSDLY     0x6d
+#define TW9900_OVSEND     0x6e
+
+/* CS53L21 registers */
+#define CS53L21_MIC_PWR_CTL  0x03
+#define CS53L21_IFACE_CTL    0x04
+#define CS53L21_ADC_IN_SEL   0x07
+#define CS53L21_SPE_CTL      0x09
+#define CS53L21_ALC_PGAA     0x0a
+#define CS53L21_ALC_PGAB     0x0b
+#define CS53L21_ADCA_ATT     0x0c
+#define CS53L21_ADCB_ATT     0x0d
+#define CS53L21_ADCA_MIX_VOL 0x0e
+#define CS53L21_ADCB_MIX_VOL 0x0f
+#define CS53L21_CH_MIXER     0x18
+#define CS53L21_ALC_EN_ATK   0x1c
+
+#define USB3HDCAP_VID 0x1164
+#define USB3HDCAP_PID 0xf533
+#define XCAPTURE1_PID 0xf531
+
+/* Vendor request codes */
+#define REQ_I2C    0xc0
+#define REQ_GPIO   0xc1
+#define REQ_INIT   0xc2
+#define REQ_WATCH  0xc6
+#define REQ_UNK_C7 0xc7
+#define REQ_UNK_EC 0xec
+
+/* Isochronous transfer parameters */
+#define EP_VIDEO     0x83
+#define NUM_XFERS    8
+#define NUM_ISO_PKTS 64
+#define MIN_ISO_PKTS 8
+
+/*
+ * Stream framing:
+ *   SAV (ff 00 00 XY): bpl-1 pixel bytes, -1 because the XY is actually
+ *   in the first pixel's V position... weird but it's correct
+ *   Marker (ff 00 ff NN):  audio - NN = number of stereo s16le
+ *                          samples, audio data = NN * 4 bytes
+ */
+#define SAV_LEN        4
+#define MARKER_LEN     4
+
+/* BT.656 SAV XY bits */
+#define BT656_F_BIT 0x40
+#define BT656_V_BIT 0x20
+
+struct hdcap_buf {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+};
+
+struct usb3hdcap {
+	struct device *dev;
+	struct usb_device *usb_dev;
+	struct v4l2_device v4l2_dev;
+	struct video_device video_dev;
+	struct vb2_queue vb2q;
+
+	struct i2c_adapter i2c_adap;
+	struct v4l2_subdev *sd_tw9900;
+	struct v4l2_subdev *sd_mst3367;
+
+	struct v4l2_ctrl_handler ctrl;
+	struct v4l2_ctrl *ctrl_brightness;
+	struct v4l2_ctrl *ctrl_contrast;
+	struct v4l2_ctrl *ctrl_saturation;
+	struct v4l2_ctrl *ctrl_hue;
+	struct v4l2_ctrl *ctrl_sharpness;
+
+	/*
+	 * Serializes V4L2 ioctls, videobuf2 queue operations and device
+	 * state. Also taken on disconnect to clear usb_dev.
+	 */
+	struct mutex lock;
+	/* serializes write then read for XCAPTURE-1 */
+	struct mutex mcu_lock;
+
+	/* buffer list */
+	spinlock_t buflock;
+	struct list_head bufs;
+
+	/* ISO URBs */
+	int iso_size;
+	struct urb *isoc_urbs[NUM_XFERS];
+
+	/* frame tracking */
+	unsigned int sequence;
+
+	enum usb3hdcap_input input;
+	/* current standard, composite and S-Video only */
+	v4l2_std_id std;
+	/* current timings, component and HDMI only */
+	struct v4l2_dv_timings timings;
+	bool no_signal;
+	int width;
+	int height;
+	int interlaced;
+	int bpl; /* width * 2 */
+
+	/* stream parser state */
+	u8 *parse_buf;
+	int parse_buf_size;
+	int parse_len;
+	struct hdcap_buf *cur_buf;
+	int frame_line;
+	int synced;
+	int was_blanking;
+	/* BT.656 F bit of the field being captured */
+	u8 field_f;
+	u8 top_done;
+
+	/* hardware init state */
+	int hw_inited;
+	int has_mcu; /* Nuvoton MCU present (XCAPTURE-1) */
+
+	/* MST3367 state */
+	int mst_current_bank;
+	bool mst_bt601;
+
+	/* ALSA audio */
+	struct snd_card *snd;
+	struct snd_pcm_substream *snd_substream;
+	atomic_t snd_stream;
+	size_t snd_buffer_pos;
+	size_t snd_period_pos;
+
+	/* diagnostics */
+	unsigned int iso_cb_count;
+	unsigned long iso_bytes;
+	unsigned int markers_found;
+	unsigned int frames_delivered;
+};
+
+/* USB control helpers (usb3hdcap-core.c) */
+int u3hc_i2c_write(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 val);
+int u3hc_i2c_read(struct usb3hdcap *hdcap, u8 addr, u8 reg);
+int u3hc_i2c_rmw(struct usb3hdcap *hdcap, u8 addr, u8 reg, u8 mask, u8 bits);
+
+/* Composite (usb3hdcap-composite.c) */
+int usb3hdcap_composite_register(struct usb3hdcap *hdcap);
+int usb3hdcap_composite_init(struct usb3hdcap *hdcap);
+int usb3hdcap_composite_querystd(struct usb3hdcap *hdcap, v4l2_std_id *std);
+int usb3hdcap_composite_set_std(struct usb3hdcap *hdcap, v4l2_std_id std);
+
+/* HDMI + Component (usb3hdcap-hdmi.c) */
+int usb3hdcap_hdmi_register(struct usb3hdcap *hdcap);
+int usb3hdcap_hdmi_init(struct usb3hdcap *hdcap);
+int usb3hdcap_component_init(struct usb3hdcap *hdcap);
+int usb3hdcap_hd_set_timings(struct usb3hdcap *hdcap,
+			     struct v4l2_dv_timings *timings);
+void usb3hdcap_hdmi_hotplug(struct usb3hdcap *hdcap, bool hotplug);
+
+/* Video/streaming (usb3hdcap-video.c) */
+extern const struct vb2_ops usb3hdcap_vb2_ops;
+
+/* Audio (usb3hdcap-audio.c) */
+int usb3hdcap_cs53l21_init(struct usb3hdcap *hdcap);
+int usb3hdcap_audio_init(struct usb3hdcap *hdcap);
+void usb3hdcap_audio_free(struct usb3hdcap *hdcap);
+void usb3hdcap_audio_data(struct usb3hdcap *hdcap, const u8 *data, int len);
+
+#endif
-- 
2.47.3

