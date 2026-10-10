Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0386352031
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 18:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655645; cv=none; b=cB5EEb0aL0sVF4Oa+zybQbXL6Wo2bx6CDlz0prNFai8vn7NdtuFWLld28OUho2XFyauWLdV4Qvy1pdfGV65TZdQjz/hiZ5vpG5MSWrbrAuFboXiUu7GCtErFMH2O9eYU0aRSHtDPO6huL6BmIACDbzMmtuNdpJyS3dQQ2sC5ZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655645; c=relaxed/simple;
	bh=OT+LcZq2po57Ea10ACMyNoXnTz+fxCL0TXrerpq9LqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQQAml0PcWfcECKz/MrqZDKejY3ie6ndzRX+G3QUx1kKBE6ie4XgW7OsbVUhpYwa/e4i4jPCOix5MsYFImMOVLSrlviNjYpo+9QZKzQazP6w6lZgSxdvIVGlkkplqb0tPRF3VKBVhCDAK28QUvKUyajW9aT121wYbEchnWjuEgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoKFs75C; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoKFs75C"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so4433615e9.3
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655642; x=1792260442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5j1pSqblDdPaBPvCTrZnRaS3nxEgPKJ9d7lIX0F3CQ=;
        b=HoKFs75CN/raWrbhTBegomfkfXMQkNZjcQF7N0H9hwx7pgHYrNZpkcMMA3ZeqgDAwK
         dIzZuPwzqmf+sIsxd8JGQdLQNglDmDZABQM1MOpXjkGw0cnWFDszZlRGunulhSYRHNAx
         Wfpvs3+WxUd3q93nK09Qd0cSrMSWFFwPDfgB0/IcOgB3Ce3wtnEVpcjBHsGcwnTntprD
         4b5wN21ATbdS486azBwSVfUFVNf/TFAKJF507tbhT9qk3abjo3uYiHCnb8KleK0hksl3
         hr2hpsTgwfywtbbR7USr3+ndm5qdoXKJgb02+06Tc6Wp+Gvy0hjtyr3nzcrM7ik4XFYO
         xt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655642; x=1792260442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5j1pSqblDdPaBPvCTrZnRaS3nxEgPKJ9d7lIX0F3CQ=;
        b=w+UZEezhNXF63UN1Li4k/wO606gJkId+i27uFGd2w+ZJjEDS1j0/gkCQUGXayfqqWw
         ypN4EWyVx45XPoXXLu/bCX6YltC2mnqkM5HyQxhQcGNL1lvx1mHdkPhJWI0U7bM3U2Gd
         tqQNdOfhrlZ5q9bQWkE/bkbZo9JTrP+CYmhtGwz3oNS3l+xOO7zNlLARemA7XNefZMAx
         3UDtnulOJCPzhQBnM/nCLIBVlmxtwMoBOAuqw36TpB6ej1l35pWs52cQOPseICJSyueM
         p2YBj1JFELb2IUHhGyg0Qc/wG9C9Nlw1LlVd8HaSeeWhE9XXEWS8EbtiMNijeev3m92s
         M16A==
X-Forwarded-Encrypted: i=1; AKwUvBw7E1rkWb7FfegIh8F8K+G5+IfgWPuhFakDawoTOzbXdta3eMCxTQa5OLrxQljOzj98D4/DaYTZc+n97w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZbI4MOL1XpHWhZxusJXbg4HZ2m0p7ipoHVuTKWuljjW7YqCVa
	j2SELszuTxmdTHCKQp5JmyURWLQrTXS3QTlV/8hEW+yUfRxK1NLUsRQW
X-Gm-Gg: AYBFou0j6DIDwltQXLoDB/Cvv9zCf0hNjXmCsEviglp/NDfqx78A8YNh4NrmlMoTuUI
	yAG3IFoZYNJ3KiLc46fTgAPu/Ozgv03LGKbuefrbaRpZoXz9ljyQk+JXVTecpaU9RDSYYBOiYI7
	5+1HTH+n52BRv55+buSviWj7394cEfMuhCDIH8iukrDW7N7Hib4/QGgwiP4HYbUDFEBtA0mpDIT
	9NaIZ0krQ7iRDSjhYjwlbDoxU7ckUFuTm845bEMRtB4iNkiAs0GTJ/dV1bHayQA54gGnVPgyxkt
	Pwkr3KOKAmLfTXvMG3IbK/mMhW5MM1JZhRNau0f7wUeFyQChH8E44YVy4jhSOjkMWmCc88SgRXs
	gaU861L2RPjR1aZIe3VTH39VDkib2scChz6bX/A+Xz242qzNq+/RujQ/WpXpmsC6LMpfmnp2fJ5
	gW7ySEQ6GKOck/tO5uEITe5B6/fMaAp7Vg2Rb3dFrCDvZxxeXW9KXNFMLx8k2aB5IZDpNQgMthu
	Mt8B6FhXx7b44BsndkGOevF0m321a8PiIv+mtpSXgc=
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr91571535e9.21.1791655641777;
        Sat, 10 Oct 2026 11:07:21 -0700 (PDT)
Received: from desk (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e530esm9617208f8f.13.2026.10.10.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:07:21 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Julian Orth <ju.orth@gmail.com>
Subject: [PATCH 1/2] drm/syncobj: fix fence and syncobj leak in drm_syncobj_import_sync_file_fence
Date: Sat, 10 Oct 2026 20:07:10 +0200
Message-ID: <20261010180711.1548333-2-ju.orth@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010180711.1548333-1-ju.orth@gmail.com>
References: <20261010180711.1548333-1-ju.orth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If dma_fence_chain_alloc() fails, the function returns -ENOMEM without
dropping the references to the imported fence and the syncobj.

Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index c23a5de27..5ca5163d0 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -730,6 +730,7 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 {
 	struct dma_fence *fence = sync_file_get_fence(fd);
 	struct drm_syncobj *syncobj;
+	int ret = 0;
 
 	if (!fence)
 		return -EINVAL;
@@ -743,17 +744,20 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	if (point) {
 		struct dma_fence_chain *chain = dma_fence_chain_alloc();
 
-		if (!chain)
-			return -ENOMEM;
+		if (!chain) {
+			ret = -ENOMEM;
+			goto out;
+		}
 
 		drm_syncobj_add_point(syncobj, chain, fence, point);
 	} else {
 		drm_syncobj_replace_fence(syncobj, fence);
 	}
 
+out:
 	dma_fence_put(fence);
 	drm_syncobj_put(syncobj);
-	return 0;
+	return ret;
 }
 
 static int drm_syncobj_export_sync_file(struct drm_file *file_private,
-- 
2.56.0

