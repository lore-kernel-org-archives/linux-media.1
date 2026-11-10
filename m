Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293502;
	b=XLfdD6CEnasH7ANM+im5TBl5m1dhvXt2Nqk/RGygvv55FkPX7PyMOVU6gRim3py1llXe
	 aVol0Xo8vks8g2n9yXeUiFRK6zAXjUBA2Loa6/T3ofUd33jqyMrjsMWJK/iIhNa9zHKYN
	 ZRG/KNecyCN0gYY+naYnqChoZ6Ri4JNiUd3PQh/x+BcOkRhf0It8Gfm8zkQAYCKNZjApr
	 B+0ipWGVvWBH5sAZVCrhg1bos4gQkAY4EZyYxdeg1J6OxdTnK0TBgNehdTXMg2MnGqfF6
	 8e6xhLGMWICj3gpx9L9uK1evuhvY1uHFEslKOdedO9RDfVp3xzliAtFR+O7LjImXB6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293502;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AQk2bWnn9qEiJB55CfKKDZX/EDk/uqfS9SOxZvrUyFI=;
	b=KpHdutG0g2uum8/5EFGkPy4jY7ad3QuSCDAncu+pLO45VE16XezVBWv4CcW+yOoFipVG
	 CJCAgkq4Thu55sA/70EmvJKSSTBBX8bh3Shh4761XNJYd42gBJR3R1WqwiYskXERJSWcu
	 BfpS35+4e+6C8AtiZlydmhsvfkQho+IuNcFL6Iz2hZN42TOMgMbt44HGdT73hszRBev8+
	 NFAVS6AjNGnrJe10/zgEp/rP0/OM1gfBdolCYCBqsx6aNsGCpatOXCMenPP6cZoiLlT58
	 xJcIOVXwoStXkLBqE3nvkLw5/PrzWfuHZUnavKGUzdFBI3uKg2DqMJTx1DPdKkn7Ogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39537606A325
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39537606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794293489; x=1794552689;
	bh=AQk2bWnn9qEiJB55CfKKDZX/EDk/uqfS9SOxZvrUyFI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nvcJZWW5UYLD+L8c0CIhmpOFLYBxA/XgI2e3MQNTIZ9dezhvbModSbSWDbNG6NMru
	 tz94klciV1ccErUrZgATbxtZlFW27+oiTkJ732ruO5TvcMhGC5AeOCGEI02FrIMH5i
	 FLYVU4tK+LY6wmYpp7V5/6aMaNIFqcHNkoo/z5kzEbDwHLDmy6zbHXwO+CFXdSGNzV
	 N075A9DOC6CW+WgzUU+/+TchZoRylwTVTFGsothmWm4tpu/pUGzLiXl4E1/21eTJWN
	 dalYu7erMAR4WGWkLZSl6WUQYN7FsKy/HgB3QHjaTRPy611vZZbueiOiigwq6k0fOA
	 IA1YK/QvGJX4Q==
Date: Tue, 10 Nov 2026 06:51:25 +0000
To: Manik Bajpai <manik.bajpai@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, Antti Laakso <antti.laakso@linux.intel.com>, German Pablo Lindo <germanpapulindez@gmail.com>, Christian Murphy <christian@themurphys.eu>, Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: snoop ISYS writes to capture buffers
Message-ID: <20261110065119.20575-1-lsa.uz@pm.me>
In-Reply-To: <asaywQrMq-GSrI2r@kekkonen.localdomain>
References: <20261007183311.24637-1-lsa.uz@pm.me> <asaywQrMq-GSrI2r@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 90cce48b7b9b0d962718d9c5e3831106eccc5c1f
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

Hi Manik, Divyamani,

Sakari added you to this patch in October. Is is_snoop =3D 1 on the
capture pin right for IPU7, and for IPU 7.5, which I could not test?

Christian Murphy sent a different fix for the same rows in August,
which I missed: a clflush of each capture buffer in buf_prepare and
buf_finish, with is_snoop left at 0. If the snoop bit cannot be relied
on, his is the one to take:
https://lore.kernel.org/all/20260824224139.21256-1-christian@themurphys.eu/

With is_snoop =3D 1, frames holding rows of the buffer's previous fill
went from 301 of 698 and 684 of 697 to none, reading every frame with
the CPU, and 4224x3136 raw at about 790 MB/s still ran at 29.95 fps.
The patch applies to v7.4-rc1 unchanged.

It carries an Assisted-by tag, which 7.4-rc1 no longer accepts; Sakari,
please drop it when applying, or I will resend without it.

Sergey

