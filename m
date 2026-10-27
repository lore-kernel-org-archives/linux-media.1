Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067370;
	b=e/VuI+mzBG6Yl1tmVMvatsrDIlsVnTWTfF/o/lC5tdwrOrwVbH/IduN0ltlrnjQa6ZdX
	 pSOe2i1gfwPi321d0IThFMl2DoBCamzoYT6YBC2LPyBIgemC/IX71fnKxpJ9s2Tbd6099
	 cxr2MW9jT7lAgxPR55Hrs2KQY44VA6LuYtUw13rBGEM51nuE8URUqU1p4fcsrBr7xc5aR
	 ZUzkKKrSgDlLXt8oPqyohSxBvcPIprR+5gqZcXGIbfhjKJLkRqiH1vNPyEnTGHeg3fOjL
	 +BQmsvx3yBgFCEJ0UWEnkZhXQb3PZ7TrGknEA7BzfbJ9RDjtr9T/URruKtASlfBswNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=213hVxaY8zz7NJ3gzXzSYUeeO0Hb0kJ1MH6CZUy6aio=;
	b=ehnftWYHDlERY8D6wjLnlDiq8w1DgAua+O6uyVtSkCcUXi20KECCjooI+hwiJjc5zX4f
	 Ng9YHdHMdcA8ZHaUqBBfsy/cnA9sHLsR71PmzGx1jDUmboMluk746IS/yHL+oZvkjaSGI
	 +NVTjF32Z18Yc4QODwjHV1o4XW8v7m4e/RfHHEIt4Z3flkrrt794cAXxGJdLFCoNZO1uX
	 amZMfQt3ghYfZFrkTWXkXuLTa57+vjAxWmdIpLxXfKJwMUGgLTbiPZGOVUGOCHpQ5XJG+
	 ePxJhVEnDSTlKyLFruXcX4HKWpRAzlDRB4h6u3P8WM6jk8gi9l9hGT6/tNeHXEVVD2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TtZulEcb;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96035606A322
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96035606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TtZulEcb
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2159581f8f.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 19:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067368; x=1793672168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=213hVxaY8zz7NJ3gzXzSYUeeO0Hb0kJ1MH6CZUy6aio=;
        b=TtZulEcbNFyPlav19CVn8JOkrTSk7zs5dARKhv/oeoNxPjJo58m0J8bDm9HAf9vao/
         8uZSan2SUjjiCCDBxLRs8IF5s57PpOn73FCF22A5kq4GpKRfcSDCmUa/Ydya2gdhjRpl
         Ez7bf27k4X4CIx8vN52T+Hib0PJbfYbJXIa1FWytTOLGP7IJp5CmR55JW9w2yJeqbhtQ
         HCDFHOFmOq9K+fvXfhW+tkfafj5ok0zg3TAabBQASrvYyWvCy59VBXNfNj4CLRe2fzP6
         s4M63mxt1ERrLwgQCvR4oWTyymbUt6Fyyoe6QR7IkJ80D4GR6dzBQcz1zrFf+yNjvahP
         S5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067368; x=1793672168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=213hVxaY8zz7NJ3gzXzSYUeeO0Hb0kJ1MH6CZUy6aio=;
        b=N0oF8GQJfdWqNw8Tm0LIUHVDqBNjuroI6w/hf1mKLQx411uBCUaRsUcuj7hveKC30r
         mqWZ5BOgqoYj8BIJBS9bEGTh9dTqohFiYz6Vh+hR68sGRGIWM9CkdkMEmdlgks+y8/Ng
         BMmBRNZCrq3Xk2z7M5QGW9l14JEgjbZg+rfLxZAimmtjMX2sDckbRIRFX27lLq1iDmVQ
         oFLreDyH3h3CjVpMTlKGHdmkaJTQaWJI4R789DxNTfpNGd+gPypXFvBenYxyyp2PG/Vk
         UXJ1VMjHmXMk8l+a1beNjs1wjjD2tnsjyrtTuofp8i6oJYfx5ZFwIKHoqUbh9u8zcAN8
         JZXA==
X-Forwarded-Encrypted: i=1; AKwUvBxXAWv9QyoRzzeHrzq0gBO2BbLy7WXmEpL2ZApqQ/O+2emic6RarvsOIFLjHiCdeSnfiELE+csgEbYnDg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL171gOi9r7JLS8z6GSMNyQmpGS7+gj1xSqTgz4SX2G31bWwrib
	+99hL9WQOSkYUCTvWLjC8fvevLxxG00dK2n6jXyVZr5CE6/tpFi+38t3
X-Gm-Gg: AYBFou0sdyI31KB0iUoCFYa/x3HyR5EdSi/ylg8rVB1t6Or1+RYvjicZsvxRkhY3Y4g
	XLygavcWhL5p6nR1nqZ+IF4REyt1G1Durq4rG0F0oZejGPsDW1TVQkXQRS0KCVODqW7kL5JMvSm
	ciAKHDBPV79pDuY9OA2bcas+qo7Juzk6+xlgZZ+9gnvTIbe/A+FNY0BQJ0ry6iiLl40Lrg24/+G
	ZxbK7if2ckx0pQbRvnkb3iinOPpnTMY9FnrMf5uHWojPdPbP+kTa7/71jGQr2vMf6CjWjpzaf//
	HT+C0nljBb3bACwq8GaO60H1EkoBPTsAiNUtQL3qApvKa1XfCQj6OL2JHkTipSoPGd2PiCRg6uD
	+olnOn0J3/9p/pBcFekfIWkoFe0xOlKscJre+VhZ+VoTiGij/ngdKEqalohkDPWPtUEGm4CNQAn
	8TM82hnaP1LEzOy1kzLrWbeGAPwm/U+7nCoyu3v+6qHGVtGncKqSAOHmHR6uCX8GZOWJNdE8dNx
	ktJg2mxjrcrUcPmihoCVAPcefGG1DD1/BdZ1q4h6WLuFZ6++SENsJUH0x3akk0YlkAemQcWbeWj
	IwB9N3rWsQBPiqDyRC02i4yNnexpAWNXTA+jj00xDiDS2nRTa3HPsZAsE1oQzVl+tbErGra2pcJ
	iqDxsjo3IOhtXH8PrL6ukq9zU/0w0S3wO9rjSyFb7
X-Received: by 2002:a5d:6406:0:b0:48e:202:6718 with SMTP id ffacd0b85a97d-48e3eb8bbe9mr13317253f8f.25.1793067367758;
        Mon, 26 Oct 2026 19:16:07 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-118-122.95.117.pool.telefonica.de. [95.117.118.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm19591505f8f.14.2026.10.26.19.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:16:07 -0700 (PDT)
Date: Tue, 27 Oct 2026 03:15:34 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com, 
	sumit.semwal@linaro.org, jgg@nvidia.com, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Dongwon Kim <dongwon.kim@intel.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Kevin Tian <kevin.tian@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Baolu Lu <baolu.lu@linux.intel.com>, Felix Kuehling <felix.kuehling@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-rdma@vger.kernel.org, 
	iommu@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>, zhipingz@meta.com, 
	treding@nvidia.com, jhubbard@nvidia.com
Subject: Re: [PATCH 23/26] treewide: Rename dma_buf_attach() to
 dma_buf_sgt_attach()
Message-ID: <auAIO0y09SXk34CN@gmail.com>
References: <20261026053623.202642-1-apopple@nvidia.com>
 <20261026053623.202642-24-apopple@nvidia.com>
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
In-Reply-To: <20261026053623.202642-24-apopple@nvidia.com>

On Mon, Oct 26, 2026 at 04:36:14PM +0100, Alistair Popple wrote:

Testing the series on a Jetson Nano exposed this path. A 3 MiB system-heap
buffer was imported into Tegra DRM and scanned out over HDMI. With
CONFIG_DMABUF_DEBUG=y the PRIME import succeeded, but scanout immediately
produced display SMMU faults starting at 0x300000.

Tracing the fault led here:

> @@ -475,7 +475,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
>  	 * domain, map it first to the DRM device to get an sgt.
>  	 */
>  	if (tegra->domain) {
> -		attach = dma_buf_attach(buf, drm->dev);
> +		attach = dma_buf_sgt_attach(buf, drm->dev);

tegra_bo_import() passes the attachment SGT to iommu_map_sgtable(), which
uses sg_phys() and sg->length. The SGT mapping contract only guarantees the
DMA address and length fields. The debug wrapper clears the page-side fields,
so iommu_map_sgtable() maps zero bytes. 

Tegra only treats negative returns as errors and keeps the reserved
IOVA, which scanout then faults on.

This page-side use predates the series, so the fault is not itself a v2
regression. Is dma_buf_sgt_attach() valid for this call site, or does Tegra
need a page/physical mapping type first?

Karl
