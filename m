Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E433D6CDC
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845839; cv=none; b=KKQhSLKaEgnDT/ph+dvBBE70n5zhVQt907YpcmCsndSvxkEz100U4/QiPiklcyl4gi5nRoqwlRV2YICvDzuRqdq/8ig7YdguV3diW9bfxe9dRi1ZoOqs/20s3XAGsQtNDZWAK65cFIuykOW2NocLA8oe7m0jcJhvl0hpAMgDTYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845839; c=relaxed/simple;
	bh=FcjBU8GVSxFCjPQMaDcgyNV5vpEZggBw7xuLnKblMyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNM3IHMi1zehh5I6aiSgI+gKoOf0p93NHRyx5yINhZuR/ly5qHLx5wLgyk+naJ43WIvjGdWX00goG4oIo3tKHlgUkFDgAsPCsPYh82Q4EeS+cpMYMWdzsxLMnsPuErar+knKJ8U9BkirmqKln3g8Tys7PZrhOCmW1nLSEeg9yhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JHinPUxO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JHinPUxO"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a27b65a863so804733e87.0
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 07:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773845836; x=1774450636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdcMTRS1SNtqx4ecaOtDgv0cjA07u+A8EvWQZc3FLag=;
        b=JHinPUxOu85YS6bMJ0uxCVDSbVG5FGR+cJhd/K+ps2pupaupCk8jGfOu5lY5ird77z
         1y01dSgDZZNPsLrnhtnJgr5AsBhfHhbMlUFP8VgVdFEDM0UiVAHnKav23aprfZ97bf6w
         7qnbAHa+D4fXvUUHF1EG86KsEI4nR4uhf19Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845836; x=1774450636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MdcMTRS1SNtqx4ecaOtDgv0cjA07u+A8EvWQZc3FLag=;
        b=GTIgnAyA1PDkI62G2jaKwXg5oLXLqKc9leopeVD/N8FLsLzqBwFf9PGePbJ+189br2
         rz77YahOa2gehCdnINyThG171+QnGQ5bkHEh6OdEVBm0uoulMZgs5iL6LOIp1Q94sZwv
         0wTuyr42mL1MZnp34rBbzwmmX42k7xSEqiwHcVWk2GgQ/eMHF7LruZ4OYC8C3AumpEGX
         RecOCghvxE2/lSw7skfJVNDi0iQvJixN6hwf7zDRiP48vDwaIzqU8107uNvBYeX3CPag
         Q5hQFJPM4Hy9tQIZDLhWz7Pqgf/c0GnasXWJFtlseNS42fHNULPpn2gVowCSmf3gWsgi
         j1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWaK3a5pLMJa5YBiUqBEe5BTZT1Z+sBc06wA375eYP54Ni55rnlHKoO99MWUaPtzw1uGEt6sMFfbGzEzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxZ/2Df3TlHzhS9ULaNVNy9HwCo3e11/hvhoVumWyPOdf9hxbY
	hPw6L48sZIIDz2JmG8NzZYVde7DkSplv9FNxD7JQ7m6Ko3pFY83ICwvipNmrWrj8LF++3UPE5fi
	g05m73Qbd
X-Gm-Gg: ATEYQzySMl1hy3wamm5P7jQH8jG5/tqtgfjegkjgfwBFFXB/wC51lWkDXhLDeBw4GTU
	fFFK6LbiEgC1hCBdhzSO8AguDMTIDI1kDMhqisjbWwDJoF6VFTLuQFK8kkEE7xOBweQeHggnSPZ
	WwSdaCyWmy8CpgINbImndfdvLGm2CPyidRdCe6JTrZuFFL7iBv1QI8kKEhayZonrJAdhPLOMqCH
	qeunIssqenG44f4kC7JHrubfI66Ae8K6/xej8on76SFcRubTTUuuB3fLvTG0BmCPbG0l9NWkjVh
	Uf0uF+4bMxffLqjni3erA6NZO0Un/ib4Di1Fappz8rOGd3usOoOaHh2l3KZKKvkc/5X/NCCvBxP
	uM0sUnvu+/gYB55pmzksSWuE1BhsZkwJEGJxt4xzouxjZZUWSf8mw3J6RHbxKGo/RRTQ6IyFhxa
	ySty5G7VT5Cnqs0+JJ5XHmV1wEyjmWOrawAtfjJUe5+Y/OPcus8CeQsBHCS0a8
X-Received: by 2002:a05:6512:1193:b0:5a2:7c1c:74c with SMTP id 2adb3069b0e04-5a27c1c08a5mr893843e87.21.1773845835923;
        Wed, 18 Mar 2026 07:57:15 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2c152sm587209e87.23.2026.03.18.07.57.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:57:15 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-667952fd262so2214309a12.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 07:57:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVX49XbmQcjWaOZdE3XUiO97QXcDDi7Od6igTSrF6ppQsXlSPhl2QFpuEXn9t8Md9wp2Rb50eIUN9h5NQ==@vger.kernel.org
X-Received: by 2002:a17:906:2295:b0:b97:85b1:d96d with SMTP id
 a640c23a62f3a-b97f4979cbdmr170423066b.28.1773845833640; Wed, 18 Mar 2026
 07:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
 <20260316-uvcdynctrl-v3-4-19cd4657e1f3@chromium.org> <2026031852-unplowed-ocelot-142a@gregkh>
In-Reply-To: <2026031852-unplowed-ocelot-142a@gregkh>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Mar 2026 15:57:00 +0100
X-Gmail-Original-Message-ID: <CANiDSCvJnwGix2fZU7KygM8zC1sizkgrW-BVyESnMcmXhGE+zw@mail.gmail.com>
X-Gm-Features: AaiRm51hrhY4O3Nox32PNSRdYJEegEO1R7XoT6QCYK7UNC9YdU9PbmB0EZ4tmSo
Message-ID: <CANiDSCvJnwGix2fZU7KygM8zC1sizkgrW-BVyESnMcmXhGE+zw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: uvcvideo: RFC: Convert allow_privacy_override
 into Kconfig
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Wed, 18 Mar 2026 at 15:17, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 16, 2026 at 01:34:47PM +0000, Ricardo Ribalda wrote:
> > This patch is just shared for discussion purposes! Do not land.
> >
> > In a perfect world, after a deprecation process, we will be able to
> > remove allow_privacy_override and block all privacy related controls.
>
> Why add something you are only going to remove in the future?  What has
> changed to require this now, and will change in the future to make it
> not needed?

Currently, any application with camera access can manipulate the
privacy LED. I believe this is a security flaw; ideally, the kernel
should block all such controls by default.

However, blocking these controls immediately might be seen as a
regression for certain users. I added allow_privacy_override to:
- Prevent breaking existing workflows immediately upon a kernel update.
- Give users time to report why they still need manual LED control.

The goal is to gather these use cases over the next 1=E2=80=932 years. Once=
 we
understand the legitimate needs, we can either implement a proper
specialized mechanism for them or move the toggle to a Kconfig option
for those who explicitly need to opt-in to the old behavior or simply
remove the toggle altogether.

For the record, identified use cases so far:
- Old hardware with red LEDs that reflect on glasses. (Likely a dying niche=
).
- Using cameras as baby monitors where the LED disturbs sleep.
(Arguably solvable with a piece of tape on the LED, but still a
reported use case).

>
> > If there is any usecase out in the field that resists, we shall move it
> > into a Kconfig.
>
> What does this mean?  How will anyone know to "resist"?

My phrasing was poor, sorry about that. What I mean is: if, after a
deprecation period, we find there are still legitimate reasons to
allow LED overrides, we will move the functionality behind a Kconfig
option (e.g., USB_VIDEO_CLASS_ALLOW_PRIVACY_OVERRIDE) or other option.
If no one reports a need for it, we simply remove the override
capability entirely.

>
> > This patch shows how the transition to Kconfig can look.
>
> I'm confused as to what you want to do here...

This patch is just a RFC to demonstrate the final state if we decide a
Kconfig option is necessary. The actual plan is to land patches 1-3
first, wait for feedback, and only then decide if we need the Kconfig
transition or a full removal or something else.

>
> greg k-h



--
Ricardo Ribalda
