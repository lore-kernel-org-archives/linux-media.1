Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013072;
	b=eVmCdLjmHyy3PzyXk/18Q39ncylCgyyagYwdGRF1We2SC7/lNh2HreHY3qtj/jNXN2KJ
	 2D0yFi4DtLCLnlT9QRxScC67wqi7vq5aDgu2JbXxvPG2s4JWE+uHpyGVhwPxW6s54P8nS
	 0LDCNa5pumE52hmwl3op24hUNNbtExm6CGSv1xN7gKCam9f10yQrRIOKk+GE1Y/yGmHrx
	 Sm6XTYSgtZaUGql8U3DCwg0jJohMMfsncAF4J5h/6ftsuQPh52yAW/V0WMqZJZqAbUkR4
	 iKD9OxWUo+CZf8Ihbi5RHdUMF9pH8TrhX0DZEN2MPG9QeBOilAirqPjj/m2SITmM+rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7flh22TlI26HBm5oFNJ78HlS4hFHr9Z77BN5Iwza6Hc=;
	b=cv/4JCNMYFyVs+PT9zzGm7HmnLj2SvjF0zp6QXteSm2Y+Zrp1N3t43vvdWZvkE6VXsX0
	 HITvPkdeRrzlWQXvJnR7VU+iRGo8JO5xQThKaa1PrOiWQksaLuClRxJOAu93ge17LIfR8
	 dJ+BZXpbtvKhU0OiU7u0M5wnHW2JQTIxKMUe7R3zxLPoWf97eHUtHgY92Cy8yOyy5rPhp
	 pMQlJxtlrntN1i/ea5MzVGu3Mm1hQuugw7aT+BOPMq/bhEuN/73Z6d7VyMqcncPBAYImI
	 H9B7Grg9lleZ1/Ak5aOMJzfKoqagBUAlse3pBpIZdg2caov8jeMpMV2//21YnVUnWAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FH558YDm;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D150606F80F
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D150606F80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FH558YDm
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e0d885929so1831167f8f.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013070; x=1793617870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7flh22TlI26HBm5oFNJ78HlS4hFHr9Z77BN5Iwza6Hc=;
        b=FH558YDmEjepLb/Gx+P/JsK/txBW4odu9FQ9gnuW+8BZQ8b5h8XazJTzGGQiW8gRVx
         ZwOhC2xQC0AkfpOIOqi/AIi7YuMryIrYfDrjzErXj/iVCmoCM74MWhbi3OhaF16BwIgC
         nCaFb63BVOuM4BidA40KSBp5wzgAIo5+xtP/4VzNyEn3XyrzoNlwXsA7OasqbSPcruxi
         GgYTuxFOlLH/2DMNxrQhCwRTgw7ur8DEC156SHsae7HlE3eBLvdd27FqyUMAUA4oHxag
         jPhZZsF/2m88kdpZJlsgV0CxK8rliOae3ealZ9qy2s4t1pTJ1V03i0axhLpyYQzdTlPX
         ANPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013070; x=1793617870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7flh22TlI26HBm5oFNJ78HlS4hFHr9Z77BN5Iwza6Hc=;
        b=aQYjKTVPAwNueP2t50aMJBE5JfvN8R8dZV42rdZcPNpQt62dOQzHat99StO4xYmRad
         wEE3MnkrPRhhQ+xj9gWeBWugkhdAHRORETIqE4U0NF89Wchi2jESn0BeJh2hEaTs3ETQ
         DXZO5XBRRM5d4qqbjKefMcCUkeGkFaq4qIbCvgvBeZ/ZEI+h4pIeD3bbKQkG4TBNkkg2
         bjRsI0f/pFbolA60afIXuRlxCJ82b4Kr0Ggte2Pui6z81mV5Rp2IWgRhbFpMRaD5elMy
         LqrVHzdNM37TK332PRokECez+PJBgygymdO7yr08Yd7EMSF0qaLCCoonEHGMXKWRUT4y
         DtMw==
X-Forwarded-Encrypted: i=1; AKwUvByZzcSHz+/kBJBPdiCsEoxLz8z6Xr173UEP0FBApFhmcKK6PjZTm68dzxBNHO0JaHvNTTUbm+QUVWYXYQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLnWxwseZUSNhQz657/bNLxyl+K5HOYKj5LM9kFAwP5AjAjd9wF
	IfXcQBIf9embNvc7lbpP2mrMbgh47qgxKIJuemomCb5/Z7YnIOvMQryb
X-Gm-Gg: AYBFou39LWVO8gR14ctda488jq5F7GVleFIINkLrAynQ02Q49iwrKGOOEQBfpTAAmGP
	DFtqPK2My33pbwyK7qnrBjUf+OjcKSnplX395yqat8I/owuKuWvrWNgY7dSQyE7vaJKXBdsV/H2
	Xv0rQkymRcLuAmi7riwHw4ejPb+xcu52Ej4IFRfeTEduM3/eg/IepEp3YtaXd2p9o+5FuBxODah
	z1soRSDjie6KHwE3Iq+mdBGAOenG68bag6JED8PCNlWQffOHR6CdldVuPuyJFVfm3RWPHIwqS2Y
	IFi1Bw5VAX9fMONXiG0e4lqBwbZbRtTLgIwhcL8K4joqgbnaitSXEKYp9hKesySURUGEvUOccnD
	AbcrFIuqWTbULmPr2bD+/0sAVPGn26pJVWgavYkxwt1yW43XQ17sDE0ZY1W0vgii02iYGreur57
	mnpb4/Qz/IZRxFgjppQ+6AR8xO9XyLJhMuYSfFgNcdMo8LBExM38ft9PChOWwsqQ3LWweHY8/O8
	rMO5kdfqrZmGlZj9IlgT6u3ruyYdwD7GPs1zT7NXgZ4zOl2dSS+MOdRHBFqa58VgTn4VHWCq/td
	kg3jMjj0h75seQ==
X-Received: by 2002:a5d:64ee:0:b0:487:88b:4681 with SMTP id ffacd0b85a97d-48e3eb9a357mr12532907f8f.10.1793013070269;
        Mon, 26 Oct 2026 04:11:10 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm13582478f8f.26.2026.10.26.04.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:09 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rillian Grant <rillian.grant@gmail.com>,
	"D. Manresa" <dmanresa@gmail.com>,
	Sergey Lebedev <lsa.uz@pm.me>,
	linux-media@vger.kernel.org
Subject: Re: media: ipu-bridge: lifetime of retained software-node properties
Date: Mon, 26 Oct 2026 11:11:06 +0000
Message-ID: <20261026111108.34186-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026091252.676350-1-koreev.r@gmail.com>
References: <20261026091252.676350-1-koreev.r@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ruslan,

On Mon, Oct 26, 2026 at 12:12:52PM +0300, Ruslan Koreev wrote:
> The bridge deliberately keeps its software-node graph after module unload,
> but link-frequencies still points at cfg->link_freqs in module storage.
> The lens-focus property name is also a module string literal.

Both are covered already. D. Manresa's series, whose v5 went out this
morning (Cc'd), fixes exactly these two in 1/2: the lens-focus name goes
into struct ipu_property_names and the link frequencies are copied into
struct ipu_sensor.

https://lore.kernel.org/linux-media/20261026082549.662885-1-dmanresa@gmail.com/

It follows a20c843c9bc4 ("media: ipu-bridge: Keep the
clock-noncontinuous property name out of rodata"), which did the same
for clock-noncontinuous. As far as I can see, with those two gone
nothing in the graph points into the module any more and every other name
and value is already a per-sensor copy. Sergey Lebedev's VD55G0 series
adds an "st,leds" property, and his v2 will store it the same way (Cc'd
too).

So there may be no need for a separate fix. Basing the flash integration
on Manresa's 1/2, and putting any new names and values in the same
places, would keep it consistent.

Fernando
