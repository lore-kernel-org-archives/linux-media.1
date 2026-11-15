Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794738811;
	b=ETELB/p1fdWtjX35nE1kBHl+0r3pI9DU+LKiT7J1YjvWSK7VPGuadsNWhKPAhtGpLsch
	 33uu5MV7TccEnCGHQKoNbyn/RgNjNvwCuV7qsom0b4UfNxjCJWVSfOtI5ECXpoBla3btC
	 qMFWKbV7DctmzhSyxOGnSzELxRPatYUNaL7dnD+yO9VtPwz7Vg5u4anFs3CxbggbBTf7j
	 wS0KAkn8N30Umi0wo6Qt1qIUVwJwZ6r7p5oiMpx8CHdZpSPyhlZWWVOpZJ8HY15SJqhrT
	 M+K72uybMSxa0eZPEH13d1ZeXNhPl0UkjxQqXZqzJuU/E5vdpF7H5fINfCwWzfIXCHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794738811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:User-Agent:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fpzarE1cU1bUvbd55+S/yK+OtqBME8Oy9wYyX5L/AKo=;
	b=YNOlF8VhHu4OfR8GtDjuYkXxyJhJHgUD5U+ZPNczh7FM6OJIi52icR/A4xbPB4Hx7Iux
	 INXoHwky8EG4lvP3UPTim5El17NRk2t7muUWaZL/B5IjtQydm87+SySbznouMOcPZn+3l
	 G9nzIA68pUB1tU2Ex8iydmTXN9k11OGSO5U6noSk9JPOxzwy/jIy15Gkwcl9O2pyyh7Wu
	 5KGQfOmndP8fuhHjaO+oAzSBb1zP00m00SpMTsBe6j+9Pm7iIZ4UfyRtAepDjAWhC1fqS
	 vgjvnlHl7FuQIizRhjZIGD10XyF9T5y0oumkC2wZ/l7Hiz8TMQ8NCVgjtiat93khSCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kynesim.co.uk;
	spf=pass smtp.mailfrom=kynesim.co.uk;
	dkim=pass header.d=kynesim.co.uk header.i=@kynesim.co.uk header.a=rsa-sha256 header.s=google header.b=s4BD+3zr;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B7606A31A
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 10:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 212B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.a=rsa-sha256 header.s=google header.b=s4BD+3zr
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13997255e9.2
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 02:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1794738809; x=1795343609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :in-reply-to:references:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fpzarE1cU1bUvbd55+S/yK+OtqBME8Oy9wYyX5L/AKo=;
        b=s4BD+3zr0ZB73gYFUyoN8Fc3af5PkYuljzcdrdH8vmmpvaj9uc3xE1DRDDx6A7lAxH
         u5kq20OiQ2qIEicNj9JhCNc3xHmUfiBXZLX2jQYOXRx3wzMXCSqqTBnbXMBquuhXaKpb
         GO8ZateL3QSehf6VbdV1Ti269qi6D28Tjy+X4IaIt07smuEPL+AShl0CTXW91bwzOx0t
         lxgZ/sUMGOZyscGbQg6XwYxQSFmlOf43LLXXZRCHeBtOJOsKHoFMlbtD/LRZxKh9XoU9
         2FwqZRMjgzonDvHdx1NFQ9fwT1LyCegf881QqQ52yolEJPIj6WF3uoqVYdz/0IGqiZvK
         ePNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794738809; x=1795343609;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :in-reply-to:references:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fpzarE1cU1bUvbd55+S/yK+OtqBME8Oy9wYyX5L/AKo=;
        b=18VFqUVi4Y6Rfr6fVYSQ83XxwLmHWvjXWBhOiFqxV49MWHdryYZqm8ahbG1wTsq6q9
         u9x00Q7EgmW8F1gR7iIpyFKkEICbPC6q4Qag5p9D3DbNHfNe/dGpawRUK1yIHXW5wWiJ
         NWB2sPInukhoK93Vbq+coQ1UMKYH4Z7OCbX5xCk3RUVX+RCtdziykrbvH8+zO3nCOKtz
         JfCnddvzsIjXlscYbpPjhTLAQ4OvScHlri5r0FfxEiZPxsmr8YzNElRLm7EXZW68H821
         4gxL9AmMpta/2nEqrbtEmk8719qtF7skADPox4aEXo4wDL9GYWjR1gI/aidcXPcbmVBs
         VTCQ==
X-Forwarded-Encrypted: i=1; AL+hErFVlmsT46oV4rugp2Fg0q7JyGvLC+VwK5qxkNQVb/sclP7xydoc+/bQVTNI/ME+pPNuMIYS7XRXY+nS+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z9byDajCx35QtJCOStRn1SVHVkW5VEgyO9YDJiuYbx0KgN3Oo
	Oab9g2HUgtH/TwPOD9FdM3hXFQKQ3E3QtLuDl5/4wcJ610qf3yI2pw9SNv9MEw5yjp8=
X-Gm-Gg: AYBFou0d95yGRNTODQ1Mk/KWER9+TqX43kA0bJI15+43B3mcB3Wf/2kcB1/O/FQCCLM
	lZh0WIyUOd11J4UCj7Qqc4qtr5e2zrRCmvXxIYg0UVXzPUyQ0h7enr4fxzAS8QCxX/ZVJlUVZ5D
	1YuQT16s0KtXYni8fu9sehjGtyUwuO1jsXSH8ezUHhioC6RrPG+ekuwxwUBhQ432qsmp8EiCN5J
	+Bve3Enj/LojrFqoJG3FLhC/RS8btmxqLxxwml5peGEgIh4BETLn5UGmUeK67c/xq/xSMFKUQrC
	vGR+7Ovogg890cxIh8rxscBufLqu0HmeIwkF+8VONfeFtqTv9O/mpbOQO9Iwjgq0LZROH2YHewm
	8BQphMb8HS2T3Z4IiEV9Nkh3HmIgIZX2WMuhNttVLrabuvp9aUtgKEwMjI5S1SPJW0wQARmR083
	Kqcbv5gg2x2iSMTaAAskSz8tWRJAjHAhe9zs/d9oleBueGHADiLQxQlEFJAmtDpXcAcBOKAA7wG
	XOxvQ2iyzhs5cGWW8V2I09Zdb+OQmlaFUk79pdp8ZPYLCUtXBvojIo35PmfDFojLgQE5jzauC45
	JAz1cbpl+WEhYCWgz02HUWLfFnuagbQUq7QTF38CEac3epvLl73FnR3OCdlny1tO98Y/e2qUfxL
	RJIyzyuj6gpjkj0Q+4iUX2AWugDeJ5iW97PpTKUX3fSwZLeubsjPeimCe
X-Received: by 2002:a05:600c:83ca:b0:4bb:53e4:a7cc with SMTP id 5b1f17b1804b1-4bb55a74c2emr158139325e9.30.1794738808932;
        Sun, 15 Nov 2026 02:33:28 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc92886-cmbg20-2-0-cust122.5-4.cable.virginm.net. [82.20.18.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm15656885f8f.35.2026.11.15.02.33.28
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Sun, 15 Nov 2026 02:33:28 -0800 (PST)
From: John Cox <jc@kynesim.co.uk>
To: Andy <logic1208@gmail.com>
Cc: dave.stevenson@raspberrypi.com, john.cox@raspberrypi.com, kernel-list@raspberrypi.com, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, nicolas.dufresne@collabora.com, mcanal@igalia.com
Subject: Re: [PATCH v6 5/6] media: platform: Add Raspberry Pi HEVC decoder driver
Date: Sun, 15 Nov 2026 10:33:28 +0000
Message-ID: <vc2jflhb1t7vgp018bisojip40bq0i9hn0@4ax.com>
References: <CAParQ-2bewNmh3BP49fyFr0A51W7obkCjgHuLeZ=mGYjL2D9+w@mail.gmail.com>
In-Reply-To: <CAParQ-2bewNmh3BP49fyFr0A51W7obkCjgHuLeZ=mGYjL2D9+w@mail.gmail.com>
User-Agent: ForteAgent/8.00.32.1272
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andre

>Hi Dave, hi John,
>
>(Sorry for not threading this properly, my mail client cannot set
>In-Reply-To. This refers to [PATCH v6 5/6], posted 2026-03-04:
>https://www.google.com/url?q=3Dhttps://lore.kernel.org/linux-media/20260=
304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com/&source=3Dgmail&=
ust=3D1794798867626000&sa=3DE
>)
>
>I believe there is a regression in v6 in dec_env_init() in
>hevc_d_h265.c:
>
>ctx->dec_pool =3D kmalloc_objs(*ctx->dec_pool, HEVC_D_DEC_ENV_COUNT,
>GFP_KERNEL);
>
>The decode environments are not zeroed any more. hevc_d_h265_setup()
>sets de->frame_aux, but de->col_aux only when the picture has a
>collocated reference. For the first pictures of a context (an IDR has
>none) col_aux therefore holds stale slab contents. phase2_claimed()
>dereferences de->col_aux->col.addr and dec_env_delete() drops a
>reference through it, which oopses in the decoder interrupt handler
>(phase2_claimed+0x18c, "Fatal exception in interrupt").
>
>The downstream tree has always zeroed this allocation (kzalloc in
>rpi-6.12.y, kcalloc in rpi-6.18.y), so this looks like a slip when
>converting to the new allocation helpers in v5 ("Switched to
>kzalloc_obj/kzalloc_objs as checkpatch now checks that").
>
>Suggested fix:
>
>- ctx->dec_pool =3D kmalloc_objs(*ctx->dec_pool, HEVC_D_DEC_ENV_COUNT,
>+ ctx->dec_pool =3D kzalloc_objs(*ctx->dec_pool, HEVC_D_DEC_ENV_COUNT,
>GFP_KERNEL);
>
>Tested on a Raspberry Pi 4 (BCM2711) with Linux 6.18.63 plus the v6
>series (with a small backport to build on 6.18), decoding 1080p25 and
>1080p60 Main and Main10 HEVC streams: before the change an oops in
>about every second run (found via netconsole), after the change more
>than 20 consecutive runs without errors.

You are almost certainly correct. Thanks for the patch.

John Cox

>Signed-off-by: Andr=C3=A9 Fritz <logic1208@gmail.com>
>
>Thanks for the driver,
>Andr=C3=A9 Fritz
