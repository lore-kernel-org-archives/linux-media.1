Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962690;
	b=ldZLT0wh+SF8PO4FRwWUD7F7RjjvOQFAEBzyQISA5PDR0o1O9DGA76hgI9A2VGe+4Hql
	 YCq6O9kozO1KofHGxeFdgw4hIr4plwpNAjWYQVxQN2hxnjSjsg+j+D4sp+MPwB5X7Wpp6
	 YVviPDSlMU7TWREZXHkFhjpXR/4sOaMAMBVtxKhYm51NaLNQudyemMfahv7VMmknOc90X
	 YVzMfA4Ns9PPzbsrH6N3jhMGSOUMDh9ad9JdhQqleGcr/h6uEAI/uEGwNGvGK45yRNF9t
	 b7auB4mhiQZhOrf11OKnvc+YQYOKasRmwwg3vK0QfLQY+5nQ6epeoc5AtrqD8pZbahQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962690;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=IFa6sNlC2DIi9JCrX4hyJ9MgkQwqrv9+U+rn+nGreuQ=;
	b=cMV952RroByGIWvt2tIwg8bacBC/iGtBiRBFOJWuFmbq64di1te6uYLKvnvbLl/yJumO
	 TXd81QoD299OOW2k1u3bLkv61DhTaGWeQ0xmoMbgOsh1mB9JHJj+O8y0/nV+/xPPVrAPM
	 faWtshfE6m9CN5GmTlmE34aaQNepfb5/3rPW5/ox8gKvQSHxvTkT53rWFblb17f075V6s
	 sHmK5lzoRPJbk2Wjnh43xZ5+LwGES9janpTSU2zMGC86KniiLSswgMUpzuZBI6mDVLiZD
	 FvjMVH3IK8b6vpu1nDYrvpNUVRQ5rjJUcqrh4wlslmZRxGtcIgah+wSdrIrO9Q6Q1Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NmdtcIvj;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE6A606A32A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 00:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE6A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=NmdtcIvj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794962687; x=1795221887;
	bh=IFa6sNlC2DIi9JCrX4hyJ9MgkQwqrv9+U+rn+nGreuQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NmdtcIvjuWxlzKkqRNueH/EhFt6ig6ANoPxZOYE0CHXalDGAr0m0jQ14L/Odbfcx+
	 oCqHABeWYiY/4hYBz2qm5SkN8Y5BEawVxfAy3/lAky6uliobSznUIBDqj2wm3B7XEF
	 Kq0S3Cuw3H7H517VHdUoBxWCTCK7MDwAJSe/+DeHfyh2ETVhIMAPdbWXmr5Yceq8tz
	 aggqD3e7HJUwCfN5kH7YLZADme5tydg+MiIRKzIQnT3V29qTqa0ya5H8XS4TcKiN5D
	 prZ3plU2CbHBA/c3EXjp466Gvyv6771toBcglLAzt/jtQA0SZSEyofOVon1AGCpzh5
	 ozqUgldWTzDMQ==
Date: Wed, 18 Nov 2026 00:44:42 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Valerii Sokolov <valerii.sokolov@pm.me>, Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/11] media: intel/ipu6: fix IOVA leak on first entry failure in ipu6_dma_map_sg()
Message-ID: <20261118004421.248769-1-valerii.sokolov@pm.me>
In-Reply-To: <austAJyXh0xorYV0@kekkonen.localdomain>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me> <20261103211031.1573726-8-valerii.sokolov@pm.me> <austAJyXh0xorYV0@kekkonen.localdomain>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: a5219c019bfb8b94642bbe79a5463118cfa6db3f
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

Hi Sakari,

On Wed, Nov 04, 2026 at 03:02:56PM +0200, Sakari Ailus wrote:
> On Tue, Nov 03, 2026 at 09:11:03PM +0000, Valerii Sokolov wrote:
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-dma.c b/drivers/media/pc=
i/intel/ipu6/ipu6-dma.c
> > index 90f530a937..a923a1e4bd 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-dma.c
> > @@ -444,7 +444,10 @@ int ipu6_dma_map_sg(struct ipu6_bus_device *sys, s=
truct scatterlist *sglist,
> >  =09return nents;
> >=20
> >  out_fail:
> > -=09ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
> > +=09if (i)
> > +=09=09ipu6_dma_unmap_sg(sys, sglist, i, dir, attrs);
> > +=09else
> > +=09=09__free_iova(&mmu->dmap->iovad, iova);
>=20
> This should be handled in ipu6_dma_unmap_sg(). I'd release the iova in th=
e
> beginning and reverse the order of the nents / iova checks.
>=20
> I'll merge the rest now.

Sorry for the delayed reply, and thank you for merging the other
patches!

Regarding handling nents =3D=3D 0 inside ipu6_dma_unmap_sg():
ipu6_dma_unmap_sg() looks up the IOVA via:

=09struct iova *iova =3D find_iova(&mmu->dmap->iovad,
=09=09=09=09      PHYS_PFN(sg_dma_address(sglist)));

However, in ipu6_dma_map_sg(), sg_dma_address(sg) is only overwritten
with PFN_PHYS(iova_addr) after ipu6_mmu_map() succeeds:

=09ret =3D ipu6_mmu_map(mmu->dmap->mmu_info, PFN_PHYS(iova_addr),
=09=09=09   sg_dma_address(sg),
=09=09=09   PAGE_ALIGN(sg_dma_len(sg)));
=09if (ret)
=09=09goto out_fail;

=09sg_dma_address(sg) =3D PFN_PHYS(iova_addr);

So when ipu6_mmu_map() fails on the first entry (i =3D=3D 0),
sg_dma_address(sglist) still holds the host/PCI physical DMA address
rather than PFN_PHYS(iova->pfn_lo). Calling find_iova() on that address
in ipu6_dma_unmap_sg() will either return NULL (hitting WARN_ON(!iova)
and still leaking the allocated IOVA) or match an unrelated IOVA if the
physical PFN happens to fall into another active IOVA range.

Because ipu6_dma_unmap_sg() does not take struct iova * directly, only
ipu6_dma_map_sg() knows the iova pointer when 0 entries were mapped.

Best regards,
Valerii

