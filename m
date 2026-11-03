Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698139;
	b=yMunyNkLadYiV1NeA4Jb03UpluAoCn+S2eoCoVOGNZcBVK8EvMNJ1riMvS3VRlYTVsC2
	 UciDgLmNr5WIKLwEd7Enuji5KvYsKq6lCoCh5RSDM3AGwAYMT+N3RHoUmTOFcpVNHRCK6
	 UQTxiEchSGi73aV2zOlCd8UcG6BDGMTiuW14IhA/MrRvR07NTuq0okuy1HgQSU9R1N8N8
	 Vryi2nYo0QbktnqmMRtLR+4efyiF8eZBz/EwCpZC5Rf3o+BlvKSeIH0atP1LWEv2mxiBe
	 aaD4xV+pl/ivdBOvcDBScu9wUDrsprPbcsuNgT772eNo4gfN9CzyCO7qIa7MnNkaXWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
	b=4EeWuG/WVEMqlkIhvmRWn616Rta30UUkjx4WvuJ/u8xDEDYnOiY6MlMOPrTzILadYmm5
	 EzW72TzaoBLReZ3EfcFBb4Gm5zcvUTTyzub4p8R/e2k+3w/o9PMZDveocDi41pGJHEfRS
	 J5XLo2KE5lNX3pEpinEvShRURz54lYXe6cJbUlpmDEIZuzEiCM2FC59Nd18tpADk8oH+k
	 3xsMQ7v6AEgeyr0srHeZ6e0U9oNVc1qY/6LLphgBUJFZJ2pFTBhhPwjqrALMZaxApdC9q
	 ZkpsGDa+LWFXeg1WDor1LB0zOsZDfmBIUo4v7vmZlSQ4wdY7rYvA/KWxfodrYW4D4lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9tY03uo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB882606A336
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 09:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB882606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9tY03uo
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso568821966b.2
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 01:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698137; cv=none;
        d=google.com; s=arc-20260327;
        b=I21gUq5wao6AcX2VHBqfC8z4SOONWH2vJnp1S2uMRtXlyTRas++V+epuQBsjzS0aON
         QgRqSmfHX54aejSlehFXDdoVjKAh630jGhGWbk05YcZpdU+jv4/5Lt+jkCu9FeTPBSYm
         W/ju/nwXR5KzPg1pBkghWX5aM8A6f1C06E1SeMT0B0u4wYMqaNNerJvjoqdlslyH3cO8
         n+/3MxGPTx/7ycWju4i50rEwNENZ4d3ttw43Q11DQ9zo+msx9lqMBrGXs8Eu+qIUgHhk
         AeCFxgn6A0pwss+p9vkE5SU+5F+8OQ2+i2XrltEHk3VL3r72Dp4mnbDoUB0qjFhPEcwO
         W9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
        fh=pvwYedtvzrt6hlicSmdk+QwgbzEj+3bTYmH7C1j6/KM=;
        b=O4CQQKXT6cF310kU5mkDn4WZeTnj48UtqP3rNCq+dYPFzomO1uAVMYYN5R5vwNpCaF
         Dgq1Fb8M6i68ruyfQpH/es0pmPB+1Mupv5q4GRaay5DEspplVTAUeXxcJT4uFjo92tIe
         Pso11my5IgaRKo+A3KuHymK+3FINepH0e0WidwXCjF1WnMpwXUSmBUftCuyetQntvq56
         C7AgUlRyHBlRB7QP1qqA+gtloRKMpa6HPw3YjPG+UF1GPJWi6KllL9UkhmfufTbfnocO
         oVXXgFRAGuAtFI3XbnxNDFfPT5jb07pimJ6BiQWIcg9R6lhMFIsW0Q8/Sm7ojApmHFOY
         Cklw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698137; x=1794302937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
        b=z9tY03uoJ7G4U31VpuC4dpS/J/a3LVR0jRHF9cT7vczDh9QOjP1D2uEy0ZpzzPbvDq
         zkMm2wGThRtPz7Z65UNIobmrQcAQcyh79ffv4N7Zs9laAjrlIIzrbvZAcbA/CHI6rai8
         3iaCvAbsA3eCvp+cXUfFgUsMI2tuPchyg3fxWSHEVrof4N/pspaKiRriQT9uUWDQFWXd
         Emvb8H/MGFxz6un8+BlQf4CHXdku3v0L44r15djnLsZoIHiPkOWCsGBfi0qwrky+Uxmy
         ifATchJH8cO6ZIATqlm+tjszUgxYDDHmLY7hKYNLcaYsxS1W9/ccHvj1/nALUimflgmQ
         ZkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698137; x=1794302937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBW++KhT7ypBvLMZrTQdmFhy3oIFPk1uhi3bDCCln8M=;
        b=AFjhVt0FDG/tmXMHAYNEb21qNwJqhxbKuh8mmSALEsH+DriCwwFTJ7A8ilSfHjTlWv
         5Wz0JoQ9Nz5BOsWpYuoiXidNyU0rn+hN2BVVf1hX0uGDiPcsjfrUK5sthlJ/4PhOvzTn
         Yk5CfChJh4tPGMTE117F9Ff1EsGuUmVQ3dgColH69ta4DxcQYW6yQCphmvgESfnxpYXM
         o4w9om7+ulZQmVMhGfe7tkHqCy+N90wzr1pWQyNicQU5U/iZSnjjx/zNma23Ai6+2AMD
         7e/l/qMnizKRWA8X29RayvWwjSyhqisjqkNvIHpkC/G237TN1/iuDskoKpiLQ0ATaixc
         4YEw==
X-Forwarded-Encrypted: i=1; AKwUvBxru2ZCDjsg/NAwjDSYLcNfzklu3z8k89ajhpZF2ryhdF+zQdRm5SGvFl/qr7d8jrgLCzioadC2ejht9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8UU4sTSKWbEr7YrnUNiPHmZmTdSpRiqZEhDlVCvrbHxoqX40vF
	xgfxjBM5HD4ZEQWO2IbsArTrLBTP3PLiYDrK8R134KH2qUhdSaHpe0kGH2gP+AnMShzhlaOzFyb
	cA96HcVRidR8xI/kMqFlCpRJxWmok/xg=
X-Gm-Gg: AYBFou06PVXlazu2gKzK0g8BxXkiXtUq6ueXazU/3i/vKnfAgm9kOxL7FsstxhfuoGe
	uoDQ2argZhHYyQZ56C3KCdX9zY9UnbcHvdwr70hrCsQu9ubPtPoolMLZWbpCexVHLA4rhKhiAzE
	tbBAvr/g7eJIBCfKT46XNpivN5sdur2ApQYlSWtCX0q0VgxYYd84Oo79YGaYujUmYPyYzQhursa
	feKe1PgHLho30dzPRydk7uGbENq3qvGXE9kpjM3+JuuOJKfKL5Ik9V/22kIhklyfiKJRy2NoKsV
	pnrDhFPl20uVx8DHRA8XZ54dilAMcgzPGLImq72891oGDpC7MSu8hdmvTLhlACKt/VY98yYMD7q
	HqExOOno2aXVTwQz2X1bE8G5t6ly4AoVEQijoG8UZ7TTLK3iqFqDFHMcXKMjfE4xi4M7B+0Wt8/
	6J2uxWZySmHlMgSCo0ZmuMUD4tQaeC+AunFgClrUbGlYZGKrJu8h5XFtjZjza37wUHMTbXkdHVw
	YqXWkQdwgdN6PLf7RmC/c15RQ==
X-Received: by 2002:a17:907:980c:b0:c40:36ca:9d1b with SMTP id
 a640c23a62f3a-c4ca7aaffdfmr1012303566b.40.1793698137094; Tue, 03 Nov 2026
 01:28:57 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101154959.381-1-chaulagainavishek14@gmail.com>
In-Reply-To: <20261101154959.381-1-chaulagainavishek14@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Nov 2026 11:28:20 +0200
X-Gm-Features: AclHuK-4DCzMkKqQ5F5CE5Xu5EbSE0JkNjosn43vNvWvHQzU_y8WRlv2eqtT9Uk
Message-ID: <CAHp75VcN0N9vO1eHJcD+y1p_rP25geYYr=ucuQKgO9ktrKCtbA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: Remove unused atomisp_get_pixel_depth()
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 5:50=E2=80=AFPM Avishek Chaulagain
<chaulagainavishek14@gmail.com> wrote:
>
> atomisp_get_pixel_depth() has no callers anywhere in the tree. Remove
> the unused function and its declaration.

As long as the code compiles (I briefly checked and confirm that this
is a dead code)
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
