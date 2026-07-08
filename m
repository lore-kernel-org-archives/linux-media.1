Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445513E16A9
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 20:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540996; cv=pass; b=TTBiXT93+NL6IYKidsuO5ImGhHVa5tjAh9tvbLhTS9U8bMiOlX6cQi8yby2mJ4M4CWU0ezrtkvwvcHfw7k/N6oseRMfwo3fmiVsNztmwntLWzB2+wuMOO7Sk8cgd69fNOJn/hQmC+f4A2jr3lxSAqAVbenHR5homdLGvoAIUEy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540996; c=relaxed/simple;
	bh=VHoB62D85pcWXecYyB+2zT7VNa7GDV2Iff4zIPRsuxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYA2C1chVFaOroNHMgYQdNXEfLgGtSOf4sfvZiYC8Owev1/arwaV+Y6wDkLtcgSLQ08ncPZ1WgoCxQT9QLbNlUXBLwQek5hyUXAt68C7Rh5WuDDPzN0YMGorOxk1gRBkm3zbIr3DBFSu7r3D7rIuvKOIXWFXVAp0f4enY4fsqec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Sxu5BKLo; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Sxu5BKLo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc6dd436c6so11763285ad.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 13:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783540988; cv=none;
        d=google.com; s=arc-20260327;
        b=VlfarwTGITiMS8FDnLPFpuVpcS4L4fVcgXmJ7zkohLnfRNmu+rpXto4OV251LdvIde
         5faPu95yfwt2br1fiW6+j0qv+5MHiDek9G69m9GuyxLi0I51si4WuR3mR14GpT6mY8ji
         J4+MTMPQsjwXonej0EGPmVUmHi4nVN8Uh5RSupLXB0PCCpYa/+ZHe/4H8+2ahfZo2oGz
         S68My2RgBuvmaekZpOb8oAKvurfZRbeuhRB/ZUrhxjojy0VwAmtO8uM78Yo8vKptsMML
         2oQ1luxvABZ0wJCqfk8c3PNKZK+kL5ax2m9DUZapIj3ktwYSXh7szKpnSfwWtgT045Mg
         gYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        fh=jfOGO9EqFn+oP5pPkjTYEbHKzCkT0FRLCiu5GR+pCyI=;
        b=jLsWPyW21VUQjMqBmkh3n9UWCUuPkqofKO2luUnrgc/PxQKY8NIRG9QPuKRpr2a1bJ
         w3r1qTsEiYcBIwiLNbVoV+rOd/mu5cJUo0UeElS2GYFIC0LqaOuSOG+YGis++IGbFA0D
         gZ7XbehiEqgNVzTYxO7mjJt5ui8zL0K08glqWsBONUcwt7fj8wRPp167qc/MsagmXrwR
         vlHbA79VPZWx/jaewo13ky/OgI5pCwTqJFx3SP+4u6B4KxshceaYGTgRe+4EE24bYrR8
         ezdR4J/lT7M2tx8B5Ix2GMc1X3VcVF8+L4DBZZNBIXy5lpg227C0EgMbhhDDb3HuK4QY
         xqWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783540988; x=1784145788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        b=Sxu5BKLoabsMdi/Rp+XbMUw/GJpHKWmXtQtjeJJ1e5jaRoDt0OxDvTBg5lR7E4GYy2
         q/WL+jB73uROAx9nMRwKq8GEHgWiKyt1Wtw3kQ0N+TKIq+jNvpwMGIOc0gFJa4lmWi7w
         GSntuDY+XYTkK6cIndgzR2G2+Sckacb/zXfF8ckkstBcSvdofryy4SOvuVT4d8okkDo1
         OLOncnTlay3g3ZIJ5UFygN7BHv5oMQ7IRim2mMUenEExfTZMdJMagz1guuNBrqAfTEZK
         9FVKiBkehcUcFflzVq4ELilKFIoleK75rPW0bpAYQLhpiWsbrNppgf0uRHOSdHNX+Kfp
         cupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783540988; x=1784145788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3raWAoLWRdXsO1B6qPL4d9kyKqPCs3bPbCVnUUFegwg=;
        b=fcZQQpXNXxU6Xw/u3/h0nfVfyjRVQYL8V50OtnecgF7vCq5z4s4RcB7XysPWlQkmkk
         OoO+Z1/wISxbBCNkP2d03tR8JEOuZGdbeEBdPav4r31waXhg1zlQBR3kkgayhJ6D3py2
         oz1v8polXB76BeXreyHY5lIwFMKp52IZZwXxLWpOWN3omPW2Gy2+F/QLUHd0KfREYG/U
         q9Co9MmWVQlzY9JRaY3g0IZzXxaFHvkWCcs1k4MFM+5Cecw8D/wuJUfe+cMftyJIrb4X
         zE5fVOm5/Goyg9rrJAxN8D8m6jwGr0V/fteNQJfqH48KQ5oHwPt5XbO1fqC5kzRQqhu3
         mhTg==
X-Forwarded-Encrypted: i=1; AHgh+RpAWRhcDD9FBQcgPuCjnNH1BkUPJyMWwkP+Epg/dW3R4vTodX25je5s8paqcoDgOvWroOdMwayFrMXBDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyVjIXy0HF7SUb3cJtR8HpdpCU5QzDrJcYyWQmdgKJFx7m90Ge
	+k5KoePTQR8FS+psNKuu1lPaEuDwEPdhcyqIlsMKRJMvBMn5M2e0wlK7zrhPmHH+jDIVh8S7CfH
	fSJo3ChWz+Z163zDjErmOtOr9TB3gPCI=
X-Gm-Gg: AfdE7cmbXKm+6YpEOr/CUcuD4awMr6bPzUYuScAy2+G+iKqPI0um9XHFZDGlOQog9Cc
	dmP7MMgU5s7rg0OTSl8M9bWMOFQ1TyK/lxLHfsOvQGT0g9BK9OyXlGU4Yuki4wCPs9SRZjY1C/Y
	5Szw2GpT1R34k92TsEtHuf6EbXMS+1897bi3wRkQA15wZWA429vXHq0OmC67+T9uSaxOUsSJiqV
	f+GlhShzQ2ziDZLSn6j8h72TbaL0Aidh+jh5UgEpfedgNErBCIlsNuhI3h3PgVzBjxamRTNRhye
	9g1/LNp6VxoeU6b+DwBP/vntlphNHQ==
X-Received: by 2002:a17:902:d507:b0:2c7:f12d:5d37 with SMTP id
 d9443c01a7336-2ccea3b4332mr41011575ad.17.1783540988351; Wed, 08 Jul 2026
 13:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com> <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
 <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com> <74fc6cfe-f844-4cbb-bc1e-0ad96af37040@amlogic.com>
In-Reply-To: <74fc6cfe-f844-4cbb-bc1e-0ad96af37040@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 8 Jul 2026 22:02:57 +0200
X-Gm-Features: AUfX_mylmZnzRL8QYx31DSmWj6ivxEWovLb2UkpKfybbs6Pkvk-Opma3o6RcohY
Message-ID: <CAFBinCBQ+g8Kr2tL9ob9PvTakGrtwH3qZWjEy-ytGiufGUEieg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:39=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic.c=
om> wrote:
>
> Hi Martin,
>     Thanks for your review.
>
> On 2026/7/8 03:33, Martin Blumenstingl wrote:
> > Hi Xianwei Zhao,
> >
> > On Mon, Jul 6, 2026 at 4:43=E2=80=AFAM Xianwei Zhao via B4 Relay
> > <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> > [...]
> >> +                               func-ir-in {
> >> +                                       remote_pins: group-remote-pins=
 {
> > Can we keep the established naming:
> > $ git grep remote_input_ao_pins arch/arm64/boot/dts/amlogic/ | wc -l
> > 37
> >
> > I'm worried that adding IR blaster/output support at some point will
> > then lead to confusion.
> >
> Will do. I will rename remote_input_ao_pins.
I'm also happy with remote_input_d_pins or however the datasheet calls
this pin/function (seeing that A9 has AO, C, D and TEST pins in the
always-on domain).
The part that's important for me: include "input" in the name (so it's
clear that this is IR input, not IR output).
