Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604904;
	b=Zajt8ep3KsWk6iOeYtJ500hhQVoHtwr8PPCaqQN0ECqEUEIkx5KKQAPYOk/d5P2FstJq
	 xC2qsaS2dCSFUm/9CJ1czt65EdG3loT62YMti8pBBqgQlcQvzNNJT4jE/U4EtwVLQTCVv
	 5Kpn7fRirg6K/K9ZRn9Xr2e3AWc+WdMBWVF8qKrbO4X+o35Gbil/PZ1DT0A/hl6UZBiiU
	 FvBBAYxyjIqZXdL1HCUcPzYjOhfJzl0xqJfmhDsafEgFWam1x7Om4lnJazevlh773clXr
	 X+nQQOS0a/GBqgDY60kYjqXhlCpU32L6/OImz3Gxo102Vlla6R8aPsO4dxTNlsIBhuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
	b=NIr5FJ4syq505R2wHG3COymME47M+tOJp5RfEhgzBjOZXKPYAMzmx6kG9GbehubHvkNG
	 lMi+nE54xD/gG79Uq85p7AngAIFocWGF6RvP4n/acoRnBchgC+Y6kiJO9tX/Au5Y+qt+n
	 YovzENaYU9liI8K3vZBl2xfEuBMWyyuwLohGi4UnehBC8UnDown1gVP+hS51JGg/5Tr15
	 vvMl0CgGsBZq7eETpZIRBRAfIuH0r7L9Bz6Hf4m4eFLZVsPKJjvvu7S9MK9MuBOZr4m/Y
	 7khKLtRm1UEnz/7KeGvjXSZX9x+urDcmQbdTn+wmHFcjY5ECr2upb2kar2h5QQgv7lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiinHlSZ;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAEB606A33C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AAEB606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiinHlSZ
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so7035847a12.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604903; x=1796209703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
        b=fiinHlSZ4d5n4rtusOLKpKA07IaP8NmNIFpIRUj8t7HuqheUUlByO7nqIWPntp0r+E
         1ZpuiitbvDscUgOjtxsZQcWVuBYSCosRBBJUrZR0Uuz6vgcr/V1jW/77sq3hTniMk4nC
         NBSxkCCDBtkczMdkpJZeCRAFIm4rgQS0ld9c6+QBpgL9m+dSzQWLmSyacyP5TVYsX57b
         6LVST4FiTxHCtjs85cojinGlIaxEZpcyj19cqEiemxobp/zGGA2928l6rdmKT1kCQSzz
         ZtZc+DgZFBIifyGg3PYWbagWs++3PaqRCdccoWHvUbkn+D5zUy6oy1I3bnz+yV1y+feh
         jTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604903; x=1796209703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
        b=HnCiyLJ8zW0k4Zr36jpXAEFtUsXCzbkyuHyCxhKkAcv9d5HAGEsyEqi/iS878qX9OH
         ZFRUrYpseED8V77tpGlq/3lhvInM3nHPQ9IV6uSLCnfXDddGHPWP6SlADhJuPI4oLYAx
         TTo+zNzm3i/MSpp/FP5LjS8/acZMZt1/2ZTBqHGLLS/xeoSxBJZFfLOn/ACOBwDUKlsT
         X4yPmUfgSW/zZwXmSJpCce8SX3f64Myf6ZuFyokOuXqztQJaxCMTW+7eo8fH3ay9d7Li
         HsaxlPDMUu54oOQBHpx3kBF1eTwBFVjsx+fQM9ChXGkW882tseJpq5gc8FijW7HBs9aB
         bfIg==
X-Forwarded-Encrypted: i=1; AL+hErF1O0ghTU+N0GrYCi35JInHaP/SyU93dNlYHbXIrA/ufx0pRryzF3kY/TCrnzZW9ceS4BDpA6wkvQvKfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+PT3LRZ/aH3Tci1vvINBDhUF3THKL5vNPvqrwOlFTRSsaoGqb5
	gsKJP73MckFoY0Xa0/LJPziNgDV30OHAVfqW+WOSlZdSGwhYk1NuvbYb
X-Gm-Gg: AZFdTZc8E7Q/AAXBuaJc2aNXFEICBj7jD99QdkuzhJuIlJ9HuqQuWRMQTQv6bfeNE2X
	w7lePv36b1FeSbwaL2rzcRfhBUcW7KQ8AjsogcGi4bSU9w0LQKRZ2tHZ5UODUddexBoFnnkMDcq
	1AzcVUJDs/a+HYp+vlaIPI/0HZJoqvIlp6S4kRUGPfRKQjMT7ftT3lai7jB7OoforW8jB73A437
	XTwfayXytv6xdz9EOz1v3hhvaEMHgPB1cCPWUZIlY8XSGbNsMieiiA2/Rn3TJFqJCOv0nL0r4EF
	GcaPGZZxJgGrHzF5XkQ/Xff0/y09/HglokyNe/TC93stAPw5o/Svb4f22D6sHlbPkQuls53TmIu
	9gjX5WS36KsaJ2Kk4EcoFAVjoXqR50mI8kf8jED4OnJ/NvPPfldhygXXt/fiL9WWHVBHBppm8d4
	PRt8Pj6YkQPJGMqEIeqUB2A83BLMuft7v2TVoTao4AxPqOiv3WHV4DFAKO/JfC66NIz664Lyqhb
	UXTkP8xRs9S+gNrhKkqWhLy1ba8D+qkX5hMpTdI3jNcYj2Rekep2WYwqaHwuO4bcwPpR3ojxB86
	KyKPQ1sBCDf9664ahNmOjvo7kV1xAKNpCkkETf6qH5pHNaSvSMyyY/iqYIjBA/6u/HsDCvGvGgU
	YFOqWYsS7N9Q=
X-Received: by 2002:a17:906:4fc4:b0:c51:24a3:208 with SMTP id a640c23a62f3a-c513a5da66bmr1367694366b.9.1795604902648;
        Wed, 25 Nov 2026 03:08:22 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 02/13] media: tegra-video: vi: Drop controls consolidation into VI device
Date: Wed, 25 Nov 2026 13:07:39 +0200
Message-ID: <20261125110750.223628-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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

Like any video-centric video input pipeline, Tegra VI combines all
controls from linked devices into a /dev/video*. This behavior is no
longer desired, since it causes conflicts when controls are duplicated and
does not allow including controls from auxiliary devices such as a VCM or
flash LEDs. Remove consolidation of all devices in the pipe into the VI
device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 24 ++-----------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index fa6114f4b9c8b..71921931457be 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -960,9 +960,6 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return chan->ctrl_handler.error;
 	}
 #else
-	struct v4l2_subdev *subdev;
-	struct v4l2_ctrl *hflip, *vflip;
-
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
 	if (chan->ctrl_handler.error) {
@@ -973,27 +970,10 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return chan->ctrl_handler.error;
 	}
 
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!subdev)
-		return -ENODEV;
-
-	ret = v4l2_ctrl_add_handler(&chan->ctrl_handler, subdev->ctrl_handler,
-				    NULL, true);
-	if (ret < 0) {
-		dev_err(chan->vi->dev,
-			"failed to add subdev %s ctrl handler: %d\n",
-			subdev->name, ret);
-		v4l2_ctrl_handler_free(&chan->ctrl_handler);
-		return ret;
-	}
-
-	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
-	if (chan->vi->soc->has_h_v_flip && !hflip)
+	if (chan->vi->soc->has_h_v_flip) {
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-
-	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
-	if (chan->vi->soc->has_h_v_flip && !vflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
 #endif
 
 	/* setup the controls */
-- 
2.53.0

