Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D0375F69
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371167; cv=none; b=QUa1qIdsk64eX+XfYiquI5bnlr//voHU4gN1EXnx1EjxMhOewQT2LYEbq77ZzPWLXkWUb2V0tPQu1zzW0ZBTE6H1aGilk2gNuE2RWCAYqItrp0C/VaoHYUWy6m0uINu+vhgctlUg3R9RgQuN9wEXBJgPaS+cGv8xpiRl9qVaUFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371167; c=relaxed/simple;
	bh=ukYqhyi0RGuOSajWaOkTQRPODSNPDMI/uvdyQNdZhaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3d22PCP3XGyaOqK38ArfN7my1PuVMl47Xmte/h9Jo+A7dYJ4ZSSXKwbSSp69ww3nqv30i03MUpmWME8mZ8euAsWWjF6/ElSds/sWubtrVLfKdrT9DpeIzOVEMsaIGHVI1+Vb0qA6FPGHOCWgLPKbt2jbeov2NUgHf284MzXqhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MS5P6Fdx; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MS5P6Fdx"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-90ce3971a86so13154136d6.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788371165; x=1788975965; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezr6Kp9rH9+35ejy6kYQ0m2wIG/3JEQzG3offk+MEvQ=;
        b=MS5P6FdxRTf6zZMhQdQyRdyCYJgoZHjc+ksJJWvMOaQdqxglDX+yxi/yZD7mioXPLX
         tinPOUIPNe4cwKb1skSYehRaoBNvQksly4nD3FYSKBf2p+yEM+Cf6Qx0GxpBS1ZfNAKD
         65Bg27dO99juvhMITqqGWJugJFBF/6rnSdoFrSu87+juUCmCYuUo2jV90QcGVyc/A17I
         A9Cs7klleg/fgNhuFzm8uUd/6kXEBxuMzgLsyf5OIzFQzOpJiCkNiJ8cyB5u2EIABZDB
         ohKUoHMIld6Z5OIjs77jo+R7syxC4oQEIF6UZcrFKDWgirEn6ZXesTjWOvf813r7nFXp
         6Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371165; x=1788975965;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ezr6Kp9rH9+35ejy6kYQ0m2wIG/3JEQzG3offk+MEvQ=;
        b=iVCHXja7P4XRnNcNzB22ESbJgtlvGhvsQhIE6DMuA8dhkw9xRRZPJL/iVPzomufho8
         ofxfwraicpzm+XXZZbFgBavZc5GGW5loM6inWQAehoVeSJgYnDfF4C4VVWoB5Wy8wxC8
         yhdeV8pjioN6lGLaAViq8FFr+1txVs/MO+CI/Lr9nrfcYDZK2m4to7XaAVn5tSQkthDS
         GSK14G/TMu5ksr2YkEu3Voy8ap2IlZZh7Qr9wRWAQGOUwjbZ8MuZ+dIf9uWQ4oOipgPe
         aa0I2TDuN8ICuusesuxk34AWeB2lqk7eWARS+9ayGhpkM571cB747jcaB+fcQpa/Ghw0
         olHA==
X-Forwarded-Encrypted: i=1; AKwUvBzB3lBcNBij0UwOLZSsY+wN6/jGWbV/TxItVfXJ9t//sfj823Ptjk2l7CDDGsMgYaBKlbsLsz5ABEXMiQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mViy2/K5DBv8cFeAC27E7JcFPiK7n39NBXRCb2++UylLRVon4w
	k3b/VZsNcUiUgqMHfDzmbRuU6qgTxYs8vyakSAtNmtLxNY62ryBShY3zZx++13BGkvoONzKd7uc
	c/s5B
X-Gm-Gg: AYBFou3pmMoPtgYN4fWfqEs1SJqdmD0i5R1+OYewK9cMKfE7Nn4ngO8RBlyxt6aKQ1x
	v06z1nCXvXzStvMAYdmH6yBj4MtOgMtbUck8V64kqHErM7yf4XsJurbXZCsVAudP95B8ATyeQQA
	aKtHOmqO4A3HdzYbTk5yBu93xfapMKVlQe2de7p8QGKeI9Ts4RNdiCd+UUf7bn1YQBcbWLYRlV9
	VgJmm4KqYTLxYmFDOkFNpJJsifSz0r32T49Q2pM5FahQWFrcieoAyYCUpGHF+WKd4bix+LHaEcU
	21+Df4Tfj54I6WnGJHFI4kHZ41skSgxnpH9vjeSEt3n+Y0nddYnL94BOQh0ponjELMuoZM4AUr/
	9NTiXAcI0X/+QFApegRnmjhoBv6W/u/pxhL6MqqMptKB0yPlWBgea2BevxSaI/NwVikNdVKlGOo
	ZCc6sjonU/BJlfNO0Ww7GlT2CKSlzmmP2YtGAYQ2isx3RvMqKkGuM7nvhDx6QuegSwOJxjriWBl
	W8viP4tcUn8aLmZg3LjsCDUCMAQ32tfITvvETk+LFT6khs9F2876ygr
X-Received: by 2002:a05:6214:2a84:b0:910:3453:7d8a with SMTP id 6a1803df08f44-91034538000mr9552376d6.31.1788371164336;
        Wed, 02 Sep 2026 10:46:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee41b5dsm23518966d6.21.2026.09.02.10.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:46:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1p2B-0000000Emsa-0EzE;
	Wed, 02 Sep 2026 14:46:03 -0300
Date: Wed, 2 Sep 2026 14:46:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, David Hu <dhu@x6u.co>,
	sumit.semwal@linaro.org, alex@shazbot.org, ankita@nvidia.com,
	chriscli@google.com, david.laight.linux@gmail.com,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	jmoroni@google.com, kevin.tian@intel.com, kpberry@google.com,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, nicolinc@nvidia.com, praan@google.com,
	sashiko-bot@kernel.org, stable@vger.kernel.org,
	viursachi@google.com, xuehaohu@google.com
Subject: Re: [PATCH v8 0/2] dma-buf: Fix silent overflow and alignment
Message-ID: <20260902174603.GE2890729@ziepe.ca>
References: <20260901170849.4052816-1-dhu@x6u.co>
 <2bf581db-7cc5-4f38-a075-1b988c332f3c@amd.com>
 <20260902073936.GR24140@unreal>
 <aed39f83-6340-4fe9-890c-6d5f340c97d6@amd.com>
 <20260902083232.GT24140@unreal>
 <aae19599-2ba8-41fd-b3a9-b1f80107f563@amd.com>
 <20260902095338.GU24140@unreal>
 <65dc4ca1-6882-490d-baad-3e0abd708af3@amd.com>
 <20260902105919.GV24140@unreal>
 <7471c6e1-fbba-4430-a196-3f57a73505b7@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7471c6e1-fbba-4430-a196-3f57a73505b7@amd.com>

On Wed, Sep 02, 2026 at 03:34:18PM +0200, Christian König wrote:
> On 9/2/26 12:59, Leon Romanovsky wrote:
> ...
> >> The PCI_P2PDMA_MAP_BUS_ADDR is not supported by DMA-buf and as
> >> far as I can see is a complete dead end.
> > 
> > Maybe you mean DRM, but VFIO works perfectly with
> > PCI_P2PDMA_MAP_BUS_ADDR flow in DMA-buf.  What am I missing?
> 
> Well not quite.
> 
> The approach PCI_P2PDMA_MAP_BUS_ADDR takes is fundamentally tied to
> only map a physical CPU address into a PCI address and doesn't take
> into account that in a lot of configurations the CPU can't access
> all resources.

It is called PCI P2P. If the flow only uses PCI devices it should
always work because it relies on PCI spec things that happen outside
the CPU.

It does not try to solve the general embedded problem of arbitary
communication between blocks inside a SOC, scale up networks, and so
on.

So, yes, it does not solve every problem DMA buf faces, but no it is
not a "Dead end" as it 100% solves PCI to PCI communication which is
still a very common use case.

DMA buf users that are exporting from a PCI device, over PCI MMIO
should be using this API. It is the only way to do PCI to PCI
communication correctly in the kernel.

Jason
