Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770109;
	b=cnUkjUOD0zES9nN8J6pPamgGbizSjvQE9pxf5yt7Ig7QCKZd0Mikm99DSBC3CbRuYyvC
	 LoYmqIyCMngbhaJR1BBMTKHz8YQ6zATClsjJVabLg6D57VIIKZ/kTv3/3D3sGE+D+8ZCk
	 wlR73RZ07D3xcy98x3tcgM/Km72mVyV+8f+GUEtRULupo+admxkJSoJD+tpFEBJLcS0cz
	 5+eR7NfSDOMZvX9/kkWecG9nMWumayC/hxIc8LUVbMGoJUPE+bFGroW9BCCGshinxY4b0
	 NBolu5W3s3n7m70C7gMkD46nuptwiH3BnTiPMWLTAd4ZuF7IPh0gvBT9OC4/+boPBCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=p4zYTNJnmB4RId87xSly9GxhAKztPRW2cESt3l+Nt3I=;
	b=SFwcNbfkjPXZEeEsElWor6tJprIwoI7LXw1zyUaiawfQphrdfJ69pV7hw2Puz2PoT1v+
	 Q7fshTQezsUvK6bTQGTZRSaJIECO0ffQdneByY4ChwCT5+uyn28ojV6YEs2oUES6LOYuX
	 7JgvlyRWziPqXKuA6mDNoOOZHrlePZfF9RQ0kYSgaTTmQa/oZgTuF+fhzDidmMYr4sG0T
	 7lZtWGpR4TTABdjwVjs4fyPhP44fH998vW82+mxjjeqBRrQpbCpchi6tNBA5Bu3bOFoY0
	 7VMScNbwioazMfnb2hEw9TcNRvVdWccj49bLfP4kjJxqZJ8hSRdqtxx2415j6gkSxrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lYDGdzjn;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410FF60A3827
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410FF60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lYDGdzjn
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso736645f8f.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792770108; x=1793374908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4zYTNJnmB4RId87xSly9GxhAKztPRW2cESt3l+Nt3I=;
        b=lYDGdzjn8pKbo+YhF06SzfnDnRwEEHJoSmKxT76rJHZAROQiABUwV1j1d13KMePWX0
         PaMZbvOu7xKgfKSWKhxwl+GJVcK7sAQU3Oe6PbouioBnfDR9rq6kGFlY1BMJ3w7DStim
         Ig82unhCaPXT+WRxrp7LU9OU1rjCgc2WXAOZdgL8JOW4tVZLK7EI4nYrlY4xtVXFRaD2
         cpBCflm39zzfIW6fd4t4DIgs+71qcxLRU2NO4sFjVPatmy4G4SImlp/IOAH1vO7eGndK
         CcaNIj7jGfza+lqfg1f+fcLTRXbkSck2WE7adfoUVFLaA+L/+3lDOG63cZ1K3+519ZL+
         rcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792770108; x=1793374908;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4zYTNJnmB4RId87xSly9GxhAKztPRW2cESt3l+Nt3I=;
        b=jphh7H8IgO7psDQVKz6mp4cQPFq7AjtrdOynD8G0N5d9BoPowwhsOxPLQAhoWyWOEh
         fzT8B9w5Qs0g0r8J6kNVpG6uFpYb3Ydk/v95NY+3I0ikftKYBYn8aOi/FVFpQfd9mtA4
         qqV2J6EEKl8Rpm88vUbDBgMn4L2LcrfVU/KBVXfe1/6rovrc0UixysUFMSiGC29f7xZo
         2Awjxu1k9MPsqls/VOn0nNRV9TMBk9QYuBVCZ3udLmp3AsAVAxoliDP5ePrcmXPnDSb6
         oTapTf3eKV0Q7fXWkgtL/BlyX1KuVY76vGUpvtrSq9j1cxpLnKggphS3cbM9145WwWQO
         Ti7w==
X-Gm-Message-State: AFq9FYIujLcYTqkpB7SUcN5Up0nfGWBcap7DG4HaeRGn7XkEoT/I6+nd
	AJC7tpzN1P9eyAjpO0H6vHXSEforMJaBJdz23KseSqeN8t234qzNQD+ShLFdzp4/UBU=
X-Gm-Gg: AYBFou3/otyvnG64KSqqrM4isZWzsNTBThmX70gp25ONLs7oYIbFofHdgQVH/aqA09k
	DN8JDkSNA46EqDPb5xk8PXlQ6Q6MtfbICo6FJK0Y2clotnNXhHn36ZhqgGB+/Mk2AM0FiKLXKpN
	E1j4HDxfVMUN2r1BOLBl48cYXf3RCW7FIbPHqmL4UKnZCw+X7ux3+4euK1XrBvSFNRtIuPXH3dE
	EnibltJMyewyzg/Eq8HZ9nZuV3Qo6AWLfMX9Ypo0xVKT5Pji6pxu5Xa6NsUrxCLA9p+Y2ABWgZA
	eCsdTVc5W0oXm77IZguv6r1dFU3eBCeVay+PqU+6mkjZfqGpVSv/Z1BShCxH7p0WfLCf7LjOEtH
	QSx+MP6iUN9EhmZKoo93rur1LP/hyEn+Wk9qbqArtCeCcGTEnVQw6M9Mwzz8yEu5aVMb0Uah6sB
	JRfZJOrVUkE9f54W60tdLeRUok+cXWMllxSPkqjNJ/M/31ck/rl/+XQCkjLH68N8zSuq2m6J7d8
	iK4t5aJsfoynDDqwkJQoPO88KsOL7Qrr3ImGabcFkSunNEYf8davNTq6M+QdWVv7sXl
X-Received: by 2002:a05:6000:178a:b0:48d:f58f:c98 with SMTP id ffacd0b85a97d-48e385a5db6mr4346612f8f.40.1792770107560;
        Fri, 23 Oct 2026 08:41:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d400365sm532405f8f.25.2026.10.23.08.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:41:46 -0700 (PDT)
Message-ID: <99a419c3-81a8-4b37-b9c7-2dd56978162d@linaro.org>
Date: Fri, 23 Oct 2026 16:41:44 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 07:34, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> Introduce a new property, "iommu-ranges", to specify the device
> specific IOVA ranges when there is no backing "reg".
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/iommu/of_iommu.c | 128 ++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 121 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index a18bb60f6f3dfdba853b6e16dd2a8616f6a731c7..9766a6944d0e11a6cd8b74b1b89428acffe3dfdf 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -190,6 +190,111 @@ iommu_resv_region_get_type(struct device *dev,
>   	return IOMMU_RESV_RESERVED;
>   }
>   
> +/**
> + * of_iommu_derive_resv_regions - derive reserved regions which
> + *                                are outside of iommu-ranges
> + * @dev: device for which to get reserved regions
> + * @list: reserved region list
> + *
> + * A device can describe its own usable IOVA ranges directly on its node
> + * via "iommu-ranges". Everything not under those ranges is derived
> + * as a reserved region so the IOMMU allocator won't use it. Entries may
> + * appear in any order in the property.
> + */
> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> +{
> +	struct of_iommu_range {
> +		struct list_head node;
> +		phys_addr_t start;
> +		phys_addr_t end;
> +	} *pos, *new, *next_range;
> +	int size, prot = IOMMU_READ | IOMMU_WRITE;
> +	struct iommu_resv_region *region;
> +	const __be32 *maps, *end;
> +	struct list_head *prev;
> +	phys_addr_t next = 0;
> +	LIST_HEAD(ranges);
> +
> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> +	if (!maps)
> +		return;
> +
> +	end = maps + size / sizeof(__be32);
> +
> +	while (maps < end) {
> +		phys_addr_t iova, iova_end;
> +		size_t length;
> +
> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> +		if (!maps) {
> +			dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
> +				dev->of_node);
> +			break;
> +		}
> +
> +		if (!length)
> +			continue;
> +
> +		iova_end = iova + length - 1;
> +
> +		if (iova_end < iova) {
> +			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
> +				dev->of_node);
> +			continue;
> +		}
> +
> +		prev = &ranges;
> +		list_for_each_entry(pos, &ranges, node) {
> +			if (pos->start > iova)
> +				break;
> +			prev = &pos->node;
> +		}
> +
> +		new = kmalloc_obj(*new);
> +		if (!new)
> +			continue;
> +
> +		new->start = iova;
> +		new->end = iova_end;
> +		list_add(&new->node, prev);
> +	}
> +
> +	if (list_empty(&ranges))
> +		return;
> +
> +	if (of_dma_is_coherent(dev->of_node))
> +		prot |= IOMMU_CACHE;
> +
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
> +			if (region)
> +				list_add_tail(&region->list, list);
> +		}
> +
> +		if (pos->end == PHYS_ADDR_MAX)
> +			goto exit;
> +
> +		if (pos->end >= next)
> +			next = pos->end + 1;
> +
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +
> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> +	if (region)
> +		list_add_tail(&region->list, list);
> +
> +exit:
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +}
> +
>   /**
>    * of_iommu_get_resv_regions - reserved region driver helper for device tree
>    * @dev: device for which to get reserved regions
> @@ -214,10 +319,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   
>   		memset(&phys, 0, sizeof(phys));
>   
> +		maps = of_get_property(it.node, "iommu-addresses", &size);
> +		if (!maps)
> +			continue;
> +
>   		/*
> -		 * The "reg" property is optional and can be omitted by reserved-memory regions
> -		 * that represent reservations in the IOVA space, which are regions that should
> -		 * not be mapped.
> +		 * "iommu-addresses" must be used in combination with a "reg" that provides
> +		 * the physical address and size of this memory region, for an identity 1:1
> +		 * IOVA mapping to that physical memory.
>   		 */
>   		if (of_property_present(it.node, "reg")) {
>   			err = of_address_to_resource(it.node, 0, &phys);
> @@ -226,11 +335,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   					it.node, err);
>   				continue;
>   			}
> -		}
> -
> -		maps = of_get_property(it.node, "iommu-addresses", &size);
> -		if (!maps)
> +		} else {
> +			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
> +				it.node);
>   			continue;
> +		}

The if/else doesn't belong in a path entitled 'Add support for 
"iommu-ranges"' as this changes he behaviour of iommu-addresses 
independently of whatever iommu-ranges does.

The reg update part basically has nothing to do with this series at all 
i.e. the code you depend on later in this series doesn't declare 
iommu-addresses so... this is an update to align with a DT schema change.

https://github.com/devicetree-org/dt-schema/pull/207

Perhaps splitting this into two patches as an iommu-series would be best.
>   
>   		end = maps + size / sizeof(__be32);
>   
> @@ -258,6 +367,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   				}
>   				type = iommu_resv_region_get_type(dev, &phys, iova, length);
>   
> +				if (type != IOMMU_RESV_DIRECT)
> +					continue;
> +

If you look in iommu_resv_region_get_type() you can emit

         dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] 
as reservation\n", phys,
                  &start, &end);
         return IOMMU_RESV_RESERVED;

on a mismatch - which is not what the code will do now. Mismatch will 
warn and then not map.

So maybe dev_err() saying you won't map - in the new patch for reg. 
Either way this isn't a change specific to iommu-ranges.

>   				region = iommu_alloc_resv_region(iova, length, prot, type,
>   								 GFP_KERNEL);
>   				if (region)
> @@ -265,6 +377,8 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   			}
>   		}
>   	}
> +
> +	of_iommu_derive_resv_regions(dev, list);
>   #endif
>   }
>   EXPORT_SYMBOL(of_iommu_get_resv_regions);
> 

