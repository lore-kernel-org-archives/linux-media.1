Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CAC368D65
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 18:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655646; cv=none; b=JhMuFz6+0xNb2dUbX4gJCo0Y/sRu6bEjslES+k384Il0MHnwZWrjYdI2C4/eFjSwz3+DNRt6hBAn9HLNBeE7fvs9ucRJ77JQ+42GAanqxSvD3AlEgDspXPSkQK7BxmXQMO3lT7V6FjEJGSr5uAOF8nA/tn8mgCwBFCTL70P2VNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655646; c=relaxed/simple;
	bh=VulEJg958PnrIdvSzRGkmW4RC39GwVAPz9DpA6gnsqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ih1hUIS1enTjC50n+0Cphp81tSkYHx8gixgjRt0INImympebKqRSri8N3A0jF2XRrjd8TM8XyVF2s+eVJw8aUbArOkcRCtaxgB+7juuMluyH9CWyyuJ3D99WM4C5eWRG7M5OnBTOS085Jgxk9wQPUPhUtrxResitrQu4JmyLOps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMJRc0YN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMJRc0YN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so5804285e9.2
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 11:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655643; x=1792260443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRdRSHL4zHnCw7Uu5TIKezwFTjyQd4oKLN7dpP508Sk=;
        b=YMJRc0YNG+uTr7klNVk/y6zhdXMa/k/GdRljL0QGLQJJLUSMBq5lVbOyj7Ekd++erA
         FQxtBLgy7vl9l3oGkG8K4AEtQqUOh7/5ONyeplgEMi7nYqNOVT2ZCZ4vx933iWLZ/HFm
         EwsIYDKpAE1BarLl+ep3BqlA5XOWaSV9Hhkcq5fxPc6QYJmbykAFu3DPWvRhaQFJ/JPH
         qqgYU+xgqTysRJ6AXTVM7LOZW6zpGDItjA+RZjJYHqUlw+0Ps05bP170066JBRgYNWHx
         rHZAbWPkco3bCl2ubw8rmJYOVHOYfSSd8Zf/HvqigOx4C5x2w8EUVQ67jQSNBaepSidX
         FZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655643; x=1792260443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRdRSHL4zHnCw7Uu5TIKezwFTjyQd4oKLN7dpP508Sk=;
        b=b50PhafHvsDcGS1vDUMSqjXvAwNFvEPv0g6ArzmoY85QaqNCnzbVJWUkgBlcPhl6Ee
         nRoxdtZAHp8enX4If5qMGV+H1aTSV0niCi+pORph7/2eS6jC2xWNeYV+qWg/8WOzQvAJ
         FHfLa1NmB/kzguYNcW0qt2xjNJzBvPwEnSPMq/qFGW+990BtSxaqGZT4gYOm3JAXHVvv
         70rR3IpwpjaQtapRO/UEpK0ty0FxRfacxUbNhD9LEB1uuVcfs2RFu0sIO+RTGU6VoY1F
         +W7QQzDgLnGMNBZgacihHITZXm0bgwlybt8IaW69itk8R0w9ggjNpJIMP0kWp2C2Cs0E
         FExA==
X-Forwarded-Encrypted: i=1; AKwUvBwXk2mbjkjVqrcbC0xTZT6QcfvWHwyC405ayVfbjgM1AHAGvbqJw4r8jP9wE/4DlLWjtYAGzLp6q7coXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL0psa+uR/Qb+MgvMvmGCTFm3BiY8GP/u2cep+pRsn+0KcLbZF8
	vrwdnSPo7Kw/rtkqnZXP5V0ilxggMcaH0z9qsLG313ex/M7HwELa5yE1
X-Gm-Gg: AYBFou0x+yaqmTv0/g8EM9NeogTd4JvoJ9B+i4dlQJ5u6WjP/Z0uQ4oEsxQslQFdHtg
	Y1m6QOD16RXM1svpb8c6EaWcISP/v30L+Bv/O/DShhAH9D7YtbFcsch9t2pGmXVO8kuVuLKjee4
	sR2gT9hHMHf62qQZWmKrj5CqwiYDtevGBrThGfvMykWtAWgb6jrqqz0vwot2gSKbhTOiIgJK2as
	TJgK7PuJ0nYar42JRwHdfPTMRu1Sdy4CFeeyjCDvFd9zr/yslnynYdVyGJZEYJp5Epz0QWfue4Q
	G7dHtxDpd0NQnc3vVCcq49BeMGDLTjPnssnYl+FHBa2iROBQZ/cxurxtyXGrM+LydDfZc9Zyfyg
	j6/twR70zTx61z9/kW7g44Jc2syskjQzFM7M4xcUJOuD0vAHe039t4aDzijMmjDG/LpPpalnrPv
	SRhZYtpq1h8yOARBECeBIRCXD+uj5nIKM0agLeh/PBMkXiELfWPtMPWNldwmvmvSImTT0I17ezE
	6Saap1p+aPuFs8U6eRR16c8sxUa3rZruQ/1JPOkfxY=
X-Received: by 2002:a05:600c:3b0a:b0:4a1:779c:dc8e with SMTP id 5b1f17b1804b1-4a18e4a01b7mr103655525e9.10.1791655642961;
        Sat, 10 Oct 2026 11:07:22 -0700 (PDT)
Received: from desk (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e530esm9617208f8f.13.2026.10.10.11.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:07:22 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/syncobj: flatten chains when importing sync_file into timeline point
Date: Sat, 10 Oct 2026 20:07:11 +0200
Message-ID: <20261010180711.1548333-3-ju.orth@gmail.com>
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

A sync_file exported from a timeline point can contain a dma_fence_chain.
Importing such a sync_file into a timeline point with
DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE |
DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE passes the chain directly to
dma_fence_chain_init() and triggers

  WARNING: drivers/dma-buf/dma-fence-chain.c:286 at dma_fence_chain_init

because chain fences must not be wrapped in other chain fences.

Flatten the fence with dma_fence_unwrap_merge() before adding it to the
timeline, as drm_syncobj_transfer_to_timeline() already does.

Reproducer:

1. Export a sync_file from a point > 0 of a timeline syncobj with
   DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD.
2. Import it into a point > 0 of another timeline syncobj with
   DRM_IOCTL_SYNCOBJ_FD_TO_HANDLE.

Fixes: c2d3a7300695 ("drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julian Orth <ju.orth@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 5ca5163d0..c545af77e 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -742,8 +742,18 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
 	}
 
 	if (point) {
-		struct dma_fence_chain *chain = dma_fence_chain_alloc();
+		struct dma_fence_chain *chain;
+		struct dma_fence *tmp;
+
+		tmp = dma_fence_unwrap_merge(fence);
+		dma_fence_put(fence);
+		fence = tmp;
+		if (!fence) {
+			drm_syncobj_put(syncobj);
+			return -ENOMEM;
+		}
 
+		chain = dma_fence_chain_alloc();
 		if (!chain) {
 			ret = -ENOMEM;
 			goto out;
-- 
2.56.0

