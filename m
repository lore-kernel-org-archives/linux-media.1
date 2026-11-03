Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709405;
	b=lPF+hpVq/1q6EITwB+Q29owrcHZn4i2PJ2lN1Xsg8dDH0JnTGOCmfmCAtJKQPFkJXcte
	 h7C7yoyX3/br1vt+cCsgZ2y2DExrY0XIGPaCK/sutOTmjt8wVr9b/z6DCViVKrxFgjVnW
	 D6HLj+yrQQpapEvlAG2He2WUO/vkHZcmqKiqzBq0l2GI/uThnM487XngiWbMuuytdMfWi
	 PMop9SA/QT0+sHMoqvxz+XCKZiSaaRs8a1LQHjloa4bwYo5vWrYbHUK+YxmKaSIfU8Sxp
	 I7rn2iX8Jvl35ix4YBv1fo4ykC9i25+Vmr9fwRhavWcblCcKgd5+KvSw2fRHpFUhYvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709405;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=aarelKTAPkTgAopasiQOkhTlMCd/6gYC9i1E5tJCKt8=;
	b=jqQVrhfHHNrR/ERVVhpJYfailGps095Ru7YS8wK3kz+uhje5mZuYlu8CtJDY+OBG8voB
	 VeolRyj9HReyLr4BK6MtBMyRfspgt27xMUyeO4f97u3W8znGtBGQpVbotFkbJfdqKsQeK
	 OymJAEoSu5PKre5jwJLgtTC/wF+iezeBeV+zEysLrbv08MfA1dGa5pRv5vFYnvyRXsDKZ
	 zofoNJGM5ZDk7Xpwm1LP+SRuLng9jgjGECmbGQO0SWvw6sUzEuD1lBEvdJK7if2d1rxjx
	 3+pGcYGM8r77362Z3Pwd6fPQNtarbi5KUhpLPSY8jZKiaKa0uXTOnWYL3fyIV4MuFOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=uqUgyTUw;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB02606A328
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 12:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB02606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=uqUgyTUw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793709402; x=1793968602;
	bh=aarelKTAPkTgAopasiQOkhTlMCd/6gYC9i1E5tJCKt8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=uqUgyTUwz3VCEmut1H8iVT22hxKHHWe1BY/upQ33xIpJwCt0KQBl0pHGS1SR+s2RN
	 iDzmMaCOUdRmVvXfodGDlwjhbsjnfZ97wyWsufEi5Q/zhPrtCCeSt0fZKF/9myO8wc
	 tKv5ieGJXqaSdYluEQpaj5YyHgI4s7mlCehOwJSxmpW8rNNk+aoZhF98EpJNoG4+7r
	 s5zjRA4Q4+vCbx0Z4B8qnGVuxsTv78VQMGEJY/mnsMbQMVITNDOpPAIn3Olm5XDYJc
	 xe5iu6tG6uyi+1uJH1EjM7+rI3P2zcfPGd/y5fvFBHUPLOf0r+pyfeWPtHs1BQ5Fq5
	 wj3A8VpdypoXA==
Date: Tue, 03 Nov 2026 12:36:36 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 02/12] media: ipu6: Add IPU4P MMU support
Message-ID: <g2-UJ6xgDjO_JNHwryIluolKVBrERIUZ0CCaGNwRQy28Ww_LbOs59E85BDG_uf9iZ6Azgxg5kQ4-oBd_wyKStiwwHiSz6zG-SR_McGkeDQ0=@proton.me>
In-Reply-To: <auj4qkmm5qyt_IPg@kekkonen.localdomain>
References: <HIqY305sMFUHwl9wyKbGQ0DCE3QOKwFva_k_NSdEz_Rp9xb1o6GM6uTjXTP4ejKQwXlePFZaTVUWmL3UN4-wUXmfrB1p4hWNaWOeiP_A4bg=@proton.me> <auj4qkmm5qyt_IPg@kekkonen.localdomain>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: de20936bca449f2d029510225c6831a847f13f99
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

On Monday, November 2nd, 2026 at 9:55 PM, Sakari Ailus <sakari.ailus@linux.=
intel.com> wrote:

> Hi Ruslan,
>=20
> On Sat, Oct 31, 2026 at 12:29:19PM +0000, Ruslan Bay wrote:
> > IPU4P uses the same MMUv2 programming model as IPU6, but has different
> > MMU register offsets, instances and stream allocations.
> >
> > Add IPU4P-specific ISYS and PSYS MMU data and select the corresponding
> > operations during initialization.
> >
> > Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c    | 114 ++++++++++++++++--
> >  drivers/media/pci/intel/ipu6/ipu6-mmu.c       |   7 +-
> >  drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   1 +
> >  .../media/pci/intel/ipu6/ipu6-platform-regs.h |   8 ++
> >  drivers/media/pci/intel/ipu6/ipu6.h           |   2 +
> >  5 files changed, 122 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c b/drivers/media=
/pci/intel/ipu6/ipu6-mmu-hw.c
> > index 2b395fbd596..e05fc3f7752 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
> > @@ -38,7 +38,66 @@
> >
> >  #define TBL_PHYS_ADDR(a)=09((phys_addr_t)(a) << ISP_PADDR_SHIFT)
> >
> > -static struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] =3D {
> > +static const struct ipu6_mmu_hw ipu4p_isys_mmu_hwdata[] =3D {
> > +=09{
> > +=09=09.offset =3D IPU4P_ISYS_IOMMU0_OFFSET,
> > +=09=09.info_bits =3D IPU4P_INFO_REQUEST_DESTINATION_PRIMARY,
> > +=09=09.nr_l1streams =3D 0,
> > +=09=09.nr_l2streams =3D 0,
> > +=09=09.insert_read_before_invalidate =3D true,
> > +=09},
> > +=09{
> > +=09=09.offset =3D IPU4P_ISYS_IOMMU1_OFFSET,
> > +=09=09.nr_l1streams =3D IPU4P_MMU_MAX_TLB_L1_STREAMS,
> > +=09=09.l1_block_sz =3D {
> > +=09=09=095, 16, 6, 6, 6, 6, 6, 8, 0, 0, 0, 0, 0, 0, 0, 5,
> > +=09=09},
> > +=09=09.nr_l2streams =3D IPU4P_MMU_MAX_TLB_L2_STREAMS,
> > +=09=09.l2_block_sz =3D {
> > +=09=09=092, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
> > +=09=09},
> > +=09=09.l1_stream_id_reg_offset =3D IPU4P_MMU_L1_STREAM_ID_REG_OFFSET,
> > +=09=09.l2_stream_id_reg_offset =3D IPU4P_MMU_L2_STREAM_ID_REG_OFFSET,
> > +=09},
> > +};
> > +
> > +static const struct ipu6_mmu_hw ipu4p_psys_mmu_hwdata[] =3D {
> > +=09{
> > +=09=09.offset =3D IPU4P_PSYS_IOMMU0_OFFSET,
> > +=09=09.info_bits =3D IPU4P_INFO_REQUEST_DESTINATION_PRIMARY,
> > +=09=09.nr_l1streams =3D 0,
> > +=09=09.nr_l2streams =3D 0,
> > +=09=09.insert_read_before_invalidate =3D true,
> > +=09},
> > +=09{
> > +=09=09.offset =3D IPU4P_PSYS_IOMMU1_OFFSET,
> > +=09=09.nr_l1streams =3D IPU4P_MMU_MAX_TLB_L1_STREAMS,
> > +=09=09.l1_block_sz =3D {
> > +=09=09=092, 5, 4, 2, 2, 10, 5, 16, 10, 5, 0, 0, 0, 0, 0, 3,
> > +=09=09},
> > +=09=09.nr_l2streams =3D IPU4P_MMU_MAX_TLB_L2_STREAMS,
> > +=09=09.l2_block_sz =3D {
> > +=09=09=092, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
> > +=09=09},
> > +=09=09.l1_stream_id_reg_offset =3D IPU4P_MMU_L1_STREAM_ID_REG_OFFSET,
> > +=09=09.l2_stream_id_reg_offset =3D IPU4P_MMU_L2_STREAM_ID_REG_OFFSET,
> > +=09},
> > +=09{
> > +=09=09.offset =3D IPU4P_PSYS_IOMMU1R_OFFSET,
> > +=09=09.nr_l1streams =3D IPU4P_MMU_MAX_TLB_L1_STREAMS,
> > +=09=09.l1_block_sz =3D {
> > +=09=09=092, 6, 5, 16, 16, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 3,
> > +=09=09},
> > +=09=09.nr_l2streams =3D IPU4P_MMU_MAX_TLB_L2_STREAMS,
> > +=09=09.l2_block_sz =3D {
> > +=09=09=092, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
> > +=09=09},
> > +=09=09.l1_stream_id_reg_offset =3D IPU4P_MMU_L1_STREAM_ID_REG_OFFSET,
> > +=09=09.l2_stream_id_reg_offset =3D IPU4P_MMU_L2_STREAM_ID_REG_OFFSET,
> > +=09},
> > +};
> > +
> > +static const struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] =3D {
> >  =09{
> >  =09=09.offset =3D IPU6_ISYS_IOMMU0_OFFSET,
> >  =09=09.info_bits =3D IPU6_INFO_REQUEST_DESTINATION_IOSF,
> > @@ -86,7 +145,7 @@ static struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] =3D=
 {
> >  =09},
> >  };
> >
> > -static struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] =3D {
> > +static const struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] =3D {
> >  =09{
> >  =09=09.offset =3D IPU6_PSYS_IOMMU0_OFFSET,
> >  =09=09.info_bits =3D
> > @@ -159,10 +218,21 @@ static struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] =
=3D {
> >  };
> >
> >  struct ipu6_mmu_hwdata {
> > -=09struct ipu6_mmu_hw *hwdata;
> > +=09const struct ipu6_mmu_hw *hwdata;
> >  =09unsigned int nr_mmus;
> >  };
> >
> > +static const struct ipu6_mmu_hwdata ipu4p_mmu_hwdata_lookup[IPU_SUBSYS=
_NUM] =3D {
> > +=09[IPU_PSYS] =3D {
> > +=09=09.hwdata =3D ipu4p_psys_mmu_hwdata,
> > +=09=09.nr_mmus =3D ARRAY_SIZE(ipu4p_psys_mmu_hwdata),
> > +=09},
> > +=09[IPU_ISYS] =3D {
> > +=09=09.hwdata =3D ipu4p_isys_mmu_hwdata,
> > +=09=09.nr_mmus =3D ARRAY_SIZE(ipu4p_isys_mmu_hwdata),
> > +=09},
> > +};
> > +
> >  static const struct ipu6_mmu_hwdata ipu6_mmu_hwdata_lookup[IPU_SUBSYS_=
NUM] =3D {
> >  =09[IPU_PSYS] =3D {
> >  =09=09.hwdata =3D ipu6_psys_mmu_hwdata,
> > @@ -256,17 +326,21 @@ static int __ipu6_mmu_hw_init(struct ipu6_mmu *mm=
u)
> >  =09return 0;
> >  }
> >
> > -static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device=
 *dev,
> > -=09=09=09=09   void __iomem *base)
> > +static int __ipu_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device =
*dev,
> > +=09=09=09=09  void __iomem *base,
> > +=09=09=09=09  const struct ipu6_mmu_hwdata *hwdata_lookup,
> > +=09=09=09=09  unsigned int max_l1streams,
> > +=09=09=09=09  unsigned int max_l2streams)
> >  {
> >  =09const struct ipu6_mmu_hwdata *lookup;
> > -=09struct ipu6_mmu_hw *mmu_hw, *src;
> > +=09struct ipu6_mmu_hw *mmu_hw;
> > +=09const struct ipu6_mmu_hw *src;
> >  =09unsigned int i, nr_mmus;
> >
> >  =09if (mmu->mmid >=3D IPU_SUBSYS_NUM)
> >  =09=09return -EINVAL;
> >
> > -=09lookup =3D &ipu6_mmu_hwdata_lookup[mmu->mmid];
> > +=09lookup =3D &hwdata_lookup[mmu->mmid];
> >  =09src =3D lookup->hwdata;
> >  =09nr_mmus =3D lookup->nr_mmus;
> >
> > @@ -275,8 +349,8 @@ static int __ipu6_mmu_init_hw_data(struct ipu6_mmu =
*mmu, struct device *dev,
> >  =09=09return -ENOMEM;
> >
> >  =09for (i =3D 0; i < nr_mmus; i++) {
> > -=09=09if (src[i].nr_l1streams > IPU6_MMU_MAX_TLB_L1_STREAMS ||
> > -=09=09    src[i].nr_l2streams > IPU6_MMU_MAX_TLB_L2_STREAMS)
> > +=09=09if (src[i].nr_l1streams > max_l1streams ||
> > +=09=09    src[i].nr_l2streams > max_l2streams)
> >  =09=09=09return -EINVAL;
> >
> >  =09=09mmu_hw[i] =3D src[i];
> > @@ -289,6 +363,28 @@ static int __ipu6_mmu_init_hw_data(struct ipu6_mmu=
 *mmu, struct device *dev,
> >  =09return 0;
> >  }
> >
> > +static int __ipu4p_mmu_init_hw_data(struct ipu6_mmu *mmu, struct devic=
e *dev,
> > +=09=09=09=09    void __iomem *base)
> > +{
> > +=09return __ipu_mmu_init_hw_data(mmu, dev, base, ipu4p_mmu_hwdata_look=
up,
> > +=09=09=09=09      IPU4P_MMU_MAX_TLB_L1_STREAMS,
> > +=09=09=09=09      IPU4P_MMU_MAX_TLB_L2_STREAMS);
> > +}
> > +
> > +static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device=
 *dev,
> > +=09=09=09=09   void __iomem *base)
> > +{
> > +=09return __ipu_mmu_init_hw_data(mmu, dev, base, ipu6_mmu_hwdata_looku=
p,
> > +=09=09=09=09      IPU6_MMU_MAX_TLB_L1_STREAMS,
> > +=09=09=09=09      IPU6_MMU_MAX_TLB_L2_STREAMS);
> > +}
> > +
> > +const struct ipu6_mmu_hw_ops ipu4p_mmu_ops =3D {
> > +=09.init_hw_data =3D __ipu4p_mmu_init_hw_data,
> > +=09.hw_init =3D __ipu6_mmu_hw_init,
> > +=09.tlb_invalidate =3D __ipu6_tlb_invalidate,
> > +};
> > +
> >  const struct ipu6_mmu_hw_ops ipu6_mmu_ops =3D {
> >  =09.init_hw_data =3D __ipu6_mmu_init_hw_data,
> >  =09.hw_init =3D __ipu6_mmu_hw_init,
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pc=
i/intel/ipu6/ipu6-mmu.c
> > index 1a564ceb747..824408b21cc 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> > @@ -684,7 +684,12 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
> >  =09if (!mmu)
> >  =09=09return ERR_PTR(-ENOMEM);
> >
> > -=09mmu->ops =3D (IS_IPU7(isp) || IS_IPU8(isp)) ? &ipu7_mmu_ops : &ipu6=
_mmu_ops;
> > +=09if (IS_IPU4P(isp))
> > +=09=09mmu->ops =3D &ipu4p_mmu_ops;
> > +=09else if (IS_IPU7(isp) || IS_IPU8(isp))
> > +=09=09mmu->ops =3D &ipu7_mmu_ops;
> > +=09else
> > +=09=09mmu->ops =3D &ipu6_mmu_ops;
> >  =09mmu->mmid =3D mmid;
> >  =09mmu->ready =3D false;
> >  =09INIT_LIST_HEAD(&mmu->vma_list);
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pc=
i/intel/ipu6/ipu6-mmu.h
> > index ff113384c12..8434dd5324c 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> > @@ -197,6 +197,7 @@ struct ipu6_mmu {
> >  =09const struct ipu6_mmu_hw_ops *ops;
> >  };
> >
> > +extern const struct ipu6_mmu_hw_ops ipu4p_mmu_ops;
> >  extern const struct ipu6_mmu_hw_ops ipu6_mmu_ops;
> >  extern const struct ipu6_mmu_hw_ops ipu7_mmu_ops;
> >
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h b/driver=
s/media/pci/intel/ipu6/ipu6-platform-regs.h
> > index b883385adb4..01a7abddd6d 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
> > @@ -14,16 +14,23 @@
> >   */
> >  #define IPU6_UNIFIED_OFFSET=09=09=090
> >
> > +#define IPU4P_ISYS_IOMMU0_OFFSET=09=090x000e0000
> > +#define IPU4P_ISYS_IOMMU1_OFFSET=09=090x000e0100
>=20
> We have already a separate file for the IPU7 registers. Could you add
> ipu4p-platform-regs.h for the IPU4P registers, please?
>=20

Thanks, will do.

> >  #define IPU6_ISYS_IOMMU0_OFFSET=09=090x2e0000
> >  #define IPU6_ISYS_IOMMU1_OFFSET=09=090x2e0500
> >  #define IPU6_ISYS_IOMMUI_OFFSET=09=090x2e0a00
> >
> > +#define IPU4P_PSYS_IOMMU0_OFFSET=09=090x000b0000
> > +#define IPU4P_PSYS_IOMMU1_OFFSET=09=090x000b0100
> > +#define IPU4P_PSYS_IOMMU1R_OFFSET=09=090x000b0600
> >  #define IPU6_PSYS_IOMMU0_OFFSET=09=090x1b0000
> >  #define IPU6_PSYS_IOMMU1_OFFSET=09=090x1b0700
> >  #define IPU6_PSYS_IOMMU1R_OFFSET=090x1b0e00
> >  #define IPU6_PSYS_IOMMUI_OFFSET=09=090x1b1500
> >
> >  /* the offset from IOMMU base register */
> > +#define IPU4P_MMU_L1_STREAM_ID_REG_OFFSET=090x0c
> > +#define IPU4P_MMU_L2_STREAM_ID_REG_OFFSET=090x4c
> >  #define IPU6_MMU_L1_STREAM_ID_REG_OFFSET=090x0c
> >  #define IPU6_MMU_L2_STREAM_ID_REG_OFFSET=090x4c
> >  #define IPU6_PSYS_MMU1W_L2_STREAM_ID_REG_OFFSET=090x8c
> > @@ -105,6 +112,7 @@
> >  #define IPU6_INFO_IMR_BASE=09=09=09BIT(10)
> >  #define IPU6_INFO_IMR_DESTINED=09=09=09BIT(11)
> >
> > +#define IPU4P_INFO_REQUEST_DESTINATION_PRIMARY=09BIT(4)
> >  #define IPU6_INFO_REQUEST_DESTINATION_PRIMARY IPU6_INFO_REQUEST_DESTIN=
ATION_IOSF
> >
> >  /*
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/in=
tel/ipu6/ipu6.h
> > index 4db9f3d85d8..c70ae6bb1d9 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6.h
> > +++ b/drivers/media/pci/intel/ipu6/ipu6.h
> > @@ -95,6 +95,8 @@ struct ipu6_device {
> >  /* The firmware is accessible within the first 2 GiB only in non-secur=
e mode. */
> >  #define IPU6_MMU_ADDR_BITS_NON_SECURE=0931
> >
> > +#define IPU4P_MMU_MAX_TLB_L1_STREAMS=0916
> > +#define IPU4P_MMU_MAX_TLB_L2_STREAMS=0916
>=20
> This is fine of course.
>=20

Thanks, I'll leave this in ipu6.h

> >  #define IPU6_MMU_MAX_TLB_L1_STREAMS=0932
> >  #define IPU6_MMU_MAX_TLB_L2_STREAMS=0932
> >  #define IPU6_MAX_LI_BLOCK_ADDR=09=09128
>=20
> --
> Kind regards,
>=20
> Sakari Ailus
> 
