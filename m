Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392696;
	b=HYe+5qNj6g52mfBb2JUk8bnfa5eVSbIOTWWeVE4TeVvlp4jTFxpFBEVyDApdeTaoDG1p
	 wltrQk13sTxG184PyCuo3234LmxETOY/n2CumPVcM4kCpqfS4uWrDhA/CSotOJS42EOMa
	 HQijnhhaSfjdVwa6xqVTPadEwk5hIA8TiM4AvpnUHhBxCgkIlty08MchqsCSEMCiuHh2N
	 jTVw2ITSbjH2gTTrL5qiHC54/XNRvR01gzq61uBXynBqT2N2bnF6ebRZJ7hf/qIdWua1E
	 wF6aqLiDDQ7TI+YqygLNUF/LcZ70ZMw/J3+UkX/Chm1eGX9UR6RHzRqxXQms4+Zf8Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392696;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pzL1OdNmy4Sn4HuW7URSYpC45FZ9iIyQh9nhTGJnRkM=;
	b=3RjcljCfZ7g4DQAJBgOmLWRGlIO0faj5Cr7Lo/DO0yImMgcYEnbrSUnx755bzpp1nMlL
	 EOzSQo+yeqtAcaKqXaWYDD3jk5tV6GxffOjIidSG0NfLRSa4/tdaNPpNGIXRg70uzNgnq
	 7Us0ky/CELNHZpyckOBm32zc0CE18LhxBkfYcgkTL1knQqB/RU+3fsmzXBBUNM5nqr9vU
	 mdvrAmKkF6Y3XC6tV4iNRvjrUBEwl07kTZqY4DjW0XyzYaWnBB4MChr4XngNzLZrtl1rH
	 x4viO7Bja/UTDkX+rRfPz6+27Xwg4HEikD9kAxf+17Y/p/5ki1JJHRAT836+xNKyXpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMZ+2RYj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE15D606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 00:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZMZ+2RYj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112381F000EB
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795392696;
	bh=pzL1OdNmy4Sn4HuW7URSYpC45FZ9iIyQh9nhTGJnRkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZMZ+2RYjViG2bmZiZGIipjwncVIeQyEHxkeGVgpmu22W7CUuIX0cycyklNR/CZaH8
	 m6f2i1YqfBuIEb2bdZrvMtTbc5YwxvhgYBMZz474HCj4VJ6M5zYYTYj4yloOlz07vl
	 TNjs8Us/HR2AOVtrtXEKS8MVZizK0oYiiP5mziUQ7qKadNIFQo81I1c9aKwALhYLJm
	 aMVHWv1hV9oGaBZX5YQfQcFaAOi2zXwu7oh7qulZo+DbiiD45AQsN31YrdjUStWf4t
	 Bwpfak1Ro35QHZVD4lJF1H9Ck0RoZPDePY6HxAAxP2WEnL4hkSLWsazJzZtSpkrDFW
	 tV6EYfgs0+xYw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso4011601e87.3
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 16:11:35 -0800 (PST)
X-Gm-Message-State: APuU4Z/fPB+/6xTIlPt+S4k2hC1BdZ/lTVpuSEwZrYQKttJhxO99SYkw
	j1HDr3kFLtVarNGvdcmWzKq+xrBFrVI0QGPHzgxLsJgikpN/4l2DqYm9m5dNKGcSx29josP60aX
	lGwrLmrtSsUil9l4u/mmplUJIl3PyRVc=
X-Received: by 2002:a05:6512:1391:b0:5c1:5a23:ec04 with SMTP id
 2adb3069b0e04-5c1bc85b7b6mr2662412e87.44.1795392694735; Sun, 22 Nov 2026
 16:11:34 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
In-Reply-To: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 01:11:22 +0100
X-Gmail-Original-Message-ID: <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>
X-Gm-Features: Aa3M54rrgEQGFcFfn8yM1_2n_V2A0OA5mXHg_mnx-6IzawOxF5-bkLruJCdf87k
Message-ID: <CAD++jLndZTg0tk+GRo3aZrQ=0rVL+5CA=Swi7_KKQr=iBDs6Vg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
To: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:53=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:

> Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect the=
ir
> video endpoints, and enable both blocks on the RZ/V2H EVK.

Gentle ping on this series, everyone happy?

I guess the DTS patches go to the
renesas tree and Jacopo picks up the dt-bindings and the driver fix?

Yours,
Linus Walleij
