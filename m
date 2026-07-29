Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA5239768D
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 05:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785304778; cv=pass; b=XswUN916ZeqlhKl+hwVzGNZFjp+zWHo7NGEoFh3NOyO9QklqqIavZ9RqQaMxs/2QLwIrQg/Iz0OlFPpSGlrHOn9yVnXswUdJDflku3L//RlZwfOvxAUSGg5NcQqZ0NpBsB4DKSfuwHcCUt+KfTVQVJoB+7hp04GYLMudevphus4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785304778; c=relaxed/simple;
	bh=zhXBz4WAC575BvE7Vbqo971rsQ7lB6pJ8jeY23ztt2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEvJh7SStxm4fVRP1oStC3m9bWXvMnXZtOCZIh33PFqH/VsRMTDcKFMzkic+lvl1BeSrNQMFyshJsv/4XZuXY2WySDomZMslGJjILXalXi13ygetpsS2842oFEEy2riYZorWbDYjtBie5/EcXXc0Al0h77g7n6VVtkMA70G8dL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbjcvB2X; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbjcvB2X"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-907ae240ac3so2909546d6.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 22:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785304776; cv=none;
        d=google.com; s=arc-20260327;
        b=grwFTFlFyRV6wuCTvnixAgUwVJpTpeBEmVke48d8XmlQQKSHoK1pEsEIEm1r3jG8P4
         akYcFKGBn255u3vDTczDPLWBYvdlZGueT6vs/wwsa07DgWjjXNajTMadUvYT66pq616k
         5cfDbxxwgwNdh/pRAiUDGK3yQaK7IuaBcEIBlguYBbpYbogiGdKSX1A+OKF3zSY/UQR/
         6OM3cloWs8NgYSSANiiZXgWCUjsfpPbug8NRHobLllIrZ8RJLqzoc/LA+1GpbH5/9HIw
         87TfeonSuFMNMemGFTTRJ+ZI4yBO04311re4P98cM62sbSOEldSICAkkFXR3x1NpGF6y
         3hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zhXBz4WAC575BvE7Vbqo971rsQ7lB6pJ8jeY23ztt2M=;
        fh=UvRD9gN5PHfKxQ9cJ7DGteNQbSfYnP7d0YM4cpfsJlo=;
        b=mGXKl4PDq+5U3tukPzpsvT9yVQXCnt+E3iHGg17yBlSLJtgDr+tuImDi/fl5Gu65vm
         1GS3JWAsIGrZ+qDNpxDhBNn3Qx3Ls0AHjhm4nSkTp5a7iGPqnZN77J6IIWfq9j2hGMl8
         fYCcVpFUhcplrg4cu5EgBYrWsFFh8sLjKTnpe1nRL+3kZuMLTp18qEZANwc64qBiKHgy
         6ZzjfuU64M9bGuyUHke4j+4g6A4Y16ARqFfkICqHITX/RieyVp/CYVmN2bVkQmhng222
         f73Armc0VjgTXAu9CqpIKCAxiuc1QusNOcKaI/VUjrWOUvIicMyE/boYeikxoQhYZbet
         hOfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785304776; x=1785909576; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhXBz4WAC575BvE7Vbqo971rsQ7lB6pJ8jeY23ztt2M=;
        b=lbjcvB2XG/Ragoko7b/jWv4UJsdgXRCAe1mfRC+8wXIUMr4v3OEC+5DF55AhueB06R
         dRYQRGxshwIX7Q5sRJtp94ygwUHOTck6ZnuaBt1w0vdgNG4a86Y6d1KcmfQm4LwQ/TMa
         qzyNo/G5axpuFJXlmTbiwLexvoAEc1PSyUhM3vRXVMoUBNfJ4LFh3gHqxyhEn6k4lzyh
         b540KHg2orwAW6kAw3iGVmMnKQ9T5QK0SNsQO3hxp45dECM95SzVBxkPsVJIVNeu5pXH
         13maXda31VTviM8fXPG612oGTMGrMPGMPz/2HOBjZJkHxoYNIVEyX/dsCv2UpkZdV7VE
         JyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785304776; x=1785909576;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zhXBz4WAC575BvE7Vbqo971rsQ7lB6pJ8jeY23ztt2M=;
        b=LHKXvlK2MxwsL+O2xM3nuSby/U95PGMFaZlVUbbQp8v+wV5v8mjhwuJEtJLoV/up9a
         l9NuEKoT5akZgO9QRJlUAcNaHD/Un2pEGa90vIpjuu//DdIflHBldcupUC+7lw4Y2Hmj
         TMyET7nd5p07QDhshJfeS83f/imIUZOPZ7UoekM/2CY+5lwzyDBtmLAYA4m8PIidAkSw
         gQhI28fjsjz2akbb6VtfyMuT+os7ef3s1UeEpsqyB6gtETHgO7OJcJHm9cYid2w5v9c7
         3ugnhPudPkVg+jiJgJqKisfSDTPpbamd57SGV0GBZGVq6EYkeogxECP09fzQa9A7kVrZ
         sSXg==
X-Forwarded-Encrypted: i=1; AHgh+RpEmT95cg4fFpDOV7r8UEGgzkik31+BiJ1YXfw9DJ33+NXsMAs9rb5Bf0qLqxngvwhy7W6YUV1jCt9Qgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+nnjP5+nBJJnYGd4GaUuqqE7KcGXCB38gMF9h3yDFNK2BtZ3
	16sJ+C7XTf+0KnqdykI+cNoMSdsaliXe5y3bGa3k1HT2CP+oSBBHuEQBYpu/xiHQ7ZfiBfv67aH
	siumP8upLBJdx1h918LWc9H1QTuDplMg=
X-Gm-Gg: AR+sD10c/1d567Ci9IkttgvbulTjALoWU3tYxO/hV4dfRkus6myW1PacFVsrSAo7pWn
	32GQQ78+qWzshQ45fQa5eOr84ohqJtde0zqGxFJPvpz199/uaYAP0v3ogvfF2UNn3ANs/W4T6lO
	8kyX5mgAjnf0AOsdXXl/ntOe4/iVAlQVEPaBKoRaFA1PwxoWovlRyx7i8HJACwsogAbOtNvNocb
	Ir8ritqsmh0/PU5qUgOBmPbgAY0HrygH5aUityNUPHSEyDd0Z7yakisYyzFqi2yuogcWi94ZL3X
	Cmp/TNUf/zdEJqbyyq5NznE0TVVGKzyZeq4zEECxyKhflsYkwGm4U69Xr+6WrF83qbmz/F89RpX
	vMzptj/WIjvsUORpEYtQpfiEGzsKpBqv+pib5
X-Received: by 2002:a05:620a:3727:b0:932:de52:319e with SMTP id
 af79cd13be357-9330266599fmr539914385a.23.1785304776005; Tue, 28 Jul 2026
 22:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724131208.2315-1-tharitt97@gmail.com> <20260726024243.730-1-tharitt97@gmail.com>
 <amjQafSHo5cjCTnW@SMW015318>
In-Reply-To: <amjQafSHo5cjCTnW@SMW015318>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Wed, 29 Jul 2026 12:59:23 +0700
X-Gm-Features: AUfX_mxSFTIscdoxIwMB9WODihAf5JMiVEABEJSCWkuwnn3lbw2GW_-l9aNNhSk
Message-ID: <CACak8wPrYOmHKCBP2R7udaFyx0mW1z3f_A9ivaGb5ATNgqujhQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: hantro: release runtime resources when
 device_run fails
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> You need sperate patch to remove this. simple remove this here may cause
> build error or warning at NO CONFIG_PM config
>
> I suggest use following patch do below thing
>
> 1. Remove CONFIG_PM
>
> 2. Use DEFINE_RUNTIME_DEV_PM_OP()
>
> 3, Need update
>
> .pm = pm_ptr(&hantro_pm_ops),
>
> Frank

Thanks for the suggestion and the patience walking me through. I will
send the v5 series as suggested.

Best,
Tharit
