Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A7739F17B
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 12:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714421; cv=none; b=LgTm9KVlAlpNinD3gMlIjgpjpIBZ8L3nBw+uiuQZhvH3v1VGxtf1wKQtbNiTXb+nxDDan+uD1IQVHabmqkmRl+yqDaTAGy3ML82cfwpi2OGeXCJYs+J+oTkCiG/ysHKwXlJGnxrYZ5rFzduvBt1WK9xDP9nDge4vvlGUVxZqj6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714421; c=relaxed/simple;
	bh=vEuPDSsDt//wtmzfe9Xu8GSe0LEcvi4euzHg4drb0UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvrnB8FHH3aupQYdgH4TvQqAiynIiusVGQtb/JzX9p9GLusN9o9QkqG98OMpCceC2Ki7b2VDLr5gbPpEBAeJVV84kWPCUz3mxeZWNQSfpcmgs7FbaIqaDhAkqsMoWPveR2bG1mbCXz3cpEFC6ADogGc9mBYDQDJmFKOs4yUfVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=jy/aO3vk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="jy/aO3vk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so4849595f8f.2
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772714418; x=1773319218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vEuPDSsDt//wtmzfe9Xu8GSe0LEcvi4euzHg4drb0UE=;
        b=jy/aO3vktDwMNOfrz2bXko+TVQRJN0g1iiPJmIMce18Ay0AXlfJD2NANTWMYihUgZ4
         g9bZTKa1ZpQJTpUuDRuEFMc59X2xwiRFj5Hdunk23FLWfcSAOMkml/QHztV2CQRpfO+p
         JsQDfM+LXv4yPCMLnSu9Ziwb2hY2Zrb9eB0MoK3rSae1NlBT6JM0zq+kvNotd5Ezd+a7
         LYiOaoz4a6JLJ/lwIUQ/zDlHJVyh/YekEGOJPZ9D/sXODHEI74wTC+tzRB3AedylieYf
         yUJhUvjFM0TVJf+CU/o6jWhq7CeFvT4umoxxg5NGRH77WLdVXd+JXX2vdqcqRHShOP0y
         r64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714418; x=1773319218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEuPDSsDt//wtmzfe9Xu8GSe0LEcvi4euzHg4drb0UE=;
        b=XdkJnK4UNKHhWA4CVWTjKy4lAsyzf9R8aa0qUmykhp5w5PDXUk02+1/1jmRYxzlzBN
         Sj6/U1eKoHa1zm8KenOonQNM2Knaz9fNXCJwc5QTSYKGu83VImYw3Y0sr9LeJonsXjLF
         bnhkISQlQbSHxtZz4IiLN1WiQ+/uWbSOKasKZc9wGCuBTK8PgzCOGcn+ttbTw6EsG68F
         iuyHRnRPMEQbEHwyB4+6pKp29dpyB5qqAbcLRtYDmbDP1qUQEAkVU3RkuGRx6d7kipbe
         zy9AZ746K9dAywJjb+1Jos7OIZBmUEHRPAFUEcYw1IhtcF/gl2Gz5bHPJ5zTC/YcDfeB
         KEqw==
X-Forwarded-Encrypted: i=1; AJvYcCVWjSUNGgX9lgsS6pW05hQPW2UidaNb4s27dY+/91dZ/vPE7z2YEXsXlaF+Jz8KwAiPM39INmEHHJD9/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvbrs7KNaDY8uzKdAqKSuYsSdn0AOfUe5GnrZkKXYN7GIyyvpf
	S6vw7Ep54/ZT/GBC5R6YVZ6T0iZsz+lLXqc3EWyAOahtPq3JG4JeMnaD7ExuGBeeC7s=
X-Gm-Gg: ATEYQzz8JmWYfzBOS+WRCUKUATIPUxGT5jQCOxiIrvGURDJcWAYiF4ng8Y8W4E9R0zB
	2mHjna8QCifX5wRQwMUyR0QIM+x958X7TSPm1LiqNWiXMGkQYsz/M6x4mhWILULZHA72ht8Rq01
	QF9HGeWA/VMYOXZM16jddBzS0j3LZyo+HW0nHRwg+6xLxgPvtgh5WKZUqKH9PsruLXxnEquOAfY
	QDWiRHV3WT166rWmSMXA6IThSe/NMs4mOaRQ+8rh+vnsT3/QSBjCKxuxNoX6MUJHEpXvGIJIObk
	RDwCXJhm01injJOiIPlmzR2D38M7Fdefe3j2uSxggYsCVrgDJDFz5lVbHBgRktdS05stB5TKmr6
	cjHDqRK3BGhXg8RG2SjeChkYXa+kvUnLheGL5fM4pc4xjRa2DryN+wk09rl42cRxrolQfYR7nis
	S87cqwWLne5qn5NGYGBh+xJTKVJu4xYPA=
X-Received: by 2002:a05:6000:2510:b0:439:cd10:a1f9 with SMTP id ffacd0b85a97d-439cd10a224mr6376565f8f.54.1772714418526;
        Thu, 05 Mar 2026 04:40:18 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503425asm33480811f8f.25.2026.03.05.04.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:40:18 -0800 (PST)
Date: Thu, 5 Mar 2026 13:40:16 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] dma-buf: heaps: system: add an option to
 allocate explicitly decrypted memory
Message-ID: <yyb5ozsxnfcuzo5rzpg64hgj4rtxz6glpqf5fpkhp4zrwdgted@izdksr4b3vte>
References: <20260305123641.164164-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305123641.164164-1-jiri@resnulli.us>

The "net-next" in [PATCH] brackets is obviously incorrect, ignore
this bad string please.
