Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805000;
	b=t+6F+ode+pwxrRK5LLPpEhDc9b7mto/QQpq8XrCrKHz+R5X1I20cG4+Q0X+WGZjGugMK
	 oAIfZ8dssaR14XN97OlPOyMhoRAYSK79bFbLyuXUvbuXm5VzZqwtYLzn+C7urZfCJnvsG
	 pGvhOBB/MIiV1LrowC8JMvYvGaWyseCEmzdhwZsPh14FRcRbF9NMgwHxZrUa8B+bhm9y4
	 OD5SiRjpnzWO4+2TmrEY8qrNLJcYJouRH+5tgKexVaEPVkEL+bBnXzFh6k/TeQH/c6QZN
	 YyxEN2DvM/OwQLOiScW6kWEJBkWdyAdGjnaBJ3FzS2Ec2oykBjFkku6TI5Lf08URckg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805000;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ZohoMailClient;
	bh=RZV2Bz1rnR1nwBwCIHteBeBwrgGrqm/NvJnIi7wGD7A=;
	b=ow4GKHWGiPz/uvEJHX+gBaCffoykr5nahkSKdkCW/SIDIJEztWBQwipP0vx7LoWfYlLV
	 q7Cjp6olFj3vRC5RvDiZZhI88wpjZBBsysIhD6NIsUVI5Ppa2SQNb/r0Ubd4ZvHSaUCU4
	 KAiXvEFnWgHhm/7HcvXXHczVnQJVoCyDWxxbaJbMhkBxu8+0oaXCxONXp+ak6mtNRyggR
	 hFe3A74UNmFVpWHUjFjThXu5/NnigNj00w2X5pT6auccgU2LLsCep1DEBhO0i7DfpjN5t
	 Pxn89bXI6m35wwQ0tE3gqK8NCFnqbEVnQPGZUHLwV/MZBVHU+wTtgE3/75zG/D2nBmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AlhFf8zC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A39606A321;
	Fri, 27 Nov 2026 18:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A39606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=AlhFf8zC
ARC-Seal: i=1; a=rsa-sha256; t=1795804954; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WcZtN3tD/zjvkk8uI44gdbTyPfvaOlx2Uyw+n6EalGUJfhu2vyRP3ATf6Fs40uUjjalYJ977Uv0z2PRkZEQd4IE76JryonkGpgoiw1qvX9Tjg50seYZmaLv9K8mvWj/gPVkYdhK0u8bXblt9FClGbhL12aU4fpfWVvHFl6VtlEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795804954; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RZV2Bz1rnR1nwBwCIHteBeBwrgGrqm/NvJnIi7wGD7A=; 
	b=msZ1BEW68rpZfIn05UPZaNVYPC8P2EHyim38o+oe5zt9X9dp44yOvAx9CnvPK5qD/D1GBqYnuT/2sBQJt4EHNFrJqJF3szqKvjcqHtF+1tXkCDkPW/S46i+J8E8M7FLiXTWXTUVGU/U0NSV+81pRf4Z5ehYkZFrVipV5e7U4UzA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: a=rsa-sha256; b=AlhFf8zCtIALPrXe8zga3TTnuSQt0lRzQGYtAzDrHn++w3fCVG+LhzmCx3usebRtnZHI1BJiwQhUVIvcEw6uiMt6Y9Crx6rnJoiYG0SEBR0fRflpO+xdg7OInUwN4YW4I9QP9CdbTZaNb+O6aUic1mFDxOzvtuMlUIk52JxFIY4=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=RZV2Bz1rnR1nwBwCIHteBeBwrgGrqm/NvJnIi7wGD7A=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795804951277426.7074106650923;
	Fri, 27 Nov 2026 10:42:31 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Sven =?UTF-8?B?UMO8c2NoZWw=?= <s.pueschel@pengutronix.de>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] media: rkvdec: Remove unused need_reset
Date: Fri, 27 Nov 2026 13:42:29 -0500
Message-ID: <sHCcy4ZARIqHsoGbYpMAqg@collabora.com>
In-Reply-To: <c0da8a7d22c6b837c2c8d62e6d267b54d6ed28f4.camel@collabora.com>
References:
 <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
 <20260810-rkvdec-multicore-v2-2-986f89d22cdc@collabora.com>
 <c0da8a7d22c6b837c2c8d62e6d267b54d6ed28f4.camel@collabora.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi !

On Thursday, 19 November 2026 12:35:43 EST Nicolas Dufresne wrote:
> Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9cr=
it :
> > A left-over from the iommu restore mecanism was forgotten.
> > As need_reset is never set to true, the if has no use.
> >=20
> > The actual restore function is called above it vase the IRQ isn't in a
>=20
> Tell me what you wanted to say instead if "it vase the IRQ", or define the
> verb "to vase"?

It's not a verb, it is very ancient belgian English meaning "in case".

> > success status.
> >=20
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>=20
> Reviewed-by: Nicolas Duresne <nicolas.dufresne@collabora.com>

Detlev.


