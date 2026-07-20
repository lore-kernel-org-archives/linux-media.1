Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F91305E3B
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784583228; cv=none; b=TaCfuDvC8aVf1dWow6PFqjEVs4338r30nRfCMx4oLwU26eYZjRV/D3/lONHA0Pw+kja0ZQ6Sn7RgrByp78YqeRl/8GB3H4+K1+UD2TeKuG/hrXDsEOa27s3KXuldWNWfsViGQeqNbe9kBy9Vgvl6T8R4LwqgsjNt1CytQpAMfvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784583228; c=relaxed/simple;
	bh=44idU8XRPllgsta208T3pPheGd2tESHEjmpM2ssCfH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvYLidpscQqMYH+V7SMDdddPBR66Bxpps2S4MWnAocEEq1tmnxZGrmPrYZACPxQbXRcwS3ga6OcYQ5/TslQB/P/+PJTvuHwgI15+Y+AQ2aE58uaGhri8r/KC4GK1MzW2SfQBCrniDdIZV1dWFkXZpUwcnKQfzaA0iiejipXls2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS1UvihY; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS1UvihY"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81ec29f1d07so87499007b3.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583226; x=1785188026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=usAr8RVI0THAJ8XIFOJ4ZxGvrwrm2FlwhEayG2wImz0=;
        b=NS1UvihYe05ZdEsYa2d5+tzFnVGekPYGLoctqkl8AnLBPX8s+e6REiBv0lcE1RLJKV
         2CsX2sldiKiaycJDqfKW5p0UwUbIm1/qHJRRB4F1zc8iGTZ5ELxxGw3ZM6k7OgmTQgVL
         J28OvY4FgqoHAXg/9Fd+dVW+GD+VwuSpXVn8K+WVoxR59qi+fF6NgL+ouLorVxuz2ym/
         LUxuba/OkHjVGwtvpYywF4AEeoEd3s+vsK75RRwtIeer88FVbqCuUPdcekXksdhhVPK3
         kZioLDiSF7sdargd8ZZXk7OsScNL9hCOHCiq0Z0R508vp/fhSLFi5Wd/7ugnoPHBdeqo
         e74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583226; x=1785188026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usAr8RVI0THAJ8XIFOJ4ZxGvrwrm2FlwhEayG2wImz0=;
        b=oIElA3iRLlHA24ejXl5auL8VkmJdqXYC909d9uz+fpNfb7a1Xa9mLeHQ8vS3pj5NYu
         ge31YaNg4Zv6metKJt2CsRupC+KUJyhupcR0kkPUdwnV8SQfgASEgKkvHQEphM5BDZ76
         etwU2O9y3MJyitj/vriuEYSFf8+eWDnV9RqNzgXHU4fBnbKEGh4MkS0fQqTYufNUaAwx
         e0iq/vB9TjSFOzEioH/amQQBro1SGRaKovFw37bzmTDf0Jl58y/61XbS4qGoJ7JYQ9do
         g3cSAr2d0tRjvco6r8kJIley7acLOhjwWimTabH53fIAbGI3qv9fBZJS2PveG7hoSOwQ
         3sEA==
X-Forwarded-Encrypted: i=1; AHgh+RqhCVazEDNt6OQsd3JQJScrQ+ZlGx3nBJwEQ3t2EQcf2GJPuwGq+jMQ905uEjHS9Z+SbLcIbhzHXdbOiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkwmnp0TeR8zS3uMT0klqPGTTWSfwJG+xjsIAJdrwRWvKYb/8l
	NSjsPTZmntAGoQIhE3Q/z5W4MeLjjIj+/yGFQdHSVGeNvJzRm2ICUip/k352jqr5
X-Gm-Gg: AR+sD11fGrqw7HC9GVGmtRXHe61f+sepkZV0LX6j2o51ru4DT8r48obrYEMyFwcPpJg
	zUqKQcScsyiNRV0PHueVAg/EpBzZlmmSClyK8baJEhPeP+t1NWQKf8MM4bkzbNePB7rB9WIBd+w
	5P4TDaaZGudyzZooRNyyA8SbhOubCHgOoB0U7ZabOfRPLKywx6WunjROplPDHvz2dKWPDEaakfk
	/7PG3dquU+v5NqjtHhjKJT0fV4ME9gDst5g4jJJLdZCHsvpQH0gryWtVc6Pm02/nHz9V3n+6SbO
	79GeX0hGe9QF/O1jWwnV3HphPVSrSAACNZ4Hj/3TykNv7zjJoyKs1HVJH+vhNWuJWs31U8C7/GD
	5iZKX/WBTDN3mxjOztPeTerR4oN5qS78Noz3QNRG95lqBoTzNveUlWwL5u2lueqOEzFlhWkxcPu
	+dvbTeBWOYVE1F9g92d+NziLwojlVpKUK8xci+4qWujMSk1Jo=
X-Received: by 2002:a05:690c:6607:b0:81e:d032:f3c8 with SMTP id 00721157ae682-81ef26a5baemr53618927b3.37.1784583225589;
        Mon, 20 Jul 2026 14:33:45 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:50af:ea84:8387:c8b5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef406700csm56746327b3.22.2026.07.20.14.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:33:45 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:33:44 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR
 receiver
Message-ID: <al6TyVD2EO3MxHY1@zenbox>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260720225310.039aca2e@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720225310.039aca2e@ryzen.lan>

On Mon, Jul 20, 2026 at 10:53:10PM +0200, Andre Przywara wrote:
> On Thu,  2 Jul 2026 17:47:46 -0400
> Justin Suess <utilityemal77@gmail.com> wrote:
> 
> Hey Justin,
> 
> > This series adds support for the CIR receiver found in the Allwinner
> > A523/T527/H728 family (sun55i). The only board in this family that I
> 
> will you be able to send a v2 with the fixes we discussed in this
> thread? No driver changes, just the binding for the new specific
> compatible string, and the DT changes.
> I tested this on the X96QPro+, and also managed to enable IR operation
> on the Avaota board, where it uses the other IP instance (and another
> pin).
> 
> Please let us know if you can send a new version this week still, to
> possibly allow a v7.3 merge. Happy to review that quickly then.
> If not, please drop me a note, I can then take care of that.
>
Gotcha should be no problem! Sorry I was working on some other patches
for a bit and was out of town and didn't have access to the hardware.

I'll get the board out of my closet and do some testing before I send...

Justin
> Cheers,
> Andre
> 
