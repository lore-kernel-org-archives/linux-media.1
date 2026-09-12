Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4930345CCE
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227867; cv=pass; b=HzN+G1vzK5ppLr8cS+VuaNHv7vMNvbnGLXUl9QXDogmOz6Gp7I2DyU8yQFlQPSeQoAr3fgYU5MILG4L5IUb22NDvpKcHE4iU6FUNoesfnn0qJrVqnF/kyu3zIIvj0+SEKJAEYwypZw1REPzJlf+54N2FBNfsuhhf3hd8YwEDqpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227867; c=relaxed/simple;
	bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvHIadqql/3JPA9kgYQctKgAddxWNwk7b74rti7ChvK6C4vLm5CyvJV3ljuAKXOS7q7TX+UxTbnUG8ws/a3ldrdVI4QdjTFcupwWcLy5Yoog72FAHTjzvMq1ZlaTSCGk/lfwWET95lBGOocCInVvZRKClKAshb+eXMy/U57/eKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLXHO16v; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLXHO16v"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so998773e87.3
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 08:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789227864; cv=none;
        d=google.com; s=arc-20260327;
        b=CDHVD2FOFeyUxWwoCzQaf9+6I4Eeyi7QCy9ihMmV9ESSZm63HVt3Td7D5nEWfsJR8H
         3CNI6oi9+W42qMvi5nZGQeub7UXZm3HkGO+ZsrnFvlNibapmGWwnDJX9Qg2hgIjaXOGH
         eiSpEON7VsKQpM6bu4XSiYfbe3aj1ZK6gW94/UdN7gAZ2fEm9rcjhYiOVfYPrQNNxbRr
         5fJ8Hp/sT61YZpuZ400lCQzoHsTYaZKkVMCZMcgh/41/VkpwvrVrWQnfi60u++7FDhdk
         L9mYDbDJI5lE1XURIskq+G+tTvd7pikb3Cclu7x5CzbIgm7PjFokCtmDY8FkgGGr8WOu
         p4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
        fh=Utb8u0wrCHuyK6EDgDFrk6Lm6YVoyWbFMPQ3Qp7GJMo=;
        b=Md8v26E+VgiECTA8V2W0uK0HOGi3YoCO9vu+Xm8lIs3SRYul4eDcPAXl49DTA+hs0C
         PV1njn0YW0lQGs73abC744ceaA65gPsbhT/AgPbi+DN3FPuXzY7ePNVduhOr6CXyEyFI
         +J9UrfUx7+9OQ/lspjxyE9VcT2jr2jUm8joNjVdX6Mdy4cukveXo0pWQSAbosHSBbe/C
         fzRXTXqR/Xb36iKZTH2huKvo4UK2zWrNJm013A+x1tpdWlxDgBgfv2iBf7ugrjXXcX+k
         i/yc/dHsx38emiNmnbUbyYO+ddD+bmLG7ic85t+0ePX/q7YGZS/LKZgEdszzaxPx0GUo
         O/Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789227864; x=1789832664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
        b=lLXHO16vmEipU3iTCm2IB0johNZws/1Jy5hLxCsWZzWOBx4dnS0xu43zl7h+0Qg01U
         wpFCOWQ+ZpNpkymg0kkU2S9VZrip/EuW495N9HwAPOVZO2C4imK1Q4y3tU1DlsOJh9oC
         FlHFK1rM2WaO6gK4ndIwwT9tq0FJxqEyUEKwkl1zQ2A1Bb0l3vtdjQ++86bfRJuae60K
         7/12BdmLzRB1csady1zUwaRCK8L15zWWBlWPIq/r1xMNxWpkdYcp780O1+E+erjInT93
         fl36N0GlCb4OcvDsFFd0IaCSJKNJu3QrrVhI89lsU5btBAsOakpQrAggtCM99I+qTmpF
         hmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227864; x=1789832664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
        b=pvU88PdS0ldLRdaOROPBnc9q0hgV4HqzFI4dZpUxdM6xoJfUUmV9r2k+y3ExnUE3/w
         GMviprORZHNJLkrBZSsCyeRLMf2czeUUEBYRKiWmMoyOS2K7uLbkNtT/dpgEFlco7Wze
         bB/FwVDT9hler3g6Yk0uuERleJ8uGEfQlL50vAfEF10fM1kYF2RAfsg8S95BaQY4rYYc
         JcHAZS1FL/mfPFNonZXiRA1T9x9XNlzvudBMbMCyNGUQgmUytWhQm316BD6+Upgw7dYY
         GusEhuCRVIVktMU6raWWtudDQtYAg175VknI584uHtgRJYmyeUcvVig7FK2RLp8cpUrp
         yyKg==
X-Forwarded-Encrypted: i=1; AKwUvBzPqGgU3SimFvMO/1Ke9jtGZOb432z/Q4p4aYWdZBxr8H3aKcWy5gPsGoD079KasljhFWZ7frwE/udiWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nvHl95EPARi3jZWHhc2DkhrgG2upNlbpj/NgSFjVV/D3zPltvt
	5GyFS/qQQiaA+E6d4GYRWKUDIanQaujudJG+Kg1o/kI8WtMDJJl/mlk3Q3QJJwAfNSGjXuWdpKJ
	xga22BT9Wt2Es/rvEupXyHhrPZvh41eLZFJuKxYw=
X-Gm-Gg: AYBFou21WcNExaYSnenI3XRaU869mnNBvDFY2w26hB6ZfxPcyaGw8HP+U7GW3+BiRV9
	QkxpOFSuowMk9lp/oow+vBBXydA49koRtNgSHTRJB+zVk8+/aUSiicNwxAtXa1FFs3HJnn3Sq2l
	xOlLgBXzmkUHxbMknoaiezRlVPJF52rLPCTBzkmmHqNiPvstvWsBWMelTQMgaKU9tHEp9w8crEK
	G/qWaV1zql+sr4XtyXOa0ALWk8N9wbTCMGpO3udiZ+sSx31A1zjD35LtYE+YUe4waiDnM4NQq/N
	I7a3tQRhgqUSWs0riWaZ74IlQLlCmV6ndltYd3gueWi31kqphILmsCAw1A==
X-Received: by 2002:a05:6512:318d:b0:5b6:423:7f0f with SMTP id
 2adb3069b0e04-5b8a0339cffmr4190697e87.29.1789227863611; Sat, 12 Sep 2026
 08:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912010936.12832-1-ricardobarbosamscg@gmail.com> <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com>
In-Reply-To: <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com>
From: ricardo barbosa <ricardobarbosamscg@gmail.com>
Date: Sat, 12 Sep 2026 11:44:12 -0400
X-Gm-Features: AcwNN1XRfFcNPuNAyFywkEbj9gVFTQEx20WFI7Say6LdEin3F6clCr5L4UmHlTQ
Message-ID: <CAOOzAW3+ySKGkSETW7knDLb7=aMTsgpJ4RSmRFcMjCb+gvaJuQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove duplicate blank line
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, Andy.

As a beginner taking the LFD103 course, my main goal with this
submission was simply to validate the workflow and git send-email
toolchain with a zero-risk change.

I'll look into more meaningful tasks for my next patch.

On Sat, Sep 12, 2026 at 8:36=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Sep 12, 2026 at 4:11=E2=80=AFAM Ricardo Barbosa Dias
> <ricardobarbosamscg@gmail.com> wrote:
> >
> > Remove an unnecessary extra blank line to clean up code style
> > and fix checkpatch CHECK warning.
>
> This is the lowest possible priority patch, if even considered. If you
> want to clean up this driver, there are more interesting tasks.
>
> --
> With Best Regards,
> Andy Shevchenko
