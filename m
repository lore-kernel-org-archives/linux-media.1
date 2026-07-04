Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3D0273D77
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196135; cv=none; b=T+nDKUGytguZJvT6nbYouwPeg7gJPLHiyB/Hp/cjeLpGbzpX6XyjRHvtHIATotruNKJeCgUjjf1y35D0HD/SCfkAxha+eo6hQbACme+it6KuSs/rV6M6Q18ryWcY6CKyMVHTtaeIdOxhF7o5ZF9w/15AQiehCGV55IQb952/9sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196135; c=relaxed/simple;
	bh=UYQxc1G8kTHERq1/ch0iy8tMgokCBm08mo1ytQ65Sp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMRUNztFzsLc+RtHgMuLypkut1kYJNxy5a1AOMHYzlv+5d4aKQgQga3Wf/MtE9lYhHELZHO17LN3ApBv6XO9i0T3URchBx4FOaMO22tLiicq+KpfvHDEQGe2rPjXV29HB9N6ivJY19E4Mt3S5hfRIoJwtwwbGDSXKOOE9K0aCaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kvukb08Y; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kvukb08Y"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38511175ad3so39213a91.2
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783196134; x=1783800934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9FQgQhvEEiaz5w6GlbhMEU61fNEFFsr7tOOYFmSBHs=;
        b=Kvukb08Yh1a7++/D47Zr8JanDfpTby/xFz0by5st8dQ6tKFVmxWJrJgniPIN0ARVrl
         5kQGVDICkPj6XSEhJkQedBu3aMJJFl2ZUDi5NdgMaPUITDiJcH5QSGHo9vARueQdc3R8
         3fLagzJqO3hkSXC3PmBzoShRpbyEIdnciTdkgecbA7RhxFnhzCXxRc0BIT7VMGpNbuB1
         znjLRoBEaaL0/lQab0xM0IYo/pgYqpEQfueB/40a+5uUrzIaoNjJ+ZoKYH9GNBXD0Fl0
         MaKJAEMyhROSUPygxaQZEGcQS3Kq3GbmWA/KI4hly6RnX0vfnJGn7SCiVLEuW6k1/rvo
         /PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783196134; x=1783800934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9FQgQhvEEiaz5w6GlbhMEU61fNEFFsr7tOOYFmSBHs=;
        b=U8RAW/kOZE+3BxwZta9zIUTociJkEJBXjnyRgY8RclQy9t/cjQ2synhj+D8l0lVBkX
         9anyllc2gegC447U7s6So9nAYPsH7eETKVpunRz7cdD1j4H8b/EUHiQz/UktFweSEAxb
         yNN4pUf6VedUXHPdrWX0xd1r2ym7EefbK30NW5I2FQr4cNwNi3TSSwwz2QgSQtsUznW/
         PAdn7PijXoa7+/L8SFHpHienbU4eGPRAFiWLH+FSqr/oFjs1l92SNyMzjuUGmGfHWnlY
         aMw+ryBtE5Jh2Cxkr09z6wCV9uw6HeR9z4nKc7+77Rg6YxfzTO/wq1YWF0yhexrqNyyh
         VhVQ==
X-Gm-Message-State: AOJu0YxL+lZ78qdEpTB9CIw1C/A19+w+m3GnSo6ecGpZhsmxqbeYLgq9
	YdDMarFNbwrGVBWq48r1eCPbcFvdkVehHlmzs6TTry89HMVe+vvh8Atqynk3xtSx
X-Gm-Gg: AfdE7clXBJew5JSnKaO96wiBh+ZCoUX345tl5Zscc+itJDgrEXIL9lS0g0WOTXSPSRR
	WynwHyZd1IcYtF9JqK1dabyrzXqiPa4UdZNcT7NhYNBBuJYOBkQYDZK9K/lfxZlaU7QC/e656tM
	wsrL6zO9X/IOW7yW63R8ycsK+bdG6+giuZUyVzAv93VFqUohNymNYK8tpklD40hEPKJLEFy57Op
	wMKodmfNmcRK2YSQWwctIfynNzfSffEKwwRQhT0pTUUwKCEOs6WMqOKWEEKgwcClM3hzppIvCK7
	6yjI5NrnR+uez7cdFvhpFhLnAgzyB64OYSdWUfoC0iGlDrh6Dm1JdBHGeOL0zV6ecNa9LnlhK2F
	IdFYrigkg4+hP67288BGQvG99gT6rlUWdma+8hVMKH8Xcf9tcePpI1EyRFECehMd84eXPYi4dhr
	Ryv/2WkDzngPKq/MskxA0HFOYXwuRE60MMF/y2S7moZ/k=
X-Received: by 2002:a17:90a:d40f:b0:381:fa5:521f with SMTP id 98e67ed59e1d1-382806b14d8mr4175089a91.3.1783196133804;
        Sat, 04 Jul 2026 13:15:33 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ffdd292b0sm6341930eec.2.2026.07.04.13.15.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 13:15:33 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v4 4/4] media: renesas: rzg2l-core: Add missing media_entity_cleanup()
Date: Sun,  5 Jul 2026 01:45:11 +0530
Message-ID: <20260704201506.82524-10-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704201506.82524-6-birenpandya@gmail.com>
References: <20260704201506.82524-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove function is missing a call to media_entity_cleanup(). Add it.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371c..84d4883e2fe7a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -312,6 +312,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&cru->notifier);
 
 	rzg2l_cru_video_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 	media_device_cleanup(&cru->mdev);
 	mutex_destroy(&cru->mdev_lock);
 
-- 
2.50.1 (Apple Git-155)

