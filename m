Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611469;
	b=PE1OuGk44kHr1Gp2KMdAVMugd89mwfdFgQZN31VyrZJA4heiRCPmqOO+TbV/rvSCLKR8
	 KrUWcFXwjsLn+t5X0N/+0t8RbRgGEPmoCbw/OrUR26PkTa1u9VYOLeggJ5twSandi6Ug8
	 vqjoogP1TtDDXDdBm/73WpNR/2jM86lETSLXJ4ihpPZ8SFU4BN1JKDehLrYBAFxUxBwbM
	 oO2tHqeubN1No4NUQS6gf3Ffi6PRoCuHHFICsYBTJbuPKHoItvHM3wc53CMnA1lzF4xqj
	 WFgWghXbua4j12j3to6J++FU0CmHKiPraTpWYk9MGuPVCzXNeLakUmUW0XIQQAU+tlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611469;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kJt+ydyRTixeKLbA+0l2aYt6ojWzKdTKUDAlmkzXSx4=;
	b=iR1ufkZTTCG7Uzy03kK5KQkmjVUp5S0gydwbGZ8jdYKJ65dXQtA6qtXa21rLFL7w/TAR
	 xx+Njxzcw5Qh/Q55hPd3kdbqwRlNM+7Z44/SVwjqPL4uCsjThb/ZF5pxYuYx5UJe0pUM+
	 9M6wl3tz171BBH/zhf5xZ5mx+dXzs/btS+K+enlparH21PnRyXHCoQgsIoeMsH/a2Ea95
	 M4omx7VAgK1mNNwzAz0AbSCfHat4ZOqOeZvYMGPGyWbFS/8Y21gPzeJmCMsInGWzyDwAU
	 z6mGl7fzOZ+lUYas3Vbmke9GBzMD658YJ2yTS+yhR7rC/39edb1fgwxtRzCnLo508XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="btu/aT+w";
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD67606A31D
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD67606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=btu/aT+w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792611466; x=1792870666;
	bh=kJt+ydyRTixeKLbA+0l2aYt6ojWzKdTKUDAlmkzXSx4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=btu/aT+wzkBryud6j710GW2QjsH7PZsuAMMGFC03bMG6WMUh4kg8rY7zrsrIQmkvQ
	 X+pkc+4eiYHuH9aeaP/Pn6wC3aBgNkWqvAD0ajLwQ/vLNzhfZ+KRmi4wD5GowoqJ1V
	 lZH1sCNs9UconzRk/A1eyIrRWEomHz+F0WyGUzAABzVrsqNWKd1hqhBBe6t12j+cuQ
	 nQLF9WU8D9DnhUPKudM0u5W6I4+Mc9cBmQsxbciPnIQK3kiEny9F5JW5dPvOvnRuvY
	 UQfIOgKAsFe4pLG+bCfwrWPeV/T40InKAUQJFKenpNmqYULxeYkgTBtFoNNn7bBFf5
	 AMC3GeVPtG2bw==
Date: Wed, 21 Oct 2026 19:37:42 +0000
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Saikiran <bjsaikiran@gmail.com>, Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: qcom-cci: Reset the controller when it resumes
Message-ID: <179261145907.36927.12230352776394948067@pm.me>
In-Reply-To: <CAFEp6-3s9ER_V_B89W5f5PVkRnLrgSwnUwE+tmftbUGB-1_BdA@mail.gmail.com>
References: <20261020193946.51478-1-birk.skyum@pm.me> <20261020193946.51478-2-birk.skyum@pm.me> <CAFEp6-3s9ER_V_B89W5f5PVkRnLrgSwnUwE+tmftbUGB-1_BdA@mail.gmail.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: ff5736803f5461e1fbf86162dae562ba1f05d144
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:20 AM Loic Poulain <loic.poulain@oss.qualcomm.com=
> wrote:
> > +       ret =3D cci_init(cci);
> > +       if (!ret)
> > +               ret =3D cci_reset(cci);
>
> If we don't know the state, it's probably better to just
> unconditionally cci_reset().

Right. I kept cci_init() first so the reset-done interrupt is unmasked
after a power collapse, but cci_reset() alone works there too. On 7.3
with only cci_reset() on resume, all 30 camera restarts after 2 s
pauses started, with the controller suspended in between and no reset
timeout. v2 calls just cci_reset() on resume.

