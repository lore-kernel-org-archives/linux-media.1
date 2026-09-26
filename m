Received: from mail-pz2-f23.google.com (mail-pz2-f23.google.com [74.125.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ED563CB
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 02:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790389237; cv=none; b=GqtRGqql19ydlmEI+7pY9zaSvU1jiNR38wWPicpxV1J7C8GOQ26IK0iqTBp5uP/hOdxmn6LOMcx90sK8WBcrBn4PtsJYmpsjg0mdyx+enHWNqscZuBGjNZ2QnTh6zLqwp3jdFtmvPnQmTeOOy2zAV83QR12BsSvxB5fw/DJyxfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790389237; c=relaxed/simple;
	bh=jg7+FemWVFBVpRrvIizD8nTkz/V6UqciTlpbBKfXenw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nEjr5ubcprIMqnwBRSCmQWd0iwXrZJAJ8m7wBu8eQw4mbQ/WbjG0C0A7kGVJgUbimU3BzQJSRHitJ8L72FLWzNdMQJmDAskU9xVNl4hbXFAsYNAFSG49oHqhUGTIySw5QbiSgPgY40zieGGFpSuYBjx0ghCjs6zIAjf/NC4ITQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHuDUt/Z; arc=none smtp.client-ip=74.125.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHuDUt/Z"
Received: by mail-pz2-f23.google.com with SMTP id 41be03b00d2f7-cc792ffdfc7so28146a12.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 19:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790389235; x=1790994035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A35dxfOiF0vku1a8AiorVl5ekNNXinTf80Wsr1D60yQ=;
        b=EHuDUt/ZBWEjyfij3XI/E3UAqcKeMYA+ZocKWN/eC19pbXFhhxdZeV6cVVs0upGTZy
         jijebJbLJ3I2+CJilum1ZgEEW/ZQQdX7hdZuj8x5QN2ndU8Zzgy1jU9mIKlthqkR43M7
         usmzLItap8UseMSD7Lp08Swss2D35sKCNU6U/1DubELH8ok2IXRs7eK20K1v7ZWhVfoO
         oTSukA7SqvrwZLdEyeo8c5Jl5tRh+MlZsADvv0nMSw/VzJCIgj4uYwAZvsJrcRMJ4Zfr
         BPMD0agC6Y8lts+GfAVV4lptV93Dme6bbuo5dlY0d1d2SI6D5oyEautbw3n4WFlAE7kl
         vWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790389235; x=1790994035;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A35dxfOiF0vku1a8AiorVl5ekNNXinTf80Wsr1D60yQ=;
        b=RcopLlzqVLu24sQOBLRRpWX4ABsPrbF4C1yWgDPNw27flmtnZdiGgGlS3T6PAhzyXy
         +P7qSlhVbrkYZf99xG29Wkb11F/hPGC3TIUOaNYYw69TQ1HGdUpN6re/y7PAWd8txzu1
         Q5Ntmwr6QnrBC6jTrO8ky16l2KM7qCHp6UhlZs87X4TsEyE7D9VmrMcIwRw+FFOPgwlM
         /TIReTS1Qz0SRcGkdZqk+Nyo11o3x4CyjnPQKOBfnvEsq0o8KxpGBtDFhBxBmOABhUEA
         VIy+3AtIiarINhguqZc08DRZ5Lni853J/m1mBuxe5meewX4m4apnL5J2fyrYA2KV2Poh
         MyoA==
X-Forwarded-Encrypted: i=1; AKwUvBxSAVBurnIYRSOLmUDmt4DoGdYjEK+kuNFlSWveChb4unHtAwhNa2L7JqXA+7NKW5QD+VmHOLToa/xHZw==@vger.kernel.org
X-Gm-Message-State: AFuF++mKNHLcU1kN5NSU+mjkWz7J0h/qP+uJ782SpueripeFKHgsT2/U
	wqK3275V3Nd55iNCvraEc2+UwYK1MoujgWXGNUmM2NA7keDxgxXWki0n
X-Gm-Gg: AYBFou2uRQb/HJ36X7z6AHY4WkpjI0xmWK5ZtnAbNsfmXZQkufN6KNNnh3H8NZV8y42
	ru9okafNrrqRMrTqiBuZOOIs69IedZ93hE+aGiTQqtjM/EfyFt1I5bK9P2MsY9X88oIpyQLcH6k
	Sxrm7tRYgtJ5KAcg8CtXA8pcotdW3W46JQFSIPBVo77MI1vx+TDOlpXc0gs9TXWQKfRNDUAEune
	W/GQvSHP5W0JUycbIVHG3/LZ0lXOCuzxtADsF54D1rU8ZKpPqugMJpS2TdhktBqyHILzwZokeJw
	ivGl1VO/9dmvy277z5EXDwYtaAVOBXbw6OQEawAlBOBtXTP2fl34N+hrkKIpgkgfNavxm01cuxj
	E4fog5llMysy6JiwMQDrntWc9DBxGS4SfKvm4ykD0BTjg6biqPYe4PXt3BN7hHu0vMf7Zcr1o0S
	UUHLp6ZnERwhI70CRigc1VPFdKnKKg4ptTTGJrkeYRGKuaAMWmV8Xl/8/TNqBtYFaf9rqE1mdHP
	ecQ6CjO/NT/+g==
X-Received: by 2002:a17:902:c94c:b0:2db:2846:ce3c with SMTP id d9443c01a7336-2df8e59a4e9mr65359735ad.1.1790389235476;
        Fri, 25 Sep 2026 19:20:35 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbac49sm17687415ad.3.2026.09.25.19.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 19:20:34 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Bryan O'Donoghue <bod.linux@nxsw.ie>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on DEBUG_KERNEL kernels"
Date: Sat, 26 Sep 2026 10:20:17 +0800
Message-ID: <20260926022026.10539-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit 143755bdabaa96776c24f878014608e9cb44f930.

That commit fixed a dangling reference in the DMABUF_DEBUG default
and thereby enabled the option - and with it the page-stripping
sg_table wrapper that dma_buf_map_attachment() hands to importers -
on every kernel with DEBUG_KERNEL=y, i.e. virtually every distro
kernel.

drm/msm is broken by the wrapper.  Both of msm's map paths consume
sg->length and sg_phys() of the attachment sg_table:
msm_iommu_pagetable_map() for the per-process GPU pagetables, and
iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
zeroes sg->length and strips the page pointers, so mappings of
imported dma-bufs silently map nothing, and userspace observes
arm-smmu translation faults from UCHE, e.g. during hardware video
decode (clapper, chromium) on Adreno systems:

  gpu fault: ttbr0=000000088a889000 iova=000000010741c000 dir=READ
  type=TRANSLATION source=UCHE

Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
v7.3-rc4 bad, culprit 143755bdabaa9.

Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
either: those fields are only valid for sg_tables that msm has
dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
are not, so the conversion needs more work.  The msm maintainer has
therefore requested restoring the previous default for v7.3, to be
revisited once msm no longer consumes struct page and sg->length of
imported sg_tables.

Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liujianfeng1994@gmail.com/
Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index e4f078a326a41..7efc0f0d07126 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -43,7 +43,7 @@ config UDMABUF
 config DMABUF_DEBUG
 	bool "DMA-BUF debug checks"
 	depends on DMA_SHARED_BUFFER
-	default y if DEBUG_KERNEL
+	default y if DEBUG
 	help
 	  This option enables additional checks for DMA-BUF importers and
 	  exporters. Specifically it validates that importers do not peek at the
---
base-commit: 93f51579e7df248780214094418f205253383cc5
branch: revert-dmabuf-debug-for-7.3

-- 
2.47.3

