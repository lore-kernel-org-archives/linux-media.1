Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617514;
	b=3hwy9EF9TTD58dbRabMh+lDmlM+zvYiYZUIiFg6HSiiRMr+sLBFV6UrbTDDdiiJTT31R
	 EJvG5zJ61mYKvluJ9H4n7hI2yD9hkRauQpMbm+rksGzgJrqLzi2LXY4PUTG06mUYGCOdv
	 zd5JYkoa4d9kVmr3Xqjyk9T0kdWJ2+RQl0aHhw3xu9YbR+X8a8EGJb52loq+5K/fR5LWW
	 ZxoLlY7hrHASy3JOnU5bXG/EQRa6nXamwktQKxEOXRf8PtaeS0RMT7hWMb0htibqLR3lw
	 snOiTwf8YvCK6/vXreXMMUHQX5nLPlCocE5clAy9u0KxK6PlBcGSIbDq8b0oKPDYwBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617514;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=V+SWYMrsgQDDOyJAzdmFdi2RZ/LBOyWTLZc7ss8N4j8=;
	b=mgLAp4f4syZjv4T/scRlnp4MzKRCx7RDakW9ANPS5NGGEC/+vM7eVJorhQQS744KKhAi
	 g5O+VrCIg3YhhsXV2WPLKNDjiil1q+I3pAna/oFFFcMvVlbbBpNcX53yPTvG1bOtCOS+C
	 g0aGnWDOM4oispL7ZKUo4ef3Kgh5YgwrtrjR2PdU5soka31xKREJvoRh4VPbu1b5MLhg0
	 8vcFB5+55pRXy/xjnZFFOaYTZ1yZ2MiR+7ybbvQLm3NnJ+VkYSq2UV8wuLNzosDpJtGfF
	 U7dZcEHYn8s7EGF5eYWzbws40rtaHjC8kLgxiksYvhyCpruD4Z/FCX2UN+xEiFsBFBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=p0ervYHU;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B7606A329
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 14:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478B7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=p0ervYHU
DKIM2-Signature:  i=1; m=1; t=1795617511;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:l++4yv2tKsCy9LMLBOl6P8eSDMiD
   7QIwFyjbLwJxkB70HnK9PrwDe0lCKlsthEkCxCOtAW4ERb3OEvST+3b2L1tU1C3Su3GIJ2laQ1n
   huJMyshjX+NfApIwPM/LI5myN24wlJOIItIe7e6NdMRqBX0cUSWxJi/Gk84A6njPT/lyre2UISh
   kNd2m4Mh3GH8Q8aMgV/e7w1y7neda4ekPpY4DgtkasqPvewuMsdbrps4XVvAU4Dswevp3rCdLV+
   UrrmAXrhhCRrX56oRNSBj1a6RHVnSsg70kZt4R6Hsd4DFmTTUhfIu3txzkqDakd1stEjdzSCpaP
   Gf+GEQrdEuEpXw==;
Message-Instance:  m=1;
 h=sha256:
   fF/XZeyUxy8FHjCHBzXgXM1gwwBvjTgNwVFzDafx8C8=:
   KvYEXE+cubTibDFFZRlF86cMR9D9ms2+WRSgzpVl4G8=,
  sha512:
   yHE8dCB/5Zh4cEawczJzWHi1XBZG+o3PAoD+FXir22ti75+Y0BYo/9xNRVcLVJ/RjCHH+DM1xSUy+6UwC/dkIg==:
   IK6FEubpsiP9RyqNSC2HG3YKUhQNJfYdklEHC5T081CpoLHOK0sGzv+Q2odalZU3BsZlZQbKwuuFYhPyGLKn7A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795617483; x=1796222283; i=markus.elfring@web.de;
	bh=V+SWYMrsgQDDOyJAzdmFdi2RZ/LBOyWTLZc7ss8N4j8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=p0ervYHUQiczczlgIiMcfDphWzspc2hHWZPrhbRhvbVxV5JXG0g0HfelD1tf1dhd
	 qQUwZp6eWgiVFu8suVfZBn6dw8vjKCkhbwdF83E88iCtL9GPDimEjInZKYRAJFUFv
	 a0AtrI66MjoP5xF0kzDdL7D9cGQ88JMKPsE5Dm05sPxb8SZfwp5he/gUs3MUikYbw
	 aNk8s8QRx7XxUW5vgc4Tppm+1a8prW5bOil0jnM8f3Cyslhb3YMYc4iVZwRgq4C2s
	 37Nvgrbr79en43fzaAuME6/taAm49K3ujWyJImFQy9IpF974/XWkNEf/LMaqa5/VV
	 MDrOVrduYyIyeljEXQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzkSZ-1yRTWU0a13-00yduM; Wed, 25
 Nov 2026 15:38:03 +0100
Message-ID: <5ff7af23-de12-40cc-a8a9-29d787873837@web.de>
Date: Wed, 25 Nov 2026 15:38:01 +0100
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
To: Matthew Laux <matthew.laux@gmail.com>, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261121035523.26764-11-matthew.laux@gmail.com>
Subject: Re: [PATCH v7 10/12] media: tw9900: add S-Video input and progressive
 source detection
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261121035523.26764-11-matthew.laux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r7M3hiurwiZ498JuLbLD040PvBBtMSuao+pfsYh0EEyKcz2fm8E
 /lA5sbD2RtAY7nXRrm16p1mHglhHFjEV/0BinCOHDWIenxmwSYZyKBhVGDrlRw1JBstldsB
 bYETdLQPxgro/HjZpPp1+vyKky6ixJA5+cUQzjSlH6PMRzOAFJ4vR4VwMVKGrC7V/ZfvX1n
 Tp3EEhNB+25jf5/ItlMvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KhjKszN8ApM=;/5XVeEYZgrvX2T/21NR3Nv78s0Z
 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

=E2=80=A6
> +++ b/drivers/media/i2c/tw9900.c
=E2=80=A6
> +static int tw9900_s_routing(struct v4l2_subdev *sd, u32 input, u32 outp=
ut,
> +			    u32 config)
> +{
=E2=80=A6
> +	mutex_lock(&tw9900->mutex);
> +	ret =3D tw9900_apply_input(tw9900);
> +	mutex_unlock(&tw9900->mutex);
> +
> +	pm_runtime_put_autosuspend(&tw9900->client->dev);
> +
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a macro cal=
l
like =E2=80=9Cscoped_guard(mutex, &tw9900->mutex)=E2=80=9D?
https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/cleanup.h#L=
325-L328

Regards,
Markus
