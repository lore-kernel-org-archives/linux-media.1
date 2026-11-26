Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680601;
	b=i3ew4UVlDiV3lbnBNcVuTqx795J81vr818fHfQksTPhnPH4hgg93adyrG2gc9E0VVYWA
	 rwHV1H1yw3SVwJyABHErUn/ny1Y5FGVpApaF6xDiksk7mUeDPbJnz25DIHycvIO+q4VV9
	 SF9Tv3uceFqEnl2wiBsOmpap5vXy7trY0KaZUxWGIT03NqZKCQn6BaWxpkyqBiWCkSz34
	 3/KaH3Ohj2WoKz20Nug7Afx98lahAaaaFtg47I4At3+L0LCK42oZX5SD+0CHYGYpTANS+
	 sbXJPo9QCTZgn4Kk4fKi7ZUW79ev6udhP57ShVl5Da0uEocgxbitN6Dd3yI9dwaPQjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680601;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=LZmleDIFvqIjLQ3cU4aTXi7jZyx8/cIELc+ontle6cc=;
	b=BjqyFas25ra5Uul+ZJqpvcsHKdCsDluB2kxgYGqzUG49pyVlTfWCbpXVpyuH0oHqV9Yt
	 oayenhNHCSGw5ODPL3vlgSJbPE2lSm7C7H3tT3XPyss3hlms/pmXJeeu1O7adYqeAw2e8
	 mo8dS+M5T15dCcXz/I/bSDl7eG9rShV2wXZ83/crX0h9pErDkUYPar/TRFiV3eMzVTRc5
	 5ncxxcmAfkfpTCBGhWZ6+21h69WmJ/qX8iPw4/aKdembYPY9KoksmLSJ6LrCXZlSezMGE
	 Sq47/Llqwp/FxUUkYjLZ9eR5lCK10VSt2S/vGljX0qrOFZ4BLxEQ6kubFrkFEz3hEBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=vnD5ClNz;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174C2606A334
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 08:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174C2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=vnD5ClNz
DKIM2-Signature:  i=1; m=1; t=1795680598;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:gHzpwvAwv8efL6OxR6CEByC8v5IO
   1/x1YIr6iUWhI3OUZhwjl+0uJQntCqjReZcAoTuAo4kxKw//TUJNCAFoqbiAe7rOrvR4vg5QNki
   /yV3wKwSr6ZRas71FwgluZThoMOk9NIvJBz6rONEMncN4ZztgqduTVifjiBq0HHMLoainWCEPaY
   +SUQhniswFYE7lNxGYxA/4ELcjXTYagng03313Sveuh7SuQ0eyc8AfpwfKD9nslA+yzVuRhpiek
   YeoDbNMSTxEa6sN4r3Txj6ycCboCEv01uZtJmQa7xyIjnQWTBBniAaETjqwzXuSITaPQWmAMUsw
   GneHZiA+GoJG8g==;
Message-Instance:  m=1;
 h=sha256:
   vZGEr+hSbxio8VkTN1JNQckIgfK3U6f4lmqO+Rel2x8=:
   bafd/2f+pVK3eKwC63Ea+oIbjtu5jAWcpJbE5ZbrgBQ=,
  sha512:
   cTjlJn4hDZoDdoTfmcs6QKXQPC6aZq0aTf3V5aJU53N8DWQSj7Jhs8CgUmjoWWLjvEMIvtiKLX7BKNW629dlJg==:
   eb07pZk1uQZB9P1jL5WTIkU3nxuX4rHrtSzdtZ43tYSAmx2FmMdzNTfDM1wtBudo1Hdf5895DlEQI0Ikjp58bQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795680593; x=1796285393; i=markus.elfring@web.de;
	bh=LZmleDIFvqIjLQ3cU4aTXi7jZyx8/cIELc+ontle6cc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vnD5ClNzVO3McpwqrF4t8YqOFkQwIAYUlngvFJJMOOm2oF8wmh0l/WvV4L9DSVd/
	 JbIxzjHC7aeqvD6qB6l6hUTjnlKkucnpPF8IHWuos239kHdZl/q5izhfiBWm16OdK
	 5t982vKlCaHex3NXy3Dooc2qnyQoHBOgz365v2N0LKpxqGGYQUNH1Psr9PiXEw52h
	 3CtW2WnFapyfiR0+WAvw6vPnHsE9XPLr9Wou6EBfuTxvEch6S0Z6F6E2NC8hZ036O
	 ClmY538L5cG+aGvAaAqW87BRkdqHNuaitHSLIw6IGawGVJhoOV/DNMps00QaROz9K
	 h5NVg2dafEKZt81lyQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBjIE-1xgLvR2bRU-009CNu; Thu, 26
 Nov 2026 09:09:53 +0100
Message-ID: <825b308c-0a5e-4577-9f45-9bfe571ef36a@web.de>
Date: Thu, 26 Nov 2026 09:09:52 +0100
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
References: <20261125194951.19072-13-matthew.laux@gmail.com>
Subject: Re: [PATCH v8 12/12] media: add driver for StarTech USB3HDCAP
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261125194951.19072-13-matthew.laux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hLQdcTIEhV8rcrlBCkh0AQx43xLwzkiwLtQxq+SEiEqiRbUc7hv
 i1Ycf6TITre7pNClMV7feBdhDMJtrb040N951KehM8/a8xoaM321Nurgd010pSfNfFrhU5c
 4MM/wtO4fnf+sR0wm+3EQApnRF6vEf8YgMXtD+z1rjoJa6jyBd6AHmPZlQFV793IBqYXYd6
 86+6w5UbhPxWd68pIOmAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eO56Mv77k04=;XEX1GTJ5g3KqpmarjxyEymS3OvW
 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
 7hpIwtqNIHlQVorXfw==

=E2=80=A6
> +++ b/drivers/media/usb/usb3hdcap/usb3hdcap-composite.c
> @@ -0,0 +1,212 @@
=E2=80=A6
> +int usb3hdcap_composite_init(struct usb3hdcap *hdcap)
> +{
=E2=80=A6
> +	/* disable MST3367 */
> +	v4l2_subdev_call(hdcap->sd_mst3367, video, s_routing,
> +			 MST3367_INPUT_NONE, 0, 0);

How do you think about to achieve consistent error detection?
https://elixir.bootlin.com/linux/v7.4-rc1/source/include/media/v4l2-subdev=
.h#L1942-L1971

=E2=80=A6
> +	ret =3D v4l2_subdev_call(hdcap->sd_tw9900, video, s_routing,
> +			       hdcap->input =3D=3D INPUT_SVIDEO ?
> +			       TW9900_INPUT_SVIDEO : TW9900_INPUT_COMPOSITE,
> +			       0, 0);
> +	if (ret < 0)
> +		return ret;
=E2=80=A6

Regards,
Markus
