Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6D3DFC92
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 13:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972124; cv=none; b=MH3J5EiAIx1WzNk9lc+RYtUYTBsxJpCCaYt5XvWmpQBgavBpjVE1YFK2cCpi0ouH3Vhl6CU+n8TTg2yTKqQUjvVdWymu4zhODxZc77YfC8GVQ66pWXbnrHzC8p+Q+kkRCj/ruL8VS7+l5LVLqisERHCMf0RHWykosgwwY1esce4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972124; c=relaxed/simple;
	bh=CrDuhrMKWDKB5Y+gzUmQAxIe2ITx+XfMsyEkeAbJbwQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CEc9WwjuYATdOedS2odURjcWXdT5JrK3A1RlYFGwTDqLh5dZb9UhO/it2tookLjBZqMPP+DFTtD5YhLwlTHYpqqU2bEjq9IY6wqr1nlrmdnoACYGZ7RgmifcwIomJh95pqqQJplf38sMo0HotCIu0DUICaWwMghpFcX+9DSbLkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=cyLJq5d3; arc=none smtp.client-ip=185.70.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="cyLJq5d3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1786972114; x=1787231314;
	bh=CrDuhrMKWDKB5Y+gzUmQAxIe2ITx+XfMsyEkeAbJbwQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cyLJq5d3CBtCwSnEPYCzptdCTkJJaQjz7bvX+Xmomh/twqgWRvJUN9wMBk9pZxBHk
	 nJiLEJgrH1frQ4mWme0W5ZIVgvL9QCy7zK342Qep0ikboaNrfsrW2B1UTcJ36AAZr4
	 gI0TUcv/0eMjBm5wgMjb6aHUZtWdyRLEKsleVRYH1fjjm7+JPbPqujEDTC79Kolox/
	 4St0hQ4a1lc8kU5cTjo1HhQyyUDqdTjdmxevBkpv2IhTMF5oOfhnU3zWSZ/ydp2gi6
	 XWXgKb9cDUMiKtd4xFmeMRjjDkSOd2+AxaXioH12lVsuVZTTJN7TAar7IAsBvpA8Ow
	 KXtv1Wd719YeQ==
Date: Mon, 17 Aug 2026 13:08:30 +0000
To: Ricardo Ribalda <ribalda@chromium.org>
From: Natalie Klaus <natalie.klaus@runtimeverification.com>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] media: uvcvideo: compute frame buffer size in 64-bit arithmetic
Message-ID: <0LjdkgJ1u4SshNwsbWZ_nuCytnWBHuqKrtaGj1rCENp7FpUPGphlZrxLt_xk8AB-OJr9T2Q_EX8b26nzmG01ONtC0OLcA06eoZJJWX6VvIs=@runtimeverification.com>
In-Reply-To: <CANiDSCsH3+0Mc-05gR0260efg4taTSuqr4kG1R8XABzD6E7ZoA@mail.gmail.com>
References: <20260817123941.1701962-1-natalie.klaus@runtimeverification.com> <CANiDSCsH3+0Mc-05gR0260efg4taTSuqr4kG1R8XABzD6E7ZoA@mail.gmail.com>
Feedback-ID: 202241500:user:proton
X-Pm-Message-ID: 04ba49ed10802167a66f4899367eea4f0dd62dc2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, August 17th, 2026 at 15:45, Ricardo Ribalda <ribalda@chromium.or=
g> wrote:

> Hi Natasha
>=20
> This has been previously discussed in the list:
> https://lore.kernel.org/linux-media/20260812103251.18309-1-noambs2999@gma=
il.com/
>=20
> Maybe you can help reviewing it?
>=20
> Thanks!

Thanks for the pointer, and sorry for the duplicate. I could not reach the
archives from my environment, which is why I flagged that in the patch note=
s.

Noam's v2 is a better fix than mine. Rejecting the descriptor when the size
does not fit answers the open question I was asking, so please drop mine.

Happy to review. I will reply on Noam's thread within a day.

Natasha

