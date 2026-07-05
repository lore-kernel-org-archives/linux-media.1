Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9901325B08C
	for <linux-media@vger.kernel.org>; Sun,  5 Jul 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783235966; cv=pass; b=Ex8TXLP5F4DSed7E+yWIGRsN5u1SLTzEsgg6aKHv60q0kaHiSK1dbrQ7QEwql8WOqrgwUPwF7RQsI2KHhc2Lpt6gb2rBAOKKXV2li7nRsVgwXraBu5e177gyETGxvuTwA3sPyatlTDlTJaA3dRvodHzq7KI+SpuF4vd7qMplWPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783235966; c=relaxed/simple;
	bh=CSmO9dED5MukBr1OCdiFjkn9M5dIv/f678IztuUO3xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7I5rU5vk68xgUfT0D0bbkX88UNVSQUY7iwjfKAWjzI+MWmXwqb1ukOSe3UHq1plBw0gwxcqNoWKsMzabI7f+HJgximp6mqxm1QjnSyruhIHLNc5MwQbcyBshja/SCx31X5WAH13K3/50udZnUMWsduVJI0T+oJ9HYIizEjj390=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODZjxGdU; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODZjxGdU"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-495d0269b39so252435b6e.3
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2026 00:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783235964; cv=none;
        d=google.com; s=arc-20260327;
        b=nQOAS2upASluuhkIBgCH9TO9KMf+0UwzHgfG7KlV/hMQG1xcaEuXYdnZIJBnb23NgO
         AvdP4XtgYO6qsJ79d+ih1BQC1Ujzw2bu9h9twclsHKoqidjDEN9/3pEWDV1Dfr/VRgGe
         z82XmeS6tS/quddlIjBe5PSh0kJ8viab9CNakIE4thYjkR2qrrIggzHhhuTmLL5Sdzrd
         peSWJBx7TBzlEzLF9KTZhQqlPIzsNapf+uCFrCircrwpiqvf8d4ZcVFseDTgZhYZmJoz
         tOK8pUOJUclRvd4IgeoxvvJVh6zTVbydKGu7dtx2nElNwlFuV3+99gyw23sNoEabpEkY
         iYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvbZLkZ0Tncr5wiImdqWfYK+VnSA7b07oguAxoTRlH4=;
        fh=NrF3m8I63FgMErZkimdaZG5HBZ+ruRDBxutY5blNuG0=;
        b=lWbtIn0i9p7s87DjoHJjq8c9xpRbN6Yy51gI836rzaKQcVfLByD/PiFJjxCmlWjX9k
         6nr1XsXJ5dlJXr8qgY7qmVgOm/2n2M2dQTOyWIGuE/3j5cGEx9wMcTL3TgawMMl/bCLG
         w6s76zDn4qz5bHVpglJesxA0hBToStb70NUYaE4UcCsC6g73elLk3RsmmhFoC6tr7ykU
         o2ZUZ+VtbDWRe7And4v3i3tVDH3FC/Hi0xIiN6WitKMCwun2OpZ7jodzUy8Nuu6GxOSP
         erOZ3wg89qxnZycEWzouMHhJTzWhRKS5AKoBaGxFV5WEfcVaoHdZLaOY+EAWBRQeCUSu
         q2vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783235964; x=1783840764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvbZLkZ0Tncr5wiImdqWfYK+VnSA7b07oguAxoTRlH4=;
        b=ODZjxGdUSkPtnDj8IXRvaeMafsI27ZXUm47veoFqSI2PH8xowjWIBeq5S87Fx92XnN
         JtznaCB4XWArFxcgrVsNMCF14yOWkOBVJXSAPvImD0kl9rIqNPiHoapzONtVsUkE98ds
         YbdDEs/6nFxXKXZuuDL8ND5ihXL8XBdIwdGYqNZStGyuS4ooU3cbR+Iccm+VYPvxEN6s
         1uVVg35kOyZrJq0bs2vGc/H0Q+3+gebP2npEZYiUPCRBGfMJ7Z4WMIwJBQKZtNuPbCay
         zhanBpIOmb7QEqv3wYZoXF5cnX1eQDFl8W/iFXmOtVLY460o1Xk3TA69F+hhFHMdtRze
         xkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783235964; x=1783840764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvbZLkZ0Tncr5wiImdqWfYK+VnSA7b07oguAxoTRlH4=;
        b=brFzgZs+NU7JZ9pwGpju35O/Vol9ht3MbD5sJudyFLSrdBZJUk0BhKZQOCgS0gavCA
         uw9OzWVb1cQ9i6CzlN3XuUF75WBByqWvxulYWGUSlG7rdrTB+GZSKv7WN6rhNM2aSQmd
         IqqvI0Zd7mr7KwM8AgaoggTkEL4ic7BTd1ppDh7lBUcwEdsuVQpWwmLwyUgHcufA7G95
         fxvT5pf4fnfhbEYLECDWzkVVA0lQ04L8aJZePngOneTiPZU+AMhoZlXzPtySmdNfXqKl
         XqhxbxNcsuq2lbLKAtmfP4h5H2dPozXhxxtHkTI1OKMEvwruDLDSg6wPMw99rRbiRjlG
         enbg==
X-Forwarded-Encrypted: i=1; AFNElJ96F3mdABL1aAc23GywVzaGDEtd3JuJ+23NWISIa8H7guK8visZFXgxYNGUirg868j1qmlxTGkNI7lL8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqc+aNZmsA3a3EHtfSaKaG9UbjRFssnhM0G+2rgoSV8RvVRqO/
	L7ncIbTOAVVCp1OdfeU7cRiqGxUvRqWgth5dmm6QrWx8QO2DUpkpRsmCmIA8xgvIl9M9eNUsKJ5
	SIlElT8tBlHPSg9JDyP2FoyFjT2SvwKc=
X-Gm-Gg: AfdE7cnsWTcL2jjqhetriWOdLQ5cKsSJ7Mt0oaneAa6Y+iX3COrhDq+EcBIgw2HZC4X
	4axwNRFbkJOBMpjYgZFpCN0wHGor5d+S0YeQkPsDrgUJOtKI185e6iqfB45q2M7SmIBf8p2IdcO
	lrwSuQTK4bVQMZ1YHO4bsiy+KgGH8JWR1oBH6LJyvY9MnQPaOVBaowOSGfm88GY/mUhmN1S5hoM
	UvHyyox2MPZMggjGWdK5v7uR+0hjKcd5mdOsjZeu0jsHXbQtHpVyCc7rLZ+gGjVDiB1nKAWyizA
	9p5jKrAHQF4T5hQlbuM=
X-Received: by 2002:a05:6808:159f:b0:497:e695:3423 with SMTP id
 5614622812f47-499affe5af5mr3144698b6e.0.1783235964556; Sun, 05 Jul 2026
 00:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705043920.105252-1-nealpatalay0@gmail.com> <akn7rISgJJeFbOWS@ashevche-desk.local>
In-Reply-To: <akn7rISgJJeFbOWS@ashevche-desk.local>
From: Neal Patalay <nealpatalay0@gmail.com>
Date: Sun, 5 Jul 2026 00:19:13 -0700
X-Gm-Features: AVVi8CeUIhv6_orfrYyWSfGNCaj_IggWg-fAys9xpbnlt8Xc7YBzlYwM2jVODKI
Message-ID: <CAGjuiT9+Gi5=dbtgMsxSu1jG4Uz8uqVSoFL+jFHLra+w+hxf2A@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: refactor pipe graph dump
 stage formatting
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, mugrinphoto@gmail.com, matt@mattwardle.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 11:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> The definition should go to the top of the function, there are only a few
> exceptions and none is for this case.
>
> Also for the sake of better layering, introduce local variables to track =
values
> of offset and line_len and only assign them at the end.

Thank you, I'll implement this.

> There is no need to have do {} while (0) as there is conditional already =
and the
> macro doesn't return anything. Also it's wrongly indented.
>
> The below should work.
>
> #define ADD_INFO(flag, flag_str)                                         =
       \
>         if (bi->enable.flag)                                             =
       \
>                 ia_css_debug_build_info(enable_info, sizeof(enable_info),=
       \
>                                         &offset,                         =
       \
>                                         flag_str, sizeof(flag_str),      =
       \
>                                         &line_len);                      =
       \
>

Great, I'll fix the indentation and remove the loop. However, please be
aware that the loop's purpose was silencing a spurious checkpatch error,
so that will reappear. Also, I'll take the final "\" off the end of
the macro you
provided and also remove the ";" since that raises a checkpatch warning.

--=20
Thank you,
Neal Patalay
