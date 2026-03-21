Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B59F33F5B7
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 04:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774069041; cv=none; b=BlsfUZ8BvMfRsXolBKwd66dFrViHt6Ye+tCEozGcdVE66YOgxURaO4XZxQSrvdFPQoWpuGvDs3b32wyYI8FrTIlRiS81tnMsZxkwj1fmbjBnXOwmGIl/DR4tW2Zi00IfS9lz6fmYyfNrF+uUnUv1wF4qLNUfJsWu2NlDeZ4JTTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774069041; c=relaxed/simple;
	bh=WYcM42MJ2XTmtz5HqmYYr7HnUfB6qWv786XxBO8FpAY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iWz3MLe2dUXy4kmNP3yl/q48oUTt8m+cO2ixXyw8jSmbl7oEhBzaB3hq32RIy5qFDLphRjJGqiV2Nx95nBBvnGtXQThMWhNWWxQuyU0RKCq27lo2Yq2qbOuXoGTaToYW82slgV6BFDu7qFrbfOgGFaBmf8nwBKA7gsv6hrwt2PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=DNA+Xh3J; arc=none smtp.client-ip=109.224.244.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="DNA+Xh3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1774069034; x=1774328234;
	bh=WYcM42MJ2XTmtz5HqmYYr7HnUfB6qWv786XxBO8FpAY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DNA+Xh3Jgr+wz5b0BKsemijam5S4V+r1LZtxlPkqZ13Y5E+6s+1M0YotXlqJyTOSF
	 Ek22Dl8bEpVjipHLsaMm84TB4qk+YVI4ItO6idHNnxMQ6h9az/0o/9InPx9O4jI7Wg
	 vsEwdiQjrjNeBpaHWkFCYsxj1JZugJoKfi90jSmtnUOaF9yUnDkRRbFP6CLPXyqFp4
	 jkN47q33SxiOYVHA+OWUWzupmgOii+qFjynB3eY/wINL2HCVTCJEzGo0rPSUTfhlGJ
	 oDyYwwxPM2xlhyHWqJvcqj3GE0nGungTkZ6wwJZCx3GfI6jeOd0MrmRBbCG2SQZDCu
	 0voCDoHwMWREA==
Date: Sat, 21 Mar 2026 04:57:10 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Antoine Bernard <zalnir@proton.me>
Cc: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH 1/3] media: i2c: ov13b10: Add dvdd, dovdd and device tree support
Message-ID: <upbCO5Ov9EM8f4ZCXKxzuKpXo5mOZ3tEI4j0VvTEZ6QQobtULxabIWkHlGTx0-iV9_nxK10rh9zLzccuYMtN0ldUKfwSDWm5I9kflUQ4sg8=@proton.me>
In-Reply-To: <ab29XzACA3gXE4MI@kekkonen.localdomain>
References: <WDExF9Cf1ELo55IwClyLBJqXeLe2-Kb2m3QYg7ex6qREa3HBG52CdMovctxuZ7W_ixhvHyjk9L73NDMCJi2ndkuDJcpzHSDs7Z5pEAgET60=@proton.me> <ab29XzACA3gXE4MI@kekkonen.localdomain>
Feedback-ID: 152853527:user:proton
X-Pm-Message-ID: d0095ae6b4e3645edb270291724b8e584a79020a
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for reviewing the patch.

This is my first time sending patches to LKML, so please do
understand if I make some mistakes.
--
> Error handling needs some work here.

Could you perhaps tell me in detail? The logic is same as with
avdd, so I am not quite sure how to refactor these.

> ACPI supports device probing through of_match_table, too.

I thought this was needed, because embedded devices don't have
ACPI. Is it possible to not use of_match_ptr() and instead do
.of_match_table =3D ov13b10_of_match directly?
--
Best regards,

Antoine
