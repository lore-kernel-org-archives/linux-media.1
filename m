Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD42406275;
	Thu,  4 Jun 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583345; cv=none; b=JceAAcY1ItkiffaztWIHI7V0cMxYiK+kXNp8xaip1LffQn0ed6OaGD6ZKqfcZ+gB9yAi+w2ClGVoaADhiIpnGyVzkQL5N25vmCdet4aLIDJt2XhWtJ1XhFP4mSsOewUO3HxHFHxnOZ8A7NgM9Gaipb4oRodoHmrHqYF56xgaDVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583345; c=relaxed/simple;
	bh=Ioj/3NgPHxVc72U8PNRLyJCL0bU74plSM3UvV/dEsSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zx6pLoqBJYhjX1m3tojR+PTfH+DlApTq2AJadq802ZiwG0Ohsh5VsQLAxIuorvjJkD8iF5gR5r5Srni358RJNbT9rO3fHn7qsOKWf8ynQ8AlLGPFmsnVQwVNGSHdZF6jzB/25AvpV94VuaI0evZGu9W0RyWZPnIjPfEcLWWxW9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdazikNm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdazikNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455951F00893;
	Thu,  4 Jun 2026 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583344;
	bh=2WEaReAijThnDZfLLsPE0vM3K1nlEfEAcfgeu13pIl8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NdazikNmgHkd4KFFvz5ROCnJmMg9XL6iigj73oTInpotzIISsVxl5GJ6qyEdb6MOl
	 Q5QNfUKGRWDbAxjNhdoCGrwwGuX0HiWc95yMWk7i0Frtu2Xrfxyxo62fFB8AjDqsMZ
	 v8CUHi2hsq5UjwOBHphlDzTFOoMjD71p0OzsT5J/F71x0LD68Re/jRL2+AXptaTYJM
	 P/OKR8YcQP+R3Z/i60pBlmqBC6m8d+VjwWuqU3ucYoAAVQU8OddE3/PD1g+Bn18Eg0
	 U5kybfY+d7ytrlCtZHsxTNvQuxObnqi1VCVhbpIEPWmKH6G4WsdKtXScarFffpEy65
	 7JK4PqWCB7l+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 01/22] media: mc: Add INTERNAL pad flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-1-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-1-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:29:03 +0000
Message-Id: <20260604142904.455951F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Fallback logic in `media_entity_get_fwnode_pad()` improperly retur=
ns internal pads for fwnode endpoints.
--

commit a0ac801b415beb48f5c9da940609a2ea7d38e0d3
Author: Sakari Ailus <sakari.ailus@linux.intel.com>

media: mc: Add INTERNAL pad flag

This commit introduces a new MEDIA_PAD_FL_INTERNAL flag for media pads
to indicate routing endpoints that originate within the entity. It also
adds safeguards to prevent creating links to internal pads and initializing
source pads as internal.

> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 3fa0bc687851b..7938f785e2e3c 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
[ ... ]
> @@ -1148,6 +1154,9 @@ media_create_pad_link(struct media_entity *source, =
u16 source_pad,
>  		return -EINVAL;
>  	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
>  		return -EINVAL;
> +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> +	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> +		return -EINVAL;

[Severity: High]
With this new safeguard for internal pads, will media_entity_get_fwnode_pad=
()
incorrectly return an internal pad and later trigger this warning?

If a driver lacks the get_fwnode_pad operation and direction_flags is passed
as MEDIA_PAD_FL_SINK, the fallback logic will match an internal pad because
it also has the MEDIA_PAD_FL_SINK bit set:

drivers/media/mc/mc-entity.c:media_entity_get_fwnode_pad() {
    ...
	if (!entity->ops || !entity->ops->get_fwnode_pad) {
		for (i =3D 0; i < entity->num_pads; i++) {
			if (entity->pads[i].flags & direction_flags)
				return i;
		}
    ...
}

Should the fallback logic be updated to explicitly skip pads with the
MEDIA_PAD_FL_INTERNAL flag?

> =20
>  	link =3D media_add_link(&source->links);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D1
