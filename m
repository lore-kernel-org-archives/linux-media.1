Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740284;
	b=pJSe5D9Ju/oDMzO6Scqnaht/AMAK6SfADgG2FNNUaP3Gs+mIYMuZA+GooMDi1YG7S4fq
	 gSbwtGUwKLMYKwaFl27+jX6kogk3ZGXHYPUQnOPObUu94JQ2FiC59pZ3lvj4uotIKg3+L
	 Sr8xFWTeXHehCjTuFFfSb34J9d1k/Wz5pZwwOUs5vPpn0yITKI0TkS5hl3ezuerDNPLt1
	 +59Z1yCYwnwyBeC/giAMi1ykj3Te5E/pqFVLIBIn7CKzdBgSrP2Wbvs+udpCEkdmEr2CR
	 3XUPT5LLfmMpajcpK80O9w7AMlIyfahZ6bg7SEyr64e6XlFxXyx2UHgf+vPpuF88Muw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740284;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kHensUF1xdf/8688ORxM8ArA4/N3txuYlaENxML7r5U=;
	b=IP5qB8cuHNnR81cssYi3TaFuCeZFmmgmrix6hGOf3Hjl2aLFUCkDD2vrZSGInn8jCxuD
	 x9NyX95vkgIsPWXyTcGXoVHlAmf6cBPQ/HKjJu4oW7x0/UA/mQ8LAM0Xb3C7rm0r2tok0
	 vqsKHNzk8MT75VM2W1ik5y9dlo8bDTklypg4xQYW1mo6RQ5XwOyjOvqoJ565y8nwG61pJ
	 DPl+qqFCFRAZW6PKHIUEa7VF72g4cAmAtPtcgAoAl1zIJrc1vN/bC6zr4OnqoPTdyWKsW
	 0mRJdnSE4V8bM3qTomO/THHUi5RQeb7T847zubJLljvVNFsmpTSeG4Vxi9Kbgxa63wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=bhN3FiuD;
	arc=none smtp.remote-ip=79.135.106.121
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C6D606D836
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C6D606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=bhN3FiuD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740281; x=1793999481;
	bh=kHensUF1xdf/8688ORxM8ArA4/N3txuYlaENxML7r5U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bhN3FiuD2t0My74z4lBSBKJKHyd+O98mPzrmzQBTVKpRJMUZDdLxLrBcJM5i4GMxv
	 ezUMxRtCaZOKgxttdricRs7Ee78ANCLgRwSuokTgbbxycz3nFtFzuZmfRRXZRCg7Dm
	 6IeurT4LzHN0SlHqNdfB5+61vXvN51NIUaRG3fhIjfg0KOSzSfghBhilqtY89plF6c
	 mU2uR2zySBgCuZCEIFRJbwnuMie6bThcOHw6iyF1mIIFoSCFRe/aYFJEj5iX5NuBWI
	 dCGNpVmRdAC23sq/8Sgkpp8sAWOQqompIaiCHgORuNzW5jQUfvn9PWt55luZONyAWx
	 G/WbNqNTkxE7A==
Date: Tue, 03 Nov 2026 21:11:17 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 10/11] media: intel/ipu6: pass the device to dev_err() in ipu6_mmu_unmap()
Message-ID: <20261103211031.1573726-11-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: f580b263e855500e7b9e5b964e66aa138d38ce9d
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

ipu6_mmu_unmap() reports unaligned unmap requests with dev_err(NULL, ...),
which prints "(NULL device *)" instead of identifying the device. Use
mmu_info->dev.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU t=
able")
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/in=
tel/ipu6/ipu6-mmu.c
index b1c34964ce..f21f3a1e53 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -593,7 +593,8 @@ void ipu6_mmu_unmap(struct ipu6_mmu_info *mmu_info, uns=
igned long iova,
 =09 * by the hardware
 =09 */
 =09if (!IS_ALIGNED(iova | size, min_pagesz)) {
-=09=09dev_err(NULL, "unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
+=09=09dev_err(mmu_info->dev,
+=09=09=09"unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
 =09=09=09iova, size, min_pagesz);
 =09=09return;
 =09}
--=20
2.56.0


