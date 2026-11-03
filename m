Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740281;
	b=GXhz7iumZm4Kg2U3NsUBrK3No6/fqN66HFdjHwq4kRtq2aItYf2KTrKesduuYOA1Yh3m
	 l2wt7Xfhit3RGz8DEE3846/a2D/e+SGUUkC4kUd3H/FXe+dDONi9N+09jgye32Evfg8hz
	 /WH99c5QkQLIHouAIvY2FTXnzMGYLBIsnLKYxuXnHi8shKIzF77FkN/Ur0QKbxDSKTqHx
	 QrhRW9hMjfuSmzg7BN0kMyLQX1V0RgKIpQIdnoGfHKAD634Sq6odXK19CYZPxTFmsPXSy
	 wU0phXfxQ29B5/Qf+RHhRJS8lo6ipaUMq9Qb0EPsCXH5Uqx+zpJPmkjqmD5xndBQ7gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740281;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=KCa9z8lDt29OfaAKm450/Je1WPRYXsZvXR2r4M2kWqg=;
	b=dxio2Vy/+R+i7VL7v/r+RkckE/ZHwn/YA4/yEqIiziV0PXddfunyNou7UjFS54U4yblT
	 UZDJg9P9sJgjBpl5qBV/PD2REFZ9anKwvCHYws2iqBst+OPRxyVw1VHCdF+jLczlEm8oq
	 r9VD4PD15VUirRG1wmdEqoKLAKkNi0Tlo1oOWd9zrNsgTRxO6FUBpA6CxxTTbPn91KWhg
	 xjBVxc6EdXf07h8Xz5T+2aE5UzOcPMpb1cPs3wixgVQV70GCyThfVecgaHhqV7LN1Xt0m
	 3S9PsxSEUbWIcl2jR5JonwCwVB2hQfPUuKvdzYUzbwQk8+Ep7E1Xth77Wcj6Uy1zJlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=JR0wSCoz;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB4606A32F
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEEB4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=JR0wSCoz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740278; x=1793999478;
	bh=KCa9z8lDt29OfaAKm450/Je1WPRYXsZvXR2r4M2kWqg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JR0wSCozU7vMnfOeEmYxCmZL9DznNqC2HB0RUtkZF+lxemozsLnVqo2PgAyNMJcr1
	 s3HQ1F0SM3VZg9rqVJQGV/FkMdoffZFoYrSuwQtD9JoN4hxU8coVWUxEDYOEQchhmE
	 MEbU9WTClj9CFGRMssjwS+CaxSedbdhNE4/3lWwyYxx9zuQDrFMq21XFgccUDGKE/y
	 efp9nBFOQmsXWpUO4XtN3h0PAunio5+WVdqn89XrnUpfiCk7hJnWkkj2OwBHE4JbB4
	 jVHU7FolXj+m7Brzpb2oKRsOH4XUu7Z5dIifHoKM2bYSSoGcMKlVq1DF2E3hyoPjU4
	 PgxRMWA0bs3lg==
Date: Tue, 03 Nov 2026 21:11:13 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 09/11] media: intel/ipu6: unmap the dummy L2 page table in ipu6_mmu_destroy()
Message-ID: <20261103211031.1573726-10-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: c400ef70a91a4d1c8e0a7781355612d7ae9b286f
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

ipu6_mmu_destroy() frees mmu_info->dummy_l2_pt with free_page() instead
of the existing free_dummy_l2_pt() helper, so the streaming DMA mapping
of the dummy L2 page table (mmu_info->dummy_l2_pteval) is never unmapped
when the MMU is torn down.

Use free_dummy_l2_pt().

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU t=
able")
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/in=
tel/ipu6/ipu6-mmu.c
index 1a564ceb74..b1c34964ce 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -668,7 +668,7 @@ static void ipu6_mmu_destroy(struct ipu6_mmu *mmu)
 =09free_dummy_page(mmu_info);
 =09dma_unmap_single(mmu_info->dev, TBL_PHYS_ADDR(mmu_info->l1_pt_dma),
 =09=09=09 PAGE_SIZE, DMA_BIDIRECTIONAL);
-=09free_page((unsigned long)mmu_info->dummy_l2_pt);
+=09free_dummy_l2_pt(mmu_info);
 =09free_page((unsigned long)mmu_info->l1_pt);
 =09kfree(mmu_info);
 }
--=20
2.56.0


