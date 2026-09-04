Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0B03ADB94
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516755; cv=none; b=ZSfbAGbhj3enJtmC/97Xr4fZCm7c14aBK0LD6iultZ/RxZJzHH1uy1ysPbYfuP+yZvO+X9oYwXAdp8Am4MsaKqFLS7IloSRq3EfDyTWPNCCeejIriRxbnsBXv2hzZBquFkIxfTS+6178ViyAmyMXVKpV2n1zhceEem4GhjEd3go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516755; c=relaxed/simple;
	bh=nXX66gUGFqX201p7p4GOcaFwzAYaMjfV6rBkSSWjCYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSGjB0uPvJrbLv7SVYSNvdHsEHMLciyJF5FV5gZpzVDj3peoNzE/OKlHglWCGKg2Y9YyvvRPQurkAFnw11a3CYUsvKRcZ15SHjKgZhm/Yal7hSrJEjqwrM3bvxhxCe3wRK0mlY6rX6NnM3JYMzyjNx1+MpCv1Ppx49tYMI06GIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLn3jSJb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLn3jSJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6411E1F00AC4
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788516754;
	bh=DZiVQdPz8dxpB3dwMtTDJdFm3Y0MEm9AzA/3UWR+g/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FLn3jSJbjLCIW2E3fBwcNaIPoR+BmBxmnjbQx41SHE3mWPk0oomwt8iMDmqA7YO+v
	 6UD/1zaVwEePus1PrqJgxmVvf25vwx8v2oc+Ca7nP+bm1rH7IPBtAL4qGMLshtq/OM
	 t91BneYqwPThfFyLkfzy3Z3dY0U20N6nDaq4hcdYhSMl+WilcKigwMCzlBgveNP4zO
	 EnHkO57/8Pj/e3Jp8MGVnysc8b9TRuSJ8wNQIammkZhQ4k4T/rUSx0MjrefD8efC3z
	 E+ZQscTnM73DoD+JceVLc4U0IjwK8bGuAObnp/auJ8RiDBM9g9WVEU4IznRpwaPAaP
	 /BCddBcXfPGCg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso2672384e87.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 03:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1U78LL56EutalQp8BXCp5tdQiHToaS+WcxxaTfgnRH5QKOedo9alfGg3F9mT2L9oG73VZaVuCkro/uQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m+wMvErJKnJMSUnHsTmhsWSqc1qBipIJmICASGNsOB9MoZOAKp
	D848p6USQVpfWCVFx3I+FOdsVR0ZXVhDyQvITcWIjqrGw4mB80lC9kJorZ/uUMZqNeNpaOwkaFx
	zMGqScaUZOMnOxEvALGQNtKHodtYJVuk=
X-Received: by 2002:a05:6512:3e07:b0:5b6:10bc:dc46 with SMTP id
 2adb3069b0e04-5b610bcdcefmr1564717e87.29.1788516753090; Fri, 04 Sep 2026
 03:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903025526.2657105-1-dayou5941@163.com>
In-Reply-To: <20260903025526.2657105-1-dayou5941@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 12:12:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLnVf8-o2XBWonLStH33+GfkFCbqORisM9JMZOhhbNxX6w@mail.gmail.com>
X-Gm-Features: AcwNN1UPiVGn7JiBVYI5u-IeqklJZ6ZcQVZ_E9TL_vtcDiuEQ6YqTdwLiRy5Rss
Message-ID: <CAD++jLnVf8-o2XBWonLStH33+GfkFCbqORisM9JMZOhhbNxX6w@mail.gmail.com>
Subject: Re: [PATCH] media: mali-c55: free IRQ when remove while runtime-active
To: Li Youhong <dayou5941@163.com>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, 
	Li Youhong <liyouhong@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 4:55=E2=80=AFAM Li Youhong <dayou5941@163.com> wrote=
:

> @@ -861,6 +861,8 @@ static void mali_c55_remove(struct platform_device *p=
dev)
>
>         mali_c55_media_frameworks_deinit(mali_c55);
>         if (!pm_runtime_suspended(&pdev->dev)) {
> +               if (irq_has_action(mali_c55->irqnum))
> +                       free_irq(mali_c55->irqnum, &pdev->dev);
>                 __mali_c55_power_off(mali_c55);
>                 pm_runtime_set_suspended(&pdev->dev);

This whole runtime suspend/resume looks a bit odd to me.

Normally you keep the IRQ requested perpetually in a driver,
this looks like some really odd workaround to explicitly deal with
wakeup capable/non-wakeup capable IRQs.

I tried to see if this was addressed during review of the driver
and whether there was a reason for doing things like this.
But there are too many threads on lore.

I think the proper fix is to keep the IRQ requested during
suspend/resume and *not* mark it as wakeup-source; in the
device tree for the SoC.

Support code is needed in the driver, something along the line
of this:

suspend():
                if (device_may_wakeup(dev))
                        enable_irq_wake(irq);

resume():
                if (device_may_wakeup(dev))
                        disable_irq_wake(irq);

Do you want to make the patch or should I?

Yours,
Linus Walleij
