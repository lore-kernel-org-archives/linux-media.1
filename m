Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519195;
	b=HrA1PJkj78oF7OkCijjQrrGKremrqXIHBdqoOvlw3yJKT/d5y6DB4KyTZrb11aWobboK
	 Be75852//VO0kRu37tEQ/ZyacQZxArwkk8Qihv0vXEZPOBjx7BbTeVsif+NVyD1FOmmkx
	 keYUivEoL5MEoJp4+ndoxUBIurA50EPSYDOuctY+/kGo2ZJFEBfD5mV3ftBUhdWzIt0Dr
	 GjTEWCrWiahpH/CiTGKcM+NyYZbDffL/9yIwYJ7Lo9xVwHVuUBl8dGXzHt4zAOLTC9Pez
	 /9v2Y2i8w/fGp6WH0RrzYymJwb6o82XZB9A09+mGNvS1nTRlB0WFT9sYmzEjqBGrjsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519195;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sflG/fP1L0m8J5CqwcBr6GqfGSpw4hKXmAR3ym1x14U=;
	b=JDiQlx/Idvsrbs7OeporlnGsBkD6UVGGy5diV1C06fyC1ZTD3pTeldDUzVxnw3Y6iqWL
	 yv/2L4ID7R2SKuirJfGmDZSH7P55vCUDuolB8r+SB6x7pq+k/eO+kolTIHupxG3o/VfDZ
	 zK8Xrmw97zI7pyIYX9UKuGZqKqtp+nx31lnP3gC0/yE9RiM/FHJ7eRekRwyUSv4TcnMGg
	 1PTB/qm/U7uQPOINbmpuinR51E6Bhstseyp6P0TNWExb7Ma2Wvkvj34ljlXDbEIxxpMR3
	 A9uBVZez5vuDYCv2AmDUD5T/okRPrQDK0jf83NRPhZ/iQTg5txmzKLC9I54cCi9xMDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RiCdDCpN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493D606A31E;
	Tue, 24 Nov 2026 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RiCdDCpN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38601F000C4;
	Tue, 24 Nov 2026 11:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519194;
	bh=sflG/fP1L0m8J5CqwcBr6GqfGSpw4hKXmAR3ym1x14U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RiCdDCpNmJMo4DvlLs1URU123IHwgsv7PD/iH4y2qNTauM6J1qA66t4fT+YA8f9wf
	 5RbT4RTYvGGo6GpDd6EQL4Sv30GmyfQR5TjTdvhXWrIzMO3unnZXDrjQ33Dm0Y74e4
	 JDJBM1kYMLdCUEfawCYdsT5dIqekng3MI9Trs/HTtytUof1SDeq+GwO3u4QmJFfN9A
	 Zop0pL5epXBLCTpYI9ynA4gRbEnxlPlI8JHe2LBw15e2gg8wzo4FIlfakCwOw5cGb9
	 HWfUn/h5gfLOcPn6TOsU4CYitt7L8rSeLI4w/tbv4p+zvfbjBvgoxqgHBkyzw2kSf2
	 C8e/OnSRBJx+g==
Message-ID: <452bd60f-2440-4935-8bde-6bcae872d40d@kernel.org>
Date: Tue, 24 Nov 2026 12:19:50 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] media: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Heidelberg <david@ixit.cz>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
Content-Language: en-US
From: Joshua Crofts <crofts@kernel.org>
In-Reply-To: <20261110-media-remove-dont-use-autosuspend-v1-0-cc07e71b30f9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10-Nov-26 15:03, Joshua Crofts wrote:
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
> 
> Remove the redundant function calls.
> 
> NOTE: Some drivers in drivers/media/ still keep their calls because they either
> rely on pm_runtime_dont_use_autosuspend() before pm_runtime_disable() to flush
> pending autosuspend delays and trigger synchronous runtime suspension,
> or operate on a parent device rather than the platform device itself.
> 
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
> Joshua Crofts (4):
>       media: i2c: imx355: remove redundant pm_runtime_dont_use_autosuspend() calls
>       media: i2c: tc358746: remove redundant pm_runtime_dont_use_autosuspend() calls
>       media: i2c: vd55g1: remove redundant pm_runtime_dont_use_autosuspend() calls
>       media: i2c: vd56g3: remove redundant pm_runtime_dont_use_autosuspend() calls
> 
>  drivers/media/i2c/imx355.c   | 2 --
>  drivers/media/i2c/tc358746.c | 2 --
>  drivers/media/i2c/vd55g1.c   | 2 --
>  drivers/media/i2c/vd56g3.c   | 2 --
>  4 files changed, 8 deletions(-)
> ---
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> change-id: 20261110-media-remove-dont-use-autosuspend-a8290b020d6f
> 
> Best regards,

Hi, gentle ping on this patch.

-- 
Kind regards,
Joshua Crofts
