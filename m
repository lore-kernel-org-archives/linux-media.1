Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187101;
	b=025ZuGHvmINYftFJx0Dz59p/V65ioa8TN6SAVSnH+ZT5LqSgD1CcK1uuV1Kzr6Dn0HnV
	 IMFzGxElK+pRCBcC2GU+Qc51Y4QTOINF17Acx6Hl3lbceW7HYm81QkPpuLbKvtjn/SIhM
	 XDY5AI26F1YrfW1e6TMvgU20M3B8mNovg0ariMlMFZuxOPQVRLCyYz92bLD8I0YlR/asn
	 tZYoPmQV+A30NrFUwE0ac3jGHZHZuukzoQlivKimebqxkUkCZgNebGg40l2fU1puLKubd
	 sNJqRbFT3NldMlUqEpZMtX1nBwsHZIt8eihbKcyARufrnxRGiCHsGdA35pnTsPKMb4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZuVQNaWid9pWYXFR5sJM/0dx1+C32mmdmGQdiGyQ+Qs=;
	b=xlwqoN5/+TvNyc2Wa8t2Aw8EACKrpT3cOhwHMDtmNrg3cQMKxNRXHv8lE5/RtwZw0KRu
	 0buBTXigAg3Hco7vpKZlUkVKY2bHjqy1wfFUzptuYkLCAR2fCf4EiJlOMJja8MFH5sfDR
	 Q8ZErkZUG393gGtMRPPN4bCDmc18aqP1ZRGnEAD5Rutq344ehMGzIgnn0N3zVxFpcKCfB
	 tD39zE3f+POhAA7toErKnAdQeO+vNpCKfZvsO963NQLGa9QkkEG1ICgPqSpwdX96J/qWt
	 R6E7CcIEReeUJM81wXjgfXscmKuTT83HASxb9OAuqAa0K7oolJUbVqQp3CCtv2OUiuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rzC/RiYb";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A5606A31A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rzC/RiYb
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so7947355e9.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187100; x=1793791900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuVQNaWid9pWYXFR5sJM/0dx1+C32mmdmGQdiGyQ+Qs=;
        b=rzC/RiYbWvBXA2P565MellKyXzy3OLBZHsPXUzchhH9CD9zSbNGGuQPPT6M+tYvTCh
         Yuk3owPEQXYdclywO47Aa8Feei31oXB0GOBAxAzDxGgQ8YFQeagzW0GeuDO/n2RxJKjG
         19GAzCGFDXZwwWUsPH5Nm03BEzVsE1XJ6od4B6jI1FzJZcFIBHu80YIwgbNOFBrpu2EX
         Ny/OwLurBh9eljPCKwhK2stMULN9YUKrX0y2QYYBMZ+mRBR95ViPp/VHpkeZbctfNX+K
         sJHJDw8OvegYMUdFmcPTt8j86nfLsMu1ZsIkRlTLvK1G51x49TkUBZe0GmJLXTOBj2Fo
         AkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187100; x=1793791900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuVQNaWid9pWYXFR5sJM/0dx1+C32mmdmGQdiGyQ+Qs=;
        b=pNJ652zB/cICUQnIHAgDbsjFydiY59CQ8Lf+UVXYt3IlHEAT36j01g52/lp4/BUjb4
         W73gxzEGNymfIN1QlUEaIpbSeg25hGaJJfr9DTgnm8L/HlIjzq0hFV0qk18EOWDHFKMh
         pDFh7W5dI4d2fmd1lOWGMm5gS3/idYTawM8Ig/VlnnhvSg9o+R+i6sbcqieNSZ5TCvzj
         qNAjj7Xo+pCYjoXuz1OcrryFq2scGqCgr5bf56zpG2YlWlMhZ/5Zmn9tw1Z0fE6vyq0c
         zqCySp9uwwIQfhEgA+2TSdvFtZ+qYBBb93fsyMdJW1MYwlzj2hAsSeCMOWR/RG4a0/bi
         HCBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG7X+Go4soiKudcxgcAfxDp9lkclxdRAWl5EIUcjh1ukX6D6buEItF+SSX6moW49K03meBGiKL+n4/Ew==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ1xJKvgbANEzJcBgAynQlRR6AYjvY+G9SAtkVvmfv/IlwLo72
	jN9yi2iA5FVmGoTn47u7RDIrH1DX7YgyNF7KvwwIrr5TlNArBjmO0q8h
X-Gm-Gg: AYBFou2b2LuOJBA9lsJaV50q1SAEOcMVxC19eg95uiT3jtkacYvo9P5t31eJpHmvKw3
	Nq9YBmECgbTDf8jD54tF+C4jrzBArCBp/m5cStlZexfs9FFOKouHdeRnMYYaC1nseIiQ7fNv98j
	fvbY5lfE5hNj4Ce8oI7C4Kgnu6MU90VLR/X3u2CG1CN7v8VHe5507bkFQSlhZj2576RaPeKrxgI
	xKf67AGEpXG4VzAVBY9tIqOGhhzdacvGJVTwmBp8C44rIFWI05SUCxsd1dn2KjleJtsGhF4K+eo
	KXtt4VpJbuWPQq1REK+Uz33XnbrfK+FOyQ5dPsbr9JWj59dvQZ/wqmJiAapZkQgjHFDEig0WkPp
	3xuBGuoEx+lvylEpd4TqVTSmoFVoGdtdx+xg2oPEfM1f/lSC/A6fJq/4CTblJateN10eYrVY3Sd
	iBh7l1de9ntQUfnXujZzSU0nptOqCIotrbQq4qNpiVP4K8WFGdMQd0dnsmSNTjNK4YVAgKiTEcG
	m6K0Ps5w6gqy/alvZBvIaApGQ9A/rMbeyGhwZr0jK7ux0Y+g24IBWoHsgfUVuRBNe+9PBk9DliU
	sF5Dl9TINMcEF7jriZjUyiw/hZVoL/00iFo2gCgpEn9Nr+yyhDCilQJE2c0rH6aDvN7Q40PvCQC
	qG2tbT5NoR1twbfq1urRcwgDI+Q0iodjTMNL+Y5aA2Zre8o7+33RaF/wkJS3kQXmaxGKjTzTiSF
	sHnwe10Uzisaw=
X-Received: by 2002:a05:600c:3f0e:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4a99781ff60mr36159265e9.14.1793187099590;
        Wed, 28 Oct 2026 04:31:39 -0700 (PDT)
Received: from PC-Marco.lan ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a996aa0ff3sm16684455e9.1.2026.10.28.04.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:31:39 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Chris Simpson <chris@nilk.net>,
	Simon Kruse <simon0x+git@proton.me>,
	"D. Manresa" <dmanresa@gmail.com>,
	Tony Garcia <tony@loafecho.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: ov5693: Keep the Bayer order when flipping at full resolution
Date: Wed, 28 Oct 2026 12:31:36 +0100
Message-ID: <20261028113136.36524-1-rylos78@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <30b2925b-0518-4692-ae2a-f70fd11ce43b@ideasonboard.com>
References: <30b2925b-0518-4692-ae2a-f70fd11ce43b@ideasonboard.com>
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

Hi Dan,

On 28/10/2026 09:31, Dan Scally wrote:
> Hm. But what's the right approach? To allow flips without changing the
> media bus format code by offsetting the output rectangle, or to have
> flips change the media bus format that the driver reports and flag the
> flip controls with V4L2_CTRL_FLAG_MODIFY_LAYOUT. At the moment that
> would mean that you couldn't set flips whilst streaming though, which
> is suboptimal.

I went for the offset because it keeps the flips usable while
streaming and keeps the format the driver has always reported, so
nothing changes for existing users. Other drivers do the same: ov13b10
and ov01a10 shift the window offset by one pixel when flipping to keep
the Bayer order, and in imx290 the sensor itself moves the readout by
one pixel for the same reason.

The cost is one extra column of the pixel array, which is why the crop
end is widened by two columns, clamped to the array. The reported
format, crop rectangle and size don't change, and the binned modes are
left alone since the flips don't move their Bayer phase.

If you and Sakari would rather have the MODIFY_LAYOUT approach, I can
switch to it in v2.

Regards,
Marco
