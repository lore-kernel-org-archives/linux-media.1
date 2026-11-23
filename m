Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445859;
	b=kmCrq9xw8vrIzCOjWMKom8FySW5mH44y2abEuhR+pRRtdmh9IJ1PU5q85Bz5Vo+1Sidg
	 hX+NXRsR6p893RC3g54lfDkvsnEITK4M1A0gga8Yc7kbP5odmZ9V7ei38cStM1gStA1Mw
	 derNku+OnDtWYyotYHJGwikHhEsuo38Ly055R43GjIOj2guY1QXmqc27Sk/UwfOamgmCo
	 bM5d6Z1Fn9WLApJfLCwsEWypGB8pOpvRNBxg0vb6ljvZpHdyW+e457FAdb3aih5WjrzgC
	 SM/+a2/aEVdAd4go/L/Xt22r776fq7gBUjREIx9vbsQuuR14fXCXBYWnhOmWRJ4MbMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zYKXJCR+OHzPIwXu848W4WS83V243GLbfOzYCVn1lSc=;
	b=wXXs3b06ifO4f3Gd4jUchgb19DltPrvL56Bvg2oNtYrcxeJlRPUrn0G9S4icyCZqbgoG
	 4LLcF0fMlc5G91/teZiGWAtHBAH4Yd9AYz7W7ROgLyiZRpq1kGiH/tuQVye5xQUmPMCdy
	 BPs6f9WxjJHeahj4eC1NG1u165aRGBv0NtUHcfyUe8OU+e55smCqYuONi3wUuXh+JCUwH
	 s5JGLZjaD9w19EKSQO8LBI6uUVLRES+zhIGPdxUMCTeYCTPfEHmFxsWN4A9iuqoo7ZuEb
	 xFlOxz1JAz+XPiIPJsyQ02IMqm4xKUVN6kYugQDzgaujZwd5N/tlx28anTqN7Z+SdwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a7DQdW4k;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C138D606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 14:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C138D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a7DQdW4k
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so33732635e9.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 06:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795445857; x=1796050657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zYKXJCR+OHzPIwXu848W4WS83V243GLbfOzYCVn1lSc=;
        b=a7DQdW4kZdqSRWiWHKSKPUe9cVkvSjVcejQelfAfoGAeh3AU9nnL99c2fJ1jG++X+e
         TMipsz8mdJUc9txeNefbc8dIpkrXVtWt4zy5XdWENjoIfHpqQnDp0YSBtldIvgjXtWAY
         JcOnO3d4SubDnbDMBCjQCvMA+MRN5JqqJ768ff6hoFWh7I7TmQh5Hzo4wD3J4jIJJLub
         ovqqkHRUccgU7gDNWJUtvZw8Mlb0fWz/0+TEN89nl/n3PZipH27eFBJSRtvQZZWkgy+G
         qw0LEcK1AJt8N/fspUEqjw0WIvEUf6f9b1LtbDm/NowxSoAzHvrjtagjymM+FSpmjd0y
         JWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445857; x=1796050657;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYKXJCR+OHzPIwXu848W4WS83V243GLbfOzYCVn1lSc=;
        b=jnL6RT0TcVherqpKpjD0v6q1qB+qaUNNQ0pXg6E6f74ODifZvMgwM44a1aLGZdZgxl
         eWs7UPm3aEfhyTLBRW1JjJ1Ay6wZkRlyP5i/SuCmbg/bVaGA3HewrlztID6lJ7ogCoLV
         NOMyYastf8Xssdi0ksNYILZwGt2xiQUmGY5vIofu9amdYqCn/227bXll1SJovQKYhFMk
         ruAcSfdLBe3YEkS0uQKHC4rgmb6Gu8S4rxItIfb9/XE6TX2JgRrAvbn0zjpDbyBOSSzw
         TvC4AUKbPdrzokFgXzNyCcnppHRTIjRN0OmZyhxcHLw+n11w9EUHJzvgXIQxeuiFA+ie
         UrBg==
X-Gm-Message-State: APuU4Z8+cb/p/X+WZTrefMrrlpbGdAu5bViGRE0wbwaE1aS8SlOz28RP
	zz6XJd3EAFf9a/BABmimcUNNZR7Dmb32TwxwX7t2NUjM/VJ3/pFmMvhpwLgwjpHnVEs=
X-Gm-Gg: AZFdTZd4OhRB0ThF1Ns/KQbBgnUCsuepeaclH3qXrfFRXft7pTGTdFgoPy2vw3UZ9S1
	MEtSHA7CR6GAFfGDZqfFZHNsCh4hPkAEydWGa5R9DNoVsoOQ/9fvj17atlHnX69h/HMNnosv4Du
	H1oF6VgJsc3tb686zLygRAvASk7n/zw4l6r3KKVygiAHKTuIC6b72s1P3heusnYSq3RzDe+eb5N
	9s6bYHLSINFwdZu8Ib3+lG+tBA3jHMjaXoX0AUnzX7ErP2zZeEn/m8ibbIVB/2UM6BcKD5s5Vsj
	yrMCPyKMxR3Is9XgHhK759GilladPIjs92VH6x5SoNMQaMothIDOUkDABfHTIzGDc+Zk/0zojpF
	ZVieHdkvekQzvmG5QPTKoXBuRqy20afYcsj1nXXVsJD4bZRWiteZa9dIJddqM5wOvghfZvtqC27
	ccC7j54v4QmRxNuJC90aEy38UWkcedLRueIExk+rBfxeHEkwUczmGNVLyjTwPz9dwpOHtbbHJ2s
	D3cXlNp9w6/ReLtY7xUNs+kRLE2BWIRaAWwf9RmkMO7DnH0nZ1anzQnf2SOuEdaEjj3wqGylrkh
	toR8TuR0+yUfrOqWRM50oNAqXObYin9yQAO3WdxNq0G93yJEWyfDe0/X1Qtph4n8
X-Received: by 2002:a05:600c:4f4c:b0:4bb:8503:69f4 with SMTP id 5b1f17b1804b1-4bb888097a2mr299056955e9.5.1795445857113;
        Mon, 23 Nov 2026 06:57:37 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm169377755e9.0.2026.11.23.06.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:57:36 -0800 (PST)
Message-ID: <ab0a0ad6-4c5d-45ae-a318-dd678a5685e5@linaro.org>
Date: Mon, 23 Nov 2026 14:57:35 +0000
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
Subject: Re: [PATCH 5/5] media: qcom: camss: video: stop started subdevs on
 start_streaming failure
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> If a subdevice fails s_stream(1) partway through video_start_streaming(),
> previously started subdevices earlier in the pipeline (such as the VFE
> and CSID) are never stopped. This leaks VFE stream counts and write
> master reservations, leaving the pipeline stuck on subsequent stream
> attempts.
> 
> Walk the pipeline from the video device up to the failing entity and
> call s_stream(0) on each already-started subdevice before stopping the
> media pipeline and flushing buffers.
> 
> Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>

I'm 90% sure someone has already submitted a change for this.

Anyway

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
