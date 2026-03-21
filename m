Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83636E56A
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774094562; cv=none; b=dK35MRC0+5eEQU9mMPMxFijlv+G0yQPl/xVhpcfiNM/i3ghTPjXvITv+2uu4YOVIjDRYw+HTApDnsEdip8/o0rRguf6UWvvcya9JEA/yGJfYU2iwqd8X6OoS1h891qYWxKveu2U6HHP0RdhP5KoyacyAVNrVKQPtZfRkNVndlzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774094562; c=relaxed/simple;
	bh=kZzs+DMxwGMPueif4QlBBglWmpBhXXo4QHQ4O5/SDfc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdOYoUKJ/NqvpcMytDAiSHxdoEflH7C/ETJHiQioEtviDbzMnKn5d1PZAW2VFRPvmfq7GiJUltUkMmOpweL1178sF9AzTz0KdHkA5GI8AGW6ngsMmtYulfhwB12GhbTUMjcHahWBSMcGPbKqYwU4zYh1LxOqzN4fo1gGKLVN4dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ft24YbLv; arc=none smtp.client-ip=79.135.106.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ft24YbLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1774094558; x=1774353758;
	bh=kZzs+DMxwGMPueif4QlBBglWmpBhXXo4QHQ4O5/SDfc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ft24YbLv+sUokVhxkYV2cAk8o+F+CDXQ3+bDH3pPNxPGWpPFeX1l0eSDVQKinE53u
	 YEMknrmwUIGOTh8NR7hqXK7av+zvBP4nodsNeRCem5tBQqXwYUONlE/nXJUL6eGOMb
	 0xJrk/NV/HaXflywSRBaNQjOkiBwQeC8cWdD7Ibwa6cCWootTW9vFLJO8YGootWP9U
	 KQKJ9NPOATl4HaorUeUFh6cqXzg1cKy4393iF7dL4vldP9I2AVJir5XKC9QkrPHRH+
	 vTQJOIwaaHxCnwKV226QZk+MwkrzN5ZzbXSiDJf5bkSIBE1fplliQXVZzgWicezic5
	 gG9OXzFNf5Hyg==
Date: Sat, 21 Mar 2026 12:02:34 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Antoine Bernard <zalnir@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v2 2/3] media: dt-bindings: Add OmniVision OV13B10
Message-ID: <WAB7jp0xjjHctNtq5ASJolUOI6Kg5aMEGSDolwUfAWaAmIima-lr5dCUh-EQPBZvrUFdXMxA8dKfkY-XRkTFYhzCrp5vheC2h15to5ZsBsM=@proton.me>
In-Reply-To: <10d6863d-7c66-47ad-a683-251f2a40af66@kernel.org>
References: <cTZxBKdzN37cy_eGcCK3hocAgzwzdfBnsqWXpJnNYFZb6Odl4FspR5333ZBJIJG5dRunnVBB3fWiRJL_pq3SmykhDKxaGPRl_T5_BShJIng=@proton.me> <ab2-j6tMKTAlCDcT@kekkonen.localdomain> <8or0YwK4oKEWSf5sBtuu8Xo6CYaQTVSu3BhkNBR_xv6se8zLgy4VVO3Q5gvuNk4UyQs_omqdqaqHhZBfLJuoaibc7A8foK9ISRweQCkInb8=@proton.me> <20260321-screeching-lovely-earwig-c0bd53@quoll> <ySoCU9RG-svsJbEsf812GyWrLdj1qAK-m_UQXD8WVeADOml0c0HrDyg3mMgxY7NVhafoUEFdXlpXZ7eqUXE1LtqUp_FOWHhwJFGPvGidskE=@proton.me> <10d6863d-7c66-47ad-a683-251f2a40af66@kernel.org>
Feedback-ID: 152853527:user:proton
X-Pm-Message-ID: 5e9771c294bde70986433a02055b97381517077e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Please wrap your emails.

Sorry, I noticed that after sending.

> If the hardware has the same properties

As of my understanding they are different hardware, can I really use
the documentation for another hardware?
