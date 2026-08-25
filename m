Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432D3B1009;
	Tue, 25 Aug 2026 06:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787637927; cv=none; b=H2eHmZJfr5ESd88j4w/wK7oc2Y2JgZrobZAZsvO489ZZ7J0B/sZzw/ce3TKe8oSEbzBwUSyJp2/FSqcSzNOGowIt9FXpfIzw5wsP315KAduTYongYIT2tzo9H+YaIdX9cBU+I9rOxcckIJggre5u43ybNO493edQT45f8nMJedA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787637927; c=relaxed/simple;
	bh=5SX3XLtrazkTuCQ/ilBaxmWP2RaJblskG7NlcD6dvfo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=nImvrMZ9mPQfjmbi4xaG4lBvOdSlK5Kqv9t0U8wZxP+dO1mwyFTFMvmRi0Q8IYMa0DFi0UOQFkPn9tiC76nkGwJ+W5SbQbD4US6/3fIErzKKNBKcCu56SW+r6LC0N26z4grQwuMzfKZ6gk6/ajoTDPgIOYgzZNi8ebXPFnddlVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mXM4HMQ0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mXM4HMQ0"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:c31d:3341:ef05:614a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5363F2EC;
	Tue, 25 Aug 2026 08:03:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787637837;
	bh=5SX3XLtrazkTuCQ/ilBaxmWP2RaJblskG7NlcD6dvfo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mXM4HMQ0bmP4BxzGxcvQ5bzXkBDgV6ANdQeKF6Xv0flXww8U5mX+isjVZIhXgaPqJ
	 5hRy5al5QzHjy/Zxjc0XUakNZhTNC9fHuLxfEMqb+HcOffX2jiUlst2mnAXqABZUSu
	 AuS2shD/vBUc6OO7gN9x874A3sUuITWBDdBom3rY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c2ed44e5-ed5c-41f7-a782-57c82968495e@kernel.org>
References: <20260824090406.3695880-1-paul.elder@ideasonboard.com> <20260824090406.3695880-2-paul.elder@ideasonboard.com> <c2ed44e5-ed5c-41f7-a782-57c82968495e@kernel.org>
Subject: Re: [PATCH v2 1/5] media: dt-bindings: Add rockchip rkisp2 bindings
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: michael.riesch@collabora.com, xuhf@rock-chips.com, stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, laurent.pinchart@ideasonboard.com
Date: Tue, 25 Aug 2026 15:05:17 +0900
Message-ID: <178763791744.3620719.5831445737928843099@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Hi Krzysztof,

Quoting Krzysztof Kozlowski (2026-08-24 19:52:26)
> On 24/08/2026 11:03, Paul Elder wrote:
> > Add documentation for the Rockchip rkisp2 bindings. This is meant to
> > support multiple versions of Rockchip ISPs going forward, including the
> > 2.x series and 3.x series. The current version only adds the compatible
> > for the RK3588, which is a 3.0.
> >=20
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
>=20
> Testing is disabled for some time but it's not really a reason to opt out.
>=20
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>=20
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.

I did not use b4 but I did use scripts/get_maintainer.pl via --cc-cmd on git
send-email. Is that not expected to work?

> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
>=20
> Please kindly resend and include all necessary To/Cc entries.
>=20
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree=
/bindings/submitting-patches.rst#L23

Indeed I missed that, my bad.


Paul

>=20
>=20
> Best regards,
> Krzysztof
