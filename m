Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823883;
	b=pgR37BUk0bapDxLdOeCMxFRCUchhuuhM2gXp66S1wY5iC0hfYR4+u4RNAo9Fxn8s5G/U
	 2ANSaxXqmmQVrIDLk1lM1sUaU8aSQu37RUqVXiSuwnJW3O5LW+Kw6/AhdEzQ1FyGTW0Gy
	 V/SV3q3cZNxr1zvyJdEbPavkTw141aqpNKQJR070BurIepfjPMOOUvxlrXWlvSENlS1d4
	 aEC78UQ361FgTRxFNKTgsSrw+Wpl5m4nzOo/dSk8UtKcnFL8tLzlL+0xa0Yq2pxwg/0PH
	 AB9kw6eifhvrcJqlSYc8KvKxgx97SGEP5TzuyaL6S1n/BTbaNRibs6I5wVLT3OQRj0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823883;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VDdgEqnnBqULx4MMS3GYki2TX5m8ZiMkZgjITNIXXPk=;
	b=HUbjsK3FSNywNDN8DcZLP8T9rAsKsxOXRplKEKdGzHktlXpkuUEM0VXS0rqvGgPIL598
	 Mu9AFRy7sZWLMT9IygZJcpEtCkQfwASdf+ml9r/cmj+yQKIa1tKQzTk9e2cxJ7IzbWiTQ
	 +wWMT6/RRwAd094lRZK+Aq1vDuaX1oSm3cXy2HUeriBxXgjnaXVD+Mt7DbZHdFuJysYIh
	 /oBejiCDp5biwCYH7MGlYWYaX8F3CF/FRYhg54vUqVJW4Kv4iAQjc8G6vSai6p2H/fB+3
	 XvGsenAi19VTJMmg1hNHnyS/De7WchFGuVAKJnnPMGUTnI5Z2DzbMqyCweUUxoItQtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHzdXE1E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B28606A888
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JHzdXE1E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D501F000C8
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823883;
	bh=VDdgEqnnBqULx4MMS3GYki2TX5m8ZiMkZgjITNIXXPk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JHzdXE1EcbblEPveKr4J6hNG5QBckImv46ao+hyk5ZGaMnIugZgfFle2kf9lgXn6F
	 jt5z1LYqDe55qKnmIOVlLaGEi037V5nfDJ5MZC8QSBnBZqAJnFMheIFofsBlVZpjML
	 wnxZd/MOE32CuK+l7Jf5uXG4g/twaEXfqnybilMGGssQ0agJPj16UGn9oFO5MuC/oT
	 mTNaFxxhUcL+i3VRmaB23QIv3IYF6mNN4JwjQPzw8Yvdmpa24dX7aRhbJIG3wEp3TN
	 QGI5z9fpBxwCHGVfw8hBiJ7GSfGS5EkN5LBi+cDT2yk2paQyLf2vVdBcWSsJOp6+TG
	 RtQDXeUAr74lA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14470729eso2709732e87.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 02:11:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGwGc0ocA0sgSAWUyZ+pguq7Ai196GZzdW0KalgibwG5Vz6dherHvMHsxOm1schWuuO7a8v3XsQiTKHmA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9L6LV9DOXLNp9P8dk+TX5JkY5V+3F0jDHdUhR/++aD61tHdq5z
	lOvbm42pkpz34bdxeTM0pfQMoPp4Qocj5MukaqrUksTH3S/5iWqvB4XuOuPlkq8VZeAFHAJC+X5
	CsDmDXr+ckCjBGmsse54e9vePWwEBZ5M=
X-Received: by 2002:a05:6512:618a:b0:5c1:5278:f9b7 with SMTP id
 2adb3069b0e04-5c170b1c7d2mr3708890e87.20.1794823881151; Mon, 16 Nov 2026
 02:11:21 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116014823.3132576-1-jic23@kernel.org> <20261116014823.3132576-36-jic23@kernel.org>
In-Reply-To: <20261116014823.3132576-36-jic23@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 11:11:07 +0100
X-Gmail-Original-Message-ID: <CAD++jLn0gq0FL_5L1QnviPw51tRSzc7Kr59BftRrmZi2RkqNZg@mail.gmail.com>
X-Gm-Features: Aa3M54pHeJxrP1Fk6URaiwULFWhJUnkhNel8D9qfG2FXtEuyt-fcPVVKRf0PUWc
Message-ID: <CAD++jLn0gq0FL_5L1QnviPw51tRSzc7Kr59BftRrmZi2RkqNZg@mail.gmail.com>
Subject: Re: [PATCH 35/35] iio: gyro: mpu3050: use default_trigger
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
> the trigger is set up. Whilst the ordering is such that there is
> no leak in here today, this will make the ordering less fragile
> going forwards.
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
