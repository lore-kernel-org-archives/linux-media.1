Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789236;
	b=zcH74xXsivpKKIu1re0cdjqFrLV7nrJBy6QaEKedeFTZJf4ebtSNxVJzw/euhSvePtbi
	 nz2KDEgcR4nZpN9uGBCOoDk1v5Wwx1PpuImzUBKpvLZaQILFup5GUMxVwwJL8Mcbg467v
	 UZ+8yqTIM2pN0H8ZKDoM6z5E0XdI6g/SLamN4p3GNUrXUMD4vA9LDg6J+CugQtiKctN1w
	 JtvBaPqGD7SDQuTHkJ/bo6CO35rf7fUQ0t6Q7+eubq1ftA2L77tByt7q94YSGgm+RO5Mo
	 3V4TMdkkGrHAfw5R9UXNbmKcshQOocH4xgR0aDmjnDuinWZPADTO5qeRpxUOCEvbVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789236;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=hwd+jLmNGBC0PgMporOrMHpOuSMJzVN/xIRsOy3Yfgo=;
	b=UzcmffJjTDXX5iBzsebsvz5H/eiuMb4mAqjSX7izZMG/p7iYUSsmeBN8NWADXg0bOwiq
	 jV8iNoY946bXR8GyF9b33gKXqzIRvC0+tgBK13JcAeJuGu6/NCSwLtbnKEpYz778hhHFZ
	 2svHNnMHjmsuQn7INuv/xSBckiQEGAjqLo934ns2IJaIpahIJxruDZp4pj76ce1BwH10c
	 x2Eufwh/E9W3DSoFFMWIi0q5hXoamhQLOdxcDpbjxCBYINKt0WYX+pNVgCT9d7xxJs5Wl
	 Hp7yb/ou6FGGyjdJTOSAYxL23um1RP/f5e1maD+N2WNM7w3KjhIrzltF/BAlS8oWJjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oemwTWOZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44D3606A31F
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oemwTWOZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BCB1F00893;
	Fri, 27 Nov 2026 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789236;
	bh=hwd+jLmNGBC0PgMporOrMHpOuSMJzVN/xIRsOy3Yfgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oemwTWOZPoRrfr9LWyHdshVIAkWGYPzUqzjtiVvHEwAWDhke3CzRfQFDA1EM/xTLY
	 1sdOzllimwPQFh6xuW8eryYb55AnR/Ho4lIUY1a6DnyMJuuRqqu3ih0Z6PVzMH4BFu
	 LNlr+iiHU3c8WV4C85QNSfukvp0WdQOv9/FPf/snbb5ZC0e6XF/FvqdISd6Fso5pHX
	 /aBlTsgtW4kJ6Ppc9NgsTv1YrXWo10bZTk+yJ0fFT9mpoYYTksxpVD/XT9Y948ESeP
	 Njq1YaTPPuSOZY85AF5pYpbjQLluncFpjUKTX1sXM7jkLHVDCKd237uoBWYS7sTGIM
	 c34+r8gUWMcAw==
Message-ID: <f5dc7705-bef4-48ed-9d21-09cbef2a125d@kernel.org>
Date: Fri, 27 Nov 2026 15:20:33 +0100
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
Subject: Re: [GIT PULL FOR 7.5] RPP-X1 and R-Car ISP updates
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
References: <awlZPM4gs5Odo-Ca@zed>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <awlZPM4gs5Odo-Ca@zed>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/11/2026 11:24, Jacopo Mondi wrote:
> Hi Hans, Mauro
>   please pull
> 
> The following changes since commit b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4:
> 
>   media: v4l2-ctrls: set handler error if array allocation fails (2026-11-25 11:31:43 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/pr-rpp-x1-for-7.5
> 
> for you to fetch changes up to b04e4008c452c5a5e5aa7e9a25cd176417de3ea8:
> 
>   media: uapi: Add 28-bit bayer media bus formats (2026-11-27 10:43:23 +0100)
> 
> ----------------------------------------------------------------
> Updates for the RPP-X1 and R-Car ISP for Linux v7.5.
> 
> Add on top the introduction of 24 and 28 bits MBUS codes which will
> be used by the next generation of R-Car ISP.
> 
> CI pipeline:
> https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1805304
> ----------------------------------------------------------------
> Barnabás Pőcze (5):
>       media: rppx1: lsc: Fix and use LSC_SIZE_VALUE()
>       media: rppx1: wbmeas: Fix uapi documentation
>       media: rppx1: hist: Adjust configured LAST_MEAS_LINE
>       media: rppx1: Move register definitions to header
>       media: rppx1: Update shadowed registers
> 
> Niklas Söderlund (4):
>       media: rcar-vin: Return unused buffers correctly

Dropping this one as per my review.

>       media: uapi: Extend bayer media bus formats table to 28 bits
>       media: uapi: Add 24-bit bayer media bus formats
>       media: uapi: Add 28-bit bayer media bus formats

It's fine to add this, but only if there is also a driver that uses them. It happened too
often in the past that uAPI elements were added, but the driver that uses it never materialized.

So I'm dropping these three as well from the PR.

Regards,

	Hans

> 
>  .../userspace-api/media/v4l/subdev-formats.rst     | 596 ++++++++++++++++++++-
>  .../media/platform/dreamchip/rppx1/rpp_params.c    |   3 +
>  drivers/media/platform/dreamchip/rppx1/rppx1.c     |  95 ----
>  drivers/media/platform/dreamchip/rppx1/rppx1.h     |  92 ++++
>  .../media/platform/dreamchip/rppx1/rppx1_hist.c    |   2 +-
>  drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c |  34 +-
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   4 +-
>  include/uapi/linux/media-bus-format.h              |  10 +-
>  include/uapi/linux/media/dreamchip/rppx1-config.h  |   2 +-
>  9 files changed, 719 insertions(+), 119 deletions(-)
> 

