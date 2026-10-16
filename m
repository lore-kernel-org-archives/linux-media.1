Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7170F184524
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126514; cv=none; b=ZW9ICirP21NR212yLsSFx8NAEydEL2a7/KjeMMt/SHwrXf91TDp9umWYxYdD1Q/SbUH2xCdNVjfEoLB280Squn7iLJNP27XpeomC+iJNX3FwNLGRR/ny7yBg0V/sNPyn75kPlyxyXXvBxrgfDwu3dEWV29X8/dpLXvZ+QHQW3b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126514; c=relaxed/simple;
	bh=+5iE193CcANOKRFQzupZHipdESjlCYOhgkDtgw4LXK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psgwjN0xYjHwLMRSTeCJHuLGknP3YPMKXUiz2w2M1I09Id5MIXOsqaS1jFizTPNn5xbJ6WZ9Z07Fkaelwi9JmzzwP4BbVw5yhUs3ni54AuRMjTNgmf+thVUXC8FHsOvxXjnHdejVYUwz0YDbEcpkoll6DwR3X0Pk9xPXJ1Uwmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8EUfwo2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8EUfwo2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b042c0759so4370644f8f.2
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 21:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792126512; x=1792731312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQWFKxuzzMgUKGL1MQJ4DQ3TQ8VWfkposnOCjkIVtBA=;
        b=I8EUfwo2IXv3yt4MoFiObtp5FwAQ2cv3I45ygrz/rXXPjGqQHEP4ThXOXo/xR6KvTi
         xqJ2/TsNG2g5esEzKWmENvbOYylvUwSXLRPoXqg8Io5+pHTz9RPeHQGJi11W+tYogpHX
         zSE8naTlPFxzMVieHMMQjRsuj0kjbrPXYrqiPAn5woiso3jN7Eh0xQqzTSj1APWBEKSZ
         0QQGljp2ykby/x1wQh623raILlSEkX0joJa/4P/AbwbUnwNPLePDELH5Ml29BGcVUbxK
         +lcwo8echCMv91JacgVIcUrNXUxTfi2qr4QPLX7C8DwdX3eGtMaLPBIYsN1agvNGaaA1
         jAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126512; x=1792731312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQWFKxuzzMgUKGL1MQJ4DQ3TQ8VWfkposnOCjkIVtBA=;
        b=YnEpwU3XYdgv220Chf7B5/PCGUklmEKcHof58KXEnQgHO9hZghql3dNAlDj0CPfWdW
         o2g+h4qoI5JbfcOtybp1g9hG74i1HZH+/QA+38R5K/GniQbFTcFQTNVIm3PeAKdkr4Kf
         21QupIXCNVmXudrAAohODx84JiW81DhqoKVcFiq6+dHUbPVUZW8ezGINlw4BFvwPaVVa
         vseScwo0xA3NJne8zNkHYOx97QN+jilQhydvKvJPK/Fx4iz4AP8i91C2aMkvt4OGCNeN
         LcncKCgjP+cmuO/TE2ZjG2+P9K1PCrEZDfPvzBo+2CpcljdKj/nfnQMWkVPI2uC+xMmC
         qLuA==
X-Forwarded-Encrypted: i=1; AKwUvByMqy9hM+z8ky+YYBrSW+oatRo2B8ACg2X/m/wW3U1BiqlJJcaB5ui5jXh2WxJmTIKkcfLJQ8Lp1WTEKQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJHnIrqpqM6Rm159VNbCKI7Nn9p7MoC39EybamR995huCtzdele
	iKivyFzLPVqP9Am0llVmDsPxWlOuzUnoSbOpAAeZFQlicIYpZVDhmE9V
X-Gm-Gg: AYBFou1UBMRXjKC9cL97t1peaZ1TcTO9Hl/7WMi2bnGrgBbEFGKAGmdqKsofYS2lIEl
	80PWcWrNgV0neSGzqsfreiqH8dayNcMoz7bapL9UVPfDnVDFf0SZzCjLUlJufPD0z7qqocJhkHF
	oH4uhMOWuRsk5CBaep5XDP+WsQ4Zbw/2z/qyLXsjWllMOtWPFcX0xN9xGkw087b1dIgBCcN+T2Q
	WfUi/CUKOJzSRVglFxzKceTMZZ/GzL/qEujCfHk5lyrWz/1L/IHRa5W+DCzEzlUQN0847UnDWF0
	kpghp6DJlz6OU38S9ieCqOX4gA1PhGoeM6CWoCGc2rb8HB3iGtufwDtGRGTHdugzBx7lXbmvF95
	f0OW15P4s1153cZHCVYUERaPTwVi5B0dAn3OEXsmv3CX/thxoNPA7JexouedP2H/km0xL+O6Hre
	8WPIk0RVBIp4TX65QC0i9JwOPPfFWdzR2jMRbOKS5uGMjs8MnEx49m7v79ppbwMkkI40vGOFz6M
	KyhuV42pva1MXycES/FcEmvEBizYP4RWlj0l6yVCZal1LLfQE0pKt93WzZncMbnXtuZgTS/4MyN
	zD4mkTA/sH7kJoqYqUkwpbTwtoFl8+Yy0mFrzwjjGrnLwq8nKrUjzVUr78k2sRhzh2x4QzqDNbO
	UBw1BZSJe+A==
X-Received: by 2002:a05:6000:4a07:b0:48d:f25f:5a14 with SMTP id ffacd0b85a97d-48df25f5ad3mr9567344f8f.49.1792126511382;
        Thu, 15 Oct 2026 21:55:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50d080sm2455314f8f.53.2026.10.15.21.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:55:10 -0700 (PDT)
Date: Fri, 16 Oct 2026 06:55:09 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] udmabuf: respect the device's maximum segment size
Message-ID: <atGtwBE_zrIvU0ZF@gmail.com>
References: <20260929054835.94118-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929054835.94118-1-kmehltretter@gmail.com>

On Tue, Sep 29, 2026 at 07:48:35AM +0100, Karl Mehltretter wrote:
> get_sg_table() merges physically contiguous pages without accounting
> for the mapping device's maximum segment size. This affects both
> importer mappings and the udmabuf misc device mapping used for CPU
> access.
> 
> With DMA_API_DEBUG enabled, DMA_BUF_IOCTL_SYNC on a 64 MiB udmabuf
> reports:
> 
>   DMA-API: misc udmabuf: mapping sg segment longer than device claims to
>   support [len=65884160] [max=65536]
> 
> Use sg_alloc_table_from_pages_segment() with the mapping device's
> maximum segment size. Return -EINVAL if the limit is smaller than
> PAGE_SIZE because the page-based allocator cannot honor it.
> 
> Before commit 5bf888673e0d ("udmabuf: Do not create malformed
> scatterlists"), each entry covered one page.
> 
> Fixes: 5bf888673e0d ("udmabuf: Do not create malformed scatterlists")
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on v2. It has Reviewed-by tags from Jason and Christian.

Thanks,
Karl
