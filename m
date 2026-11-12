Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464431;
	b=OlMAuJOUue05pdB+x7Qnb7ptw3eOHeKRn3lSQh0YF9VeBJV5Xu9RtwxNFowM7HKn/Uay
	 w/65MH1ZtBmiLKgYirNW8wWn0fsL25+Bk2I2eWWibbjrHFAgDLUY5v4ZATjzPy6pMppd2
	 npfJ6bfhqTOY+epvsJrHTcifNuiSbeqdCM3/17/nJzggBouLKnnqF8cq8lXK736rMu+cU
	 gU27ROhqEXwzD1gNPjhnkfNodH+l7c60QFVy52jN6flcQTiGal99bPalVxFiA8QHNvXdM
	 nyycDo6KVHE8Vdp14Z/dFpYjukY5e4al0PekRoLcfgTmSmuXMvRHNI/TOQVOWZD/PnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6RXE7MpOiitHrkFdvkSuFI10OAvTxEYbjLQMQzqwPMU=;
	b=fxaiHFq3lnWq87RsejGkQS5/knHFQbjlk96JkCfHnI5Mfhqk307eLskOwpBPienym9Ov
	 YelCjIM35f4NjVDAyOZkRRU/tacvNzQjJz43fpsoznf4v7rrl46d0ysKNm4MRndpc3qtp
	 E6xen2sG6yZVyEshbUOvcjANrKYWarOoD9PBK2I28DN0Pg7CfpQc8Jp3POLgR6quBcz/b
	 37dazQG/PtNqDpK2MlKBkN+EkvD4iXW9TBoCzqbiT60AlcWduzeAWpdNvJI1e4V+Fu7Ou
	 lH/yWnHRjm9/buSgwoNu/VOxOmn+DsUURr1dxlq3k8hw7hBJT2y8b6SbsA4BX6oZOAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tn3YF89A;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198E1606A323
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198E1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tn3YF89A
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8bd6ac32564so76854b3a.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 22:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464430; x=1795069230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6RXE7MpOiitHrkFdvkSuFI10OAvTxEYbjLQMQzqwPMU=;
        b=Tn3YF89A2O78gka8b8IcTXQagBvYm8NStwBvLNhOWWTtaqlnIA7An0Do5Yy2qlzX81
         DZnJQz2o9zjYh7vhaw2wkiT8vL6lQqEvRxncXuRZbBd8qvq6hAwC+gmv4cCGzCtoaruu
         ZN2CP780HdJqUInbJ2DDdj7tgj7RY6X/WGa/wFm9S5Cgsm19rU43VhWw6u97u9rq7FIX
         IZwjVIN4G2CVQidzd1SCvztbMUFot6xndRhjqfpyT+PNr/MkJIe17DGfkoQeOF+RmFBx
         jlKFW98pgI+NURBPqVQGHDhvKody1G6QIVZypdSbQmSDNmT0P3/FH5rRJYWwsrFoG3S0
         zbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464430; x=1795069230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RXE7MpOiitHrkFdvkSuFI10OAvTxEYbjLQMQzqwPMU=;
        b=JJQPZQgtoYIOfKntniYx/42W1xvdv7NHQVoCKFoBZ44CzRhjDOKXTRXLTgVQ1gXhBf
         rHs9A20I+o7iXpxwU1XoI/5NP5qY/Rz4ODxYmYbDzX3Lurt1uBFvgwClCCuEVsmXMlwa
         duxbtF6mihiTH/OS5ceLZ2J2dL9/lf87GmOvuJ4JZ0k3TQ/PsC4ylpB03mbZQPXtd+C0
         /iW4m/MF6vgixzbD2eSWsuMNXzsybHoPY5WtPsohpXyedP8FaWzoToE1ExBgJ9iUcIS+
         uXfcN/rtrkWq67EcBughedWCxGkCe2A2/fbKyuyORLIW00OyvvxUbQYd8zzg4e81wPP/
         /E/w==
X-Forwarded-Encrypted: i=1; AL+hErEIcyHyjORr04EAuUphNNWaPTXJy0Ytiy6E8j31cKQ+lpeNtkPN2oxCsnRUKY2ioK9sjRaYerRLynePJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8kKkgfyW2asFy3H/5oF1Qcpp0PpfnNOLJMLp0p7194diUoObzs
	ZDYOjgHeBzfS7lltlswAA/BHIy+O6YfCNAiE98ZHbLNh5JwyKp/bQizU
X-Gm-Gg: AYBFou1fNR5xWDU6xTQPjuQ5ExN/6Vnoj5xF5jfnlab1y3yYpwcPcXQofn0DPa5NEXM
	goK3oD3C7z0C5jYbdEb+ghKhgOu8OwwGgrRLJhUmUjOhstMbCu/by4nv28CCv5zI/yEhdiOvZ7l
	cI+JmzSYTXHuJc+hNHj9+tbVO9Dvr3hMI3IB2k1Cfff8nC4YkYzCXIR8cWm78UUjpUTKnZ+NllK
	DrD7JrdPQ0rwoxibgRyogGHHz+9vvrE5WCOBvL8X2jImXRYlJcO5pTr4bM8Qhnn9LfSSS3JsjkS
	Q6owi68w/B0qZ3gDMpaD1ZprLLerOmng3/TQJeQyx0brFsREI8Zg9A6vVGl/Jtz0UogcZiqzZNV
	I8iN+9wxViZRB8744kNndFC46LGP4BY99W61f/8x4KFx1mYEncQVfNZpMT1gHWwBzZ+fNWyiCL7
	jY3VomXwnSOgxu+d3OEHOx4fQMpawOGBgGGD/LNcS9v7uwKk/9+S6eBoCN/SF2ksvbY3Xqqn9Gs
	Ex7vKiHKR2hDB4Znqyc/vHMyaZvF0NGzjUBmuSs/OI3fxv2D4TAmiMzVGC9ILGPMjbVL07iDXnp
	gcjhdYKkrSZvCPM3ZWM+HJe8BIV92N6jzIqkP1+Cy+RshIsmA0f06Uxom2A=
X-Received: by 2002:a17:902:ef4c:b0:2df:8ab7:fe3a with SMTP id d9443c01a7336-2edd78c45admr80762355ad.4.1794464430262;
        Wed, 11 Nov 2026 22:20:30 -0800 (PST)
Received: from FAIZEL-KB ([2001:569:52f5:4b00:3fec:b9ca:ef85:7998])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7bf55sm28202185ad.30.2026.11.11.22.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:20:29 -0800 (PST)
Date: Wed, 11 Nov 2026 23:20:27 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org, 
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH 2/2] media: rockchip: rkcif: Honour the requested
 bytesperline on MIPI
Message-ID: <fxrwhxkzgihpiz52rbeuomtqkzz7izgdfcbux7osamqruc7w7u@qhvh3nkqypro>
References: <20261105232310.385463-1-faizel.kb@gmail.com>
 <20261105232310.385463-3-faizel.kb@gmail.com>
 <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <51b09428-9d10-4f36-a811-a681e479e45e@collabora.com>

Hi Michael,

On Wed, Nov 11, 2026 at 10:46:43AM +0100, Michael Riesch wrote:
>
>Come to think of it, TRM p. 2111 says for e.g. VICAP_MIPI0_VLW_ID0:
>"Virtual line width of even frame for ID0 path(must be aligned to double
>word)." which I would interpret as "it must be a multiple of four
>bytes". What do you think?
>

The VICAP register summary defines it.TRM part 1 (V1.0, page 2081)
"DW - Double WORD (64 bits) access". So 8 bytes.

>> +static void rkcif_stream_set_bytesperline(struct v4l2_pix_format_mplane *pix,
>> +					  u32 req_bpl)
>> +{
>> +	u32 min_bpl = ALIGN(pix->plane_fmt[0].bytesperline, 8);
>
>Please add support for the bytesperline field in all the plane_fmt
>entries here...
>
>>  	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
>> +	req_bpl = pix->plane_fmt[0].bytesperline;
>
>... and here.
>
>>  	ret = v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
>>  	if (ret)
>>  		return ret;
>>
>> +	if (stream->interface->type == RKCIF_IF_MIPI)
>> +		rkcif_stream_set_bytesperline(pix, req_bpl);
>
>Why is this restricted to the MIPI interfaces?
>

The MIPI formats all have a single plane, and the MIPI path already
programs the line width from bytesperline. The DVP path uses the width,
and I can't test it. But I agree it should not depend on the interface.

For v2 I would:

- take the requested bytesperline of all planes into account, and use
   the largest for all planes, as the DVP has one line width register
   for Y and UV
- compute the sizeimage of each plane from it
- limit it to the line width field (20 bits MIPI, 15 bits DVP)
- program RKCIF_DVP_VIR_LINE_WIDTH from bytesperline, with the current
   value as the minimum

Does that sound ok?

A question on the DVP: the PX30 TRM (Part 2, 5.3) says raw data is
stored as 16 bits per pixel, even from an 8-bit source. This matches
the width * 2 in the driver. But for V4L2_PIX_FMT_S*8 (e.g.
V4L2_PIX_FMT_SRGGB8) bytesperline is the width, so the buffer is half
the size the hardware writes. Am I missing something?

I can only test the MIPI path, on RK3588 (Radxa ROCK 5B+). Could you
test the DVP part on PX30 or RK3568?

Regards,
Faizel
