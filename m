Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604909;
	b=4XGGdj1gh0/+L4+JkPoPvHX+HhvSoft/4qzBAUNUU2W6+zysb3uIsFLVxH4GgpIjHXnd
	 7L/4iKKIGYTXMeuSOfgdmLoPUKlCa5VZ+1VuvCEvQJUXGExm8WMxwnG3IU3t9D5t+E2Zj
	 8oyhKCCQMwT2Dm7ZQDuMMDnRi20ZPOlAhcTTRNQZtvULA6+dUGgXAdf5bjg/rwNZFPtmZ
	 25+e710aNZwR67to3juwuginBx/18ApztKUUa791xSPqy8wOen+WljoI/EeIEHZTQNFAF
	 eWODeeVYY/cBL8YNLCdNvP3VcPs9P/zDIcXGDSng7Y2xkQb/rqW8WOGVAqYKT9Qp7Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
	b=Et5TDlD+TbOtPA0UC34sVAdOGkkG5EPfkMcFVycOcUWUIEM2Lkl1iE+TLNdoXiHKqLfT
	 IYlXFFRBKLcCqsThZfaSc4ABMeqDmGXHhE52N7Mxek9iCmc+ylwBUGJrMjhYW9MdWrFcG
	 nSc47zbTEchwO/bh4sVrWHnWjU02W9ctSirZYToee4ywPKfsBPaKWMa90utJjoFnqXepH
	 qgi9rhOuU7kTECzmR3857QvJypD87RwG4Po8Cp9Aa3CdfU4mbM/r4F3uC2vXuNyH+suLA
	 ogPt3cZW2Kaqb44Q4Br8NjiJs2JfpXZM9bAmdA3Tu0qfWNY7nQw+aJmQEQXTt1fDlUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHz5TOqV;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B6606A33C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3B6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHz5TOqV
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c51373ae637so49283966b.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604907; x=1796209707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
        b=CHz5TOqVYPuX2mfZeJtdw9oCoXrqneAWxSeSJv9oYAuXBhwKY3Zw/rVi1CYbwu2u/Y
         z1nx+NS3szCEfEjP+f3PnnoyTj0jDh1RStWaSSEpjF82/BjaaHXy5b0vFXoA4jP0Tpwp
         KAF47GK5DtIW5bJYEosSqbPo3pDu6G0rgK83lbrhbBH8YKUrc5clfLF1o5OXMRlUVnfI
         rdFB4GabdnYOrP9R1L555kAr1OwUTw6sUlqu1si3LJ7GFc0V8tErRUjsbatbw2SW02wK
         NDhSfnLmeNkmJ+Lu9y1AMne99AtJQUiFaP62WXWG6azy6n4eR+qrFtWCtzHZAoH0BjqB
         ZB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604907; x=1796209707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbeBc8Xjd8EXP+769RalNkVenzdVJuq6UafMvhubpeQ=;
        b=OjsgOKlOQ5Vm4jcIY/cNaA6J7TgI9n1acbQFPNbIcKC05V5J7kYyOxfacSRROkzO3V
         b3cLSpHOaD1I36CbAH3p2s+pddx/qRFKyJ2+tueNPxXkli/QLslhJTuR2GIX3AOM8auQ
         uKMcN0t+Xw7SOUiPxsEeSBnrejXgoK0QGLbo2+6ulZ0XWkHO2tgcTJevKJKej9mJrD7W
         muxoCz7hEXxzTtgKzXdh9y8VIE7FzAysIpl/fVqpGn267xAWKiCviaEQ2kdzskkhBVBs
         1w0RldKip2lrFHHG480W7jJYi1iGbeGldwRMSvTCQycFSol252d/NTiVSpF2Pk1/6+ja
         y3Rw==
X-Forwarded-Encrypted: i=1; AL+hErGJLgGWHNAOoBzeEVGmRDGjg9HmYBJ0tKMW/eY/lKUwU515V6CSyvZ0OMq2aDKiTLDjC9SAczfzxnYoHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z95qh+AImraTFLvqh0uyEjIavGTNZpArlMgpwQkXuicQDSmJiA5
	xQGIsGHrxe+HQFqfj5Yg8Bdmk/0hu1znj3SJB3YmUgG4G+116wTlbgI1
X-Gm-Gg: AZFdTZeh2TRA06OTVm7YN3uglbyHzgWOVei6215lGk6WGkO/ph3E300kWuqEAnToaiu
	BVtFmBUWtMXBAcPTDgfBCyopRrCHy1Cunkj5h8sGNhFpoM/PxirTHXud++B8UIQ7O0kts+BWOtK
	rDkRdrP7RbjoibwRVCiXGggdTloy5tSRMhkIPzJv9SPZ2eYPdSeztrmCPMBrIHzHAUixtMaq82h
	GJfdhUZ8/YyN5RVnQshvf428Cut3LHOEaGj2bm2jZZrQugiPqkU6UtXHyKJpDHPRF0ENO7ZHgXy
	+x11nozlFeC11rb17lgPyw8bMRVfd++4LHG6CBwkRwbgurmFZfiz6QJY6hiqx8EitqPkWTAKXXE
	j4Gpn8mfb6g+O7t+A9up0nhs847TvyY5wth6WoXhJ6dzQr7rRaa6rfuTG/JsYQwm7cM0lX0F0kI
	R0HIE6Hs2Tg3BYsbESWimBhJdTM36a436LjNCeDkXr6t0VlICmXa7ZeJOeV6TEyUjvsxKBBq/kN
	8w1jRZL54ijwR59FdEXa05vHEc410SeDHvSLH61I3DWKrzxRdLae19nsLyQjPR2Ln1EcASjEogN
	npbiSSHYcjXr4Kr4GLHiyqAQJB+UibHKTd9M1lU80MuAsVXfhqC+ywfQ3ix8Yle2/oZgQPZSRYS
	B4vmgQr0Zlw==
X-Received: by 2002:a17:906:115a:b0:c1f:983f:d8a with SMTP id a640c23a62f3a-c513a89ec1emr1095743666b.24.1795604907065;
        Wed, 25 Nov 2026 03:08:27 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:26 -0800 (PST)
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
Subject: [PATCH v1 05/13] media: tegra-video: vi: Implement link_validate for video entity
Date: Wed, 25 Nov 2026 13:07:42 +0200
Message-ID: <20261125110750.223628-6-clamor95@gmail.com>
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

Add tegra_channel_link_validate() and attach it via
tegra_channel_media_ops to chan->video.entity.ops to verify that the
remote subdevice pad's active format (dimensions and media bus code)
matches the channel's configured format during media pipeline validation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 376f53f44b90d..5b38bae648686 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -558,6 +558,46 @@ static int tegra_channel_log_status(struct file *file, void *fh)
 	return 0;
 }
 
+static int tegra_channel_link_validate(struct media_link *link)
+{
+	struct video_device *video =
+		media_entity_to_video_device(link->sink->entity);
+	struct v4l2_subdev *subdev =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	struct tegra_vi_channel *chan = video_get_drvdata(video);
+	const struct tegra_video_format *fmtinfo;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index,
+	};
+	int ret;
+
+	fmtinfo = tegra_get_format_by_fourcc(chan->vi, chan->format.pixelformat);
+
+	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
+	if (ret)
+		return ret;
+
+	if (fmt.format.height != chan->format.height ||
+	    fmt.format.width != chan->format.width ||
+	    fmt.format.code != fmtinfo->code) {
+		dev_dbg(chan->vi->dev,
+			"link '%s':%u -> '%s':%u not valid: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			fmt.format.code, fmt.format.width, fmt.format.height,
+			fmtinfo->code, chan->format.width,
+			chan->format.height);
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations tegra_channel_media_ops = {
+	.link_validate = tegra_channel_link_validate,
+};
+
 static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_querycap		= tegra_channel_querycap,
 	.vidioc_enum_framesizes		= tegra_channel_enum_framesizes,
@@ -836,6 +876,7 @@ static int tegra_channel_init(struct tegra_vi_channel *chan)
 		 dev_name(vi->dev), "output", chan->portnos[0]);
 	chan->video.vfl_type = VFL_TYPE_VIDEO;
 	chan->video.vfl_dir = VFL_DIR_RX;
+	chan->video.entity.ops = &tegra_channel_media_ops;
 	chan->video.ioctl_ops = &tegra_channel_ioctl_ops;
 	chan->video.ctrl_handler = &chan->ctrl_handler;
 	chan->video.lock = &chan->video_lock;
-- 
2.53.0

