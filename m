Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937279;
	b=Ea/qJKy/sLBQNowOLF+o79LsUljs5XCNDK28Vx7ED3I2yLUB81rBr39D+e4+E/aSON0+
	 aZWLpPfiEML5Rc6hTHkj1G44iYDO6c0pSiwsLLb46B5BIrgDDdRbqRcWtqgJ/0iaPz1rP
	 UECYTpROM3rGhNG2LNZMzOJa9NbO29lktjFLlobVQ0IUT107S0t3jWrKfowRYruK+Z6qm
	 OybgcbaG1zrL0C/nPzwh9DoIpd3FuW536gLIyjzyOnM5r5bHh1iw3ztotEbyqNJB3H+/7
	 HK0VaHHqIuWp32iS1JIgo/1aqWBiaIalD5DULE6iBY4yjo41OZyrpIP6gAT8t7SO9Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
	b=QOsF9A2JQ6ki3INJL7EIFtHZWOmdVzIz6Dafdbz1spXvSdHGZv8ee1ZXgnO2RaKt9h1f
	 F1zYVLo6Nlsk0BHClVX8jBg0XlPMZDNA0rI4zhXgCFwuQXxBAB0XgO94pjcgyrAkIkzhv
	 fLmLQAV70n2Bm6FSW0iaiZLo6Sjo2DKf2U/XH1rPwrCKUUN1kTJHhWStlWoHK9z7KdP94
	 Pm1auSYUqmw/omywbZreqNczQ11m9PB3YDCicHc8evOrJcXvNpyLo5QLXelz6MGfTkr4q
	 6+MafsBQG6lnHmE99yUk8uDnMhcopljo96tevTyYbD8uvXRnQPAc3J0+Z3CxkU2eyFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaU0A7V8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D76606A333
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 17:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D76606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaU0A7V8
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67583c777abso1639673d50.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 09:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937278; cv=none;
        d=google.com; s=arc-20260327;
        b=N8QuBb8lAB/7xyprzA+yZV2ITbZYFK6+xzIHyVfutpcVLduYSZxvqDKFchKOtKMT2U
         oNIjYNSee8l2HGFluphO4gZa6fhH6ZWyX4zPPIFARqv/bvob/qBqCnPstQJ29aAHht3O
         DI7QHa8nKSvusJ3tnCLbOWdceJZpjDjP7bIhrGLk4OvSjDkIm63oHcM0ClQWNoC57XlV
         djou2yP7cJoUaZ8I9GqON7/W8ymFo8tJ1Ok35N2zi75pTB/s4wPh8RQbxkRHi6eXtKXA
         e53cM88Ab+Sg+b63RBobuUL6oIjrsH+ITCv+erj7ijEYXOKh5ERJ6Ag0pw+fvgw9inKt
         /YKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
        fh=r7RDKyIUui4Pj0upej1b/uJ7t34jT6RE04sVgpzkKFY=;
        b=QVTgqhcjkAv35SYSArbxuOpPoRkSZ+vyCHiU2jvzCsbWqFsCQpmqE6qnRa9VecwoP8
         M1I3NBKH2uKB7/+KeyGem0nionwl0iwq41xMoLhGA6dI5ozqilxOIMBE26NNWj9jSIFh
         7n2N0xSuobrdjxslMOMmuwaotgoChzDt6TWL4L4HhbU0U7mXaIRPhPpRWJeKkTC/ioFd
         cCNssvnFHHslS7gOD4JcHoozDUQpDGqklsV8l8cmRtHTpH7LJJot/twKOJFHFsiV7w3n
         6/UwUfHmPM0+rCM9549r+bjK9MNE420ZY3vVBNuvDABN1fU3MhcGnWfS5H6pYCSym+Q+
         BaTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937278; x=1795542078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
        b=eaU0A7V8tK+Ilu+9z/UGX7RdDsNwdlMfm8BewaD1pnna0CsJoSPekMI1YyKDcd+2PM
         Ci4z4WsH11AjVamY7wuimDqeq2RsyRObrOmNsGLqE5Bbcm2OwhAcOKz0Zw8EFGaZwkvE
         Kvxt/DN+Qm6PBW86LQLwTsjY12gDzMtu3i6XDsupP65b+BY/F+CGDN6OAHFKj+79PJE6
         52RAx5BQ109CqEMK38/rqPd8TVOB8TPBUXrIsq0thwUTfzYqTXssXpNBZcUlxogES5Fd
         tj8W7phSOn4aj3lxd9MPoiIj3opd+oWFYcHGl7K8lhcxMmH/kBynADd90IkkpMjEPclP
         VfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937278; x=1795542078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tLP92r2JJjV3xpeaFg224oQEoqeTk5oJyjAMWmIK68=;
        b=Od1p2gkNg0A5ZFaVXUeKSupa103k/qAmack17ym6E5iwlmJEQzC91BDAtHaZqQ/Bom
         JjPaeS5l+qc5o6BKPduDHjtmz1AxwTCMFgyK1hxDn3BVW86Q+tBC9Izn+vkscKuJgDDm
         h6rZeUin/2w1maXCqheWImiq+cnpRmir+bk5l2uAwHe37wIaMOYVHz+v76yp8SPKCgH4
         Q+IPhh0PF2O0Q2zgIyvasxNv46SQQYKOfkwt6UJ4bYHDmLTry2wMAzv0mV0IJTEhqjG4
         Q6kUxIvoJJXq/VYPg9OpH8Ec4ue4f8jnC+0zkvZauwOnvCC8Z+3TVgjd3Z/1aKJAMjme
         bvCA==
X-Forwarded-Encrypted: i=1; AL+hErF58GGKb3t/CzX5iB5ZAqGIxNof+6JwhcpLduXyxvETbH8dWLGQjdxZ0xB0ULJJECq3HkkB5Yd5/8WthQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FetMIa5TdamJwmXIqd44B0tpiz01gDgrCRgi0Ommp2BXT8Rbb
	9ypUenZ0f/RFAeZWGTth9gZ2aFB4ZE+q9x9GUQ/IyUH83NDjmEfLlHLv+sJXh+N6N0ykukzXm6a
	gvbXfMqxUJW6fLaB5FxRq9R8LW7gkyTw=
X-Gm-Gg: AZFdTZc9QnjsqW4kmAcl7+UERwrIL+W2q85N5AOTqr9a1pjPSaotEe4oZAv1+wLmAm8
	0uaghsxMDJuNkNqw42FjCr+pkN5uj+5k2tbpmEEuld+vxs04cndVsKt+I8+GupmA79cs5FYKdt9
	depaxZJasYkABa9EM9zdWDRXcZhnv4tmXh/iHcBy9dulZVbanlaEYWRgTmYQVkAi12b2jG+jy+X
	Z6bGs1PAiDb9SP2Rk5j7ZvPtwradYycVXuCD7Ib47U0fRJjlLMcr1bFdDHVZq/QKQDhVfiKabaK
	56v/9NACxAISZUwddOJjFR7/HUNulNSjGqBhq62oZeF1KYHP3V//goEVknBlQmsZC+TVm4waWuQ
	tXcX6z8OeQJHjINUtJtGOxLXV026bX/bPyY49hCxnuTGWEerl5VGBym7ZsN/zcJSXkNyp2z1dqq
	X3xrDrfue2AsmD/aEf
X-Received: by 2002:a05:690e:814:20b0:67c:7317:de9a with SMTP id
 956f58d0204a3-67dd3fcbefamr95689d50.43.1794937278391; Tue, 17 Nov 2026
 09:41:18 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116173307.14169-1-volodymyrchapman@gmail.com> <avwmPmzohY3BCwrI@ashevche-desk.local>
In-Reply-To: <avwmPmzohY3BCwrI@ashevche-desk.local>
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Date: Tue, 17 Nov 2026 17:41:07 +0000
X-Gm-Features: Aa3M54p8jFkXOh9LYokUtAIAcha5-QcguW5hVoJ7lYeF7_rN5Mza3f_HdmKjLCY
Message-ID: <CAN1s30ri4XsBjt6sos9pcrhPb2wch-m7fQhYaMJKTWYZxFJedQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Don't cycle the PMC clock if
 its rate is correct
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> Besides below paragraphs (that I removed) needs to be in the comment bloc=
k and
> not in the commit message, please coordinate with other folk(s) who are d=
oing
> the same
>
> https://lore.kernel.org/b4-sent/20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef=
392ccf@gmail.com/

Thank you for the pointer, I had missed Manuel's patch. It is the same
change, which I found independently on a Bay Trail ThinkPad 10 with an
IMX175. Since his came first, I will drop mine and test his patch on the
ThinkPad 10 instead, replying on his thread with the results.

Thanks,
Volodymyr

On Tue, Nov 17, 2026 at 10:02=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Nov 16, 2026 at 05:33:06PM +0000, Volodymyr Chapman wrote:
> > atomisp_csi2_set_pmc_clk_freq() enables and disables the sensor's PMC
> > platform clock to be able to change its rate to 19.2 MHz. ACPI however
> > also controls this clock, through the CLKx power resource in the sensor=
's
> > _PR0, and caches the state of that power resource. When ACPI has alread=
y
> > turned the clock on, the clk_disable_unprepare() turns it off underneat=
h
> > ACPI. ACPI keeps considering the clock to be on, so a following power-o=
n
> > of the sensor does not run the clock's _ON method and the sensor does
> > not respond on I2C.
> >
> > On a Lenovo ThinkPad 10 (20C3) with an IMX175 rear sensor this makes th=
e
> > sensor's probe fail intermittently, depending on probe ordering:
> >
> >   atomisp-isp2 0000:00:03.0: Found supported sensor INTCF1A:00
> >   imx175 i2c-INTCF1A:00: Error reading reg 0x0000: -121
> >   imx175 i2c-INTCF1A:00: probe with driver imx175 failed with error -12=
1
> >
> > The effect of the clock cycle was also reproduced directly: with the
> > sensor powered through ACPI, a single clk_prepare_enable() +
> > clk_disable_unprepare() of pmc_plt_clk_0 makes it stop responding.
> >
> > Only cycle the clock to change its rate when it does not already run at
> > 19.2 MHz. The DSDT's CLKx._ON methods on this machine already select th=
e
> > 19.2 MHz PLL.
> >
> > As a side effect, a clock which the firmware left enabled at 19.2 MHz i=
s
> > no longer turned off by atomisp_csi2_set_pmc_clk_freq(). It is turned o=
ff
> > when ACPI powers down the sensor, e.g. when the sensor driver
> > runtime-suspends it.
>
> Besides below paragraphs (that I removed) needs to be in the comment bloc=
k and
> not in the commit message, please coordinate with other folk(s) who are d=
oing
> the same
>
> https://lore.kernel.org/b4-sent/20261112-atomisp-pmc-clk-rate-v1-1-d6b3ef=
392ccf@gmail.com/
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
