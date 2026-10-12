Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571AC41D635
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831978; cv=pass; b=kuWFBoRI1voXJ8rphHL1PJm71b+9BSZzehnKRhAovkdI1v5q914ehpWL77V1yXVuG/bSdgMyWoP6lo16Qn81pga2qVubcBEKF3GfheAswW+FWsdMer7lw6E/PKSTJ6PWii8OVrAvuoc+UbzXz+Qwi+2hODQ11rBsFn6wasbRiQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831978; c=relaxed/simple;
	bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRMxkbtWxEWj6KBuRzP3oEew6BefXaDv1RtmbUnMcahLk/KRwJAmQ50jKdxc8g4sbkjztNhWm1lF6P+iNKbx2KRqAYPAqLXUIvSRgQoEOIK8fheGLrmOksGD2EqCu8/qSYTTLGHU/Zgu/rP0HgMtshdFtADnCWHcFA2McIuOxss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2I58Xd+; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2I58Xd+"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so32891251fa.1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 12:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831975; cv=none;
        d=google.com; s=arc-20260327;
        b=EKB7QbF4Xr+swYQwwgOB6wRZ+opoTyBI1ZEiz8b+pv/E2kFnNZTZi6LPbp6wJl/4Me
         mZEUlLysHXMygF2KbB6PNnFbbW85Ndtck0tA46kUWiuEyMon168tUSGHz7cq6RpiZKCm
         XOXlSSq2yxz6zyfJxhBBoVH6AZHEgkVl2OYE6itTYT6h9kRSvD9vyAzqFAtzgaaboTyD
         g9+fSJspEnjsxHgkAS2NbH4bavJ0Be5F02e0NX8yRrIR2IG+0HQ1VHo8VIvgKZVAxO58
         zrjKCvW45T1shirtOyESAXBO+npyxvKvrR4LVBkWdaHFgthWRQYVaqkX225TemYAgiQK
         Klmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
        fh=xMO9BcwJG9ZyixEUAULOIytfAXlI1FhMYOiy8DHEiEk=;
        b=jf0mHocl7Tmet/3Jxwr1aum9NA5BC6kZOtZWhUXZGcSll4oc1gQZiA6zPdnJQxymoC
         88AeUd11m+J65807VDnyu9yXjwH/OuhqBqinrlEdgIkn9OfqedmChgfiPCuu59AILRaT
         QkXBMFKSjEGggm2Hyq7W/wAcplEhjTZvwnGcJ9wadTPdLvtY3xq2zBEuLh1R1lglAPKB
         tMN8/uGO9JrvMZgh5hPowYeFqXQ2BrlCf0BwCJOpusilRIQD/7Zkwo7frj3SDebtJ+c5
         /X25ppfKDr//YsKXzag08bRTXga4kVZI1GGrBNU8kEW8BgSHKTXRHs+zp6bF+LGJzFfx
         eUtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831975; x=1792436775; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
        b=I2I58Xd+n4pXn6kfPLew1OhAimo+xaM7Kn8fT2nUOtxKCPV4xKcRkT0sj9Kxgyo9Zv
         4RAKXQsuIfNT8xMJYfjiGceVCsW69IFJ6OZ0xnni63Vo3shUSPwFwoTIOCIaWTyV1qKj
         i9ZJpPDP0Y0VSHbGyF9MtcyUSF8WQG8sGqrpHv1q6Fk7kBE5QjiEM1TrptzWRHjN9LAm
         T4OiMVcF4Wf98CMux+Z4b7TEo2UEXO+cEKP30sCio6aSEylJZAIVvfAP6tMK+0J5Anrs
         M3drT5y6rXWH7996Rv/CvIIdSR1E0Lb05Yo7W/q8+ptWlDmqueZvf6Ab75XTfbPa5l24
         iZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831975; x=1792436775;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLp3HKsqGsshDCWSPd0ffrvTNfaxMvsL0rFxADDYYVM=;
        b=ZU2lCLff4EV58H5s6x83a/zF0sBO62k2GyzmQCKqhj3U5m0ie3qfkRVSeDbf9n5fkG
         lfL85quFbtIKRBwPzD0Ue0lE1ZBK3hfFOBigVegaXFLaOFr1BS6Ta+yWtyJfpNgwl+pC
         tEaCve7hmoPs2hOrVOCFvz6eDR9tbYZKJu0L8NH9TOVdX8PLRhFM/lrv1jYmkJXH7BOT
         +owMHLwOYxEAyCvcvo97oSUf0BzX1Vib5LU8iwIlGTajbRL5a8jB9YHn9zITGF7pkdrv
         RiOHY6dRiM+ZOfwCyTjqyFn/vrbK3pntDu3ZIbOZKA3JYthniVbLhCViKWSVnyITTXOe
         b3gQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj1Iv42HKKar7/Qa03WgJQPvLJZzQN6w0UnkyKCoZZoaCGpMiajaAO+CjvV6Zwr18NMUvbw+ag4vKyhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIUPE090cY1BWS4sNQi6cm2fuOn9ykVVQWrVOw64cV2l5JM8WoR
	+SCRrEo07XFvhkAnKvTgsoDMshlPpAPYng/Ld/TI9AmEmJnNJJYzIT0Kv0/sD7dNXa5q69MThLb
	37sWo2gp+6KgSSGMpHf124yqgi5hdY40=
X-Gm-Gg: AYBFou3MyK0tM+J51dX7lUU6GIxHWtgWypjVyGDzKyJXX6cE/bJLjtk2Ju4axR1ZbuD
	oRNOce5IshkFsxM2nW//HSOmXfURQMRKQ8GhCit7AuxZY5EIcPvWnVLK/ilxlpqVfwapk4ABoDU
	s1xGtagSh+xF6IkJshbhvrSDzS/QyyCOO1gUMshrO8SEW7mpgbZJ7b50iIBuQAxL91TPraBg0VD
	xtIiYX6r5PFclsLds0AuQ6B2yQKGQKjl+p3j0nb/1zEdV6BCealZAsmKLLEIHigF4Gjv2CyqD0X
	bpspEUQVEM1szq88RyYKysfB7W9Yl3L+iCjvoL7ydeyLGEbv4cxmkwD8FM9Q4BcW/a/9lVLYs65
	9KDy3PiHiHukUODMvOfWgOH4iX0VXubsiaA6vIxa4vrtLCk6DV6bWbybwRffuw7ISDQ7gyy9Akm
	2Q8rVEYN0MoRqount1ZsR4pV0qquf0s12S2X1EJOAx
X-Received: by 2002:a2e:be88:0:b0:3a9:9eb0:de86 with SMTP id
 38308e7fff4ca-3a9c2b2bec4mr24167141fa.16.1791831975227; Mon, 12 Oct 2026
 12:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012161322.930099-1-johnsingleton@google.com> <20261012161322.930099-2-johnsingleton@google.com>
In-Reply-To: <20261012161322.930099-2-johnsingleton@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 22:05:35 +0300
X-Gm-Features: AclHuK8fAF2fSWnfjrxj_cT8t7W-huCmBhhYSwYrfd_UWmKMMD4Pm4VmZJDTQS4
Message-ID: <CAHp75Ve0jonWgyAQrXXa3L84zw=ZsgW9U80UYpkKtWVaMYgjjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: media: atomisp: Remove extraneous dev_dbg
To: johnsingleton@google.com
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Remove dev_dbg calls that (per checkpatch) are duplicative
> wrt ftrace.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
