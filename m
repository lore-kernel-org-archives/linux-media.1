Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C6843D4F7
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974265; cv=none; b=JqfOIoNN3JmYoZkIionIa6C3Z31PezKBEP+3YkO5/n4TMyM8tfS2dzYnUNnOZgeDAgo8JaI8lPsGhR/JbMVAqjjwAG9KBmX8t1vFP+/fMKA9mh+e14yRbRWEyFbIxNLgI7JsVfrQCR09wCbd9z4oXUoxD9vh29hdoh1u0PfMi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974265; c=relaxed/simple;
	bh=l1KmbxaSn1vlCmlCKqGoPg+3lItQFTLM7H5zRTTjdlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BE9C2iXcb9HXoIYPM8Ht9couf0btw/bx4xpKIy+wfjd7+rYrD7R/rk+J1tf+MtwHmg3wnEESYwElrvfrGnJJcTgScZYs9YQ4e2iIBNAt4GxKmIGfPwMhzgraV3t6RDag+W+1ueJsBvnjpWYo00PV0YxlETs5YTJzs8S9CqOre6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RVkUNc0K; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RVkUNc0K"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8f186025973so31619986d6.0
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786974258; x=1787579058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BS4TBmNsymnramXeNmNZhBmFeFZI0B72fRANMpt3ZzQ=;
        b=RVkUNc0KMftYqkK9LnXuOyZH3RRmadeGsIi6gpMafdHwUPE8M4GL9Mz69lBOAX+V7K
         DNZ3qCkulYlUBmIZ7TKWwCwOBm7thT4MEWlp6tNQrHwGVPLR/8wEIo1sg05EHAxH15l5
         W9kVXyn+ZYj02e8oOXVUMe1N5a2dIZJbyDQAsQGr+5i/gNxb/zjqInZLxqOMxfkyRS7T
         GwZIUungtXEJbgYjmQTmcqprcgd7rfFX/Cd9IMyTCGnb/W4jpIzzMBWVuw4DIing/4cK
         TkfHsPyGuxDGvJWeNVlm2U/6F4g1xoyeFKAEt50UZQU3A+wUGMIqallRWh+FgBS08qLY
         022A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974258; x=1787579058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BS4TBmNsymnramXeNmNZhBmFeFZI0B72fRANMpt3ZzQ=;
        b=GNYqlVwnPLGcM261rX/p8QcZIYwxBryRZvwc04TRXfw52MJbkiJDnD6xnKVNk/xrDO
         RcWMvgvxdbN57aYYCXFE13o3Nk2kRW+JBYfOdYsuDBze/orluBdrmH/rJgczVEjmMan5
         fiJ9VsRHLsJbyc6jOwsXlvyMF9ftxjPX1EmWW9tWl3mUF+ZIhzcOtiTHGOMAj+FsQJOc
         PT3iet2PIIKQGvWTKeBh7FcrERZ8Vkv1MLfhbTDXaj6N6ohuCxbReBPB0w8Z/JTiEZbz
         OQhXSZpNH7jS+f+idJpawUL8/frjHGQjmLjiyXYtEw+qAnG43GkPh93ZZgdc3Y0oEK29
         EHsw==
X-Forwarded-Encrypted: i=1; AHgh+RoJQ2s0GjVmMQY5bA/lS4uqXxwu2FzvNKmRjczErCNBiV9GgFXDtkG6e8bnP3AsDMC+smPdsrgWmQJTMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIbqLVMHxzDMJWb6hui2AdGc1PQmjv0i35AoL55CgInEHP+oD4
	62+gzyZah1JxgcZwzm92NQrcrCD9isRP8V7SJVtunV1J2xrzoTvEqFFS/Cm0VsV309U=
X-Gm-Gg: AR+sD105p3lqV+CoPr0QiRQIrGJcI4Y8PqOKDJnHlRSL+ePjgWpB6R67rwGfK8iHWHH
	TlNdE7/eI9FMtTswIfZmMS6/03GhVdQv+FmDCqBaUVqiVxZMFzmyY2DTRYsJj+mdpqGv2Gn5Y1R
	RiePSLXqku58nKj1eICaCwCmKkMAWOPTPGH3YcyEiyzd9AxdHMoloDiJE87FA64agG9dKo+9ajQ
	Bk0kEjdwFJP8B7JMUtIRrxNcfCC6Op6aXEs7yXtefT+rPlFrAimcugARiLegLYfJnlhq2F+kWiX
	4C4YZdw/G1eGQkapiEDUblVLrxrCc7m4mB1d85SG/cKN5Fr8tIDR5USMrbHzvXubJzxbWvpfyvN
	qRSZ1pv0k/00CYiKTvv+lK4KtdEMFUqkH6Zn2xNg++egkeeysm/M9xeT7A3WEkbEGWNouie+JrP
	qJhmK1/37vOBgbCA1w+flFQZT1mWluu9mgw0+Ok8YNks9HmVBc
X-Received: by 2002:a05:6214:2029:b0:8f3:e97:59c6 with SMTP id 6a1803df08f44-90a91dcd1eamr322787926d6.20.1786974258222;
        Mon, 17 Aug 2026 06:44:18 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c45986ae7sm9166026d6.48.2026.08.17.06.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 06:44:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wvxdQ-00000005wLX-438N;
	Mon, 17 Aug 2026 10:44:16 -0300
Date: Mon, 17 Aug 2026 10:44:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	srinivas.kandagatla@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
Message-ID: <20260817134416.GA1415075@ziepe.ca>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>

On Mon, Aug 17, 2026 at 10:17:40AM +0530, Ekansh Gupta wrote:
> Register the QDA compute context bank bus (qda-compute-cb) with the
> IOMMU subsystem by adding it to the iommu_buses[] array.
> 
> The QDA driver creates synthetic devices on this bus to represent
> IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
> so that the DSP memory manager can enforce per-session address space
> isolation. Without this registration, the IOMMU subsystem does not
> probe CB devices for IOMMU groups and of_dma_configure() in the bus
> dma_configure callback has no IOMMU domain to attach to.

I didn't notice a clear explanation of the proposed DT schema for this

But it looks awfully similar to the other driver that was creating a
kernel synthetic bus for actual real HW, that wasn't well liked.

What is this for? Why can't you have a normal DT binding for the
iommu with normal devices?

Jason
