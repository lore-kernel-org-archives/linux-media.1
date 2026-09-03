Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530D34B148D
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444084; cv=pass; b=OV1CbIgh27hFuTgcwxxrjiC9LBwdcqr30i8HwOn07yiuUtzCB4hyz5L8MACG4OBiHP7P2XYC4d2/NsXnpUHR5W8srw7nchRm6xRA9PaR0RFqhHvB6tOlyWQPP/Zfj/ec8W9qG//LhKD6cj86DiFYpf1H3FyWHHQADoLtp1PaIsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444084; c=relaxed/simple;
	bh=W/ZhzYyuVms2wSvCuj+zW2Oqgu5ZoLzyqaYyoEnm/KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5LBYiBzMEXdArPMIml1j7JiHpbjC6WZYoOTbbHgENanJ5+e8DrKcZUgFU9nC/orcvQUdr3P8yBakhB1BxPOJUkDMHoW4KQh2/0AcIpm3OFWhQwdPYbUgCVIQFECJf9K2QNfBl2d8p18dho8GnTaI/Gdi4jfmtn7ZWkSBQT+xvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaHIehkY; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaHIehkY"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so814994a12.1
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 07:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788444065; cv=none;
        d=google.com; s=arc-20260327;
        b=CCz/CfWbTDEsIF+749RBxMI4FhLveQUVJiHxNUoig09LOvPkxcBWJIoTQ7ZDm5KpoB
         REvpREYh18930DJFhCLkhZ34DhrALBKES25Y6/Z/bnavBNuy+2G56/sZuhAdWx9RneqB
         KtziULPZCAjgDT2rPvVcI2fITguc0rAG2im4jSKblA/zYE49UUj9eQ+lCZPLb/zOxcyA
         q+wHWzi0zITMjuIpjlKPV+c5zVx48cL3XRUojT0tinEjnaPOaYClVLUatReQ7a5bO8cZ
         rfKwfGf/D/Ws/koX8RgBefdDZ2dxMDpb5Tz/+SWxjn9LOqCgB6lz7ToAbSfP7ypshtr6
         lhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o7o2saOOdNbey7P8OnQtW1dHvAKknp6TT0oyR0mR9C0=;
        fh=gLj0eG67o4k+SN0tb2Lo2jMio8OdCJ2dYjgrrAN4014=;
        b=YkiKNc8TwudLXd1QTEdZOa5Gfj1iGbpdO0MR7lFdcp9ZpA5EtcSA2c1a1a53IQCiDV
         XXclNAJWq9xrkwVBahWUzyyP6DzU5jKXh4LUSLEnH928VFD+p3tcvI0FOyPoJW44a8hX
         JIA3EFvOPiDc9dZ9bAAVIQrw8nFE6OjFfEzEpKK6H+wlZjVPP+ETwIyS0nX5uY8/XW1K
         ACHw4CwT/PmMc7EJhQzELFmY7mSyNB0TiX8+1irsdhVMx4w5LoITSsr6w28Vmu1z6oDS
         pR9YM3kJgV5KEnpyJkvukspaiyJHlG0eDFJnkEzTw9TsT5t+INUl80dmdGfkVQbQvEcB
         DN5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788444065; x=1789048865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o7o2saOOdNbey7P8OnQtW1dHvAKknp6TT0oyR0mR9C0=;
        b=CaHIehkYBVU3F4NVcMelqG9bkOH6YD8y4KiwfHW+yDR5TROAMH7naiLZiZa+AIzzIq
         rbsZyfBtsSCFYcIy5w/iq17X+fasmYALTuwMKoZxxAq6TbElz8ji7WYXUH4nOPVtdGUI
         BW43Y8q67P8jKEE+/K2MWlptPCemBVNWsCBsb7bn/E2QH+wUS3ZGVWjrzXS22D0P1nw4
         0pOrCKKED4Y1lTNVCm4vqyRd4npPFRLgJeYZ1SI28GfmcTDRxPSmB3M5aHp+ProudAOd
         6z1/MZhkLsIsdWFAVL74NkIEhpJ29LUqQqkUyl3+g5KfF4yq0dB1jTZqjPQ6j4AtoFz6
         6MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444065; x=1789048865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7o2saOOdNbey7P8OnQtW1dHvAKknp6TT0oyR0mR9C0=;
        b=n33DBpg5rd/U29WxndXOqCvjnhME8qCrH/i9TZFe+6iyxtxfj97MZEvpa72rVQWLSh
         8FIc0OdnksFYHkJeF70C6X2O56SEOJE0IAC1N4du7dsQ0TTwP7i5ZCf3/aoNquSturbH
         Hq5j9BxcOiwUg4N2HMYOtUUhwO8ZW9biPKRkr1xrZiWJvKvlCSV1gJecGN/+YmeF5qUZ
         lzqN+sMQev7bZS830oDjqE98SGNPgOC4E18SEbZa8Pg30KIOhkLTVdemBbaKAvqWftw9
         DFgJsG/6WH5QXFe4VgxCDEQd33KAiSdhgKEjEdPWBkihrknxFX/lHMhj0Mxr0I+f3HqH
         EYWA==
X-Forwarded-Encrypted: i=1; AKwUvBxwxb/n8uD2BfGlpWlmun/Ku8vordD+K/ec/rG7KuHKZH5idG/T6hw/iHUJ7faztYgc1V/2muqnnT7s4A==@vger.kernel.org
X-Gm-Message-State: AFuF++m4v/sY2dIrlpbhc9cpg6LD6IDU0nYy6OBNNe0K+AWP6D1lTVBp
	jARaPMRHxXCQDOg27maVHlFLQdyBmeu/hswvpJ1fjXV6FL2MxCakI4lAyxTXgdd0BBLAtY3X5jg
	9TXjQFIlynR7iyeGmc8ciuJ+FI7c1+LU=
X-Gm-Gg: AYBFou2bciJABYV9s4ICjOWQkPE8RmHN2o85wI6JpNBy9R/UABap9fgd3YzfxV2iiLT
	41lQH7Ign+Q1GMQK+MZW8fA9BuignMsOWtIRxjDECZGye7SvmZqak8wqOnntkQ6xFi2iuECJ+tN
	Of3ABcj59e9/gKavuAWqnIwKYs6olq9KkEYcTsb4Ksw0KcFNgplDPIWncxVZFz+uyIDKen3vj+Q
	GVx7KPnpxWrFfebN1O1ZM/lUQECJPocLtXRXcppCuBtuekrTeEBZtiPzLaQBToeSFvVuVTK62C8
	gZTmG50aQsErE7QjUz0i+3zReth5hxmSwDxUSRCSnF+sBF/1/ELKuHakrsI9U3W4ow/1TWIfxQQ
	j92RDYZDYC93kkE/XHwHmcl5Nkpf0YEoiiU6WhXNJ4QfaUnIKXuaEUHnaffZmrjJwoCNw14qkqF
	8KYesWwFGMtF5ETaAG/qlYxxu8idQwTw==
X-Received: by 2002:a17:906:8e0e:b0:c25:c651:fa70 with SMTP id
 a640c23a62f3a-c260474e8dfmr39283966b.13.1788444055893; Thu, 03 Sep 2026
 07:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903081557.16603-1-germanpapulindez@gmail.com> <apkvE9kbfEWHrAte@kekkonen.localdomain>
In-Reply-To: <apkvE9kbfEWHrAte@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Sep 2026 17:00:18 +0300
X-Gm-Features: AcwNN1XMsw-TkkISsHavguNAtNCU7_fOI4nrPd6B4gIR-w9TMT3OopwVlR-oBR0
Message-ID: <CAHp75Vco84AK9mU_HH8oubsVOmErB3utsTcoQpqtB0EG8KFAOQ@mail.gmail.com>
Subject: Re: [BUG] platform/x86: int3472/discrete: unknown GPIO type 0x08
 breaks OV13858 rear camera on Surface Pro 11/12 Business (INT3472:00 / OVTID858)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: German <germanpapulindez@gmail.com>, platform-driver-x86@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:26=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Thu, Sep 03, 2026 at 10:15:56AM +0200, German wrote:

> > On the Microsoft Surface Pro 11/12 Business (Intel Lunar Lake, IPU7),
> > the rear camera sensor (ov13858, ACPI HID OVTID858) fails to probe.
> > I've traced the root cause to int3472-discrete not recognizing one of
> > the GPIO types described in the device's ACPI _DSM data, which leaves
> > a power/reset-related GPIO unconfigured and the sensor unable to
> > respond over I2C.
> >
> > System
> > ------
> > - Surface Pro for Business 11th Edition with Intel (Intel Lunar Lake, I=
PU7)
> > - Kernel: 7.2.2 (Arch Linux, vanilla)
>
> It's usually best to test with linux-next, not with distro kernels, or in
> this case, the media committers tree
> <URL:https://gitlab.freedesktop.org/linux-media/media-committers> next
> branch.
>
> > - CONFIG_VIDEO_OV13858=3Dm
> >
> > Evidence
> > --------
> >
> >   $ dmesg | grep -iE "int3472|OVTID858"
> >   [    5.555231] int3472-discrete INT3472:00: GPIO type 0x08 unknown; t=
he sensor may not work
> >   [    5.788882] ov13858 i2c-OVTID858:00: failed to find sensor: -5
> >   [    5.789321] ov13858 i2c-OVTID858:00: probe with driver ov13858 fai=
led with error -5
> >
> > The "GPIO type 0x08 unknown" warning comes from the default case in
> > skl_int3472_handle_gpio_resources() in drivers/platform/x86/intel/
> > int3472/discrete.c:
> >
> >     default:
> >         dev_warn(int3472->dev,
> >                  "GPIO type 0x%02x unknown; the sensor may not work\n",
> >                  type);
> >         ret =3D 1;
> >         break;
>
> This should be addressed by commit 34e31390a3b939db2e0cbfef4c40d95052572d=
f0
> .

I can't see that commit in many trees from kernel.org nor in
media.git. So, you mean it *will* be in Linux Next soon.

--=20
With Best Regards,
Andy Shevchenko
