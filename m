Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124090;
	b=oT4lOAAk8b57Yo8jxeXAZXF/ZGge1PMmWrmyWLKuB/mrRZh+GV1oNM6AS4RfWNK8ARCt
	 NDIU9+ELBHalMSaTQSpt5BmNhB0hGQwkmu2ad7CAhBVqFKJx+ylSS3WQNampB4NG1Agft
	 Kxo3wX1R330SNcbMmgkIVWyw1zS1oIEDRo+A/s5D5SxznJQJFy7tOYuZq7X1ZRwiFeCtm
	 3htSkZih7/uWv9whNQqmguA7b2RBqpVxxn5d3aLMx44WsV5/pU9dfLpQW8qCn+xAskPsU
	 dZVECrT42kj4K1manCvW66TgxVoW2C90Lov1SX3RPAc5SjsBKv9aNsIili+Nn+jc2aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124090;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CmaFIcWmgtXdEMcSvFzwqtYSPrJWkBbMkvu/8+xigKU=;
	b=wYdwGFPKb/4WJjiWD2HIg25PLxNXhJe4RXsm2DkwiqYaaAI5LbmoxtfoItvI10zW2A3+
	 dd1AntnbOFqXNA8Yauxx5Eol5/fslIgwQeUOjmHvkVnlGLb3nEp+G8jLJC8BJrqLlLLzR
	 h+0ucrs2XCJ3Y38RM1pdsE++ru1t/lspCZKoPcffDDcI4E/qT8+qWwb7uWFNVxoYp4h/p
	 XYZggrJREbD+UNi5uVa+K7E7JoGdyQZlucRaPS2o6ENwT9taOwq5tlZimRlqyxgAAmL/j
	 og2/hQQBoRCF7ItR6AQr9fW6HKvcU4uwalZ7EO0G+OuI3eKGuevBWwRLnHCPA3TtUKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mn/12WVd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AEE606A31E
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mn/12WVd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E2A1F031E6
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793124089;
	bh=CmaFIcWmgtXdEMcSvFzwqtYSPrJWkBbMkvu/8+xigKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mn/12WVdLXfCzXnn1StrpfTD9e6P8OKfUnmtWzsJ6PKRUEo5uag1Ff41fWcldOiXv
	 RBpkqH8U9OMYFEoyhMNrdvePPx+4LPnRJa9TeQoyuqXujTRpAbf10A9+XB1b6cN85h
	 wr0tYNxwHdzU5urjAisZgf+hyt/pmYBAEu5An2YnJLGpSpPsgWju2LEn7l089mBEJE
	 rA95g5SRzrLhQIcE1xSSKEMVUkuCyuHixeNwmJN4H7dtJhZ844ku05hPe0a40s0L2c
	 m1FpkT/rhJeH0KVbFbuk9fGaC5clCVVWABA2MjaT9F5alEfblV0R1+o5GOMia+rIhj
	 v2DLKsKj67HyQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso286362e87.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:01:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByFO8nYjDnKqjHbumOdW2KhzDbX89QObjRRzMEL501QI94WT4SrsvLpmq2qomjeBKdEk7irCfwGrqTJMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkwISNAFJ9GrLDI4l/irQxwyOPwe4iPLjMrDpA7DMrypbTI9Gb
	TM+Q+jbuBLkY6IBggrZrxAuXSgpdfbK6kHAw03UNETm+A2f84BhDI8ct7vA9zjZyGzK2KKQtkQq
	lKYSqfW04CU6MI52pUovZJzQiHH1OCww=
X-Received: by 2002:a05:6512:39c8:b0:5bf:c0ea:5a1c with SMTP id
 2adb3069b0e04-5bfcad1ee03mr72369e87.24.1793124088049; Tue, 27 Oct 2026
 11:01:28 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed> <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
 <atXol9eFjLKxgTpg@zed>
In-Reply-To: <atXol9eFjLKxgTpg@zed>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 19:01:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
X-Gm-Features: AclHuK8HhU9uKCu44e9RLxqd9VqlIg9aSaojLATRz5xTKDcE3D8BqHGd4v82YT0
Message-ID: <CAD++jLm5iRKbb6=ZY0r1q_bb-zO3DAe3a7MxdDbpBT3ZU6_z_w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo, and Prabhakar,

thanks a lot for your help testing this!

On Mon, Oct 19, 2026 at 12:23=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> > +       /*
> > +        * Allow the ISP's 2500-vclk reset recovery time.
> > +        * 200 us cover the RZ/V2H's documented minimum of 20 MHz.
> > +        */
> > +       usleep_range(200, 300);
> > +
> >         /* Use "software only" context management. */
> >         mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
> >                              MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0x0=
1);
> >
> > When we now retrieve the reset and assert it, it matters that
> > we give the hardware time to recover. (If this works I will make
> > a separate patch.)
>
> Unfortunately this doesn't help

Since it is clear that:

1, The clock and/or reset ordering matters.

2. The device tree order does not in any way impiy any sequencing
  or such sematics. (I.e. we can't really change these DTS patches)

3. The bulk APIs for clocks and resets have unpredictable ordering
  (clocks will process from left to right and resets in the reverse order..=
.)

I have concluded we need to request each clock and reset explicitly
in the driver and sequence them in code.

I sent a new patch series with two additional patches to explicitly
order clock and reset enblement.

See if this helps and how it looks... Try dropping the reset patch
because I suspect that ordering to not be as important as the
clock ordering but I could be wrong.

Yours,
Linus Walleij
