Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851926;
	b=3rCWfRcHVJmrdxUmK54/2anwE0ionJK4ZuipDyeiRDHEyswk1zNQUPZGtaDJEP5aywwP
	 MRkwK2HWkwgmtHb+1/Lu45OTcNKeJ+I5Bz2NQuY+fdYfYU9mfUaQeviftuJMbA+Z+Q0T1
	 veq0JKomDO6fySFq2sHVsNMzP4sf9Q84dR0DeBZ9R135BWymF7rbz86rlY0HSHkWa+l55
	 f8qF3D9jgyXv1cF2qOlyyQGhxvM7j8peCnHYOJz4iMLMGl3VdWYLOr58Qwp/DLoQv9yJ4
	 6zbHfpRhTr52xjemU8GFR4Vphd5TvpDcNNdelz6LGnYSFo5CBh0Fog2Ng2NmBg34KFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g6TQmkuyMCXzib2c99Z9MWfPdjMzOohKSTeFZiXInjw=;
	b=Hu6YTjr4ywdod/WOsxzgLNQhHC95zacGovhp1mVSDPc6m1e3S4ozsZiMi0gg81h2YsjD
	 +naEgUrWETFDA4DSUzuHn4ywQv2QSzT4WSehq2ETzSbAPdZ16niuHQAIf10LSZU8hHTGG
	 NSIghLvOPKF1nC0rT25/CTd8j5OGYl67R88fxP38+ANv6PJ/MvudgGsye5/g4+64GJWqg
	 tUo/bQoeJkwpPk4tMW5tAKq9D2ACRcRXdtEBZKkgPqnQCGmMy1h/B+vlgY2Uim5ftYkly
	 5tSMj0AmWs61IWczlEZrajSATAhLSAllmJYM94YvqGfTfCAwh665ckU0nROjJxru5vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCpb4BZa;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CA9606A88E
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6CA9606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DCpb4BZa
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso69381f8f.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851923; x=1795456723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6TQmkuyMCXzib2c99Z9MWfPdjMzOohKSTeFZiXInjw=;
        b=DCpb4BZa/voEzzZmHniSsTUU+Ycm8NQQ+HfPkgCO1F+GuXvZLp8y1d+9vlOc9Te+Pd
         9frQ3hOecIr1z/cHJsd1peJA+Ehp8+wMn3K5dDTnU4PUDPsnizoCXph2Tqte3qLR6oKp
         RyGvrwWdhOF2mYptdNRePnVltnpCvxe0/nllIkI3SbptJus0Qamns+TG7aZj6IJcmLwU
         6l8qH69ZLrsV0x2+Uc3c++6qxvL3J26yu/hwiPy/r/UQlXS7NqAAGtwYVNVCkQSgAkg9
         5hL2CRVlWQAMnoYTdw36mJjyzYLzJJOHmVPMWFOXAbFsKWs+Cv5QE2L0m0a5KH6Pdry9
         W5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851923; x=1795456723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6TQmkuyMCXzib2c99Z9MWfPdjMzOohKSTeFZiXInjw=;
        b=lmCQKH4ywrq5+2gQIZvFPjFsWqnApq0uQSVMQw9PjvqgQveH3nI6gvYnacmeLa2dN+
         0fGTz9tjFzI2I8FSsU9BV+HyvKy7Oem0ZtTS3cQGCHwsoeeRyZ595O4YEPIWWb1Ccwhw
         s5pwRrMWB0I+QTX3SwoRTD8jE3DIMTMzQXI6UXVs81//0/HJRA/5/oZfTEc3sF3r02+l
         mNMlJx+uvDfyXB3e/k4AoTUgE3Le1lbMPy00su0hBAhd4NFX+j87Hbbz2+U0H9YXNbJA
         oUsc1ObmKRxPmGB0uuSnv+z72GuOAC/EbknKLQoZAggoIPzYwsoTjP68cwEI+h4hWCyL
         vTKw==
X-Forwarded-Encrypted: i=1; AL+hErEi8KGW5Bxl2FviTWOy/2n2IyKp63zR3JEtoFAYCzBYAOfhJmO959+jaQ7ldaAfZtoTytz3YvxpH7J9Sg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9GMxvNpmdxrK3mTJMCXUDu7X3H84of58xBkiLPl8qqHng2udIy
	5vcGXAQeNqsuzZqghzpYZv5XfNjLUcfEFMR5ILlbPSBsq891bW9xUtAj
X-Gm-Gg: AZFdTZdX3mkNyn+snGfrgg7S+0VVJ3L1zeDpsctdfnf6oXkoIMSjbgArBM97TbH2EQa
	0q7G3Boz5b9OB8C9niLy19MrbpYFwDlSqHp2evAjjAc7v/5t+ujpHmDSFhuqkNxzsRHfudXwXZl
	bF0q1HwAKhC3iWYm1i08q6to7ZOIbqD6yuxIKyB9hGU7+vonzJ+qG7efoFLlsbHIF/OkINZpEDB
	4QCGaJ3is37mmJ3cJZAwp5WqKXUxq2Mfm9mZGD8BKBboRT4S6Sx5zr0Mg6LmMMtVYV4IUVMFrKh
	GO/3M9qthRWE58Y004+O7SH7W+EzUkpeOZOJS1s2bQFUriV7uCH0NNrNxc+NPY+ZCLjfU37Ifjj
	XSVQQFCG/k9qzYpOWGuabUp6RdZiU6XpRL/djcCHoYi7a6IyxYV4av58Eg1oUD01noqxj/7LETF
	cHwDs5PTosnsaI48Z0iF+aSl0SbuGTlCaCf7u5mrjMxxQcOKbugeShqSRQyRp/wwQ2geUUGpA2l
	xyhbJubSYQ+mcFMiN2SK3UXS3+7OTdzSREZPQ6pah5onPv1wtwIGch1QNXBVVxZF6LErqPOCbNd
	ZpuQ5nS2fs8AOFw28035RpXxyxe45WMCs79hKSSySgdIzQ==
X-Received: by 2002:adf:e18a:0:b0:491:d721:548f with SMTP id ffacd0b85a97d-4a3735b4463mr501445f8f.12.1794851923193;
        Mon, 16 Nov 2026 09:58:43 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm24171374f8f.3.2026.11.16.09.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:58:42 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 2/2] media: atomisp: Report frame interval for sensors without enum_frame_interval
Date: Mon, 16 Nov 2026 17:57:50 +0000
Message-ID: <20261116175750.21905-3-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175750.21905-1-volodymyrchapman@gmail.com>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com>
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

atomisp_enum_frameintervals() passes VIDIOC_ENUM_FRAMEINTERVALS on to the
sensor's enum_frame_interval pad op. Most sensor drivers used with atomisp
do not implement it, e.g. the OV2722 driver only implements
get_frame_interval and raw sensor drivers such as the IMX175 driver set
their frame rate with the pixel rate and blanking controls instead. For
these sensors VIDIOC_ENUM_FRAMEINTERVALS fails, so userspace does not know
the frame rate.

PipeWire's V4L2 source then advertises a framerate range of 1/1 to 120/1.
Firefox (libwebrtc) takes the minimum of such a range as the camera's
maximum framerate and drops all but 1 frame per second, while the sensor
runs at 30 fps.

When the sensor has no enum_frame_interval, report one discrete frame
interval: the sensor's get_frame_interval if it has that, or else the one
following from its V4L2_CID_PIXEL_RATE, V4L2_CID_HBLANK and V4L2_CID_VBLANK
controls and active format, rounded to a whole number of frames per
second. This is the interval of the sensor's current mode, which is
reported for every frame size; for the OV2722 and IMX175 all modes run at
30 fps.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795) with this file built out
of tree against a 7.2.15 kernel: ENUM_FRAMEINTERVALS reports 30 fps for
both the OV2722 front sensor (from get_frame_interval) and the IMX175 rear
sensor (256 MHz / (3430 * 2500)), and webcamtests.com in Firefox 160 shows
about 30 fps for both instead of 1 fps. This was build-tested on top of
media.git next.

The problem was investigated and this patch drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 046a95857..c83834405 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -576,6 +576,65 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
+/*
+ * For sensors without enum_frame_interval, get the frame interval of the
+ * sensor's current mode: from get_frame_interval, or else from the pixel rate
+ * and blanking controls which raw sensor drivers use to set the frame rate.
+ */
+static int atomisp_sensor_frame_interval(struct atomisp_input_subdev *input,
+					 struct v4l2_fract *interval)
+{
+	struct v4l2_subdev_frame_interval fi = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_ctrl *pixel_rate, *hblank, *vblank;
+	struct v4l2_subdev_state *act_sd_state;
+	u64 frame_size, fps;
+	int ret;
+
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
+	ret = v4l2_subdev_call(input->sensor, pad, get_frame_interval,
+			       act_sd_state, &fi);
+	if (ret != -ENOIOCTLCMD) {
+		if (act_sd_state)
+			v4l2_subdev_unlock_state(act_sd_state);
+		if (ret)
+			return ret;
+		if (!fi.interval.numerator || !fi.interval.denominator)
+			return -EINVAL;
+		*interval = fi.interval;
+		return 0;
+	}
+
+	ret = v4l2_subdev_call(input->sensor, pad, get_fmt, act_sd_state, &fmt);
+	if (act_sd_state)
+		v4l2_subdev_unlock_state(act_sd_state);
+	if (ret)
+		return ret;
+
+	pixel_rate = v4l2_ctrl_find(input->sensor->ctrl_handler,
+				    V4L2_CID_PIXEL_RATE);
+	hblank = v4l2_ctrl_find(input->sensor->ctrl_handler, V4L2_CID_HBLANK);
+	vblank = v4l2_ctrl_find(input->sensor->ctrl_handler, V4L2_CID_VBLANK);
+	if (!pixel_rate || !hblank || !vblank)
+		return -EINVAL;
+
+	frame_size = (u64)(fmt.format.width + v4l2_ctrl_g_ctrl(hblank)) *
+		     (fmt.format.height + v4l2_ctrl_g_ctrl(vblank));
+	fps = div64_u64(v4l2_ctrl_g_ctrl_int64(pixel_rate) + frame_size / 2,
+			frame_size);
+	if (!fps)
+		return -EINVAL;
+
+	interval->numerator = 1;
+	interval->denominator = fps;
+
+	return 0;
+}
+
 static int atomisp_enum_frameintervals(struct file *file, void *priv,
 				       struct v4l2_frmivalenum *fival)
 {
@@ -601,6 +660,11 @@ static int atomisp_enum_frameintervals(struct file *file, void *priv,
 			       act_sd_state, &fie);
 	if (act_sd_state)
 		v4l2_subdev_unlock_state(act_sd_state);
+	if (ret == -ENOIOCTLCMD) {
+		if (fival->index)
+			return -EINVAL;
+		ret = atomisp_sensor_frame_interval(input, &fie.interval);
+	}
 	if (ret)
 		return ret;
 
-- 
2.43.0

