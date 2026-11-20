Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795182859;
	b=ijt16uSDUvb2QmBLzVLd6Sj5ymGtnAnjM2XpEnsmW9Pm4NvTvw26sfdKp/sid4xJC+1t
	 0yZpXNYRqx6llrQB4l1d+r7rDkZuYri9ja3VI4Qh7OowybfmIXNOqRnzq3eFpqRZfQr0B
	 yQ8vZyvBuwl+8N4zU6xcDUWcAILgJpB91Hj92LoVFMSt4Y8wFbIa65TXiZQQolsHp4r6G
	 h1lh0QxwV21yoxuUmZTIczE8kmjTjaBrOnEPQAEiPOTLUCgI8RkDOyTHbjVhTz0vkVney
	 2P2sb1e8yfLbzmmeScCXkzyGYr2Idij7/3BrUrGbuPTJ7/h1JJLi1sV//7Kn+Hfg2/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182859;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:From:Subject:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y4gUhOHZ5Dg/eVpejUL/iLgyeedE8wBdB818/Yz+Gac=;
	b=PYDZGF+CI9f66JkOlNyeNNLY35K8rZUJygJhkPM4egU0rTbGq2sha7JekwQ8VIe1Mir/
	 AMq1u9j9YtjPbdV2TPAPxriJtpLKFhjKOAeQc3o2p1OoEG0t/OBYA7rgRAILZR9B57mTB
	 /WAtv4Q5/Lz83VV+0J5/WVwQEeWrgR3Gmz10dFucaHiiC49gYVg/faTTepj/xRykYkOHN
	 RInP6OUCb2+9y0Nulrnt4ZMZdZoNNT8gS4iozcRmAaKRxPQJFAfBGP+j5knXKaBbec9nN
	 2A2QBRO44+T60J8rj3NcGe/YDE4tUIE7qKPvAKo7DFEtMVUGyF52t9yHOXZt71Hlccg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=AGjG0qqK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200E606A325;
	Fri, 20 Nov 2026 13:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F200E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=AGjG0qqK
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 04D5C205B37;
	Fri, 20 Nov 2026 14:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795182856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4gUhOHZ5Dg/eVpejUL/iLgyeedE8wBdB818/Yz+Gac=;
	b=AGjG0qqKX/dnRRDclRFEwp9LrG0BIGja6B5bhxSSGDDqOPb5yA8hC9qMxHo4g+DXTECZwD
	IYaN68X/1Azmdy82gHGmFZ5GW81u8JMFFRRU9uV5dqM/N6OG/x+uc1xF3zJd7xuaRIJdGU
	DOl44ccwdw/MMDmM60XV3/hV72DcNinIAn8a14Iqzwee2NoGw1AK1N4VcFQ0UHAgZR/ldN
	lLM2EpqDyDz0vmuofAhepsk+ctEuSBSS8zemeftHb0V1er0rxRC/eGH25RQxgS1oBiP791
	Tj89HipKsku7LiYfWPecDrRmzZ4sz+mnqChbpOjB24+K2e/VnIN+6RG/T5p33w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795182856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4gUhOHZ5Dg/eVpejUL/iLgyeedE8wBdB818/Yz+Gac=;
	b=Mfe3EvlI8G6xPOHWf8h2x/WMkjBzJv+9Soql10ONZZokf8gJT78snxc2o7ZQMZQnFYrY/D
	wJqKYMd4en+axLquesgQqClWLOWMdl8b3bVJUncFSS2BvamlX2RgjapkPBMnUAQdZY/ne9
	fE/NyJdD3IwRvVv+v4Y05ti3k2S7MZZ5XZWRyqxlTMpPhJ3avcKoOkZIWUfTGoM+reDmfS
	P+UzSZFW97SIxsqwmFHjvdV/S+HjIraANeegTzQ6drkPK4fQEkWxtELHXeRaM/+mQdlcUg
	sRuUAmcchX+pOW/K9nw8YwHUqqukp2n5oh8FwDiqiQVms2VkpPbMTdEWSS6ARg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795182856; a=rsa-sha256;
	cv=none;
	b=G50iDqclBwQIZOWXrSdW7zR+j/nX6mLkHD8Qk5r0W79Gg3wVsvVp7z1bSLZqjKt7DZZc7Y
	1V+/ZnBTI7wprK2F7feR7hUaqh1k9K0SlI13gMBRRDb36Gz76OwxmQsZ/8X0ejXNbp3wNt
	s5O6W45XlBvPPtiacPbuBo3UbJNo/6v4q1ydZUDVNCBa6nlAbQLg6jq4XRpuRWN8TT66Fm
	wp0jVvBGZyQseEVX6ALeuWGSwoKiBrcvajQI56/Now9Eu4OVmEhZu7xwoXc8Ar2jgXyrbi
	behoYLWmgMaUNr/SBC+0BsllffVVHV4tW77uvrH+fKeKXQpY56PMpLAoc7t0tQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
Message-ID: <028df402-a8df-4084-a4bc-7eca286a0c35@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
To: "Sergei Khomenkov" <shomenkow@gmail.com>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Lucas Sinn" <lucas.sinn@wolfvision.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <92CE2271-6485-4B33-AF75-480F9BD56980@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
 <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
 <92CE2271-6485-4B33-AF75-480F9BD56980@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 13:54:15 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

Hi Sergei,

On 2026-11-19 22:19, Sergei Khomenkov wrote:
> Hi Sascha,
>=20
> On 2026-11-18 14:27, Sascha Hauer wrote:
> > I haven't been affected by this issue lately, but saw it when the series
> > was still based on the hantro driver. Yes, I'll change to 3 bytes per
> > pixel next round and make that the floor of sizeimage. Would be nice to
> > have a proper solution for this rather than either wasting tons of
> > memory or risk having too small buffers.
>=20
> Thanks. A correction to my last mail: 3 bytes per pixel is not a worst
> case for 4:2:0, despite what tj3JPEGBufSize() suggests. Since then I
> built 4:2:0 test patterns that push the quality 100 scan as far as I
> could: libjpeg-turbo writes 3.35 bytes per pixel of scan data, byte
> stuffing included, for one of them (640x480), and the Hantro H1
> encoder on the RK3026 3.14. At quality 99 the largest I found was 3.08
> (libjpeg-turbo) and 2.88 (H1). The patterns, 96x48 and 640x480 JPEGs,
> the same frames as raw NV12 and a short script that makes them at any
> size, are at https://homenkow.ru/kernel/vpu/
>=20
> With the Annex K Huffman tables and 8-bit samples, a baseline 4:2:0
> scan is at most about 3.3 bytes per pixel before byte stuffing and 4.9
> after it, at quality 100 (lower qualities are smaller). Other tables
> give a higher bound, and APPn/COM segments add any amount on top, so
> for a decoder any fixed factor is a trade-off.
>=20
> So 3 bytes per pixel covers what the H1 wrote up to quality 99 and most
> of its quality 100 frames, but libjpeg-turbo goes over it from quality
> 99 up. If that trade-off is fine for you, I have no objection; I only
> would not call it the worst case in the commit message or a comment.

Ok, I'll rephrase that.

Sascha

--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

