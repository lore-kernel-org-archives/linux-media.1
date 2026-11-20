Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203614;
	b=Az+Vzfe1An50C5bYCoulQOV28gU2inxDZHB51wQn/6ej+wJFOz2Qt3L38KiYKatIyloI
	 KU24lvQKQeJziarpBl6P4XdXCXnnoKWu6qoItml7ck+qlmDPntHs/JIYaStwdGSZ4qxfg
	 k+mxPn2FljyIiBL8gI7whE26c/1kreGtQUK9w0LYmh5rEwKneQ1nN+zAft9un2Rj94jYP
	 zGjB6ZK5y6tEZMNUsetiOYWS/WxvR4bS9DIVewmygg/ZlEAh+Gmm6EUJJGHYyFBymlm79
	 E9jlLf/2WnbkxDcvQ5/EhoO1dTos7WCxA7vvn1FKKG9oQ7bCltA0hvT2UV5EyhQlIbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
	b=OvT7RcAd65ViVRaKTbr1PXuIqRmCJN0yMAjLT8WoqcOJkTieBt42GbHWOou9TIDmB4u3
	 aSwKYSk2MV9Oyq/eNlwVFFHurocpIgn1IYP+VQtUvQ/gDe5X6uo/eB3DnXTuuveVt4CdZ
	 XnrTlgsTjlf5MA/tUdT04+ClFreNW4clDD1LHmox2i2X8LuJuiEQMwP6TCmf6+eLMKJvO
	 jPED7b3pJpP49cUwhNKzazwla4ZexzEjiIGK3R4iUFLFerFwsJWewOEEQ6MnTDFheO7sG
	 kYrdqzmx04SixPqvXNDiS42o7XvJ9N5JNCZFamzisrHFakxDZzUQ/qKYh+Dp8MxXBlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vq6I6rYm;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3192F606A6FD
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3192F606A6FD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vq6I6rYm
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d65662077cso627573137.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203611; x=1795808411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
        b=Vq6I6rYmewD4vEX6D5UKtWkxHcWMh3mpri0JU+Zf5Xj13Pm1PwfFX3FPe06ZvNci0p
         cp9c1+HiAnx9zd2Cp0fm3fFuymCsJkbjg5jNy/VHQkmG8dYQ4n/cc8nOMWSvpLDuAsjB
         hn1cpco6ehCfunHGczyGqIsUEdMCcdW3/z5qYByXcWf0ukhvaUK6XkTAlLh5Udprl3Xr
         vhXVCBjYw+YuyisVLCdExyNe+dVM8sQbGVfhoNRq9WCeb22+lVqC4lNsWzjdYZxHgUOo
         Xpy5ZjTqZjIMLoC7S4EP0Myi6X1N+Fkih3D5J8U5iXdTwJ20c7XjjD6J2OSiXhD3kdZy
         8qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203611; x=1795808411;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IkpnTCmX2Yw3LdVkQLinJLsP93e36ieyPl+JuSAdltM=;
        b=WocLKLsxHMNbHpw0iP12h4+N0fQbwsgBmJwk+LWHW63WsFj5vO1hXpA5JggQpZYh3B
         rv1pv0IZBvmFcrQ26ehMOJ/AozsVEUTwcHqiVHUwPsFmAbqdmaSK7BSzV63gYorOe6fi
         4rTHwMeBbuuFaXWjeIjjR9b87GTNLVhgK7caWTCvaSEBC2I+G4euHfUd3NxwO22si+uU
         O+PfGveQvi5oOsXWzdlL83l/eBJgXqaXHLA2HYpGjdsG6+Ed9BzO/9fv84jMdtts0WAA
         LmS6P0IL+azef9O+rMX45jmWtQvt5OMloZKgR90zc97jufZq330sRUzdSpib1N4QINj3
         8fCw==
X-Forwarded-Encrypted: i=1; AL+hErGlJM1BTVuaEogxXlNZLoczkLoujSsoFkhUTIua1XzPM/2T0q/NYTcMeOmLXARxc8B0oyOYSVu8M+K7Hw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1lM5qHLDcN+9soQ2udO2g9fKqxfWKLcs8XkWq6m/BXo5KJ3RB
	VPhjEoPLvwfSEsadzSVxzuEu0oCmqWJ9tCx0B2wcIfFhAvV9i8Mbt2fY
X-Gm-Gg: AZFdTZcsEmRVH2bbayzvdNuGLqukJFOOw/4rQb8t5uX0y4fSXAFndQfd/4E7qZTh5s2
	pzjEtQD7+4tynkOqmCT61Z20sMAFE+ClsDQa59Qg+5Hh7IcosTToOARcEQpsHN3c+Ihlw23Z5wd
	jfhoH3EiRMNwXIUqC04TOS6VS+Wwx78Pb3sM9JdiFTmngNqgc3szf90seEFPuWbmKXQaoUkLw5c
	pvizwcUPHrxbIsJgzHAOAbuUMSGswjcMmQk+KQCKsFZsSvYFObNf4EbasTiphZ6JdjEsgtABJmw
	MdOxe8tdLWFQe7WUDYA+b/GneAX2PZ5D2iha2k4nAmkU8rgVJGIuUK7ar+pg2Gv8yLUWeILgcLG
	EzclRxtnob1RYu/tTB6UtNhQxsrMwhc4eHsIv6YkOpyFjPOLIi2FgXA9hnU/7ReOsAg6/WODJXx
	Fvr88sPJbiGyq4w3lPyxoLjZ19GN8rTylUKgYESIRYNtdhqjNJImYjZiJS4hvK5iRNBGxhOxcIC
	JU9vvRCwn1RXoHl6O85Shts+oMG4qDUIOYuwhqFfoShl4/ktPYuAIHk+UW1r4m1Gjk0nXhhnh4C
	aMgTTyVo9pAiA5klvRTLCo4qhdXo3T+AB5Br3w42o5JrqxJlFiJMre+Y8fWOSZoIoWCbhDVqvb9
	zyo2j6ryxHjyZrQqtPYTMtPYffLthIvCb1XPr
X-Received: by 2002:a05:6102:5091:b0:7d2:cbb5:71f9 with SMTP id ada2fe7eead31-7d7393ff1eemr1985327137.7.1795203611220;
        Fri, 20 Nov 2026 11:40:11 -0800 (PST)
Received: from ?IPV6:2804:14d:4c64:82a2:d4d:f9f9:a4fc:aa28? ([2804:14d:4c64:82a2:d4d:f9f9:a4fc:aa28])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a29csm3845871241.5.2026.11.20.11.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:40:10 -0800 (PST)
Message-ID: <a848c700-f1b4-4975-8c80-27b8c81160ec@gmail.com>
Date: Fri, 20 Nov 2026 16:40:04 -0300
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
Subject: Re: [PATCH v4 0/3] staging: media: atomisp: use kvmalloc_objs() and
 drop redundant OOM messages
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Content-Language: en-US
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/26 19:48, Rodrigo Gobbi wrote:
> Several allocations in the atomisp driver still size their buffers with
> open-coded multiplication, e.g. width * height * sizeof(*p). When the
> dimensions are large the product can silently wrap, causing kvmalloc()
> to allocate an undersized buffer.
> 
> Convert the remaining sites to kvmalloc_objs() with array_size(), which
> saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
> allocating too few bytes.
> 
> This continues the work started in commit [2], and picks up the stalled
> sites from [1], unifying with [3].
> 
> While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
> the touched allocation paths: the memory management core already emits a
> far more detailed warning on allocation failure as raised at [1].
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
> [2] d178c7ca8fef ("staging: media: atomisp: use array3_size() for overflow-safe allocation")
> [3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> ---
> Changelog:
> v4: 0002: use the full commit reference form for d178c7ca8fef (Media CI checkpatch); collect Andy's Reviewed-by;
> v3: https://lore.kernel.org/all/20260623221028.40238-1-rodrigo.gobbi.7@gmail.com/#t
> v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
> v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
> 
> 
> Feng Ning (1):
>   staging: media: atomisp: use kvmalloc_objs() for overflow-safe
>     allocation
> 
> Rodrigo Gobbi (2):
>   staging: media: atomisp: use kvmalloc_objs() in make_histogram()
>   staging: media: atomisp: drop redundant out-of-memory messages
> 
>  .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
>  .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
>  .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
>  3 files changed, 41 insertions(+), 76 deletions(-)
> 

Hi all,

Gentle ping on this series. If there is anything else needed from my side,
please let me know.

Thanks,
Rodrigo.
