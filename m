Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823984;
	b=eggZp4OltJwsFiEJF9qrp4MuCrPLAVhmnQwtQpTpfUQD2BG7lr/3WttJ0uUTs1nCGAv7
	 7Z/QQuh1uy01/Vk/pPVPOxFXf4JZc8tSuLG8bNzXo04Sq7weQbKJw6QqFyqnm+CDd7fYH
	 RLTkn3mi/iZNbaThBkTBonNIPHuFTjrhwKEXsk+RKncWUwLNHErTV9eu6Ofoj7jbEtYhs
	 OHB+Xvq9ua1ImIEPrLCVR57pUDiVH+0pPI6QIciYoKtdOwNwfjdcZkST5CtB7cV6Kgvik
	 z25/a76otiUkILi+PdPNeQZL0BjOrKJoAno3Wjy69vlwiZeY9rTXcaH0D/PiCqpyD7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823984;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YSdYiyUlnvFWz8iXQcw0X7fJk/Cp2zi+hAjZsocDatk=;
	b=yIc9BcldMZ0i4Atmmz3PeNQGKf3aMAUc+2RP0pHOEbyoOXWoJ3mpGQ97bS8qU+86ERTA
	 MXHurjy3MLoD2LyqVdgGfGLD6KhsJVpfczXod398oBBVxYJE+jZn/I/wU0pMtfddajvYv
	 Hj0+ehCpTwPgC+XfYiHvSskNPPSCq84BmmPNkTVKU+Dkcjlg5kZSQseAUh9/cWQqCTjwJ
	 hNbCY1dXV7bpYRbmY1VJIjkyPb/erYSuaCZefR+sClTwC+8dUs9a3Z/6CuaL8ZuTgoTyV
	 GbrbTfToZllRCtujPr+vHL45aLOdTxfmsQPKwmr3bwh62SVTEbQxGHaBMUkGPQrYJwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmQNe7Yp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8390C606A330
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FmQNe7Yp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6E61F00934
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823984;
	bh=YSdYiyUlnvFWz8iXQcw0X7fJk/Cp2zi+hAjZsocDatk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FmQNe7YpB8jS2dI5tt39gzE4HeTglXC+cKcAuS9svkqaCpPF4CDFtDgedFu/RtbRS
	 BlrA3WsB9d0H+euYkbeCgjqB4qE9WIV6+uiHQP/eIxs70yiYltbni9/QMspsqylrC0
	 Tm33I0T5N6gigsm3TAP3ILpjhdX5UaNbEMdlGtRldTdCxGyS1dsEA2H80pApzAhbKu
	 GvKam8xPbMWialCAgmqUZlKELBmsa3WvzVmm9J8eOrR7XXDXzfe4nw6tjwRxD6i215
	 46bZha0sYMm13aN3Gd/BSuW2Y/rR2BjWe3JmBhONwy3IZAOXJ6s9T4kUaJyIEDN1MJ
	 yBa8JIcUKPySA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c151178f0cso3098252e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:13:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE1twbc5hfDr04FseTdvxznCVi5LbolVXKW2EuZT+UuLf44X3DhJr2mWdRnxjgnlec4RHc9sURoL2O78g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/f14o91+dbHZwNPUNUepmtWRV2jYb+QlPuQVe8QsUP5XjuErl5
	d5V/lI0YLCaRM+SZDPC04KiU5tRU+73LnbhSVRICHlxwBGvDAwBosOoesYVROTcyKoRrxxEHxNY
	ig+asq3mauIVLk4aA6Pe2ZG1mmFJo99E=
X-Received: by 2002:a05:6512:3182:b0:5c1:5bcc:bf0e with SMTP id
 2adb3069b0e04-5c170b1c308mr3696720e87.14.1794823983027; Mon, 16 Nov 2026
 02:13:03 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116014823.3132576-1-jic23@kernel.org> <20261116014823.3132576-19-jic23@kernel.org>
In-Reply-To: <20261116014823.3132576-19-jic23@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 11:12:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKz41LeMGJjGtsuzB69TfZQhDy0grFKxd3vPh-tsz3Aw@mail.gmail.com>
X-Gm-Features: Aa3M54qobcsJYrMCzCZfCjAScyuFW8KV_4L3-AZSbH3okAaKcNbd9qDJaNqjzTY
Message-ID: <CAD++jLnKz41LeMGJjGtsuzB69TfZQhDy0grFKxd3vPh-tsz3Aw@mail.gmail.com>
Subject: Re: [PATCH 18/35] iio: accel: bma180: use default_trigger
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Gustavo Silva <gustavograzs@gmail.com>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, 
	Ramona Alexandra Nechita <ramona.nechita@analog.com>, Tomislav Denis <tomislav.denis@avl.com>, 
	Jorge Marques <jorge.marques@analog.com>, Petre Rodan <petre.rodan@subdimension.ro>, 
	Dan Robertson <dan@dlrobertson.com>, Jianping Shen <Jianping.Shen@de.bosch.com>, 
	Gwendal Grignou <gwendal@chromium.org>, Maxwell Doose <maxwell@maxwelld.cc>, 
	Tomasz Duszynski <tduszyns@gmail.com>, Esben Haabendal <esben@geanix.com>, 
	Narcisa Ana Maria Vasile <narcisaanamaria12@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Vasileios Amoiridis <vassilisamir@gmail.com>, Abhash Jha <abhashkumarjha123@gmail.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Nishant Malpani <nish.malpani25@gmail.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 2:50=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:

> From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>
> Set indio_dev->default_trigger rather than taking a reference to the
> trigger in probe(). The IIO core now takes the reference during
> iio_device_register(), so it is not leaked if probe() fails after
> the trigger is set up. As well as closing that leak, this also makes
> the ordering a lot less fragile.
>
> Fixes: 0668a4e4d297 ("iio: accel: bma180: Fix indio_dev->trig assignment"=
)
> Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
