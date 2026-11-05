Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866069;
	b=Sk2r9ysimsdY+JQNaqICWRH57jsDPUmwTYzf9kXtMQH/7qe+hsM/Z0B+1wPLA87AY/ps
	 XU14BVcezNrJyDWABYn5AtB1za1nfiZ8AZXSnWifa91mPH87wwyzxYUVym2ptBZsKzrAn
	 3TwazdWKsFo/1wNZ+/Lbf1x1msx+mUXvqCu7jqGM8aknsdBZ2OkXzXLCGA7jn6B49CztI
	 ctHTIKZRbV1+67fEpqtF4OhOXIsARjTCC0CdwtVHXG7yoCOHlK4dchuyVPZBo9rQMozh5
	 r9lfFGXDY66zp8X3hERDbXekrXDdSy0r1hCfdXXPLT4lyC2TpDo7IxNge8AVLGzwYdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866069;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=oWw6g0jthWHcK00OlOBDH8ZErsDVIEACI1zXshUCIAE=;
	b=QZX/sPOEQTLah0ndGcBqwGFee1Rgvw1tXyJk0c8hHPgTPRdeNDPOOTdXbNz7Tn9XnmB2
	 AIlwpkO26k9fEr7vdWO68d9dBTnoG+9sGpaXYgOhG+u/p57rlTJda+7CsNb7vIHLlTVtE
	 71pIueurDJ3akn3qtODB4VacSdmSqZcMSQ5nbSbElIjM6twwvjyunoda5Ilvrj+p5xIDa
	 Eybk7K6uJavEeDTm4o6RYB2wsKAwFqSpZdyH1MDy/gw2jNKT0J5FGTEOdbViXjDuyKO5C
	 7fC2aPNlfR4q+BHdQ+2IKlG5Dma9oNaRZ9C7OTZBKKF3PWZtP/hR4Ec41by/03I+uwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P/ndCYbh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EFA606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P/ndCYbh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1DF1F00A16
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 08:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866068;
	bh=oWw6g0jthWHcK00OlOBDH8ZErsDVIEACI1zXshUCIAE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P/ndCYbhdbtqEun79Vph2rce3/JXPYFPOBFypmgdRmbCszIrnzkMWkiw3a2VNF0Nd
	 cPXdWft+WQKKbBHb7+OmRC3nFUZkwE97wqAGLD49/FUoJz/1cEGl47H+LnJWkjinli
	 VK1Q/y73ecKB7dkc7xuvdfKYO4zs5nERoEL1sH+5PpSjkus1YHrIYqTosGrm7b/gmm
	 ZlH3TDYZFtkAP8tCHwsx1JjYBFAGx2bUrc7V0Te7RfMhfiEZ+/7xf8M0aZkJ6qJh1S
	 i0YQ9haF1bM3TUOOZwAhqttK0EsRnL19gfHV3rljq1yuwsvS2KLG1N17kZ4AYSPwqW
	 new6XlGg+GP0Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso1277098e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 00:07:48 -0800 (PST)
X-Gm-Message-State: APuU4Z9wLc2vru1kw/4uCZMnn4TMfLkn0tNw5S517v/W4DaJmMHitA28
	AzX7Ob9yvrDIFL0JFhZNeJ6YkJcFOGj60i/jjqJLV4064664XwmIxbniMqz0rqfmn7OEpbwwkvZ
	KUXu8yxGyt/A0a6/mgQ1EcVAk2TnT9bI=
X-Received: by 2002:a05:6512:3d16:b0:5bf:c12b:b2a4 with SMTP id
 2adb3069b0e04-5bfd9576cc4mr6718239e87.42.1793866067307; Thu, 05 Nov 2026
 00:07:47 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-mali-c55-irq-supend-resume-v2-1-759b3f5b2cfd@kernel.org>
In-Reply-To: <20261027-mali-c55-irq-supend-resume-v2-1-759b3f5b2cfd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:07:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Tf=DJxVG15=83iM3912rPXX5Jc3vxVL3fEH2vBPMrxA@mail.gmail.com>
X-Gm-Features: AclHuK_M9jjzg90MLmcasn5lZzRt4G7YZKrjtv0uopGRfNmYQDYOv9JvKa_9M2w
Message-ID: <CAD++jL=Tf=DJxVG15=83iM3912rPXX5Jc3vxVL3fEH2vBPMrxA@mail.gmail.com>
Subject: Re: [PATCH v2] media: mali-c55: Keep IRQ requested during suspend
To: Li Youhong <dayou5941@163.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Nayden Kanchev <nayden.kanchev@arm.com>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 3:08=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> The interrupt is currently freed on every runtime suspend and requested
> again on runtime resume. Apart from tying interrupt ownership to the
> power state rather than to the driver lifetime, this leaves remove to
> guess whether an action is installed for the IRQ.
>
> Request the interrupt once during probe and free it during remove.
>
> Disable and synchronize the IRQ before powering the ISP off, and enable
> it only after a successful power-on.
>
> Hold a runtime PM reference during probe until the IRQ is installed,
> and stop runtime PM and drain the IRQ before unregistering the media
> entities during remove.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Linus Walleij <linusw@kernel.org>

The PW bot replies:

Thanks for your patches! Unfortunately the Media CI robot detected some
issues:

# Test virtme64:test-virtme
Error running test. Final Summary not found

I take it that the PW bot has issues with itself (don't we all).
So not my problem?

Jacopo, do you think we can apply this?

Yours,
Linus Walleij
