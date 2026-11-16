Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819747;
	b=deC0qYejDn5+IcSGI+5EIIXjIZtuLkziaRAKO1OskjZQ8k1bMgY1fwVB6NkDlh+Wkrfm
	 RqtoPbyWWr51PN2Cl7ObxLYhPE1glDqxr+lgKcmQhhzSTRH068NDl4h1Wv0lI7LTd7n+H
	 J8Im7awbncIP7aFYhexzcpVO2z6PMtqduWZLS8EXFFWxfchAz0ZGJKA8bZgrEiZfpQVmb
	 ObA41GMoT8WyUr7oNUP6ldvQmBCOEuvHfBZObLne5VIUAiGH/JIuEEMzR1NG6MQInfACq
	 dxV+gtScHR2LPTWG4wsD9ssj6QzLLWru+15unwazL+cfML8z2W25nk1z26ALg4Ezvpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819747;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yHnVScOHuhZN1AjvBYgj0ZqzQ8oQAYw2e+C+Vx91DKo=;
	b=MGFAdtvT26Ym7+vpsejmLb1HOhkoQaOEivlwScCNbPsSvhHl2pQZY2/MhTzjGvW7AhbY
	 FnJOa1fZosW69kzitzQT4L7Vie+QoTofga1OLi8bgu47uQ/Cb5Bv+b9MTv+w+gEPY3B8K
	 UjjvLNppOMCNOs2KHXoy7U2ej2z7hhX/Nfo4DYK/m9dpSTYL0AAGCe3n4VNYBsAxLE9Nj
	 NlNmaCjGpNwmJkcZUcWy+BpRHvnwr+3Dr240gw4ZkpErXzfgkd1qbS91711ifGSzllntu
	 0jzmoLS3ET19g2uU9T+WX1GqBp+FcAh/1UgxaK2Dq0EOXKDOIWOKtAx1UC+gXoTpPmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FYhUn2GN;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43717606A31C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43717606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FYhUn2GN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794819747; x=1826355747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DhLkCFPj1bj71kroFdaMylmIwbQUEsYUD/B11XGgDOA=;
  b=FYhUn2GNxVHlqU9GRmIzCBeDTVBG7xx+2LCkK8MdFRQ8dUUEen7TNYxk
   D+1nPkrchMo3+sHtGEg1mfKCA6z+/wRtHf6DQDxhSgXPLJKSoNvUmzmGq
   V7GSen7sucdtu/WtRDSnteOLW7nXEbQYkCORoGKchEJQfbrpqbvcK0dyb
   OuK440sbNCKdSIrS+aXpkqgHstKjDR+HxSA/GrlcuupkKsKKObNCH3Tnc
   BrTLZLYqhEnq7iGh/oAyggO63Em9SLgdYzSzO0g+JWbN2WTH9z5IJpVY1
   qRPSYTTzMMabjPuU0ocKIIxAm5KESEKhVLSpIETFEHKDchayX247WiQA4
   A==;
X-CSE-ConnectionGUID: 9GuG+7y9Tz6K2tFGQL07Ww==
X-CSE-MsgGUID: FMXFPfQQS5KdDeH7bc5bgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3580641"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3580641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:02:27 -0800
X-CSE-ConnectionGUID: hXbqzJSKSA+P4bZ9bv+B8Q==
X-CSE-MsgGUID: 902v5n5FQZKfYRcIfHADSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9327058"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.87])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:02:26 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 32959121B5D;
	Mon, 16 Nov 2026 11:02:29 +0200 (EET)
Date: Mon, 16 Nov 2026 11:02:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, lsa.uz@pm.me, sarang.sapre@intel.com,
	divyamani.tripathi@intel.com, manik.bajpai@intel.com
Subject: Re: [PATCH] media: ipu6: Enable snooping on ipu7 isys buffers
Message-ID: <avrGpX80leiMM90R@kekkonen.localdomain>
References: <20261116085650.991445-1-antti.laakso@linux.intel.com>
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
In-Reply-To: <20261116085650.991445-1-antti.laakso@linux.intel.com>

Hi Antti,

Thanks for the patch.

On Mon, Nov 16, 2026 at 10:56:50AM +0200, Antti Laakso wrote:
> The capture buffers are not cache coherent by default, and CPU may
> read stale cache lines. Make buffers cache coherent by enabling snooping.
> 
> Reported-by: Sergey Lebedev <lsa.uz@pm.me>
> Closes: https://lore.kernel.org/linux-media/20261007183311.24637-1-lsa.uz@pm.me/
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>

Can you provide the Fixes: tag?

I think this should go to v7.4.

> ---
>  drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> index b1211e24562d..dd7b3ba3b468 100644
> --- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> @@ -214,6 +214,7 @@ static int ipu7_isys_fw_pin_cfg(struct ipu6_isys_video *av,
>  	output_pin->link.pbk_slot_id = IPU7_MSG_LINK_PBK_SLOT_ID_DONT_CARE;
>  	output_pin->link.dest = 0; /* IPU_INSYS_OUTPUT_LINK_DEST_MEM */
>  	output_pin->link.use_sw_managed = 1;
> +	output_pin->link.is_snoop = 1;
>  	output_pin->crop.line_top = 0;
>  	output_pin->crop.line_bottom = 0;
>  	output_pin->dpcm.enable = 0;

-- 
Regards,

Sakari Ailus
