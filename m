Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740272;
	b=uHWGk+GaLSuKZJfXAiEuQGSL8OlKEmf5KB/oST6yklEmg/zstWJqh+fXsfsKVDzvbPXu
	 k7thwZMvtPP3RIi+rqSirGlOj0Ax7TkC4v0RpDTqqIMeaSCAmYgI1CuW2z+6qK/75pRfc
	 kGHa6Zxa7htniYGxAtzLoMm6hoaE5iK5xHRdhcCSzuro2h3jQ1lPs66dHhB2UWsY1MFn2
	 RxLjwRSH6a7/SDU7N1lFgAgt1Gj1SoGUUrgSk1Ut7K7srw3uciQ1Rw7R00+T741QM4N5d
	 up7N4nWPa3zYD6a+rL13l93ZZO8wGKiCPqKH29Vqp8iO4kl/yBzsHgAkv5rzlYkQtxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740272;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=LPjYozZiSMN/PsK7FJKM7k10B1MxOzV/+6HXqbOISfw=;
	b=JOppJ0qkZmUHyvNcbUGkeUn7k6kk0ULd+Umykp+YvjW7JDVgFJ7JNUj9ZkrWXgNqW2hO
	 ZlPE8wGqTg4seNhmRzmqG0KDyS1jGssmCF7YGYL30FsiRd6OObSaewpXoR8WCgZvM0Rbx
	 Ck/EuiJK7xF7S7zziEFbzEnsTIQkdHHfDzrwNyo0jrzhDixJG2GJg6m3ndz8RKLZyss+q
	 vwwHh+rst7fsppY2HpdZfwl1pIeuvzIdSe7HVewQcCd2tUu+W7SAt915NlsDbt94z/5jz
	 m/inWLXXuJA008VV1V8xqAwlNuxQXsASQKG1KoyRy29+THYSl6bxrB6PMAjQF7MrqmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NtupSTwB;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9657E606A33D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9657E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NtupSTwB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740268; x=1793999468;
	bh=LPjYozZiSMN/PsK7FJKM7k10B1MxOzV/+6HXqbOISfw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NtupSTwBftkL/j0vNKEgBfXeZZwrsKnBkCbAdM2nAPYXP32ilNNZJgkQNQRn1KkD9
	 LKxzpG0bla6N5oUxzTmfjV5a/dvD8iVXHuCfecdA1kaXwuIiw777Zmy8UMVWLZI7aT
	 eDALRB817UO/WFEL3BwHEW/o4coZclQiM1aRoUH7pngIZMeV4/b5Mzh1vkHVoEjX0A
	 aUphRNpbfmSYxDzyTLvgWAi1J2jEqr70y1dI4HFAaYUZLOyALuv97BZxsIaUgAEwFe
	 +l9MPaYztvUEwZYZjvkKbSNEutKqp5K+u54X1KEYINLScAQSCvvZoglLWwrYmBghBw
	 YJOvqCVI/uNYw==
Date: Tue, 03 Nov 2026 21:11:03 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v2 07/11] media: intel/ipu6: fix IOVA leak on first entry failure in ipu6_dma_map_sg()
Message-ID: <20261103211031.1573726-8-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 122c9768181599dea10e16ec46771d3f6fed3076
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

If ipu6_mmu_map() fails for the first scatterlist entry,
ipu6_dma_map_sg() calls ipu6_dma_unmap_sg() with nents =3D=3D 0. That
returns immediately, so the IOVA range allocated with alloc_iova() is
never freed.

Free the IOVA directly when no entry has been mapped yet.

Fixes: 9163d83573e4 ("media: intel/ipu6: add IPU6 DMA mapping API and MMU t=
able")
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-dma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pci/in=
tel/ipu6/ipu6-dma.c
index 90f530a937..a923a1e4bd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
@@ -444,7 +444,10 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, struc=
t scatterlist *sglist,
 =09return nents;
=20
 out_fail:
-=09ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
+=09if (i)
+=09=09ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
+=09else
+=09=09__free_iova(&mmu->dmap->iovad, iova);
=20
 =09return 0;
 }
--=20
2.56.0


