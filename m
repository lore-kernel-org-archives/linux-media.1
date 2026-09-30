Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C69515978
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787026; cv=pass; b=MzFl9xHKhfpkCOH3aBZsvezbc+jzvT/hsBqgk2IxZOyKCVKJSRz3jImQeZaIKp6TRHD4wTrcW4hgO+Eswat0mwQuHIp4SaeC33+cgj7K6kWPfCrU/7Y2XYbBTuUm3RhfqavJKwFcPqT/pW11e6uWgXt8a8jo779r1N8WDmbq768=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787026; c=relaxed/simple;
	bh=dMejdq+6xK9i302/pJWEwnrQc2gS9CMdhB1sZmgPEz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EN8TbPQEhh4l2+itmEGYDffw4bh5QxvDodErfKuLWj/FcAqT0bayZS4lCQ045C5cPpvweglWb/weXt2nSo7WiM9gPTVSOQYsR5RARGhdOGk6zVbToq6/Ji7LEIvCT8FQQSbIqY6o0BFFv1wZkpcCOtNPz0s697tHwEsZsdCycp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeTagFjI; arc=pass smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeTagFjI"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e7d54b1ccdso2284318b6e.0
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 09:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790787024; cv=none;
        d=google.com; s=arc-20260327;
        b=Ut1Cb3yLT8Fx+Oa4tY8YGK0hEdlHUMHnzVr5h8X9raJY8n5W9BvTAbNbMbqsiew9jg
         j0Bh1Eofs3lPTTlT7vadskMH8JltJU1HgTTdxQKcOSXjH8eNE6N/GFlsULdE4i+hyF12
         gSjkrPU7Yg/YyPfEO9g/5s+GMqHp5LpY4wiCQw/h2SOm4+gxpuECGC76SJw810jRohI8
         0Kxbc8Fbr7Ny0qte/V0Gml/S9pQLPJcH9hdLrW2lnky6IxTr5doxrTNSmr9KdbKt+Hwt
         sDTrSjX8+M5Vatg72g+ED62UpuCUSufiE1j7p9eOwDxS3y7mFM0Cqv7k/MvH7L6CX+na
         Bb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dMejdq+6xK9i302/pJWEwnrQc2gS9CMdhB1sZmgPEz0=;
        fh=i+b1RYHANLg+ODx72BRASgZzD2VY4bBy416lx6nCaYE=;
        b=dht1n8UNfIYfqvafgAvHpsC30DgHGoopul63VpvD+qvNmEJVwJGHYJWLufqOAVmNl2
         pISLibmXkJ6r6SA+NG0JhVv2xK0lvRq0Ou5vi+hAX3Mc367bCJFJxcEgSETGjdgA9pF9
         OL2B27xyTdORCd74sMkPRhfmAKuYgoPqPQYQrgKQ5GBHLqKOmWH3BN0lh3/o92nPGtSj
         foXv0Snp5EkGbrLi2YjXIEQFx26txI94i4lzfjTigDgE2vI6AsU85w0O8zHd8n8QXx3V
         Pnvn8FMEDqj/s2+SttZBZdiC0TkI3au5CM/Z2nMUr6proy0/bJ4TPYHm1Yhl6PKbjJf9
         F8xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790787024; x=1791391824; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMejdq+6xK9i302/pJWEwnrQc2gS9CMdhB1sZmgPEz0=;
        b=eeTagFjIJFzqQk3+seTMYlL7TPZ7zMXEPZbUczBT7D6Kcqw1cNKK6m3dVA+2YTS0Xy
         LG5K4PlwKTc3oIo1g2y6m28zS/i49EhQnSxLRnkdJX8bEf9yr2XM2hemOFTd8Tb7EqRc
         Zw+l2emHXbty+wktfzAlx8RxYDSuE8Sy5xgdvYB0NN1smAMOUd3iLn9PyolM8VVIzxc5
         4cY5TPxn4lzcJw2EAVupluNwmPq/Vo4ez8q3yKGGKXHJpbSwKL1d4NRoLV3tV9S3QxzE
         6TW3IOSNZS5xwRgCi4tL6NhS2TzZXHkjSaFLwfuwQML5LarpzW4RhoVpp8GJT6VleiVt
         pCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790787024; x=1791391824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dMejdq+6xK9i302/pJWEwnrQc2gS9CMdhB1sZmgPEz0=;
        b=GyRJ/sU0vIB+eOO/Yi0QDDgVdVIzj5tp9vm5v5gZVESL3xwxKctO34Q7zfjldXPfUV
         PfAUzv77wpDAPDz23zoSFILPilqjqHgV4YcNoxIEKDm1NnxhaZrc0HXwa8SJNOM9Te8v
         EYb+5YgRPrJDP2uyHMLZM94k8A5Rf6AQveKEfZYQEUDpbYZVH4+SmBThj11jdBCwC83o
         r/h88fWATJ/cSKAUvrNxVC0SgHNg6RW0WQVtXzwPsL3m7o9dRh488qEH8CtvI2kvd58B
         WIhG/ZAEsmGIHG7PqZ2KNaa55anYZwP36eyIQRgsqde2OcYxdMq7pw/jWVRAaX4+jxXb
         acuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCnMHIffqTbBYrcWner50yCNmlSbcPJFXG/OIGhPD745jJW1k9EngF2Gbd1lueqWSmJWBuloQf0OLg4A==@vger.kernel.org
X-Gm-Message-State: AFuF++lhmLxi4DUs0FR3foNcAMayL9eSxG6rSL+Kd/ByHnBVs9xXfUpZ
	zTJp4iIZj2q47VbChXDWRuG27azIMqkmybFWLbD4hXwNdNAdmZpFLtqe4hH4lB3ynVvK3evhV97
	0PTBznL6DIftf9JM0jRCd5ioM5wjUAko=
X-Gm-Gg: AYBFou0adHqUKNO1jQFwqQd3h7vrbjchV+DHPpDfcOyx/VlGBPwF9Zv97ruEImNbICB
	0nFp1+obMppQqCgnMPsROFA1sNidKR/ELZtkdGScRBGTWx4P4jmmhO8OIYupbNfoMXUOx1lDPS6
	5q1hYqfZ+FVCR4P6JrXI3Abz4TpuQuBnLCSP75JpdAC19yIX0SK4sjvstS5gaZWC3FcTfFthdoD
	q60YgtdshmsbFi/zwJ4EDvBmUIUz5dgmMFyDkI31C3SkegKrRfLysOt9FoFfq2BstwLYDVhryWE
	d5fVd7Bz12F4m0tTYSrtEOtCKTfejxABAarTETo1h+wFbfaAIZYWgxDusiSwFh0ql2hk3JTny5q
	Vt4A2Xi+t2XaZIRfU5bTVjg==
X-Received: by 2002:a05:6808:5089:b0:4ec:19e3:4072 with SMTP id
 5614622812f47-4f1b688c0afmr2518939b6e.18.1790787023868; Wed, 30 Sep 2026
 09:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801205311.386692-1-devnexen@gmail.com> <ar0r6Ej8JgH5Sj3c@zed>
In-Reply-To: <ar0r6Ej8JgH5Sj3c@zed>
From: David CARLIER <devnexen@gmail.com>
Date: Wed, 30 Sep 2026 17:50:12 +0100
X-Gm-Features: AclHuK_54_qV2YHpovcqDJGpG6ks5k27JUE1UKomn9QRor3VmwsO1wi08DR76hQ
Message-ID: <CA+XhMqw3kwpuv=D3Wvco6kGq2crbKyK1ewgcZePhHUMPenuXmw@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: Fix frame sequence numbers on dual-pipe hardware
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: dan.scally@ideasonboard.com, mchehab@kernel.org, nayden.kanchev@arm.com, 
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo

On ..., Jacopo Mondi wrote:
> I would rather handle this with per-ouput queue counters ?

Right, START(n+1) is processed before the DONE(n) bits when both are
pending.

A per-queue counter would not advance on underflow though, hiding the
dropped frame. Would latching the sequence in
mali_c55_set_next_buffer() work for you instead?

Cheers.
