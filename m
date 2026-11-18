Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007733;
	b=Fv7I27DnPTvc8tv84JhXjHgifwN3AWXnpT1WE+qqYmJhEQ+OFmunINm+zLkPwbKmlHoz
	 LFwylZi/vQFm35sfrjVU3eBA4sHmcOGGMb6nXGPQUcmhuAHB4AIvOYMNyDRELXWxYzZPt
	 NKVSYI/vWedbAVHfHwQrugWPrqBkCk6XDsDMOfEML6fie0SJCI/VeB/eN0lG0xqlFWLWu
	 logJVXLKO2N74rABEjyZjy7ST5nARcoxaGbw8GWSdeM/ahHyGiTI2z6aqc+XvXnhmQG6j
	 GuOGKeyFWnWtuPZoP4BIK86M+9W3vIhTJSKWnjkm7BLtTsZmfudHkJz1YY3EBKdyE3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/TyJXkm2vpWoT51loq346JyUhuDruv4LPJ1ahbEZXZ4=;
	b=hRsLeOidjupwXtY1GOyxVi9IRk8Mrb87BzKMH3hbZXEAwHjpnQeSDTkKxQZGz7CzlTnR
	 LW6QwW0x5sItX+BjWxhebmYuHPx8cSE+iffr6haYBk2973jas6ZTPR/trxsoINR2iMFqq
	 4osXIJK2kr8pyJRBG96ArTW7Inot4FSz1zte+D1tlxst8e9o+SZvLxvLYrQGYtc/k4TJ/
	 Nk4zd+F5xyKsqY1HcsxdNieqN5Fy8kb3tMn96BV2hYpeyQqsg0JRf0XhR+afffMVq1GSl
	 BOtVmrD13sdUxQ/FnlOJe0Dq7cB9Ehd6MPWn4mv7I1pKOvdWyLlzvbrqcWQupSMu/rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=hjycwbIO;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32D0606A320
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32D0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=hjycwbIO
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so9564111fa.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 05:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1795007730; x=1795612530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/TyJXkm2vpWoT51loq346JyUhuDruv4LPJ1ahbEZXZ4=;
        b=hjycwbIOyvQrtyBMWNnhVJEWJBwdjlEA5Rvyz1eNWYwmnxttiufHtMTo1C4mMepjlW
         ieE3sgvVtGrErSqaWC2nOZxiaCHT0Ac9j89oPsu2nDct0nubQg13z64ZJnvNFVqibbhH
         Bssl7Bekzs4AoVLMeule1aRmXk2lDI8Fck7HI628EQlIFVkq5YF9FQa+PdaTM4yCOvg2
         8sSuNzh5wCxCMJS0g7BjKDKcxEDR7qdJsZUl+OpUo8HTzRzb7VPsUZb+gmrj0LqYMFCZ
         fvSd8Cike1jGWLPP6cDliszDr2Y64nw3FRNzOC1FWZVjHDtSTgm33VNqwRaLAWUsmTlD
         iH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007730; x=1795612530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/TyJXkm2vpWoT51loq346JyUhuDruv4LPJ1ahbEZXZ4=;
        b=KVVqNEiHGOddqtn5Qgt7awpwU8QKP9pAJ+66KzGW0lgHJPSx9vnAnhOLI/PPvkHnE3
         To9yRNcGD6PdZGPufmYvh4dRrC8NMEVyMLW9I16GoP10cg+cwgr25gmYalEYS4/N1fmx
         VrRRO3xTcmXyJTm+GNiWYaVJeYOd0xhQZ5ZmNaumm/24mwTo9k+pgly4ehbX+xiTUwGV
         IMP1VfejWkl2ZQ2g6hxOOZDlC5wDEmdJ2XCUb+JclOXr3xmSSAYwIx0OYgXCxEK8foSY
         LouwqFXfnzJOQHPZ9K8dYjsRxfIh7Fj6at5+SK01LqJwtCEpjXIGGweJP1V6oh59S9xm
         KAaQ==
X-Forwarded-Encrypted: i=1; AL+hErHKr6Fnb8HKZnQqmj5sfygVIt6bFH4mIXaeIGI+9a1kLZp+sLXl8zTA0oZTOAk5SIreeLgtFSmVaexvmA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vUww69clHAwphGpFo0aB6Sug5/QKWkmMO4XWFbyqxG2489X15
	ycHEaA7PpxP9hRZCRIMNhZAwLGchRHIXBA42m+p+kVR2c5nvsyH4TxELjU2sMyjvu+E=
X-Gm-Gg: AYBFou3P9d1vGOaSfgqMiQAY9VKXElqWbF9/Nfi3bSQapphPhRM8/TmUq3so35Lh2GG
	0y64ykgXObswjAua/fyM6DHVoNfcmEavLLSrD9p6mDMIlYUA3skBL6lhqI3S4Fh2VaB029RvK7p
	4U1Z+dPDIHJWNxe/4dUHg6HtSN/+tLpkAr9jYsXscMFw+6imXI8goXrjJUv3/ZbbgPZPCLPvXU0
	4+2U6ItlbGCygyzHj3MYwG+zrNissBmUFWuDY4tDi99rTMvV5pRsR/MaS6feB4i0jd2U1MiVHdW
	8Z+QYLQJqh2QbqR+SkGidk+yiy4SWC1BJi+eP8hnn2C7lc0NeQseNO612huZywjZko3yMiiZpOi
	5btdacGqNYXSx4aSszvX2QgExXKP15iEVz6Htt8VHr+dc4IaYV55KjdDotGeVRBiV0u63YbI8EV
	sZ/6wnutdawCfNFyFsetuZVxzucebr7DW0twIb58Vls0XvhlQeFbJePN2fuXkEzzyR8HaGYAvrV
	sfwwScKAh7VjkipTCniMMJ3jFylc9/oSdIgTMgHAxMKf9yZOvBGEeGrkcirWEYUWR+tk4BFEU/h
	E/KiXn3QykIAJnEVtq7IX5pjgQiq9qOH8QJAQ/TEYqmwH0wEso9CfLDmHIa0Sg==
X-Received: by 2002:a05:651c:a148:b0:3ab:3607:df9e with SMTP id 38308e7fff4ca-3ae670d1664mr9301141fa.13.1795007729556;
        Wed, 18 Nov 2026 05:15:29 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae67a38db8sm5617761fa.4.2026.11.18.05.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:15:26 -0800 (PST)
Date: Wed, 18 Nov 2026 14:15:21 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Ying Xiao <eagleshaw@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	"T . J . Mercier" <tjmercier@google.com>, Jiri Pirko <jiri@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, 
	Jacob Moroni <jmoroni@google.com>, Xuehao Hu <xuehaohu@google.com>, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: heaps: system: zero pages after
 set_memory_decrypted()
Message-ID: <av2jgIDyawKNS1BA@FV6GYCPJ69>
References: <20261117155431.1654298-1-eagleshaw@google.com>
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
In-Reply-To: <20261117155431.1654298-1-eagleshaw@google.com>

Tue, Nov 17, 2026 at 04:54:31PM +0100, eagleshaw@google.com wrote:
>system_heap_allocate() allocates pages via order_flags[] with __GFP_ZERO
>while the direct map still has the memory encryption bit set. For the
>system_cc_shared heap, set_memory_decrypted() subsequently clears the
>encryption bit without re-zeroing, leaving ciphertext in DRAM on
>confidential computing (CoCo) guests instead of plaintext zeros.
>
>Skip __GFP_ZERO during alloc_pages() for cc_shared allocations, and zero
>the pages once in system_heap_set_page_decrypted() after
>set_memory_decrypted() succeeds.
>
>Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
>Reviewed-by: Jacob Moroni <jmoroni@google.com>
>Signed-off-by: Ying Xiao <eagleshaw@google.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
