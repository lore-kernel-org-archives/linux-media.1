Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AAA382F01
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860486; cv=pass; b=q5rqF5HMdJgmWDK9r3RqlUnUbWuXeVRPvS5CW/8uYr/FMxrWrsg3fFp8TxomsPYJ445ir0CBkmt3y/L8nzkr+KvM8oqeRWGnYmylb3Lo7VOwEoC9f6v0M9A7q2POlmh+Pd1wYLmpBtSXV/t6XDypsZR4R/2BbWdql8vZoqJeoIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860486; c=relaxed/simple;
	bh=nhnejJMNj5iwHuKtRuWzGRWrxq38E1WZuzk9fa1bNE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sEmsLgtBoF758Tf36YXNlwk09BPkIcZNdzJlkFrLt3AS+EOXEANAmciFzmzog/DzphYRP2yGTqS5RhndSoPtCaPdarCcD3Ek6F2c+5kIAzijhcsdX3BQVyTMdEHkmITbuXPncVDU7aCbigysL43ym9AmVofznBn9Pg1LT2EU+yE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ad03NrN2; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ad03NrN2"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so7485419a12.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 01:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860483; cv=none;
        d=google.com; s=arc-20240605;
        b=GKTfao3yybg9h+gRrpmq6QJ5KwIbkw0eyImQchV8rHBqd7P2wMvAmV+iqTHqt9kITk
         92L41Qo3ojPwuXcQVXCzgCjTSiM5vc2yR36fEpc52O6B/txHEYgz3ptYjuLA3cYEltmF
         8F30ycap5xvvnkTcmsABOKWJ8EtTf19emj9d/2cyD7Ha67EdMPPz/fLTuM45vuizWgVZ
         ObiaelWRaqv1pKKfk2EA6FXrNk47lkubQDy0l38FLvvMjgngdkS1nBn3U0KsFdl2XB5E
         30kxY5TNiq6/wmzVIMCiq1B7Xy4LXaNs2j9BXX7y8Dl2wucbs58Ftx+/XimmvFzvDdKM
         Rz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhnejJMNj5iwHuKtRuWzGRWrxq38E1WZuzk9fa1bNE4=;
        fh=zr77BxdlZNPYtmyrq3IrtmBRLbIA5jFGP2WqAnT5vDc=;
        b=Ci3WCB6UDDXbHCb1BoJRKaUibUHSJnGk9REoXWVkCIlX4S23hThRN2Nax9a5TnCs5u
         mUlwe0U8AtHxQ/gFNkCqFxNvBvksVldW4KcmHMxn3N7Y9ijRs+7js4bbwbnCVuWf/bn/
         fkNHjMGZjM68QBGrOfXssTU95dGRdazIDN58jbpXvwmEsAScq6fRSGh8Iuuqs7EhZlj/
         4eEYgLG6aGYINx9Fxk5D/KSz+6p4OLXZc4PD7AKsVXAffMLffrQx+wXf7cIy+ml4HDEb
         5C6l93czRFlySKxSdbza0YWIuGJu+kd7GA8ZZsKXdeHGGHOYyT7/LJORWYaq81GZKzr0
         PRPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860483; x=1775465283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhnejJMNj5iwHuKtRuWzGRWrxq38E1WZuzk9fa1bNE4=;
        b=Ad03NrN2MIxoa6gIzBUgWSodJTsxrFArNmCZvaMTZIZ/2ZyxyiiYvasZvqJzp89MJ5
         VMEDwnudexcDNj7AkF2/772foM2Sv+vJHcJXsZNS6ndWi0rTFWBQy9Rn7zyn687Waxqq
         gtgW/AGE2GeO01NdvOqnnZx4TwouyaMei1uXIgGh6QD7dcFLJgZbX1bolTDRzWbiNZ2l
         FSLFpi0eKfrWslM2Ej5EsBfCoN/XUpMi0OrTKmiWKfHxJlwTfwRVDDXEytEtHJR5Om0y
         PVXUGEQbQr/+ZREhAoZF6ZP5JEmHIyjsgBhrGkr4aNztZ598eVYvq61k1XhubaqKBD6h
         crNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860483; x=1775465283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhnejJMNj5iwHuKtRuWzGRWrxq38E1WZuzk9fa1bNE4=;
        b=UYj++ho5Ol3Bhton0j07zTeD4eH64ajifrn23fK4BJv6nroB4In/hGKlqHjQ3+3fd6
         Tcw88T67qtwbIbK3IO0uxcz+l+3ks0BHSmcIcVG4GTwRG+3+80RubivhIgFyjtcq71pb
         KG5uCwj2axQRzxVIBCgzPRuXGG025cX6Z0IMK6c/FyVGGmgF0kgcldJmVnNJbITpGK27
         t5YuRd4SsmkFFeEKSQ5cbxtEQOEhgb+DfqfPaxWY4ASERxW80F3XlG+KV4Nj+qJQcjtO
         pOac2/9QpPtaaaWwNY8pc33gfkTRf36nsSLe140qgOTszssr6ChHv7uhVfQckSLdjvCP
         cfiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJqRQRmqL2Q2CI8+ybi95sZJ0hQyix2jgQqVSucUzpYnqEbzOye7/cc7Ii7+q8w+1b7BNyHEB2C+6juQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5qcCcHzbk5zuRnmk/ar7WWSf6CF4DMYyi7mHaWjg358gmMbmH
	oJ8PHmgVeaoIpVMAzGY/Fwn/I+b/i3axV1gHGhG1IM/Z+gK6YaaKET+XqaTXmthokvyQNbHNDe7
	8cSzLUaDMFN3+fkDPr9uFbFgBJgN3lpnPsHjb
X-Gm-Gg: ATEYQzyrdiItfY/BJcEEFy6HsSDaSVoEtN+swqMW3CdKdKXql6gI0HBht7Tqf6mboFV
	kIs9ka2S5t9G2PmVPs8d2gzeJ/vn7AlVWTRZIPOiGzDlvEZgBTgKYkORW6r27Sygbkn6+YVcF0u
	79piJ+TLS8boLh1w+MX5mQ4O2+jNsi2efJXU8K4F3ZV1MuYdpFjMB9YZTxmiUeFVdG0nqR9Xog2
	1f589bbSFjWdwLvoLL0gz+Roje0Yc5cIkDY/XR8z+Rryn9ViiIiLDmNX3/+KWNw6r8IvT/X42P2
	9YSSzKK43fsTIgBvlg26mGI1kxr1+XtuohfFdaOa1/SpQjzLWsZnOa3XWYlVIUIKJNgtojRYkyC
	uy/7eVYlljsKxYgDFaA==
X-Received: by 2002:a17:907:7b97:b0:b98:32c1:249d with SMTP id
 a640c23a62f3a-b9b502bea95mr648871266b.5.1774860482968; Mon, 30 Mar 2026
 01:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
 <acZRRXXBoflHV0rt@ashevche-desk.local> <CAAfE=nMVP9zJKPendwusvVwjesVgKOTaSBHd0S219X-RNTMDzg@mail.gmail.com>
In-Reply-To: <CAAfE=nMVP9zJKPendwusvVwjesVgKOTaSBHd0S219X-RNTMDzg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:47:26 +0300
X-Gm-Features: AQROBzBvcAtkpxMXswfE8-CalscNGYDIDSDf1slA4HdTmZr8BpHC0VrUxyvRZ-E
Message-ID: <CAHp75Vf0uGUgSW=pOWKQcfpGcJPNFXDvkwcK0gTPQ14t4z72Nw@mail.gmail.com>
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in gp_timer.c
To: Anushka B <anushkabadhe@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, andy@kernel.org, 
	gregkh@linuxfoundation.org, hansg@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	Daniel Baluta <daniel.baluta@nxp.com>, Dhruva gole <goledhruva@gmail.com>, 
	Simona Toaca <simona.toaca@nxp.com>, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 4:19=E2=80=AFAM Anushka B <anushkabadhe@gmail.com> =
wrote:
> On Fri, Mar 27, 2026 at 3:13=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Fri, Mar 27, 2026 at 08:41:06AM +0530, Anushka Badhe wrote:

...

> > > ---
> > > Changes in v6:
> > > - Mark scope of GP_TIMER_BASE static
> >
> > Good catch, but read my comment against v5. And slow down with new vers=
ions,
> > no new version within 24h, please!

> I saw your comment on v5 regarding the GP TIMER comment style, thank
> you for the example.
> I also received feedback from Sakari on this file:
> > Please don't move the defition here. There's a reason for keeping it in=
 the
> > same location with the rest of the offsets.
> Would it be acceptable to go back to the simpler in-place merge in
> system_local.c, joining the split
> declaration of GP_TIMER_BASE? I can follow up with the comment
> formatting as a separate patch.

Sakari is the maintainer, follow what he says.

--=20
With Best Regards,
Andy Shevchenko
