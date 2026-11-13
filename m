Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558188;
	b=mwMEZs5hxXj4LS/qXa6PffoaQpF+jdg8EomiHyIifn7Vue8x5mXAFXLswM98rQefp+el
	 CYA1HCRvrpKhPfb1l+YFqQxIx0IZ74IFb4YbbqnX9v9bw+B9GfgdxqYvx3fxVv+GOwLVS
	 TRGhUlrCgs2PiJ4DkQQqoIXv1n8o+riqk12Ofc74Jia09UCO9y9k1agQizt7sArMYTifi
	 j4D2R+xEFIkjHAFluGI2fnH8m2vY7hS50yzMnL39HX66TpOUPYjvulxW6NMotfLZGVPRt
	 GDSY3tEX2teftJ3FJ31AZAKvCN4SNQWV5kJkTfTvkAWkthbXOWoY4JJy6wZK4/nJm6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
	b=Mz8SmXMo+ar4d9P7q+iarCyj7STJJ7kqJJCqIj26TN3wTb8ZlV4paPpB5vsbk7ijG365
	 ypVHriXyrFy1TOO/XO5k/bK0CuGFCXWGBe3HTxgyJ43/oSQIP3tuyZC/V6BDXQdF1ZQrM
	 zmFBBadjDTxVjqrom/B7pfk68LaEBTGYQUp2DeatWWFDIIsKQr/tM0JfKO0qb5B/QxpUW
	 10psEOuY6Zfs5gwBpvqMElIIe8SDIAre9Zw4BnVXjuy2smqnFgHo7wXFNwQaMemsGb/wV
	 2OE/bcQwnMaRULycVgEl2GXN6X9wO6QMMZug4t+UsOpsCDm4pQAJYnkcAdyAdeWtCiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QYKRkeZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D2E606A8B8
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D2E606A8B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0QYKRkeZ
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0cf2c0785so7431157b3.3
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:23:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558187; cv=none;
        d=google.com; s=arc-20260327;
        b=Uhj1iToM4UnHRFmla9063dO3Kjr1e0FmM/73Q/cx5XM2tXEJaDdcmw8SedKFB3Z2SK
         zAyDc5DFw5nJ1toZQemShEGomwHTPqVgbUZ+GOivXcA1KmfamHTQU2ndIEiJzWd2/YvK
         stVwaWCpduHKD18Vd5ShAYXv/oetepKPpEGdaDS3+ZGYTqkZcUwjWxZKYjUM+868I6mg
         MZf+DLf/GuncGfBTrXcJefsMl2OaQE8qGsQM7iXY/Ehc46Fho6Pl6JBVi5RuP9C4fIZz
         VATPZDkFYXE5xFM8cRbbspJgnMUrgwmIGNqxW/9IpDYwMLp+5ikMmriclLdlPHwPb2dB
         Katg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
        fh=f57ffJTBaRcAtWdQOIVzZ5eWx9A/Ii1sg5/M114+TDo=;
        b=SG5dydrmSHy61Fzktv1jQ1AR8LpAoJNtu10s7WFEbvhXeYE3jqXD/mwvh9K3NWJOOj
         aePvU+CNRLPjyx76fnUALos/QBXjY8oKZIfguNfpT452gH97m+GavgBtnR+bK4YkpswM
         lRRcOtx+1tYJT1/77z7NDx2sDH5lmdvCMxOpwD+uR9favPUBziNQMlU2avE6MO1gvIdL
         Dn4/fWnQZS1ya+ZfPJz9HSvM47Q+0FfrB6l9FCAEK1FAydadXaxUpGcsMBgVzr01vGr1
         F439iUBoy4h0sGwMedbMrXSfFOkEcMsmQRfDOisDNCvL79D2zdxzMR/Fj/4ypTqQzCXQ
         n2AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558187; x=1795162987; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
        b=0QYKRkeZGgCKAK5bk2o2chwJMGsQY7GzXb0fwyB+14vTr1jkqNeIYyu33eNOeaTSmy
         mhaaKT2ATnUTxHED0nT6gh+qOHKvLSjBN5uf0ZUj7HFsdBP3/EF7zNnJJnQt1n3+Usc2
         c7smb34IRq3UuOGo9g9yZkOTsgTxKb+XNnH3xRQpt5Pgdx1uKXlTpI83L9zWI1r9ahts
         8+edQVC3Vdhuj+dlGndhOpsK0JqIgFiK25XZ4B5beeKdfVO+DuXrOlNZoMEtrBrAnYEk
         t1EdDeOQ5NLNyVdW3qZ/WWxYxVI7uGJz2WdJLbMFrgP0mNu0jInbTj5Cu9UoM+83Z7QK
         +fEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558187; x=1795162987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHg5JHziHE4Jpt9n0k93J782O7ifEZ9yYJVMuZq1mrQ=;
        b=B+MaiqNGGKdfyPDDyGpZyI/cLgodqsBACRMiVDQrkSRcbo3bMp1bviGxhWOr+dKH/V
         bEO4fEekRQQavs2Rms6WGBuzx83qoQM5d8GazHtGdCyTJebdijNRJzQez75aRyZ5R0RA
         67yYpn78GICA/R6eWYeOxJu6I/p3kviEF7q13GeH5FZijAtfwmbk0DgFLGvAFj/uVIb/
         sh6xP8FwFEQLzGirAWBf0kfTNb9KNDRUAizNUYykrYgj9cT1e8lUAxYEWI3/m5LyznVO
         tZAqjVuoJkoYq4WI2mhy3QQItZ7wtWYcpMDCZYLt+XlS0pSDMXwV6S07iWv9T2bu6xu8
         HFJA==
X-Forwarded-Encrypted: i=1; AL+hErGEKoSlBwLISvPshvLM+LLGgqcA9XyU+yF8e3XvpmL2O/oTpjGHWMG8l/l4okhSTEF4zAxwfuZlejnfvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lysOpndYOsSvt9eL8Mj2ijcvrkIEuGKDDQErACWnHExwklXTo
	W4It++Bkrc0EMKzzy9JL9BlV8ao16oKH6Br4JrqHdC34r87nT6Yih99rgZ4VPtrqeKavUUDlq4O
	y5ZUEFhAGVKmvZAkeEg2KCbgOhgGsWTugY2QqRk0=
X-Gm-Gg: AYBFou3PaSNi4T6rPwCDJTUouwDuDZENoCAN5P3kYJVgtM5tsv2sGXf1yYUrVeY59dg
	BBAq/CImuCxC429ux113zLqucnOQsmR1z+vtcIj/u3Ww5+S5GjAi81M7E31MuxSXSOXWamrINEu
	Lp0tZB4GT6/1G3G0fU8fvautnue2PTo5WxFmpS8HnL8T0EObIqIW5wZ50cI8CEzaNdFqV1KbvZx
	mpXENd7aveGlpv5ea4xSOzHojhNkXN2AxPl0Zz8P3So0+rImfPjCPasSxG9044WNzc6UWRExVQn
	Ze+435l7SgT9agepQS0nWgF6C31V5H4HXEazjRmqHIR9IuywV3ICo6lj849OqtYUATnNRFcslfW
	0uQPZGc3MRKNY/9f00SWOy3BDXjxgWn0udY8CeLWzxm5ki0cIzpa+xvpXEZYltGJiZGEg+ky6+r
	VRtHE9z1TQQNnAh8FiK54eDJv6vYO0YZLI5WiAEK/g3jaQxxWOHxMQP7xOe1ECiLN4ClZ2pDbsL
	b1YLtH/sfB/8/yGG7aLG2WrE0vtAVS+SqYoVh7NDyw2arSC/7a0kKeKgrVFFA==
X-Received: by 2002:a05:690c:a923:10b0:8b3:2c71:b338 with SMTP id
 00721157ae682-8b4aa33e3b6mr8947087b3.82.1794558187196; Fri, 13 Nov 2026
 00:23:07 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112164642.38692-1-hmjm081106@gmail.com>
In-Reply-To: <20261112164642.38692-1-hmjm081106@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:22:30 +0200
X-Gm-Features: AclHuK9gEreXQTMuEgxDO8HwoqRpAAdAWE2GTFJcD6vpcMJ_zpISOrJRwj1DDhI
Message-ID: <CAHp75Vczc7pg5SaBw++eTbca6jo8nWjTBfOaEmmF6Q4Lnd1j+Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Remove unneeded return statements
To: Hezekiah Mogere Joseph Mayaka <hmjm081106@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 6:47=E2=80=AFPM Hezekiah Mogere Joseph Mayaka
<hmjm081106@gmail.com> wrote:
>
> Remove the bare return statements at the end of void functions
> throughout the driver, along with the blank lines before them. They
> have no effect and checkpatch.pl warns about them:
>
>   WARNING: void function return statements are not generally useful

Reviewed-by: Andy Shevchenko <andy@kernel.org>

Not that this is a really required patch for the current state of the
driver as a whole, but let's process it to avoid new patches like this
again and again.


--=20
With Best Regards,
Andy Shevchenko
