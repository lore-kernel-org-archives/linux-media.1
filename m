Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638825;
	b=5eYYLJuiFU1QrOLd1rHct+1mVZ6BEHA6NnV7w9lWtKTI4TZdMioyN/6/rztU4Hf8eRy5
	 WpswC7P/8Dhl3OBmXzCHt8aMpgiI09fxAaGtfwVjDM8kX0supqgMpNKzX1vCFxpqYDRK7
	 09tOgRdLqvioavU4bA1MY936PbSz3hkqMppJKhKxUp0Ijri1f8S19CDg/AMsixdNa0FjI
	 d0xiU1WR4wNyvZ9Wpkre0GK/qv/4EwozvAQgdGhdSDuIKpFUj6c7lPGmNRFLgWg74VNR8
	 lVRJedccOuOZq738114jakGt0mtJ+yp/1ZfJ8t2dz5ECWBk68yKjKtUB54IDqfngSlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638825;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=V8FUCiGNj/oDwlyphyr1vjzx3mc0o+zaEblUbM0v+Ak=;
	b=nMF86lp08t8kOYsaINMCS+ZWULwqhBUX+mAHtAV0y8qiPmSUHXmA1VpdGeod7lfrIJjS
	 quK0cRQukai8XHe14oT2eOHXOVqDleJfQVyfBwc7QV5Vn4anGGixTVr7/p2JzsyNz+Wjy
	 BwpJELAEqgGg7qxLUPRK9iIxDKx1/dLdarYtKAHBaq//iN6jJ1rqXkouJ5P1eR5mrV/Ue
	 2O3aMUVaf4WM0C+xHoHk7ahzRxaXe5Q6ZY3fZ0HYAwRQZ51OCApYqCYzCrMX61xEYS+DO
	 KkKfv3RmkIxUimkamW80gwfQm9yHrR3D1zqSJzEAb+qhILKK/qCjuBJBk3gDgia1diA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=S2+QYLaH;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C96606A323
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 20:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C96606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=S2+QYLaH
DKIM2-Signature:  i=1; m=1; t=1795638822;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:rrUfrWO8dh41LKZcEjHmWdz+7BEi
   1VmSakn3IJZ/mJRzLERHDwfk6FctJjpL35LrM+Gn6osyrCCzhE95z0EjjcrW78yDsfG0lwPl3Ba
   NNz9aInh3B99QEWsldFwrjUySF44Qi/p1SQbNxdYGS+NR8nNC2mp8YTnQGkXv0M7n4Iyer0Ug4S
   QApyYakpwts+1PNW8UA8G2tWYAYrLi9W4mz4IXGo6DEZYaB6gaVTJXA3kZcIJicsY4JvahHLtXP
   fRVc6OqDZoggNl0vb1ob4w6gNGjjkZvjS8mQtH4anL+AFAr6HBI64IlT85gvOaInXRNE2AQpoSJ
   Lh39VIDlDBPyGg==;
Message-Instance:  m=1;
 h=sha256:
   BDaCLlZbTJ62ZmT4Pfcv0uAQURBMaWqnEH9az8VDjYs=:
   fqT10FfGs6yot3MOB7Y0XMN0loe5YXb5Pvu6HBRa5ig=,
  sha512:
   X5us1RuUASJEfMF4wv74euL2JL19DCx0wC2YcLGj/iSN3wudQtLfxHEyOP5nyg3mOjkQu7u311oss++t9GkHXA==:
   MctCrrGfu7zvcBXht78lsauMTfD0lpexoWuWYNZmRo+Rx3JkOrO7ss4tyjC+ZLV/3gn4exWhrK1o5b0zQoBYhg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795638811; x=1796243611; i=markus.elfring@web.de;
	bh=V8FUCiGNj/oDwlyphyr1vjzx3mc0o+zaEblUbM0v+Ak=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=S2+QYLaHUwS+Qsi3BzrLvPycK0Zm0QjjzNxNJex8wlGPWQtN8Hud4UrTa+FS67n6
	 uHxlqi4TfIv2+i9LJ1n8wKObdX+6nF/JoAKXPyLa9GOkE6TvyI1W32pk2HXz0V+Nw
	 sadj7qMYcbjQRGSGu9QVnufNosDWSMFaQbSKSjY6U54Kx6Axg15ZVKzAcbVY+1K6D
	 d2c7kShrBHhA/HAaUhc6y7gkrxDtYOE57MASpsE0WEEcTLKLT4DHmdqZdcf1Mxx7v
	 B9oMI/lTFNebs0oa1aBKHHPL5d0gecKtwQmiiIdFbnt3UzmERR1W5hcXUxzjO68Ud
	 WxesM7MLGpWOGsbocg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MbTGt-1y7aRG0nJh-00g5zT; Wed, 25
 Nov 2026 21:33:31 +0100
Message-ID: <4e958c1a-3a7f-49ab-bd1f-a41b804043b6@web.de>
Date: Wed, 25 Nov 2026 21:33:29 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Laux <matthew.laux@gmail.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
Subject: Re: [PATCH v8 00/12] Add driver for StarTech USB3HDCAP capture device
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0hL48C2QvgvmjEYvD5PbrExr5PXUi1is91Uww3Pv0fJS3fdHKTn
 P1JREW0u9+84/nWR1buKmXmyL+sO0bizOv2jXPi062cl9FF+r49E6dwE2PlFJ5A4kCccgI6
 xj2AOe6Hn3z3FssMgL1AtDgms5EAl4i6t3wBp5nr0XQNDpg8RgJjg/xLoBnizlJ46TShZ68
 aps7CK0GfUQYVKEmBECTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EG8YYPSqiOw=;fD9Ccc5kc5dyrTBx2gUfPBsF83E
 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
 qR2gdcSVrYjDVeewqJJqIjL0DXw==

=E2=80=A6
> Changelog:
>=20
> v8: remove RX power control
=E2=80=A6
>     use scoped_guard in tw9900 progressive commit
=E2=80=A6

tw9900_s_routing()?

What did hinder you to apply lock guards at further source code places?

How do you think about to extend applications of scope-based resource mana=
gement
any more?

Regards,
Markus
