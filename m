Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C012DA762;
	Mon, 16 Feb 2026 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771248819; cv=none; b=KNMCNhEtDVgDHH2O3h1oQkrI2JSaPrCgTHxpqXV+vBS3Oi/Vxy/MDnDoDZW/9yrsY80wpGodh9f+w5Y/jXMFGOvdwmoi7FmX6YzN1ZzmF3Xh/Gpw/NcOqS/+muy+bveBt9dDOSvGSz9r2mWIzoe3UfcKVKuNGoV2S6kOirqzyjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771248819; c=relaxed/simple;
	bh=4xUKrRwoa1mIk7MvSEGD7auFGq7ILzxeSPtTqhgpsgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAk+cAARYm2Dlrztgv+h/h8cBdP1VuGthS11bN4lw34qbjUXjU2Qrdt3IBGHX+RAPedVuOtSTMwUk4X4mkzPr7cbRsL9XCL7IYhUtmv6NcHcNSRwDZNGtWTpmqcR6G4LsF1vCV719XV+vOqEVj4jZznDXNv91da4LX2AErJzueo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VkTRcfQZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VkTRcfQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771248816;
	bh=4xUKrRwoa1mIk7MvSEGD7auFGq7ILzxeSPtTqhgpsgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VkTRcfQZfpOXsqW3yeml8RbmxInZFLkNNVmif6Z5ekDbc37oJRqXMwC4UakjR8M5J
	 v/4/bBsOKJsB6G9OPSnfVfp1qJzEZnguDezjGLnmx2UUg2jWgBxvMaosNMF7o8daZ2
	 VZa5mONZwFBmXDs4fohVtrxoMQCk03Sa1h3H4SGIFYXuT3jEkctESlSuiL+9r8ZQDX
	 BJdTvmNblfL7favKwNwOhda6b5Hxiy5Z33kBl2gPh+QctEXoeGfrwktJRvG+hzfEIn
	 M9FYWx7fnmi+ePLyFC0pVxI/+c9PiAaPXn4dpgPx7QOl97UbqeBtYkZ8BP2IglF8Us
	 B7bGt4KdzI2nA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F0D2517E12A9;
	Mon, 16 Feb 2026 14:33:35 +0100 (CET)
Message-ID: <bf195496-29d0-49bb-945b-60ce3d02024c@collabora.com>
Date: Mon, 16 Feb 2026 14:33:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] media: rockchip: rkcif: add support for rk3568 vicap
 mipi capture
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <aYXvDURNPu_5NILk@stanley.mountain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aYXvDURNPu_5NILk@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 2/6/26 14:39, Dan Carpenter wrote:
> [ Smatch checking is paused while we raise funding.  #SadFace
>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]
> 
> Hello Michael Riesch,
> 
> Commit 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568
> vicap mipi capture") from Nov 14, 2025 (linux-next), leads to the
> following Smatch static checker warning:
> 
> drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c:519 rkcif_mipi_id_get_reg()
> index hardmax out of bounds 'rkcif->match_data->mipi->regs_id[id]' size=4 max='4' rl='0-u32max'
> 
> drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c:519 rkcif_mipi_id_get_reg()
> index hardmax out of bounds 'rkcif->match_data->mipi->regs_id[id][index]' size=11 max='11' rl='0-11'
> 
> drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
>     504 static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
>     505                                                  unsigned int index)
>     506 {
>     507         struct rkcif_device *rkcif = stream->rkcif;
>     508         unsigned int block, id, offset, reg;
>     509 
>     510         block = stream->interface->index - RKCIF_MIPI_BASE;
>     511         id = stream->id;
>     512 
>     513         if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
>     514             WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
>     515             WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
> 
> 
> The id and index checks should be >=.  Not sure about block but I assume
> it's off by one as well.

Thanks for the heads up. I started fixing this and then recalled some
previous work on that issue.

I found that you submitted a patch that fixes exactly this, but this
patch hasn't been applied for whatever reason.

Since I have some other fixes for the rkcif driver, I'll give your patch
another spin in the scope of that series -- hope this is OK for you!

Best regards,
Michael

> 
>     516                 return RKCIF_REGISTER_NOTSUPPORTED;
>     517 
>     518         offset = rkcif->match_data->mipi->blocks[block].offset;
> --> 519         reg = rkcif->match_data->mipi->regs_id[id][index];
>     520         if (reg == RKCIF_REGISTER_NOTSUPPORTED)
>     521                 return reg;
>     522 
>     523         return offset + reg;
>     524 }
> 
> regards,
> dan carpenter

