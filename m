Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354F93C10A7
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006563; cv=none; b=qRI57thsUomGWubAEegPm7JC79UqOhZdmfEebhtCzb9Etkr0XAqHkJuh7daThj0SJ4VLYhqNHet9NFqsOqYXBXEBNpLKmB1qjboqNEXKQ+0Wrkm3DB6spL6nJk9v6bWx5kzD91/yILvUwdPvr2sHpe5xtgTYvoOGheA0Hrei39U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006563; c=relaxed/simple;
	bh=7hXBKG2/aGGmBJs83jwL7Ki5dq+WwATxc3r3KXfUvo4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ksnaVebwGD2VTLiPO/TozdCjkW1w7UpyFv4wostigVxBgDOYtSenAiFlsB2ob04whJLrGGWw2+LQRJ7Vg41mXgRDhAYnf35WqgCqzM13XFPJ0PuZuOAmkPyRzDo3TAJJ/6OUwrmXNlI06gbZUgHUPOh1wg69FnlyCpP3GDSLk2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=ZpVv9dIV; arc=none smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="ZpVv9dIV"
Received: by mail-qk2-f3.google.com with SMTP id af79cd13be357-93a3f97e134so53172585a.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790006561; x=1790611361; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7b19y3WRIssK3jbhmoPHDoJprLyuDeFXulhkZ83oR+8=;
        b=ZpVv9dIVIwGJ3CxP3oAVmUC+Eyi0Nri9avQ0QATP2mGzlcUhernlAb2yH8xIQAiJB1
         StHp9GnA0Kjfst8ex4Tx9vj+O/T96x+CxwZr/TyjTcsV5Nq2H1nwcrED+A3VgrKgAbIB
         YpnDK8B4UCF7OnxrQh3n6bCKjbDN7xKfmYHsAu7uwKnWvJTrvkyOp3+SGcj168tF9jPw
         7v/z0xBC1RVmDAEC3St4vkp0DttG8D4AkztlxRWgOjvD6rr6NMCyC3RxHXDRRLCALqnu
         g5akgZcoFfcc+gWXC3thLj32zzkkO9orHIJiZIeJR91ucVI+K6LCngaPe7ar8MdGD1RU
         ViAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006561; x=1790611361;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7b19y3WRIssK3jbhmoPHDoJprLyuDeFXulhkZ83oR+8=;
        b=Yp0USLAgc2M5sdcBmTOawyuSclxRzGOQQXVqqYDpdKoTXNtMdNbVWg7an3fj6mqhhB
         8m0Wyq4RhqZHtDLQMeMcknqrMrj7/6X/8znSfPtPdcOR17OmuSS2pa8JnVkSm3rTj+WJ
         6BfoxXasTwsLxKSzYJh27cJWdp5NDjwkewjBiz8+HqQHzSuIlwKboS1PKMSbu58J0Egh
         +DLt6EJ3qoa9Y8QouL6XFgp3KA3lpUc0HW/xdYUFo4SChYjFZ+0TLepTPHrl4X3R7AKY
         e1CluOQaP001N9D+tFgLc6PHn+L+qt1BVtvStvfooAnh8uBoLZFmFneMwvAhdnBgB9wK
         UYZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDvcSCNIKq8YUzgv0JHZlAh0Byu7GBPR8k/PBE7ZpvydGRrp+JgtLQF388dRDLiSJkU7fnIj6GFxjY0g==@vger.kernel.org
X-Gm-Message-State: AFuF++n6MVWOXmvK7BVYd74Ab/okkc2wzEtjRbquYNmoJxQt8AhKzihH
	TWhOYZF7LViCfRfhHzztOZ/sRinDoH7eiWbWQGe0v8kIdPiK3n6EnLajBY6gefUn53HpRz1AB/b
	Bv1iKh7k48w==
X-Gm-Gg: AYBFou2kvkklrSSLXeBleSREUXckLYV7/TW42sKIWdw6wovS3wrSJFrtThFX48BS6FV
	OeMCPGd/NddsVJrdA/zyBhdCYnsnO17OlvMYEko9uPxbL16+1Zcq7aCqfcDW2OIKXRpA21uJlZC
	iyW0RV3tOGiNoONujuOu9bvitzw3aC8Uakv64SGR6Wj12ofSxqZ/o+CKO9ghBerO/unJ1FwOMzc
	njdVzfVYk7SfFUn98xxdhBJb4zNlabcZJePVrtobnfhZlfg7kV0hsllRezij1dkUomDKe43GWVm
	YFolDUEQs3Bz4aMGcBuDch8h9OrXM+Y+kynfF5GcCsABzVUvnGakjtSDon4/jKi/DGM0SXstF+i
	8rD5bUsVQDuuLoXULYBh3qD8GB4Q4zaMz89otTU2jS9vFyUuCfg+ojKq0qyK2bZNCTDQJjDuuUQ
	epcJJWkSiVaWbNAUuRQgDds5mzfPy6X3mXIQrZ1oGLp1ExbgZmQwk1OXtD5a5i0Kj1FBhLrKShV
	rorxct6FQR3xw==
X-Received: by 2002:a05:620a:2602:b0:939:93a1:1383 with SMTP id af79cd13be357-93c15dacff9mr125955285a.32.1790006560314;
        Mon, 21 Sep 2026 09:02:40 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedaf3e7bsm676890785a.30.2026.09.21.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:02:38 -0700 (PDT)
Message-ID: <eb60366097f16106d855aee486a88d6767836ecd.camel@ndufresne.ca>
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Bryan O'Donoghue <bod@kernel.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Date: Mon, 21 Sep 2026 12:02:36 -0400
In-Reply-To: <90afd37d-ea90-42ac-8d8c-7b8a30375228@kernel.org>
References: 
	<UzpC1s2YnBtZIaRCab_Y8AbCecyauDUO4OC7Nhd1-h4TE21aLSghbwDuOKgdwJQugvPMjM4foPHuL-UKnBLD6A==@protonmail.internalid>
	 <20260914233810.GA2796257@killaraus.ideasonboard.com>
	 <00cc46b2-0729-46d3-8e3b-ea717ec1675e@kernel.org>
	 <xkoP0dfwjjBYtv2XeWuIvuqK5HAhjNFHul45Rvx8GUs5XTO3O8Mjnbwn4rV7ToCR6aqLrANyfzmKa7ssGAWk4w==@protonmail.internalid>
	 <20260918091806.GE59058@killaraus.ideasonboard.com>
	 <cadd6ff4-ec70-4ff9-9125-a0c4342261f6@kernel.org>
	 <uVVv8mqM2Y5t-jyuD77yRDxWpqtE869qfapajmCag2Z4krmhWK7dVywtWcvivpsSj4P4UHnXEqWjdeZ7qOnboQ==@protonmail.internalid>
	 <20260919222915.GB1179126@killaraus.ideasonboard.com>
	 <90afd37d-ea90-42ac-8d8c-7b8a30375228@kernel.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Dfwd1IoVmNfHLJq3pM6f"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-Dfwd1IoVmNfHLJq3pM6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 21 septembre 2026 =C3=A0 12:52 +0100, Bryan O'Donoghue a =C3=A9cri=
t=C2=A0:
> On 19/09/2026 23:29, Laurent Pinchart wrote:
> > > V4L2 owning sensor -> inline engine is already supported and won't
> > > change. For subsequent steps though each stage hands off in-kernel
> > > without having to involve userspace.
> > That's fences, isn't it ?
>=20
> Perhaps fences in v4l will do exactly the job I want. I'm more=20
> investigating than specifically pushing a solution.

It's something I've thought about a lot on the V4L2 side. So far, all propo=
sals
failed to respect some dma fence contract. There is this strict relationshi=
p
that nothing can hold indefinitely on a job once submitted.

In V4L2 m2m (any flavour), jobs are implicit, we queue object, and the pres=
ence
of enough objects can trigger a job to start. If you deliver your sync file=
 on
the queue operation, you will deliver a dma-fence without the guaranty it w=
ill
fire (or fail).

I've been wanting to solve this extending the request queue for codecs. Whi=
le
you can queue a request before its matching OUTPUT buffer (which effectivel=
y let
user-space delay the completion), we could also query the driver upon if th=
e
request has all the needed resources to be set on a "guarantied to run" que=
ue.
With a new version of the request queue ioctl, we could emit the request fe=
nce.
Alternatively, since the request is already kind of a fence, we could expor=
t a
sync fs out of it, and do this extra validation/guaranty at the same time.

Could we have the same query from a QBUF(OUTPUT) operation on existing ISP
driver model ... maybe. I'll leave that to ISP drivers expert. What matters=
 is
that userspace cannot pause the process (failing/cancelling it is fine). Th=
e
fence does not have to be strictly bound to a dmabuf buffer, its a sync poi=
nt
where a buffer will be filled. The semantic of which buffer is to be delive=
red
next will have to be specified, its not the case for v4l2 stateful decoders
notably, which may pick different order to easy the reordering process.

>=20
> My understanding of drm benefits are:
>=20
> - drm_sched
>    job scheduling based on dependency fences
>=20
> - dma_resv
>    fencing, sync
>=20
> - syncobj
>    user-space sync primitives which can be
>    shared with say a compositor
>=20
> - TDR
>    Builtin fault tolerance.
>=20
> Probably the best thing to do is to implement both a v4l and drm wrapper=
=20
> around the functionality and use it in anger.
>=20
> There'd be no specific barrier to implementing a libcamera pipeline=20
> around a DRM device, I mean that's what gpuisp is even if its wrappered=
=20
> up in mesa so.. :)
>=20
> Nicolas mentioned the idea of implementing codec drivers in DRM for=20
> reasons similar to the above.

Nice moment to plug my referral track talk at LPC. Appart from early protot=
ype,
it does not exist yet, hence why LPC is a great place to discuss, I already
introduced the subject during Media Summit in may.

https://lpc.events/event/20/contributions/2354/

On codecs, we aim for Vulkan Video as the API, which actually unify userspa=
ce
across platform and OS. Since its a low level API, very little design is ne=
eded.
Here, libcamera is your API I suppose, but its much higher level, so what t=
he HW
specific driver should expose as API seems a bit more open.

cheers,
Nicolas

>=20
> Anyway I'm curious to know what the DRM advocates and detractors would=
=20
> say about that. It's a question I have not an assertion.
>=20
> For an inline ISP where you connect a sensor to a CSI block the=20
> media-graph seems like a nice well defined thing.
>=20
> The offline ISP I'm describing - truthfully has elements of codec and=20
> elements of ISP.
>=20
> Probably the only way to really know is to experiment and see what falls=
=20
> out.
>=20
> ---
> bod

--=-Dfwd1IoVmNfHLJq3pM6f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarFVHAAKCRDZQZRRKWBy
9JwRAP4s1xozRPJx+Z72nu5uHCJJAauGKSxN4jVR8lVQSR22TgEAsxhZwBu6aIlx
ub1dcX3Fm+r6WTdvuc58uCvfo3GW4AE=
=G/YF
-----END PGP SIGNATURE-----

--=-Dfwd1IoVmNfHLJq3pM6f--
