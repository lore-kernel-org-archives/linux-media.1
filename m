Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652902;
	b=Wjbi+dqpZStOVhdSOKDRmHck83CHs9LlWnZgcJGYf2MeC5MZyxSXVSD7sELP77tfbAjh
	 gEVsqFwW+/pDAH6qHogNfE7Snp95iSJzfk3wOHJDVAE52nv9kMdXL1sAhqMLuwrCDYigf
	 8cXve905dUrjl5ot7vIggCJ+NcLhhDXy/DQN/+HeFbfAyOttMRm8kMWPBiOeK5vvun6X9
	 qXpxZPAKIMyqff8Lfhhi2kdsYsldg5ct7vAOEK8YPk1x5kFfmxoBdxd9gHEsYezZXx8UV
	 SX+7J+XyLkeAaclkNwGvRDqTEqohKsjqcaelCBD8rve/lWUWKwIpx9DKVRI/cHx/G4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652902;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=P2O5SkjmHgcQNmPWJK18eJtWAJzNO5bZqTidzub+3zY=;
	b=j6TFte8w/X/KOQzOl6zghcEhHy8v18mOJt9R9bq3kUOQlkBNSkV9MPQ2kXQbhuCA/N4s
	 l4pv5uZzqq2lVzL5Vh5MAm/bNeuokfi8vzAwH5IZ+pOS4zThTheGXUugbPTR9425Bw9rL
	 hdG/TViwMPFLZ8zhaDLVWN3/tjobfwDlwo2W4na37n+K6pyz3mZbYeLVtd65Lc0rfw5zQ
	 MdFvy+F5WCvwmzU8ysBKL8tcXCnOGcGwt/bG7PKnNrp3cMaRr2R0SqnkjRL9ABg7HPVRi
	 tVQqb1n5009qrV1bGfhLnFSUkPvnx00HqJdCBu8dmBYVLblCjb8O7MZD+RTxog4+9FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M97FjxF6;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8068606A326
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 20:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8068606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M97FjxF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793652901; x=1825188901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EPkO7c1nci7E+GsfPeQ2bfdtT7fVjDPxnTWU7LSVAPQ=;
  b=M97FjxF60g+UThl1fleUsOaFyGMkDuKa+TmSqUKhSNAY+Ok9Gi7GFcCO
   RjHw7cBxtazrMB0ZajLInMzW9Vc57RMDvzW0za6WxJIFr0QRertbPajG/
   75TqhP6o8nkfEMYl8L89HUjTlL7yi7333SUI7DvLeiefvC8rYmIftE28y
   gkh3m9LeN0GAQQYefQAaodDFfqJDl3jjGQPqEJOQAe5oHuBQiaHkFEwNb
   JhDlGXDWsdXoRVidKp0ehMAFqQ1TCEBweSqwlBcELqM/yqbPJT+Fzs1zu
   lmMFEUbppD/OjIrpzoxCKJXceE/k1UxKlNLzbzDwkJ79M7AnBN+2xpVJ2
   w==;
X-CSE-ConnectionGUID: +eltF0SHRf+0QWxnHViBcg==
X-CSE-MsgGUID: NtVitl6UTeSg0iYy3BGVWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2240459"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2240459"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 12:55:00 -0800
X-CSE-ConnectionGUID: uwsu1+ryRG6vSDehL//EUg==
X-CSE-MsgGUID: 4q6MvCYOSq+9v6PapPMf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="8055961"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 12:54:58 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 240F211FB41;
	Mon, 02 Nov 2026 22:55:06 +0200 (EET)
Date: Mon, 2 Nov 2026 22:55:06 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 02/12] media: ipu6: Add IPU4P MMU support
Message-ID: <auj4qkmm5qyt_IPg@kekkonen.localdomain>
References: <HIqY305sMFUHwl9wyKbGQ0DCE3QOKwFva_k_NSdEz_Rp9xb1o6GM6uTjXTP4ejKQwXlePFZaTVUWmL3UN4-wUXmfrB1p4hWNaWOeiP_A4bg=@proton.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HIqY305sMFUHwl9wyKbGQ0DCE3QOKwFva_k_NSdEz_Rp9xb1o6GM6uTjXTP4ejKQwXlePFZaTVUWmL3UN4-wUXmfrB1p4hWNaWOeiP_A4bg=@proton.me>

Hi Ruslan,

On Sat, Oct 31, 2026 at 12:29:19PM +0000, Ruslan Bay wrote:
> IPU4P uses the same MMUv2 programming model as IPU6, but has different
> MMU register offsets, instances and stream allocations.
> 
> Add IPU4P-specific ISYS and PSYS MMU data and select the corresponding
> operations during initialization.
> 
> Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c    | 114 ++++++++++++++++--
>  drivers/media/pci/intel/ipu6/ipu6-mmu.c       |   7 +-
>  drivers/media/pci/intel/ipu6/ipu6-mmu.h       |   1 +
>  .../media/pci/intel/ipu6/ipu6-platform-regs.h |   8 ++
>  drivers/media/pci/intel/ipu6/ipu6.h           |   2 +
>  5 files changed, 122 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c b/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
> index 2b395fbd596..e05fc3f7752 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu-hw.c
> @@ -38,7 +38,66 @@
>  
>  #define TBL_PHYS_ADDR(a)	((phys_addr_t)(a) << ISP_PADDR_SHIFT)
>  
> -static struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] = {
> +static const struct ipu6_mmu_hw ipu4p_isys_mmu_hwdata[] = {
> +	{
> +		.offset = IPU4P_ISYS_IOMMU0_OFFSET,
> +		.info_bits = IPU4P_INFO_REQUEST_DESTINATION_PRIMARY,
> +		.nr_l1streams = 0,
> +		.nr_l2streams = 0,
> +		.insert_read_before_invalidate = true,
> +	},
> +	{
> +		.offset = IPU4P_ISYS_IOMMU1_OFFSET,
> +		.nr_l1streams = IPU4P_MMU_MAX_TLB_L1_STREAMS,
> +		.l1_block_sz = {
> +			5, 16, 6, 6, 6, 6, 6, 8, 0, 0, 0, 0, 0, 0, 0, 5,
> +		},
> +		.nr_l2streams = IPU4P_MMU_MAX_TLB_L2_STREAMS,
> +		.l2_block_sz = {
> +			2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
> +		},
> +		.l1_stream_id_reg_offset = IPU4P_MMU_L1_STREAM_ID_REG_OFFSET,
> +		.l2_stream_id_reg_offset = IPU4P_MMU_L2_STREAM_ID_REG_OFFSET,
> +	},
> +};
> +
> +static const struct ipu6_mmu_hw ipu4p_psys_mmu_hwdata[] = {
> +	{
> +		.offset = IPU4P_PSYS_IOMMU0_OFFSET,
> +		.info_bits = IPU4P_INFO_REQUEST_DESTINATION_PRIMARY,
> +		.nr_l1streams = 0,
> +		.nr_l2streams = 0,
> +		.insert_read_before_invalidate = true,
> +	},
> +	{
> +		.offset = IPU4P_PSYS_IOMMU1_OFFSET,
> +		.nr_l1streams = IPU4P_MMU_MAX_TLB_L1_STREAMS,
> +		.l1_block_sz = {
> +			2, 5, 4, 2, 2, 10, 5, 16, 10, 5, 0, 0, 0, 0, 0, 3,
> +		},
> +		.nr_l2streams = IPU4P_MMU_MAX_TLB_L2_STREAMS,
> +		.l2_block_sz = {
> +			2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
> +		},
> +		.l1_stream_id_reg_offset = IPU4P_MMU_L1_STREAM_ID_REG_OFFSET,
> +		.l2_stream_id_reg_offset = IPU4P_MMU_L2_STREAM_ID_REG_OFFSET,
> +	},
> +	{
> +		.offset = IPU4P_PSYS_IOMMU1R_OFFSET,
> +		.nr_l1streams = IPU4P_MMU_MAX_TLB_L1_STREAMS,
> +		.l1_block_sz = {
> +			2, 6, 5, 16, 16, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 3,
> +		},
> +		.nr_l2streams = IPU4P_MMU_MAX_TLB_L2_STREAMS,
> +		.l2_block_sz = {
> +			2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
> +		},
> +		.l1_stream_id_reg_offset = IPU4P_MMU_L1_STREAM_ID_REG_OFFSET,
> +		.l2_stream_id_reg_offset = IPU4P_MMU_L2_STREAM_ID_REG_OFFSET,
> +	},
> +};
> +
> +static const struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] = {
>  	{
>  		.offset = IPU6_ISYS_IOMMU0_OFFSET,
>  		.info_bits = IPU6_INFO_REQUEST_DESTINATION_IOSF,
> @@ -86,7 +145,7 @@ static struct ipu6_mmu_hw ipu6_isys_mmu_hwdata[] = {
>  	},
>  };
>  
> -static struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] = {
> +static const struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] = {
>  	{
>  		.offset = IPU6_PSYS_IOMMU0_OFFSET,
>  		.info_bits =
> @@ -159,10 +218,21 @@ static struct ipu6_mmu_hw ipu6_psys_mmu_hwdata[] = {
>  };
>  
>  struct ipu6_mmu_hwdata {
> -	struct ipu6_mmu_hw *hwdata;
> +	const struct ipu6_mmu_hw *hwdata;
>  	unsigned int nr_mmus;
>  };
>  
> +static const struct ipu6_mmu_hwdata ipu4p_mmu_hwdata_lookup[IPU_SUBSYS_NUM] = {
> +	[IPU_PSYS] = {
> +		.hwdata = ipu4p_psys_mmu_hwdata,
> +		.nr_mmus = ARRAY_SIZE(ipu4p_psys_mmu_hwdata),
> +	},
> +	[IPU_ISYS] = {
> +		.hwdata = ipu4p_isys_mmu_hwdata,
> +		.nr_mmus = ARRAY_SIZE(ipu4p_isys_mmu_hwdata),
> +	},
> +};
> +
>  static const struct ipu6_mmu_hwdata ipu6_mmu_hwdata_lookup[IPU_SUBSYS_NUM] = {
>  	[IPU_PSYS] = {
>  		.hwdata = ipu6_psys_mmu_hwdata,
> @@ -256,17 +326,21 @@ static int __ipu6_mmu_hw_init(struct ipu6_mmu *mmu)
>  	return 0;
>  }
>  
> -static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
> -				   void __iomem *base)
> +static int __ipu_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
> +				  void __iomem *base,
> +				  const struct ipu6_mmu_hwdata *hwdata_lookup,
> +				  unsigned int max_l1streams,
> +				  unsigned int max_l2streams)
>  {
>  	const struct ipu6_mmu_hwdata *lookup;
> -	struct ipu6_mmu_hw *mmu_hw, *src;
> +	struct ipu6_mmu_hw *mmu_hw;
> +	const struct ipu6_mmu_hw *src;
>  	unsigned int i, nr_mmus;
>  
>  	if (mmu->mmid >= IPU_SUBSYS_NUM)
>  		return -EINVAL;
>  
> -	lookup = &ipu6_mmu_hwdata_lookup[mmu->mmid];
> +	lookup = &hwdata_lookup[mmu->mmid];
>  	src = lookup->hwdata;
>  	nr_mmus = lookup->nr_mmus;
>  
> @@ -275,8 +349,8 @@ static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
>  		return -ENOMEM;
>  
>  	for (i = 0; i < nr_mmus; i++) {
> -		if (src[i].nr_l1streams > IPU6_MMU_MAX_TLB_L1_STREAMS ||
> -		    src[i].nr_l2streams > IPU6_MMU_MAX_TLB_L2_STREAMS)
> +		if (src[i].nr_l1streams > max_l1streams ||
> +		    src[i].nr_l2streams > max_l2streams)
>  			return -EINVAL;
>  
>  		mmu_hw[i] = src[i];
> @@ -289,6 +363,28 @@ static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
>  	return 0;
>  }
>  
> +static int __ipu4p_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
> +				    void __iomem *base)
> +{
> +	return __ipu_mmu_init_hw_data(mmu, dev, base, ipu4p_mmu_hwdata_lookup,
> +				      IPU4P_MMU_MAX_TLB_L1_STREAMS,
> +				      IPU4P_MMU_MAX_TLB_L2_STREAMS);
> +}
> +
> +static int __ipu6_mmu_init_hw_data(struct ipu6_mmu *mmu, struct device *dev,
> +				   void __iomem *base)
> +{
> +	return __ipu_mmu_init_hw_data(mmu, dev, base, ipu6_mmu_hwdata_lookup,
> +				      IPU6_MMU_MAX_TLB_L1_STREAMS,
> +				      IPU6_MMU_MAX_TLB_L2_STREAMS);
> +}
> +
> +const struct ipu6_mmu_hw_ops ipu4p_mmu_ops = {
> +	.init_hw_data = __ipu4p_mmu_init_hw_data,
> +	.hw_init = __ipu6_mmu_hw_init,
> +	.tlb_invalidate = __ipu6_tlb_invalidate,
> +};
> +
>  const struct ipu6_mmu_hw_ops ipu6_mmu_ops = {
>  	.init_hw_data = __ipu6_mmu_init_hw_data,
>  	.hw_init = __ipu6_mmu_hw_init,
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> index 1a564ceb747..824408b21cc 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
> @@ -684,7 +684,12 @@ struct ipu6_mmu *ipu6_mmu_init(struct device *dev,
>  	if (!mmu)
>  		return ERR_PTR(-ENOMEM);
>  
> -	mmu->ops = (IS_IPU7(isp) || IS_IPU8(isp)) ? &ipu7_mmu_ops : &ipu6_mmu_ops;
> +	if (IS_IPU4P(isp))
> +		mmu->ops = &ipu4p_mmu_ops;
> +	else if (IS_IPU7(isp) || IS_IPU8(isp))
> +		mmu->ops = &ipu7_mmu_ops;
> +	else
> +		mmu->ops = &ipu6_mmu_ops;
>  	mmu->mmid = mmid;
>  	mmu->ready = false;
>  	INIT_LIST_HEAD(&mmu->vma_list);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.h b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> index ff113384c12..8434dd5324c 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.h
> @@ -197,6 +197,7 @@ struct ipu6_mmu {
>  	const struct ipu6_mmu_hw_ops *ops;
>  };
>  
> +extern const struct ipu6_mmu_hw_ops ipu4p_mmu_ops;
>  extern const struct ipu6_mmu_hw_ops ipu6_mmu_ops;
>  extern const struct ipu6_mmu_hw_ops ipu7_mmu_ops;
>  
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
> index b883385adb4..01a7abddd6d 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
> @@ -14,16 +14,23 @@
>   */
>  #define IPU6_UNIFIED_OFFSET			0
>  
> +#define IPU4P_ISYS_IOMMU0_OFFSET		0x000e0000
> +#define IPU4P_ISYS_IOMMU1_OFFSET		0x000e0100

We have already a separate file for the IPU7 registers. Could you add
ipu4p-platform-regs.h for the IPU4P registers, please?

>  #define IPU6_ISYS_IOMMU0_OFFSET		0x2e0000
>  #define IPU6_ISYS_IOMMU1_OFFSET		0x2e0500
>  #define IPU6_ISYS_IOMMUI_OFFSET		0x2e0a00
>  
> +#define IPU4P_PSYS_IOMMU0_OFFSET		0x000b0000
> +#define IPU4P_PSYS_IOMMU1_OFFSET		0x000b0100
> +#define IPU4P_PSYS_IOMMU1R_OFFSET		0x000b0600
>  #define IPU6_PSYS_IOMMU0_OFFSET		0x1b0000
>  #define IPU6_PSYS_IOMMU1_OFFSET		0x1b0700
>  #define IPU6_PSYS_IOMMU1R_OFFSET	0x1b0e00
>  #define IPU6_PSYS_IOMMUI_OFFSET		0x1b1500
>  
>  /* the offset from IOMMU base register */
> +#define IPU4P_MMU_L1_STREAM_ID_REG_OFFSET	0x0c
> +#define IPU4P_MMU_L2_STREAM_ID_REG_OFFSET	0x4c
>  #define IPU6_MMU_L1_STREAM_ID_REG_OFFSET	0x0c
>  #define IPU6_MMU_L2_STREAM_ID_REG_OFFSET	0x4c
>  #define IPU6_PSYS_MMU1W_L2_STREAM_ID_REG_OFFSET	0x8c
> @@ -105,6 +112,7 @@
>  #define IPU6_INFO_IMR_BASE			BIT(10)
>  #define IPU6_INFO_IMR_DESTINED			BIT(11)
>  
> +#define IPU4P_INFO_REQUEST_DESTINATION_PRIMARY	BIT(4)
>  #define IPU6_INFO_REQUEST_DESTINATION_PRIMARY IPU6_INFO_REQUEST_DESTINATION_IOSF
>  
>  /*
> diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/ipu6/ipu6.h
> index 4db9f3d85d8..c70ae6bb1d9 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6.h
> @@ -95,6 +95,8 @@ struct ipu6_device {
>  /* The firmware is accessible within the first 2 GiB only in non-secure mode. */
>  #define IPU6_MMU_ADDR_BITS_NON_SECURE	31
>  
> +#define IPU4P_MMU_MAX_TLB_L1_STREAMS	16
> +#define IPU4P_MMU_MAX_TLB_L2_STREAMS	16

This is fine of course.

>  #define IPU6_MMU_MAX_TLB_L1_STREAMS	32
>  #define IPU6_MMU_MAX_TLB_L2_STREAMS	32
>  #define IPU6_MAX_LI_BLOCK_ADDR		128

-- 
Kind regards,

Sakari Ailus
