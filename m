Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DC33AFD0C
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791238476; cv=none; b=uaZB5obbyzET4MFGHZ6DcOm5OBShLDLvuOxYetXvmEjp5nSEIssR+llfN81kVJB4dFp7EqFSt79zYthY6TYxzx3TWhgZ58P91KS9EOyOlPII7Dw+v++8i+GKN/ODYxtIqwWBhHKIQPmFbzokQa1C7WCliUxPM57QoO7g7w6xnC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791238476; c=relaxed/simple;
	bh=3kh/y7b7kjRrc0W1s/odQvJJEQlic9f37fMtluWrsX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDZSW+JZxjbXWd9NqrqlOb/34h3TSGMPxrDob0Azz7pX9lI0YMXrzxgUMP9iZ2BSNHpfbFalZHB/u/mr2pidpBU9YY7a+VGPSLT1bYgJjJC2apKOTCAKOPXeq82uJHrzs5uW5LYG3zJh8G+Dbck/4B5dD0lwW+gwi4ITdg2MTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQQfI7/L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQQfI7/L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054611F008A0
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 22:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791238475;
	bh=3kh/y7b7kjRrc0W1s/odQvJJEQlic9f37fMtluWrsX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BQQfI7/Lq1tc7TO7ZAWrEx0lX2+ZXJbWfASs+ohX1kjDW6ctI8r5QaL6LKte/72Gz
	 eqoIaTL0J8nYhBFOuUrBf5JgdwTdtVhXP/KfCwUsMY0/4Cx+thIx7VoHnqcQC9druC
	 jo54jMSl9pCw8+LJe5Yew5CV7TpV4WekRQOMw5r2cAG9mndNso+Rrl5tgsFLIf7RZG
	 R32i/bXDV0X+A6pFQhTy7xkEbKecgJIPVIxZq65qsiOdjO9dRj8Hid3knRmyqkFEkk
	 uE5GDg9d4o/6M/D4cwqUrfJgKYcuNtgwv66soTjgqjOcBCWHJM4xS1VmbQBGDRj3SR
	 0pHjljxekdRmg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b2b92065ffso942475e87.1
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 15:14:34 -0700 (PDT)
X-Gm-Message-State: AFq9FYLUjvrOMOJ5d66UlGSPyn7YKsdObraKaWZCRq0S71Vvnv/E6wa6
	mj3hgUtCB0AVXCB9PbvwqMvtNRLJ3+uPlW6wuuDS1eygiTRSV6Hn6iQ7nSETIsF3V92u5ZEnVef
	E1bOPWDOiDWe1CZf0zj9YBezXqbnzr+g=
X-Received: by 2002:a05:6512:31c6:b0:5ba:3782:d524 with SMTP id
 2adb3069b0e04-5bcb54376b3mr3263153e87.23.1791238473706; Mon, 05 Oct 2026
 15:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 00:14:21 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
X-Gm-Features: AclHuK86agYs2DVJkwb4V_l0VVjlnzhx3tLxdnlBI5x5AiiGFxy5kqV8Sor3B-w
Message-ID: <CAD++jL=tRpv_uX8daZqK5+h_dTiUxQBYyNM2-Lb8L6n4azyfHw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert/Magnus,

On Mon, Sep 28, 2026 at 2:21=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect the=
ir
> video endpoints, and enable both blocks on the RZ/V2H EVK.
>
> After these patches, and enabling the right Linux drivers, we get
> this in the console:
> mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0
>
> This was done in order to enable booting mainline with mainline
> device trees.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Rob ACKed the final DT bindings on this v3 patch series so maybe you
can apply it?

Yours,
Linus Walleij
