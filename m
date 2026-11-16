Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823912;
	b=0genviwKxZjT9WRAcsmnKt+FiwwSmPRGrM6rIfkB5DU9yIU8JstjdxPYqSMgvxI/MIXg
	 zIMoRyWIzYJMBO851jIdLnlL82bK8R1UWouKjIOPV8CvBKpLCQKFAnUchhy1WBcLL6/Zi
	 4nksYe9Xs0PO/0EFT9taKrS/NFJjKs6vXBcC36/h83TuJJojuZD6Lm/5xTXdy7ic+tA3h
	 ZBAHytu59KWsHg6pSuOl5hsr69cioPNIjJftZzCvrk6vaqLADUAzh0+4mafwwbrzGps41
	 wY1dDdzOaf70kVrgdMTFO4Jsshn6jGuhBnaHVzCSye6i1t+BPg/3FBXMDKRMCTjHo3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823912;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SODJw/03GIUBoiP4URwheuX1oRgXjJe+RqcbVKlni/I=;
	b=YIdpjZwmckJvTMvkTOkZXBXGNO9Rwn2p8qr2gIJ5NXjgfjrZCdEo8SZhRhexJ7RNCcRd
	 k4yq3vfXJixFKHkXRMh1GCphHSMYvXEEFBoXMv8Pq+Fmyl+G+uVsUxFWHuzFr5drbhMZ1
	 p968CuJOmsQfIzp9DabTrE5I0/TnNe5I4MZuWWG7xdSmjlkF93DFu3ofVUgFuY14aRDRp
	 hpnO3sB3/ZOxL+WyzowQzJo3SXMJT5Etn4dtQi0v/fQaYXOL7CGdo8QuThxxh5qyEy2ch
	 bPGAa/kMQnTuIpdbBOqKTDc4NklOwibOyrJubLvQ0CeANhoscI/EQ2hhmnZuvTERfiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECaA0zMa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A8A606A329
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECaA0zMa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80A51F000C8
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823912;
	bh=SODJw/03GIUBoiP4URwheuX1oRgXjJe+RqcbVKlni/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ECaA0zMaBeDAmPd0Py0eZ1LpG0GXdNNul8jhiLcKeay3XmJSjnMzOIfYsHBV7A5ML
	 7ylh7BTnpGQOqhNoKcvITA+eMtVZsTdhTmxNnnDQpU4u5pGss6lLMI8QyWbKIBp+rN
	 ABWunMgB40akPjT1XZ/IJmSVc+aiJfJ9pwMNPfg0NZFhe6Ru8Kp6DrIJeHO20J+EB3
	 xCvUYjjFayqs8j0uDY6aopnEkX64pgYKV9S7IlD3XE5u3dQ2HaG01KJbeQboH4lDyn
	 /ir9rqus5c287LeFPXCPXWxounHVllUDZr7SCxcQ7HoePRtfcZjtCzIJIZ9BC+KX+Y
	 aObjYatbXBcrA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be416e603cso2342270e87.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:11:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFrlQEVgC/kg/6xxeqJFfk4sRA2WR+lqRp22OQaXTmYcO0ycM2V7OvZ8yMO7X+/RHkxI8jZbS1ZWfTQzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wIn/stGdSOUe0nkWPmCfEpJ5apnzm+RIgw74NlZ3/3fFYpaI2
	hZVn/hMp+jms6djHP8PU63oxfBa6xoz6K1XW2FwfAbRwVkZx8I5sDrx7rsGlhby0PhUHBF1TWnT
	Y+9aLssMXkLNSut53Qu09HXew/2woR+c=
X-Received: by 2002:a05:6512:1283:b0:5c0:c5e:3cf with SMTP id
 2adb3069b0e04-5c170b1cd71mr3615028e87.25.1794823911132; Mon, 16 Nov 2026
 02:11:51 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116014823.3132576-1-jic23@kernel.org> <20261116014823.3132576-26-jic23@kernel.org>
In-Reply-To: <20261116014823.3132576-26-jic23@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 11:11:36 +0100
X-Gmail-Original-Message-ID: <CAD++jLkoM-HvHNi0N4QUUDVg9TpskjsoSSzHyShjPykexQRPqA@mail.gmail.com>
X-Gm-Features: Aa3M54q8CQD4lYB2lo2AjT9xMWPxPN8WqcZ_--xpx_Jz3LMimI3NvUFBFIOSDvc
Message-ID: <CAD++jLkoM-HvHNi0N4QUUDVg9TpskjsoSSzHyShjPykexQRPqA@mail.gmail.com>
Subject: Re: [PATCH 25/35] iio: pressure: bmp280: use default_trigger
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
> the trigger is set up. This particular case does not have such a leak
> so this is a case of making the code less fragile going forwards.
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
