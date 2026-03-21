Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764093845C4;
	Sat, 21 Mar 2026 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774093944; cv=none; b=UTc3ss8oqCxGnjmErT5ZhLpqlBu3MoZmtZjHIm+pdLAbRk39PCYbVzZAUIIjPLiZC3HL/a7jY9SQQ5crRn24fyRCmzVp6SDR10muWDwt8Fso1Gm24Xvzy0l0pgPOAVnifNg25HTuZnN/PgTX8zAnX1Zo7xQC12NiIX0MtTNaycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774093944; c=relaxed/simple;
	bh=h7DKDkDSb3QIVxjjNgy4otikq343GSu8T6JPzKJpPVk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fHhc0JtEgeBeIpUroaWo3SIOdHpmebXnXQqzgIuGK7TbsmNe4fBdjjGtu84wkfc9JDbjEigXwswcmagRIYyLzJKFY0P920nfF+S9U9AlGstAqjA69xCFsCnsnj1ZKH7T2qqmBvbWdqu/VC/yqp4iGk58j9TSYTnlO2pOG6RoN1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=HobPh9g3; arc=none smtp.client-ip=109.224.244.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="HobPh9g3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=j34rwh3g4bgabokqqwrje4ap5e.protonmail; t=1774093931; x=1774353131;
	bh=h7DKDkDSb3QIVxjjNgy4otikq343GSu8T6JPzKJpPVk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HobPh9g31bKv0RIQGQHKvfMgRL+RnDqueeA8ayjgHSvj2U4eG/X5/ZWEcJ1wJXp11
	 nacYsa2HfLjMleUBeGp9fnWSV9ZRHe90xMqekCYkXkoWAJdGBVeoXYYYCxYVgEhtd+
	 4/7Q0sPl6IrRqBD00rjVhP4Tj9v6waysZb+mF7F4B6NhEx3MrYF4zDUjtI3k46X5TG
	 9b7Fi8ZF9SES4xHKWDhH8j12NN0yijeKx8nfURF2qhuXGiyTG0XvkVQIdVCXvzIT41
	 O5vBl7KqVu8kyfTGvy+HFtwUyQbxLt3MAMETh2fD5Wspb4YByoc2c6Phj3yQ0OM12m
	 FVflMB6OotMGg==
Date: Sat, 21 Mar 2026 11:52:05 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Antoine Bernard <zalnir@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v2 2/3] media: dt-bindings: Add OmniVision OV13B10
Message-ID: <ySoCU9RG-svsJbEsf812GyWrLdj1qAK-m_UQXD8WVeADOml0c0HrDyg3mMgxY7NVhafoUEFdXlpXZ7eqUXE1LtqUp_FOWHhwJFGPvGidskE=@proton.me>
In-Reply-To: <20260321-screeching-lovely-earwig-c0bd53@quoll>
References: <cTZxBKdzN37cy_eGcCK3hocAgzwzdfBnsqWXpJnNYFZb6Odl4FspR5333ZBJIJG5dRunnVBB3fWiRJL_pq3SmykhDKxaGPRl_T5_BShJIng=@proton.me> <ab2-j6tMKTAlCDcT@kekkonen.localdomain> <8or0YwK4oKEWSf5sBtuu8Xo6CYaQTVSu3BhkNBR_xv6se8zLgy4VVO3Q5gvuNk4UyQs_omqdqaqHhZBfLJuoaibc7A8foK9ISRweQCkInb8=@proton.me> <20260321-screeching-lovely-earwig-c0bd53@quoll>
Feedback-ID: 152853527:user:proton
X-Pm-Message-ID: cc4614103f4605d3766cd21702075afb5cc5edec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Do not attach (thread) your patchsets to some other threads
> (unrelated or older versions).

Sorry about that, I'll resend all patches in the series from now on.

> Looks exactly as ovti,ov08x40, no? Why another file is needed?

I kind of agree, ovti,ov08x40 looks the same. In fact, ovti,ov* documentati=
ons all look similar. I made it because after adding the dt of_match in the=
 sensor driver, the validation script warned me that the related documentat=
ion is missing. If it is possible to have one documentation for different s=
ensors, then I don't think this is needed.
