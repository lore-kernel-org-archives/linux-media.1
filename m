Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF563E40FB
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624353; cv=none; b=k3RrHlPGO8ztUddj8iziWWPq9/G+Fi/cSTyye+yJgMdDQkyc+DL8m/L9dp7W2U8eMWA1FeKQd8Z91dQw0gh3wZH7PvHdsuRar533Ss5y1DH7mjLBPiWmZhOWQd4t7SjElI0t2pNGodvp9Y/Tv+UXb+AmZlG8n2SE39J5XkCxhhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624353; c=relaxed/simple;
	bh=gKwT7S4M/cDKQNhW4/ej6WZYopzIgCAgm7ZN76dmvxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKbjNlyHOUrzcFd8Q9X0hoFgY/cIJkpdriKP1VAypvnNSAqZLalOwW43oWN1p4iygq6FIc0yduTJOBY+1jzR6vROLmyzVDEqiT+wpx4+ryEJPB9UgSTSLVERsEVoIpDOreX7u/7NFaK/zKBVTQuYY0nX+3Pq53i1U04/BlsUaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWVd8RZA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWVd8RZA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so2605809f8f.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624349; x=1791229149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxVLIRI0OWy7GmeotPDiP09/QY2zlDyWkimQu7VpxRs=;
        b=dWVd8RZAwK07BgHovpIEtRipSeTKwAFsGsx3PC1Oxblfd6F0tXGBNThm8jsXXMQF1f
         mbX9IweCyk6n40FE5HlqAb2mayw+hT0dIQ6ObzGZJYh4PPsXj6AUo6iA3mBl58zG2MuS
         9XmKe6Iev37AztI/HwUvBeDjj5+f1XfjfOJW8LR6ptNgkMskj77IFG1X0sFPyp8DS74I
         5Xd7iNUn9v7/J8zHIdMfzz8g6clQi1ExoTSGQ+N5yu2/Qij5qzuaBi+4T4/myq/LF2B8
         drJ832SZzCSkVJiAbnLNFEO15k4QcML3cJXMuimSOkVId5ZdMDInxSNV8e9uzvwBxQjw
         mgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624349; x=1791229149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oxVLIRI0OWy7GmeotPDiP09/QY2zlDyWkimQu7VpxRs=;
        b=QnM2Ck6POdN9zldletE5VoSmeg2ItXu+G7N1t1EC5C8pqlOf+PpkL4XTueV+KLK63b
         51jdiGrbiIIERZUDXgX9kPVZ7FQCWd5FmgUBngNe6xgvOTcqgu+CMlYFO3Ft2ViykRVC
         17R5InA06TKG56g0ueGhVSZ/SveM8vKANvcPEAWiNd3DlKGYHVh4jRANLd5+answIl59
         3+cxwRsw1eM+AfSJVM9wKHb1N2xpbuchDsdZluiIwdtAcy0HnN8JKaAgKfWFMZNwvUAq
         itO1txhGJaIuIGDoDNtyHhALzOvI9fBzw1pXSxF7oH/bSqZs7Z3f+oQEFFQ5yZTv8mNh
         3Skw==
X-Forwarded-Encrypted: i=1; AKwUvBzUO1A4VOcnxMfCIBqtzbuQ/G1p+j1MDsY2cRIfQO1srQE4pkOHCaNsdN13Zu1MpI0Qr8ngaPCxVYKNhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwv7r6+b3ttLGmPwlsppeXsi4CLOPmE15ysBA5w+TicUwzFjCx
	9S3KCTtVlSjNDUgxchQGxL6BpNZPbLy5725XMzdTyjVSuetgqQEKmHZg
X-Gm-Gg: AYBFou2dLLKxLYQJm5ipH4W3uYTwK07yuGucQhB29S1PLn+ivLHtsWR0RyrkAkvBrdt
	6nNk0nXh/b0g71z3IbItQFmIANUOzfxVvDRCFqbk30BPQOMsGYHPRYAjH1Zs1wSHfaCzzFnqXR2
	F75TL8yZJwVPavS/gh3aEsKEE+syYXh+Gvb3jeLqng/wdjtGlf28yQwunuLcXL2YgZN/XWtAjqa
	ngnzC8OLSza850TBo6ui5zfLUmVV+/S/aRVKcebfdL8FJ/Lyhvz32q7+40Qq9PcEroYcejEPUMg
	DVD8+gOqLJ296j98vs5qRJeSfkja99Ez297QsiH8w6Ha4vcyyyDqbXCenlTVregQW4Ag9R0dKEz
	OXvTEkYJ2x9fGSqcvOIuF3xfi9pN/X0odWED9cHi8YEWQQsl+wesf+KpvKJ/YyX5ktgjOTgdm23
	vYtHqzmvBKPNxrTMntpwLVusUThSKQGzYFZSV+uBGLdivOfj4/BSaecjsghT7NA6ovY47dcWHDN
	JfBXf4HcE3UDeCtGCqmnRfIiUvFTM20hNGLJHLIvt0WQIEIy6+ZbIzyscJ8K1iqBoyF44tnSkyY
	BlTtdlCfPuPAediox7znlzD3BPu/BO0ZBAN4h3yu67Iay7X3sRABAS9J/fKqXOc8VEEBLao7sg=
	=
X-Received: by 2002:a05:6000:3104:b0:48a:eff0:c31d with SMTP id ffacd0b85a97d-48aeff0c6e7mr1174394f8f.38.1790624348461;
        Mon, 28 Sep 2026 12:39:08 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-acba-a601-4494-3582-465b-0eab.310.pool.telefonica.de. [2a02:3100:acba:a601:4494:3582:465b:eab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm29487793f8f.26.2026.09.28.12.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:39:08 -0700 (PDT)
Date: Mon, 28 Sep 2026 21:39:05 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>, 
	Bryan O'Donoghue <bod.linux@nxsw.ie>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on
 DEBUG_KERNEL kernels"
Message-ID: <arrAvk4aYQ4sDEzN@gmail.com>
References: <20260926022026.10539-1-liujianfeng1994@gmail.com>
 <17bf71c6-2442-4eaa-847d-29ef625870bd@amd.com>
 <CACSVV02WCQwQy9BpUUqziQTtKV7QyJruiM+iTiLE_SEVKtpVNQ@mail.gmail.com>
 <50a9c1f1-6889-4bd5-b4f7-0500d30d3dd9@amd.com>
 <CACSVV02BPHGeGFo0vs8-Q2JvcvQ_gw_xe4kZj_nuzk8n6sW7kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02BPHGeGFo0vs8-Q2JvcvQ_gw_xe4kZj_nuzk8n6sW7kg@mail.gmail.com>

On Mon, Sep 28, 2026 at 04:21:41AM +0100, Rob Clark wrote:
> On Mon, Sep 28, 2026 at 3:48 AM Christian König
> > What I can offer is to set it to default N for another few month to give you more time to fix things.
> 
> If it is disabled by default in distro kernels, that sounds fine.

Another option is to restore the earlier DMABUF_DEBUG default for now,
although off by default is also fine with me:

	default y if DMA_API_DEBUG

I would like to help fix the affected importers, and have started work
on several of them. Beyond msm, my LLM agent found paths that use the
page or CPU-length fields of imported attachment tables in:

  - rockchip, tegra, rcar-du/VSP, omapdrm and xen_drm_front;
  - tegra-vde, staging ipu3, pxa_camera and sur40;
  - fastrpc's SECUREMAP path;
  - the IIO dmaengine buffer, USB FunctionFS and UVC gadget DMABUF paths.

The host1x imported-buffer gather path also looks susceptible. There
are less severe cases too: amdxdna rejects the affected import, while
mali-dp loses MMU prefetch.

For sur40, IIO, FunctionFS and UVC gadget, I have reproduced failures
and tested local fixes in QEMU using local device models. The other
entries above are findings from source inspection, not hardware tests.
Some failures depend on the architecture and configuration, in
particular whether NEED_SG_DMA_LENGTH is enabled.

Unfortunately, I don't have hardware for most of these drivers...

I think the drivers managing their own IOMMU mappings also need a
clearer supported path here. Simply switching from physical addresses
to DMA addresses is not generally sufficient, since the latter belong
to the attachment device's address space.

I also have a draft warning-only mode for DMABUF_DEBUG that I can post
as an RFC. It preserves the CPU fields and logs suspect accesses
instead of deliberately breaking importers. Coverage is incomplete
and the underlying bugs still need fixing; strict mode would remain
available.

Thanks,
Karl
