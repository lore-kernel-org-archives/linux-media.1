Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA03408600
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409944; cv=pass; b=IVo0B+6EAu9tOSEGDYDuwQ+2jvm1fDD1wZlGaCf4FadU/ZZdIzVkbudqrJWYQrNyNwLGOsTP2JDdagTtiq+7Izke35q5byOLh+MLMrlc6rk2X6BK3mrghGk6b5HeAuPJVtuFCcvbK+9zmjIPL1bfAXFS4yyAVdSJTI7YTSjc2Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409944; c=relaxed/simple;
	bh=sLN/8L1y06cQ6KWA4CLKB+Y1mIYSPe3mmBiGBLZ+Ins=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=asCHNk+JFkTQjZk+rQLlpSAYe531bHbwLmp9+sGTBJkS3antzRh4n5pGk6z8A/er39hZffdHW9IiS1NeJJbHuJE4d/mISbrVIOc3l7Po+/rugkSVIlzXvCtMJ3Xf71cbDm/RSft1DePwtCAFa8y2XKDNNqDA/OK2X5D7YRR492o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=PXyW+AXA; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PXyW+AXA"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso2096166a34.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 04:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785409938; cv=none;
        d=google.com; s=arc-20260327;
        b=R2LZzA9MZP64xy/8Om+K4yovOrdnSpWUP9DsER2U4nZ5P8EH2liYqz12aYKCWxLeRo
         9kDUAhWKu+JqeqpNgt3HyTyW3otOOOs9VKFWChb7pPjR3QcqEDuZ0Ko7h9HJ5BEDMhkt
         tlaxL408WBvys3oGz0tneFxxfiwqHOsC2GcvaTwy0EmRgY3QjCgFKGwg1Dcif15ypyFG
         zuhsj1eykMQltqA0WhXh7hJjwqZJDZFFzYuwz5f4377OHlDWHrxCZaKQAC92gczR2u76
         EX9a/tZqWgTMOuchsLSVZyhG4HXRFaKB3zM2PZjwCUIoginlWNvmdvSEH0oFcn2plBzT
         yf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NUBLC7I5kJZ00fPSEGgwcR4RGiMCMioSkU56rCYLaVU=;
        fh=UB9lsJHBoZGFq7T4BSFnjt0U3uMlO2bSJVT0o8TEVG0=;
        b=rlhWBRnKA+ex3CiK6MGLNkZf4MZoC3IikQx/cQHCJex9WEy9CEq0Wq79qH4LUwlEXr
         kJkIp2ZggvflsRg784bJJT4SP6Io+BMcu3mU30B7FsW40pqc9aC6kLdCQdm1jZb7BBLs
         Pfv1ToEcqLkNCFeE6Gp3eEFaQ+Q4xgo2oO/X61hSHX2TqmMfWRQQ1Hk/W7ywkGCPUFb2
         KHPU9zoh+BtPyfDrcpKeAIA4C2o8oq2BgmyhhFybmFEI0qHNpy2EZyHd8CWJHQdYBuLz
         sC4YyLr4QERa56sjIosCpq/+eWX/jVIaiko6rN1HqGwqiKT8S6WPQ1mIMZ0mjkiKA5v4
         PeAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785409938; x=1786014738; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUBLC7I5kJZ00fPSEGgwcR4RGiMCMioSkU56rCYLaVU=;
        b=PXyW+AXANS3ydiN/LP3CDYr8822XsQ2Eas0p2c7hq8DNiI4s2KOsJCI/XN4vQ7lALJ
         qcM/nlUYI05Q6HmLTHvHc2gCnxxtnt/VM1vfy/xnHHNnzK+o5UwH2lz0aLsZg3x799v/
         WzkBM5y9NCzW3bGxoT6dA4ERz5fTfwjjkjluadPVlax2F7ThlIGCYKrjD1rkNOZnzD3T
         qWK0xOFl7dweMkgQ7UJMNWve71q1LI7AcSo2fK+GJmntWsgh573E4qB9vT7BtSb5ED1h
         vwvdjDKLtmKS2WwKWM6bV4F05N5MnjkBbzcl92hfteiDx0wyN0AcSIGMJ+Uffkm1kFYM
         O8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409938; x=1786014738;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NUBLC7I5kJZ00fPSEGgwcR4RGiMCMioSkU56rCYLaVU=;
        b=bmDFclEEN9VtEOAXfYlbMLfEEMZ80KCnbPWx+bknI3x43zK4GtZZbtF32mAQjYZ45J
         8WwOiMccSsamGuLwxayY5iP3d7cOMVtsxvmudr2j1PnWp+/UGc36WxrO1OgNNgAGFOJR
         o80lruRTp2Bbf2rh99hncVB8BLF6FpZy0c7HLzcfe82L5AGGLSlGVhjJqUdpCae90aoy
         44tBtrJcF0cI4uqfC6n8Hmo2FwFwgSkWljJ21x0EzN0ZK+8kaUR/C0NCoN5vdlQH8XiV
         HhEuRB1HV7ZCnO3/H5ElYcxrnC/jGzpTI5KlOiBc0B2gP/wJptDPWEs7oFiM/UwFzaqD
         G0TQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/vYmf/tWpf1SGbvxjhlfJ782G1FR4QnkJH+KMopY6TfiDrg5MYOYIdE9n0y77quMuID14QUi+/Ucq7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeDTPL+IA51mSSbhKraPhIjS76Ldu8R/OKSILYFJifOTaZs6LO
	Qda5WuehnLnik+NXNU3w1SCZXd9kvvmqYvLbCMizAX7K5ca4FnVXmwpqmuuu8OHk80NyNjNIp4S
	QNNwMKwFRB+8AL95fmg1bs52pz4rWupuqAB2F6IhqRQ==
X-Gm-Gg: AR+sD10e9OQqsMt8ofd1k4Z05RAs0F4rZ6eGGKxBhAvxk1+ZVXzKxYwJLOl+fGodYUc
	HhJSrl4nquokRWr3HHsYaHRcjEYz8D2prZJW/0BqvJ1kdIS5u10rALWv5vvyjvj9JCwkWdLI9R4
	aYY6NhDdq2YG9bUa6KGOKE8Nf6yYyzsdcl/uczuEqBLbxIXnDrlIJjwMMvB3vk53zvJ/AGRQzk+
	i0DumcbiIz3+48g6CrgcWbdI2vA6vGznVK5+QTTv4iAcF7UtifzABUETa0FHEZqkEQ6a1BralMZ
	lkYIGIDxPrZoac3SD0hxgPNilIKclCAGSYVBVoTPfnyCt++B7X4yB7+JW/v8ahxN6skFaGvGc99
	orI+F3Bdm/gs7Vxx4OrfLKNYH3Wx3dltKd5APXnN87lK0htP3AcWgb3qmVFE1tA==
X-Received: by 2002:a05:6820:1c9b:b0:6a1:9a5c:b60d with SMTP id
 006d021491bc7-6acbc15dddbmr1193434eaf.65.1785409938066; Thu, 30 Jul 2026
 04:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312150437.1091195-1-eagle.alexander923@gmail.com>
 <20260312150437.1091195-3-eagle.alexander923@gmail.com> <CAPY8ntAf9TjgW-E6WeJuMdsHy8pV8-CvqQJriWEFpgLB-brD5A@mail.gmail.com>
 <178455866124.1426769.18237320419273419942@freya> <CAPY8ntCvB9ij=rMwwBmBDfe_gWQboX9Xbt0ZB6WPVyFvc2CLZw@mail.gmail.com>
 <178461038136.1426769.8068222330738680407@freya>
In-Reply-To: <178461038136.1426769.8068222330738680407@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 30 Jul 2026 12:12:01 +0100
X-Gm-Features: AUfX_myGTmVBH34m2Jz8-C-my113aiV1VSAYpXPgOIiCRDk6IfxzvOQH-m-YR4A
Message-ID: <CAPY8ntDk+4aseGqijPz8Y9cGFzN=4zHPEj3HiHgetn=O_ufh_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add driver for Sony IMX662 sensor
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Tetsuya Nomura <tetsuya.nomura@soho-enterprise.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Tue, 21 Jul 2026 at 06:06, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,

<snip>

> > > and implement
> > > it using the common raw sensor model directly?
> > >
> > > I did it for IMX678 [1] on Sakari's suggestion [2]. The two sensors are
> > > quite similar, so I'm happy to help in whatever way I can on getting this
> > > working with the new model too :-)

I'd also noticed that all the Starvis 2 sensors are very similar, to
the extent that it seemed worth a very quick test to see how much
needed to change for the imx678 driver to work with imx662.

The answer turned out to be really not much:
- PIXEL_RATE
- PIX_PER_CLK
- ID
- native and active areas
- min_hmax
- common_regs (culled nearly all of them, although I do have the
spreadsheet from Sony which needs to be added to my next version)
- VMAX_DEFAULT setup if you want the full frame rate.

Those would all parameterise quite easily.

I also have an IMX675 module from Soho Enterprises which is a 5MPix
Starvis 2 sensor. I don't have a datasheet for it at present.
That streams OK at the requested rates by just updating the active
area to 2608x1960 and ignoring the ID. However I can only receive test
patterns as all the active images I get are pure black :( I'm hoping
it's a faulty module, but will keep poking.

There is also IMX585 as an 8MPix Starvis2 sensor. I'd hoped Naush had
one to test, but it seems not. In the meantime I've compared against
the driver Will Whang sent to linux-media a while back [1] and that
also looks largely the same.

And the imx908 Starvis 3 driver that has just been posted [2] is also
looking incredibly similar.

So the big question is whether it is better to have separate drivers
for all these sensors, or one combined Starvis2/3 driver? Do we shoot
ourselves in the foot when we come to add functionality and find that
it only applies to some models?
The awkward part would be testing all variants when patches are
submitted, as I suspect there won't be one person that has access to
all of them.

Thoughts appreciated.

  Dave

[1] https://lore.kernel.org/linux-media/20250816055432.131912-1-will@willwhang.com/
[2] https://lore.kernel.org/linux-media/20260730021525.166811-1-lachlan.michael@sony.com/T/#t
