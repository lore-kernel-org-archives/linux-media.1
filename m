Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986288;
	b=QR73YFGPk6x/4oorderFC3ffIdAZt3B4ch/fej8QHnYG6EMmCi8orKdAGIiwCK3XPNAd
	 8XeUO0y0tPSp3tlidGiZ7Azl2FdqNYbmFOD+ZIR1EnHNemVOqz1hjvo2akaT5vugV+hmx
	 yrTd211Gja9qLunDGlyVYl+xOcfibTtHA9OPOA1rtOriS4Qo1ZN/8FUyUyuybTx59CKi9
	 feHWPx//mbBDrGv5YdCx9mnbGFMRSh+ZQirE6D3Vccjeyuj/0sc/kdERqjUtyV5nmwMzW
	 LUfJ8ndDpw6hrELqwveq+shW4jtfty34Fgf5NwwhOMPdBsA5F23SvgrlKqCEA+WRfZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mp9syZcJ1VmKc3LeFMmkylagr7lDm03TniYUI7wIYH4=;
	b=LWvq1XolrARe4qZ2Cn6STiJs4xEd8TEFNcgUlnWYPFsDqVL3ZJRPj926IONw2sqOZd2q
	 gRYLoqMBW+ahLh6vMxx6GdGZ6WolegsA2vCbLHyUafQpw9gW+UlhAJBH9yeJrWbpjSg5q
	 Ws9cRM7PkXXqBOJNcCCiVbkPaViEQEWZkBOYM5uPly6066Db3d/I23P5vGsGfLk0GSCag
	 Ae7Fh5mCgG/44aPyTyKH9Snx0yN6aiWTvfMivFFAV3sPjD8oGn+ZwELG0qUCbx/cFtI3T
	 DQfFuJYhPAn1Nm7jZWm9CEwXWeK5/voJlssqofwthtV2XNUHERaYKFnBu//rjEzcTAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PZI0qVFz;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EEC606A31B
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06EEC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PZI0qVFz
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98c5876f2b0so1581657241.2
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 20:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986287; x=1793591087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mp9syZcJ1VmKc3LeFMmkylagr7lDm03TniYUI7wIYH4=;
        b=PZI0qVFzdLhpLXhzbHGKdoD/1uf3IVOBmnibJVbb+XPXpULEfVaymH6iUPbYnP2RNG
         fSHMFkRdkdulojLA7Yg82U1nzDpKbCzofeFqfrYyXUCBBe+3vLpnuo9w6QWVu8rUO6KX
         C9crbexWoN3nO+694eJkzeKtKthvVErsJKOxwp95si8YkHerGDgvqjWKLTGUvdF/6xTi
         +/TErvLy5ZTFua+sW/443VVIAdJ2+KAtfjC2coBCd1h+3CyXI7wKwzaGgx6UGfOIShzs
         4tnBt9e+bJpdm+nO25+A2gVJ6uecScTsanhmzo2mg7FBcfo7pw4A8HL/nuHMbYrKVbNU
         Gjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986287; x=1793591087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mp9syZcJ1VmKc3LeFMmkylagr7lDm03TniYUI7wIYH4=;
        b=yv7+QpKrBRre3uRGJH6rxvATezjepcyYkAkZxoqHlkSSrW3GvjpQaYEpgCHaRDaN6d
         mZP9fUkdPwzkfiVU8tcYzF0PA7Ub3ymeH5Zdtva54Dn72MXwM0C9Tg7lZlVZbQcf1sbs
         cG+mYYelk9kccMG6zbpqGZewgVbylC2fDJsKrZ7e5AsJrmosso50oocD62puvLILA4OS
         Exe+2FZSbfeEPuKvZhajNnS0PU/B/DyrqRVRmI0kx8ODa2YtvVdbwweXNBZk8c7PToby
         AO3uWvVsk5VdcK0qty7Gd2w9U04YP4ybQGfcEGsmEWVj756jc4CVoHlH2WhwFhlU/Flf
         BXnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzW6GVhKGi/+FpmAlPc62EAAN+0rnYIOQIcIolgMqHlArcGBGvpMtxBXrGV1pEgVDsSz7T+r/VmtfKDFA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJqxsDaYkWP/0BcR90nqNx4zBnmGitytwqm3VODVz9JtOpvpJ8k
	jtSkyO0JPYJIufLaaucW8t0S85UwWqoLFR0kSI4Ry5auycdYXXbNq6rRtcNvBuO8
X-Gm-Gg: AYBFou2XFcSGnknMyCI0LtlFrp2+96b0Uj0Fe8xuyhqfh13EwIlJ9rPeyY3B8TZLLia
	/TosMbOeau7EeJnvg18BtcJZ6FEOeuK+dxfHfB/V4UhQ0ojqQopaoOiAqd05zWNpVw4UixPL+3P
	XW/bSwjGxO/znBY+5DWU8V7hHhmpSCJVHDOV/Q/SItSWKG2yzn+8H+bPyn+R+vZryIkVdQWs2yt
	fOPxm0zsfmuaezUQkd/JufDJEgFy1Fv4eKn4UeS7Bc0Kw2zr2t1Szu9/pCkd+HB19tA5u88OLZq
	1ezVY/Mrg4AeH4IGPkiOfus5B4aIw4bwjA4csToUHPIyUtlzpBbrZmRro0PlBR57kUKAam/LON0
	HWTJXtwJbMIZMWu4aHpUY4MUZ0VrJxvwujQUr6VahtCF/Y2drw5G92W6W/jHkFBZgi5giiYCSHO
	G4bpAZbtWqG1aCRZPXjVLymuRL9E7gN4MymEJOu03rZxG/Njp7pZ5LXEEXSfYMAWwWZ65Jlwers
	qlrstfwk7aIVMd4aEezS5SAWcZsEyoca/lwlksA/n4WfqUEIpwgBpblxpbD/8rcoKE+5Tkn2bdN
	Xu5iNFLAY4eDvGrrM8B2
X-Received: by 2002:a05:6102:83cb:b0:7c1:62d2:e18a with SMTP id ada2fe7eead31-7ce5cd2d77fmr1526100137.16.1792986286951;
        Sun, 25 Oct 2026 20:44:46 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e6cfb52sm7116134241.2.2026.10.25.20.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:45 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Felipe Calliari <calliarifelipe@gmail.com>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] media: ov02c10: Split the PLL registers off the mode tables
Date: Mon, 26 Oct 2026 00:44:24 -0300
Message-ID: <20261026034425.74516-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <asAYI3pjBMHAdnTv@kekkonen.localdomain>
References: <20260923144257.119076-1-calliarifelipe@gmail.com> <20260923234100.318151-1-calliarifelipe@gmail.com> <20260923234100.318151-4-calliarifelipe@gmail.com> <asAYI3pjBMHAdnTv@kekkonen.localdomain>
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

Hi Sakari,

Thanks for the review.

On Fri, Oct 02, 2026 at 11:46:27PM +0300, Sakari Ailus wrote:
> On Wed, Sep 23, 2026 at 08:40:58PM -0300, Felipe Calliari wrote:
> >  static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
> > -	{0x0301, 0x08},
> > -	{0x0303, 0x06},
>
> I haven't tried to figure out what this register exatly is, but this patch
> changes how this register is programmed. After this patch, the value of
> this register is always 5.

It was always 5 before this patch too. ov02c10_enable_streams() writes
the common table and then the per-lane table, and both per-lane tables
write 0x0303 and 0x0305 again:

  common table:  0x0303 = 0x06, 0x0305 = 0xe0
  1-lane table:  0x0303 = 0x05, 0x0305 = 0x90
  2-lane table:  0x0303 = 0x05, 0x0305 = 0x90

The tables are written every time streaming starts, after the sensor
is powered up, and the sensor only starts streaming afterwards, when
0x0100 is set. So when streaming starts, 0x0303 is always 0x05 and
0x0305 always 0x90, before and after this patch.

The tables come from the out-of-tree driver [1], where each mode table
has the same pair: 0x06 and 0xe0 at the top, and 0x05 and 0x90 under a
"// plls" comment at its end.

Still, you're right that the patch changes how the register is
programmed, and the commit message didn't say so. In v4 the series no
longer touches these writes: the common table is left alone, 0x0303 =
0x06 and 0x0305 = 0xe0 included, and only the "plls" block of the
per-lane tables moves into the PLL table, which is written right after
the common table. Every register write is kept, with the same value, so
0x0303 still starts at 0x06 and is then set to 0x05, and there is no
change in behaviour.

If you'd like the repeated writes in the common table dropped, I can do
that in a separate patch after this series is merged.

> > +static const struct reg_sequence sensor_pll_19_2mhz_setting[] = {
>
> I guess some of these settings are determining link frequency or pixel
> rate, so they're not generic to anything using 19,2 MHz external clock.

You're right, they set both. I have no PLL documentation, but sweeping
the registers on my 26 MHz unit shows that 0x0304/0x0305 is the
multiplier for the link and 0x0315/0x0316 the one for the pixel clock.
0x031c divides the pixel clock, and 0x0301 and 0x0303 act on the link.

In v4 the PLL table goes with the link frequency instead, as in
ov08x40: a link_freq_configs[] array indexed like
link_freq_menu_items[], each entry holding the PLL table and the
external clock rate it is for. Probe picks the first link frequency
listed by the firmware that the external clock can produce.

There were no comments on patches 4 and 5, so I'll send v4 once I've
tested it on my hardware.

[1] https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c

--
Regards,
Felipe
