Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556844;
	b=fqeXFZ4tEmJQmJ3HFFIC1b5tZs908SvKunVWaEmWNtfPHNJr20FH14yUizDcSstKFGjs
	 9SAtGj15v/bZYIlTuvdGGoxfUuMGvF2hZWRMwW4QiXZgrWryaOgc4SALrUgZm0UpA2q45
	 f+glHiFIMOSUHWiukThpf6S6ovORM7wWN47KxdYbqwtLjbW1uly/j29n73w8vBbxFWw0o
	 9J99bF2KeE1PC18vZa9NqnuWQJmf5Bp0JezTRaPi3IHvcfSFbi6A3KZutQaKQIqqzS21t
	 dVIus/moUlMFBPr3/6DkAiBZTGp88zZMu4OVkVI/Drl1vzHsKTwNcb6GEJGsxbuPryQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
	b=IGgBQyJPJoTOZLW8hqQ9NX/swP72WVNpRHAF7yXHuyLSxAzSQf3gbpciUCTwt105daB3
	 HoL7FazIw1E285Slsh0igWdpvCq4dub7Ryqn0TVZqXZEbhZZj1Ud8mvXsuC9oc+y92Ltv
	 qWZiNNXy6YwfrmBdxUI2F8pydLfJrEqppTg/8uGnIs0hFDnRep8oBAGccEBIMFFq2P4MS
	 tjJHOMcmH2ABi/YM0Q5WEqldejhj3Rg0BsffVlMRHObNeEPSNGw2EYm8h+Xwi50Pbljqk
	 NqvAk+CQmQ/M6d8qCBa2zbPc0l0ZFmvWAkCZ/LlXHRZ5fiqDwkBCtHJlgN0kdVB11ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2uct+Co;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3DD606A321
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3DD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2uct+Co
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c00c727a21so64218e87.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:00:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556842; cv=none;
        d=google.com; s=arc-20260327;
        b=DWGXFlCuPRBUAgtpogbmgEN4w9zzOwC0PudjpwGzitHpiDiZN8Ll6g6HKx1ehHNoOU
         DAEW/Kjg0ZKTs408qKnMozX3ZYrDW6sC1CR5ugUF5FyAqEKs8dtTD1/loUSO8HlMOrNW
         BrvwBYOS0zqMEcyBeICD2d3U9nDhg5eTNVxgAGOZmfE/I8cDxHWfMo3hsaMN9Lu6Bvn3
         HVijNe38tn/yZbAPR7+vVtZNj2DxBiMEEXcpmqY2ygD6uQ5s2KpUEl07ZtTDOx3tVt5h
         MGLlzZuiT/DBj/I8GVxgR/fwUq1T3vrOQviNcWQHc9eS6Tf4Xkjf8JrU04p3TIQphDRn
         seVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
        fh=VK4SpAS29b6XpvuZxhAei3il1tphxOg679+xwVaq+zs=;
        b=KziPIK2KVTnK8A6dwyv6i2674WO1aQUwpEdarRQ727U0KBe/DoW7fvgLzDDGkf1a2u
         i/AsLH4bICQkUbNIeLJb6wkVGQwEONmdVHdUNID4rSdtRvVrZebqLTIQOqFduo0oq3If
         +cP9213SsYGd628m5Bq0AiFcfxNy0wj2gO4ppccs5qwcgXsEWL649rdUKCnO+SCafd4n
         vH97TFXtC0+hHdEv8O6l3aqJtm27vS9YwfVzoFEOMcQbMS9SFaDGzjHiyvu1tl3lD84e
         pzQZYq1IP90FEhjuYGQXr5GYVP3N5VbexgajhRSkE9U8JocyDvARFPhBp03g3HwWo1i0
         EP7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556842; x=1795161642; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
        b=g2uct+CokQ4F+amxmwUtOlccpC0vRIEWj4TJumELJjvRtBaLmxs8gCQb5ATjefa3Lt
         Wzhs3V5zUzSXkUhmo6yhEPVl3/AyDLgUzOJAKDixRnXG3o5YsBh0qap67riqWsaUsPJt
         JSzEfS85lwNchwUsoroI5gOL2ICTE5VC7v2UHBOeejNP7IOV4kLG+Y3TYy2q+YxXSvX7
         AWDOAFOEQ9KqRwyrWVPwfz3tmIYF1eeT1rsZpV14S0bTNlqllIcRJ3s5dw/FBF8kR4PG
         nFjXCQSXXthDNAqD0L+B61YkUTVoAxOZ2OUastjsbBdu1NUBSml3Rmev4ByY8DT+OMLe
         csSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556842; x=1795161642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=im5VzDYCAR+lhrziKPe6VB/YsWt6tS1hfXIpy0sqr8w=;
        b=CY0j6gfZ0zv4vQ0phSN9JfkIcrYetTb8pvC64EGj5M5Avs0AMHulY+CpEV6RCOXdjY
         F4TFmSlOSP+zpsOFE5QFhGT0kNtBoXnigDcHDf7sbMata2mMIV1S4/owXKpHdkyEjY62
         68P+OgsVoHHfsXNQPie6POuux68qjq5l0s0hZHywlY6smGu9KMTbDHZS17Fvzjsv4CQE
         62YPi3e1wyYPVsvg7jIoRZfR3nFo4u85EFuCfIFfDuvGB79kO4ENzzzlkR5KPqSTfSwC
         /YBs+gILwruceK1bSvIZPBq7+jfGFuz8ExEcreUVQo731Wc72b00Gf7WcDb07KpbbDns
         8N+Q==
X-Forwarded-Encrypted: i=1; AL+hErHQdlXxiSQ+tzBohlob8+/op5F8tlWQFOFldVqYm3iMEssLGBx91eX4TcgNoXtpAH7d3E661zXk3sR//w==@vger.kernel.org
X-Gm-Message-State: APuU4Z87QwOia3j86xeX1oXEm/tHD94Un/9IebEOaLEffAndhad9n/xA
	14mRM+FBGEb/UjlpAp4S0nOIKsF5qFENv1n4q7syMsy5Cfpza6liclPyTb47RPWiEGZuHqaM7me
	n0m9hjwiOn8mgq9erIaLPagMvfY2I5v4=
X-Gm-Gg: AYBFou2vDQ0LDdyJLt+6T08DWBpVeDD3C3vblrpQB53Ytyf9v4hMfZIDyhZ8wtxNrd1
	ZA4qb3hwiAwLRAyWjxwQf4Gv1hTMVZSf37FgiOWffknba8rlXfZhUzyyIzw7valhfD2j+e2RPQX
	sJRp1TXpZ3yiX7k9voqHCZJe7+MDsHFi0pwE/DPmc5j6SfEN0jJmSS7/+yWzTjOgKKtXzNUNQKC
	E4OGknBTNkdXuaqv3UKdXpcPqtYANBwVE1r+SIaibx/33ZCd8Oj2OiG5Kk37wEUAPMPbrIdWiEK
	B0yyjUtFsjp3GQh4v2Te2z9W0NdbaJHaFyP4RCcexuUz5GhlarKY0X2UTLYRKX/u42dD8Lsh55r
	UF1qbLh6JwqUa/Q0sTsYsDpnjdyJlYgJarDIVu1Zua1xIxpUAmjx+FP65gNGuc8gupXu/KoU=
X-Received: by 2002:a05:6512:108a:b0:5c0:b5c:4084 with SMTP id
 2adb3069b0e04-5c1705d663fmr682927e87.1.1794556841810; Fri, 13 Nov 2026
 00:00:41 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-hantro-codec-fixes-v2-0-f44424df585b@gmail.com>
 <20261112-hantro-codec-fixes-v2-3-f44424df585b@gmail.com> <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
In-Reply-To: <f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:00:30 -0800
X-Gm-Features: AclHuK-I_zgsSZZ7-9_Jv6URD3G7__LXdFVlF7HwZI4Ihkxqdy0NcAMKAgOjjTI
Message-ID: <CAEy9hNVSC7TAvdLmN-yWH9NdtKH9jgVnyxFwLJ+J2qPZvOQTEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] media: verisilicon: Don't offer VP8 above 1080p on
 the Rockchip VDPU2
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Just to bring to your attention, the IP does support up to 65Kx65k, but then you
> can't do referencing (its the WebP mode, key frame only). Hughes Fruchet from ST
> started looking into this but his work was not completed. The general idea
> though was to perhaps introduce a V4L2_PIX_FMT_WEBP_VP8 (or VP8_INTRA, naming is
> hard) format to signal this to the decoder, and limit to 1080 the FMT_VP8 (what
> you are fixing I suppose).

Thanks, good to know. Yes, this only limits FMT_VP8, so a WebP or
VP8_INTRA format can still be added for the larger sizes.

> If you have time, it is also miss-configured on the imx8mm, the combo-core
> (G1/H1 combined, like RK modified version). While the imx8mq has 4k h264, I
> don't know if the VP8 core actually is capable of 4k, so perhaps both soc need
> fixing.

I have no i.MX8M board to check what the VP8 limit is there, so I left
those tables alone for now. I will take a look at getting a patch for
this separately.

Arun
