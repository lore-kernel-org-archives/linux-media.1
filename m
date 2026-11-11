Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367623;
	b=N+7itXUfzMWaNPXE3n1VS5/uGvP1FjfJYSQsu46KfQZT5CpHyNMwbyPiMphno/S6I+5n
	 erOB4h6IdHwJLiMvNINPEDAk1k2URkRvAmjNEF5qoVrJQXQgZkdoSbqh4sXc/IO3Bs7Rx
	 dJC12AnHIkPGiJouXUA5YtWWdNzNPi8qsKYRcDtZTKsNeP9PiQcPQjiXZ8RK0+xTEFQMo
	 OuhBnbkH7/B/GmWbYTpKaoDTQTmjBwUzBY7lDJlCOFsY1Sl3NE7u0N8Ugcp3U4miVTKA7
	 g5Kx3zaqf3N0qYpsUaoPQDFkKO02CdQ0LKEfNtlgdgZA7zrQE6QQxatHTBYDOhzvDQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QP9+Ctp3NviXfDVXP2gE2ILUUDfgBim84aqNH/sgLwY=;
	b=gy4wID+gdQdjPPX3M4RBB0HJxgnJMEt6IkkP1qD9yzlZQB85RbbaUsWDUObHqJ+Jc/7f
	 sgVhHIp+vAUpcep5M3dzOVuJTdvuX/qznSlprXvO5AB+WF1e5L8NIEswoF8FYDZiTFFec
	 ugVwR5E/sNVFEZxepcxt3JndRUu101EFWAlYIpHQjmonX3WLAn9uB0HERgg0fZ0Ss5guf
	 W8JHcpg5NJf6DJ6TdaU2hMP3308qQDTRBJmBVoxqIobb9FqQaN6lFKOSIrivN+97j0kdP
	 R1V9O2yEcedUehXN4zy0VJngF1zohu4VedK3y5Izzb7fK0LJuUpa0qoOSXsEx1Bgyww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drMtwf+m;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64459606A31C
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 03:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64459606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drMtwf+m
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3704d30b84fso3512562eec.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 19:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794367622; x=1794972422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QP9+Ctp3NviXfDVXP2gE2ILUUDfgBim84aqNH/sgLwY=;
        b=drMtwf+m1+TCoaArpSMFE+ivILjRcW1xOEKThdlbgJn+jW6tmYXM6ESSXNnUC7kyI6
         Pnp2tEMVcinXZsDXOFZjXb9p0LAtTfEEakcHaOQXaJp5Qu86o3y/QOmCv46eolZIkO6R
         fiFGJkpAocQRzieorgMBUgJkCKIvGnNMifPhTIQO8PVDrVzA31mNZh173bkQ7E8ytjad
         1547enDvgfylM8STbfTy1kiwoo1Xy+HSR3RzNTa9/B30AhHPFHQk9TJD39PJDLnONw0y
         sEtIy8IySjstTlZP6LtgoU0UAa8m1q+GdLeZHKCFhgB5lvGE61telG5FithNRP4a80MV
         LTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367622; x=1794972422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QP9+Ctp3NviXfDVXP2gE2ILUUDfgBim84aqNH/sgLwY=;
        b=sgRVqRTOqEfC35p4aBaahPl+ddHour20L5/EiVBjvZ3sXYXvAsqA59tU1Ev78py/JG
         lbH0wUM2QifNP2xMLN3YTM6lHhb1TqhtRpY+5LUNJMtDRG5jRypRqSyGFnq/WuEtVPO7
         k2Dcf+VXx2HD3C0qJMJYHg8kKm6W1ZvlZnzNX5palQyEEU4F9a7NvRJaSoampdpesQjx
         4o8dUGfUGzNH1qDy8HHoIhW0YkbfH/2Fsy/96tfGLzHt6qrEq15II+p9Zd+QBTEdeCxH
         AZ+u8cGt39alk9hAxRdJqThDslKkETMXwhtHlURuICwFVWLjsocmldhCFWLm/z7AznSM
         pr3Q==
X-Forwarded-Encrypted: i=1; AL+hErH5UilEmszZMuY1SDlaKnpvfd2lepK5HcKV9ZsrIznXmpI4VFWAYutgay4h+QqAEoQQh4Cc6pDCa7rltA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q5+T0/AfpUv5VE3qpt2J7+7330avGZdxMduxyNaubRQz5nXIt
	lnnj0nwl8asrh0u853oU+ueYVOanjwQvgV/vHNoyoK4i4vJHGTQTgyCRy1rZTDUd
X-Gm-Gg: AYBFou0HYntd4j7SNccdOIVRXaHWVPRw7XiVlf48RvZfptHW4Jdmu4O9RMZE3lYM0xA
	epDzaDuG1n0FiZzLm3XZ/50nH8SUMoF5tnthSrbOUB6iRv3Mv3HYf0xmFxwwOCPSFLVMkF/56pv
	Gf0FqXDMzTbmIhW8pdkkZng/NOsJD09TxIe5lAKopdBgaASyRNY5PEoJOrc/klAV7hLCc3rbEYR
	KMuY4HzZu1klBg5oJ+Pph2Tbf7Rki6ue3hNNkiBgsoLaGNtuT+JxXAa+UWtEqLA1GmSrqB4dYpA
	tu44cjColyg4F9qLTyVtSAzeAlZWNt/+f1PGZLGYOK3Br8RZqgUy2Jjb5wnk6GiUb19BklUDgrn
	8prv0kHNNW/JmXj4tYUJW4Jxoduoh0u7XsX+hfogBsRYGgWG0dEQRN4+VAT5t+Xfow7GBwye3Bh
	oCfYAArf93qqkM7hG4XEkm5nnRgvusIrCsZbv7RSRRWloiKRw1WTQqNZ1shsRQZH9ze+ICpCi38
	YBkHINjd01uplmy7V2upaFdeJ2Abaj+aBK/3r0XDQXhzFw3GheO4a9hF6cOAuc28jKFbFc3YPmq
	W57AxbpjWJ7xk57flF53hIZSJu8TUsP7aWc/87QtSj66D2Tm9rq8SPJ1zBMX
X-Received: by 2002:a05:7300:51c3:b0:36e:d060:8bad with SMTP id 5a478bee46e88-3768385dc4fmr1982303eec.5.1794367622326;
        Tue, 10 Nov 2026 19:27:02 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:521b:36dc:be93:10f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm10567569eec.12.2026.11.10.19.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:27:01 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	david.laight.linux@gmail.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH v2] media: verisilicon: Replace strlcat() with scnprintf()
Date: Tue, 10 Nov 2026 19:24:46 -0800
Message-ID: <20261111032446.29803-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
References: <20261105084518.386234-1-nikitash.mariiaw@gmail.com>
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

In preparation for removing the deprecated strlcat() API [1], replace the
strscpy() and strlcat() calls in hantro_add_func() with a single
scnprintf() call.

This preserves the resulting string, including NUL termination
and truncation behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
Changes in v2:
- Replace seq_buf with a single scnprintf() call, as suggested
  by Hans Verkuil.

 drivers/media/platform/verisilicon/hantro_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..d8854ceb4fed 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -902,9 +902,8 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 	vfd->vfl_dir = VFL_DIR_M2M;
 	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
 	vfd->ioctl_ops = &hantro_ioctl_ops;
-	strscpy(vfd->name, match->compatible, sizeof(vfd->name));
-	strlcat(vfd->name, funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ?
-		"-enc" : "-dec", sizeof(vfd->name));
+	scnprintf(vfd->name, sizeof(vfd->name), "%s%s", match->compatible,
+		  funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER ? "-enc" : "-dec");
 
 	if (funcid == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
 		vpu->encoder = func;
-- 
2.43.0

