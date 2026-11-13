Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586728;
	b=Oh16Hbjgr5q5dnQwkJiD5JCujJDEcVR/8Jd7Xx+kTQgJn87JFHw9VXro2T32xYQNLctK
	 odI+/M2PJ3rPoNm7fZge73RcIkK3EVHIBD0vpvvE4cVYtVJWC4rlMB1SfOMbE1Gn+OUo+
	 qOIsrKs0MvNbHTlyPILb1smgUrzC4PoHrYRFf8/4r8j8TvzTOGjMFpn7X7o8Vt4NNkdL3
	 bS4rsrcysgqUzgLxPv/qwM9bc24fd3eSrh//IFC9d/DUdWHXFzNB8sz5GK8CJctszIRfe
	 m0AxZ6bztrYBwj/8TBwOG55rhqQOmiFgkALGZPPMQwT6IKqoS2vemQcGOFQrQ8FLL8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=XtCH8WwTweMS9Ucgtu2uo1F4H13X1qJECuCGrC2rDzw=;
	b=tL6ix5UbPHI1biUPmxAacbtBTq2KD4J+R0qTBe2NThXsdwOOSecGDlv8O5Zp3njddcK+
	 PMVz47uaUhKnBz7QhnsZesAtXci+PthkN8AE40FkqnWUh41Cl4pT+KnZDQjczNsTul+P6
	 yoG9nksGoi/5JlH83ob5P5mfg/Ltvziwe0ySvZlPxnklBJiy6UcnlCtQOSORG5wmuqgqB
	 hhe2ua6e1wzpqYftg/FqAS8FcuyUP+x9dWbssg2ZH2itpBlTgxWTMlkJvALTi739YYsJW
	 ieGPyfA5TD76g6td2unvV1qDDo5WKLv/lRardxaHE+TEbSgDg5BQqYLZJ7MXn0rSOiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jWnEvbWn;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3469606C548
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 16:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3469606C548
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jWnEvbWn
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso32968266b.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586726; x=1795191526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtCH8WwTweMS9Ucgtu2uo1F4H13X1qJECuCGrC2rDzw=;
        b=jWnEvbWnqdes1k4uVtYm9anQvd0GymwXS/jdATf6Dz32TZ4gY5OguidECMAlvFmwZh
         Ue4j900NKT2Yo/x5y4yxTP5xtwO19hDyCqvhSTSFR/bQtihTSwcuOq3HE3s9AVey93SS
         BsiHqIIiPFeM1hRiSmjoEarRYCdxhk62aENkvxw7kq6bUNECcvCdy3pThJqG+MiaoZji
         Dc4YiXEhbJqfycIduPCYwqJUqaYi+olOgk4ESNKM5F9AeA/PjjWNNJsqfsE5ACI+9OQC
         XG1mOom210rF4qx2W1OpuT3kIXpC7IcPMR5oTHveE2Im95Z9Ii4GyfonkR791/vWq77V
         sg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586726; x=1795191526;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtCH8WwTweMS9Ucgtu2uo1F4H13X1qJECuCGrC2rDzw=;
        b=QXwI3h09yV3F/6gopmuAM1vf+rNX57FEMBj28V1dtf6gP11Z6PRoBpt0IYvWnC/qty
         EoJS37QZkgiPCoD7U2R+Zu8PeLLV+xOjSRsan1lhmYoZhTV/FW+eRng+/jSvT6IFGJ7N
         fPO3xdM/j3Yaiohn1UZc8d03HgD0asp6umZytttRmSNaYZV3Q6Yybj5d1HdKWkwH9Iot
         C9gjla3AFmQFhIZ+VE89MjWTZt1JkN0EFUuRwfhEpDmWdvM+lv7k7O6ZogvLbXWWv6ZQ
         FQRRwjezZe1nc9tEcQAg26Unjqjw5ReLjq51hqjslJvcLk5224s4pNW1uoy7FyyuC1xc
         WL9A==
X-Gm-Message-State: APuU4Z8W9aMcaysNn+lL/JhDS5jk/bd0HmlCRDcdTbm7wIzlE8GPpxSz
	iG8rHD0sOJ20Aykd1pzweZG6q5Ysjtra4dGMSUFXk2iYsWbAqJrQ4d8t
X-Gm-Gg: AYBFou2Heh6U39HDmhuvoD5xPTI6Utm02UVGJexMcFY/2qj6M+Htji0zoAZMXcxxO+j
	+0o0db8iAtsHdxfG/ujrMHfje1/q8/8DTyn+8DZCWEROvSCe9Cn9OXVwp7gttWOXNafsexDyzEp
	Fm+yMx7rQXv5dr3/Pc7wgR4rGdsJWLWnU9wA0prdvE3VmvEoLHqb/I0KEP/M6RVTSDPeO+fG5CP
	dQ7AAd2Rhn6I7lLLIU1AhIVqQ9ayvGwES/5QlnjlOi+xmhaaOs2xTVwGYQTT51We5/URV3kbyAM
	BLcnxntJTgbq7PxAoe+1XkLsEfmNn2lkg9kpIakn7dYPOspI+nNBnOzp8/eQWNzhD481I6+OPid
	dRU8fZWvUDdxUaaLEYAydZeYZbAxKupIaQsA3jwiWEvxNccD/ae45n+n1lzW9yUmYukZHqbiCqx
	iwqggFZpIPBZsCKQOQQFAuuxo7iY39WPXGXHzaX4YXJMTEnTSSo3i99hRG0mxH46r3vgvIGmerZ
	WmOPFtAUtkqS2gxGA/eRqoZu1ATEmsvS2HTwRjp2O39DMFs2ZhEg1n2X8nR65kTlau0yqu4nnVs
	u9h7V6AbJx2e4UrL6BGRLzxMGuOOYh/t0QW7bXjvrGw3VALvWFXky0E8oYuXfdXfbIg1gPeVrFr
	CTT5Y5vNqrQ==
X-Received: by 2002:a17:906:4795:b0:c42:2f4e:522a with SMTP id a640c23a62f3a-c509636a806mr256654266b.25.1794586726178;
        Fri, 13 Nov 2026 08:18:46 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:45 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 03/10] media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC descriptions
Date: Fri, 13 Nov 2026 18:18:12 +0200
Message-ID: <20261113161819.36847-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Further investigation shows that the current maximum VI clock rate is too
high for Tegra20 and is better suited for Tegra30. The correct clock
frequency for Tegra20 should be 150 MHz, as it was set prior to the
addition of Tegra30 VI support — a value backed up by the current Tegra20
peripheral OPP table. Tegra30 supports up to 470 MHz for the VI clock,
but this rate is available only on higher-end Tegra30 SoC variants. The
highest clock rate supported across all SoC variants is 300 MHz.

Diverge the Tegra20 and Tegra30 VI SoC descriptions to account for maximum VI
clock limits, setting 150 MHz for Tegra20 and 300 MHz for Tegra30.
Additionally, remove the APB_MISC workaround for Tegra30, as it is Tegra20
specific.

Fixes: 071fa83ded5e ("staging: media: tegra-video: tegra20: increase maximum VI clock frequency")
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../platform/nvidia/tegra-video/tegra20.c     | 22 ++++++++++++++++++-
 .../media/platform/nvidia/tegra-video/vi.c    |  5 ++++-
 .../media/platform/nvidia/tegra-video/vi.h    |  5 ++++-
 .../media/platform/nvidia/tegra-video/video.c |  3 ++-
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
index cdadff98eae75..f27ecb1ba29a7 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -809,6 +809,15 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
+static const struct tegra_vi_ops tegra30_vi_ops = {
+	.channel_host1x_syncpt_init = tegra20_channel_host1x_syncpt_init,
+	.channel_host1x_syncpt_free = tegra20_channel_host1x_syncpt_free,
+	.vi_fmt_align = tegra20_fmt_align,
+	.channel_queue_setup = tegra20_channel_queue_setup,
+	.vi_start_streaming = tegra20_vi_start_streaming,
+	.vi_stop_streaming = tegra20_vi_stop_streaming,
+};
+
 #define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
 {									\
 	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
@@ -852,7 +861,18 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 450000000,
+	.vi_max_clk_hz = 150000000,
+	.has_h_v_flip = true,
+};
+
+const struct tegra_vi_soc tegra30_vi_soc = {
+	.video_formats = tegra20_video_formats,
+	.nformats = ARRAY_SIZE(tegra20_video_formats),
+	.default_video_format = &tegra20_video_formats[0],
+	.ops = &tegra30_vi_ops,
+	.hw_revision = 1,
+	.vi_max_channels = 2,
+	.vi_max_clk_hz = 300000000,
 	.has_h_v_flip = true,
 };
 
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index d8c77d1290efd..12eaa89304e84 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1935,9 +1935,12 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vi",  .data = &tegra30_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index 46328e488aa38..ff5c9deed4c88 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -292,9 +292,12 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+extern const struct tegra_vi_soc tegra30_vi_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_vi_soc tegra210_vi_soc;
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
index 2e84385708bac..d483fb709d127 100644
--- a/drivers/media/platform/nvidia/tegra-video/video.c
+++ b/drivers/media/platform/nvidia/tegra-video/video.c
@@ -123,13 +123,14 @@ static void host1x_video_remove(struct host1x_device *dev)
 static const struct of_device_id host1x_video_subdevs[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
-	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-csi", },
+	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra30-csi", },
+	{ .compatible = "nvidia,tegra30-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
-- 
2.53.0

