Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644297;
	b=RaAqx5+SDdKzc3mEeMRPgSOzm7O3rDWYLfVfdIaaS/TMPMIXy5gxSUiKuJyYPQEray+H
	 eHH7+HI8eYrYJJT0VZpORHtDAjPziQ0IvOwNMz1sWox9CKTpCeFxHgkw3y2M9OZ0fBaSo
	 +9HYD0p77h+JmbmIbFxMCuW9tpcy80dWD7IQ4UivDRMOkLRuMcN9Yweezo2VrAZacKzNu
	 hvdJZrkHYfrIbzAk8biKhxsH+zkxIl1aRs5G1d7mbdo4zIiYw4nH3jFOBOy9r6henSLPH
	 842AKuE+oDcPTVYR1rlPdMpJ0CK7ODfSZN/09sx0pZVf2PqStIz43QjafplvQMcx7Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=anyoS9QmIPpZgoKNSKJhW834ul+casWny8wsvVbeD+E=;
	b=htLfg4r662pfRS4WUJmSs3Mv7A+FL8QTnT6k/F/bce+IIjUchaWHjsuDKKQCCDrIoAoB
	 LTERNbWhxKkMF4zLE1fsuQ2QmbVcocCb7s7RPXQ8fcRDXKAAFx+5m1XUzsg8eUiYCbvIO
	 1naZwtZRyp1rW0y1eEFBuqzeC/Jb6aoTcT5oC8aXi2OQAtOH6onbtcREh388LGbpG7flT
	 CVdJ2FJwHrDjD9cd3CQEbSinMbeN9RzLfU489B/jElDhm/957qVeJql465tIM7XqxWF20
	 +3fB4mOJRM5r83mpHmn5y7brL1dKOOzKAcc09fOu+N30OEycPYOWLkgxgw5LBySt16Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rJ4AfinY;
	arc=none smtp.remote-ip=74.125.230.200
Received: from mail-qk2-f8.google.com (mail-qk2-f8.google.com [74.125.230.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CF1606A326
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 18:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9CF1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rJ4AfinY
Received: by mail-qk2-f8.google.com with SMTP id af79cd13be357-93ea6c73020so22241985a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793644296; x=1794249096; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=anyoS9QmIPpZgoKNSKJhW834ul+casWny8wsvVbeD+E=;
        b=rJ4AfinYz2uxgcdRu+8TTxzHSBTfhzbHfa+ZM1ZURvVXC9sAL/33PNwY0GuCtG9qDZ
         K1AVSTQEVdMLYxtoreNFvVDRDh0NH+tO87mdr9EAXNQ/Lw1A/X0NnW7i1TsqnWAAO8AQ
         gqPvzz8ZOGah6yFlo06VaCsO9ZAwaNqxWLyNvtU+TtT4PX11gAq2yzQSp0TbYesbaXvY
         zgWO66afaWE9ed+NpARd+YumHewH8mZ+GbXpv+8q+CCf3aixPVghWn6BWEqcb1QHn5o+
         d5Z45C+pic7sKKsq9zKxQOlaD2T112CyOEhrrse4laod0qZWE3mDv3uJSh6728jJGvlU
         fz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793644296; x=1794249096;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=anyoS9QmIPpZgoKNSKJhW834ul+casWny8wsvVbeD+E=;
        b=vvpCU+O0ApeVcg7ei3PboA7DJQ9I4y8G+2foKpW+s+bnpEWpB84EBBGuE1Xj7SE+O1
         ovM0rNrVDndzqwXoQa25eb+DCNXX+P1EdwuPwr1o7FBx9lolCP0ofQtEcFZ+DjvfPmuw
         mo9fBqwRwB9QtkHIqdCYZuPz7DHTpS8xdJeaNeeLI6+GiONCXQr3gQXwARGXPkKr1XSr
         HYJnK6q4zmNleEhyx5B3/1trC17csVMsudzRlXIgl3x5fWlM6u6z8UynNC+qyKwqfKdV
         /+VH1hJEhmufkzuKOyzmPVtYWLch3WGnJ5BAsTSEpmJT958XMOXzNE/U2gg6b6/uk1YK
         UZvw==
X-Gm-Message-State: AFq9FYJccUm7tNNYm9tA7YzX8WOpyrheqNCCi73p5a1QBW1ytHO1z9Lb
	FTegTC5Z64IOC1PRrG21W2DDl9mv+96pvswc4B4842MpS++gFgHnyu9HdVWGUTwgfQfu5/ZCbhs
	17l88+NHpQBGQ
X-Gm-Gg: AYBFou23kEtPoyly189H/vEhMV7RV5PbHk0m9zKp5yfz0MJd4hNeSMf8hO+BL6vNUbv
	FdCg0Ncm9qTYxCOzBDJNPpBwesY0UnNxoOcYb+Qw5A90CMiD8628RWqaJGtfKpLAbz+fz+32+of
	JUVYzBHH/ekhwwHDWJZmP72qqecMh5UnbqBXjnxVuUTiyRujT10Gp73L0ubfcwzidjCLhFCPNpJ
	KiAuK8H46vfd/IhKwCdxuShUbd5JJMqYeEfZcHTwSfHZnBRbD7LvuOY7DMiqoJDK8jTKlf4rlQ0
	/58uR36oPRk0ovcp/R18M9Ki7tKEkB+QVkoHT6Nx8dqU14cjbqbIFwlhDP+MJRNkmcMckX7PJva
	omkM7ltrnVeq18kXZ3CMsf0/miANAJOMNSg480ewwO1Mep6AGSC5hR5Y7K0gsfD0EOuJ+VtxeXH
	IiMrwRh0QOr6H6F89G9zXomTsDQHC2mNJICBvFDW8EDDtPkNw4/8nT0DJV4nHgLkdj1vLekp0JE
	XZ/j0dfJBjKMHEDaW/itZrqxY0lYWOCBIkFoytUI9rsfA7LXNtC0d/Vgf7ErOOSq1A4kN3onZA+
	yhLMHfi2UFhlbnJKXG5bjoLT5ALUW1sRB1MyG6QY7i7rascJB/AmPI4=
X-Received: by 2002:a05:620a:1d06:b0:93f:16d4:3c0a with SMTP id af79cd13be357-944214cfe6emr1648027785a.4.1793644295303;
        Mon, 02 Nov 2026 10:31:35 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:34bd::c41? ([2606:6d00:11:34bd::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425aa8fc9sm886726285a.33.2026.11.02.10.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:31:34 -0800 (PST)
Message-ID: <ece80650634cec3c63f05651ab326de1d60d23c7.camel@ndufresne.ca>
Subject: Re: [media-ci] Re: [PATCH v2] media: rkvdec: Handle interrupts
 without a current context
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: linux-media@vger.kernel.org, sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org
Date: Mon, 02 Nov 2026 13:31:32 -0500
In-Reply-To: <sashiko-outbox-185268@kernel.org>
References: <20261026124808.642373-1-a.kazinsky@ideco.ru>
	 <sashiko-outbox-185268@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-7/8y/MxC0rZQblNeEr6G"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-7/8y/MxC0rZQblNeEr6G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 26 octobre 2026 =C3=A0 13:07 +0000, sashiko-bot@kernel.org a =C3=
=A9crit=C2=A0:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] media: rkvdec: early !ctx return in IRQ handlers skips rkvdec_io=
mmu_restore()
> --
>=20
> commit 76a8e6d477d878ff7b196f0bd2f1dea7df5256ee
> Author: Alex Kazinsky <a.kazinsky@ideco.ru>
>=20
> media: rkvdec: Handle interrupts without a current context
>=20
> This commit passes the rkvdec_dev pointer directly to the variant interru=
pt
> handlers and returns early after clearing the interrupt status if the cur=
rent
> v4l2_m2m context is NULL. This prevents a NULL pointer dereference if the
> watchdog finishes the current job before the threaded interrupt handler r=
uns.
>=20
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/=
media/platform/rockchip/rkvdec/rkvdec.c
> > index fbcd0f175ad3f..fac7b49a41864 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -1434,15 +1434,18 @@ static void rkvdec_iommu_restore(struct rkvdec_=
dev *rkvdec)
> >  	}
> >  }
> > =20
> > -static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
> > +static irqreturn_t rk3399_irq_handler(struct rkvdec_dev *rkvdec,
> > +				      struct rkvdec_ctx *ctx)
> >  {
> > -	struct rkvdec_dev *rkvdec =3D ctx->dev;
> >  	enum vb2_buffer_state state;
> >  	u32 status;
> > =20
> >  	status =3D readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
> >  	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> > =20
> > +	if (!ctx)
> > +		return IRQ_HANDLED;
> > +
> >  	if (status & RKVDEC_RDY_STA) {
> >  		state =3D VB2_BUF_STATE_DONE;
> >  	} else {
> > @@ -1457,9 +1460,9 @@ static irqreturn_t rk3399_irq_handler(struct rkvd=
ec_ctx *ctx)
> >  	return IRQ_HANDLED;
> >  }
> > =20
> > -static irqreturn_t vdpu381_irq_handler(struct rkvdec_ctx *ctx)
> > +static irqreturn_t vdpu381_irq_handler(struct rkvdec_dev *rkvdec,
> > +				       struct rkvdec_ctx *ctx)
> >  {
> > -	struct rkvdec_dev *rkvdec =3D ctx->dev;
> >  	enum vb2_buffer_state state;
> >  	bool need_reset =3D 0;
> >  	u32 status;
> > @@ -1467,6 +1470,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkv=
dec_ctx *ctx)
> >  	status =3D readl(rkvdec->regs + VDPU381_REG_STA_INT);
> >  	writel(0, rkvdec->regs + VDPU381_REG_STA_INT);
> > =20
> > +	if (!ctx)
> > +		return IRQ_HANDLED;
> > +
> >  	if (status & VDPU381_STA_INT_DEC_RDY_STA) {
> >  		state =3D VB2_BUF_STATE_DONE;
> >  	} else {
> > @@ -1486,9 +1492,9 @@ static irqreturn_t vdpu381_irq_handler(struct rkv=
dec_ctx *ctx)
> >  	return IRQ_HANDLED;
> >  }
> > =20
> > -static irqreturn_t vdpu383_irq_handler(struct rkvdec_ctx *ctx)
> > +static irqreturn_t vdpu383_irq_handler(struct rkvdec_dev *rkvdec,
> > +				       struct rkvdec_ctx *ctx)
> >  {
> > -	struct rkvdec_dev *rkvdec =3D ctx->dev;
> >  	enum vb2_buffer_state state;
> >  	bool need_reset =3D 0;
> >  	u32 status;
> > @@ -1499,6 +1505,9 @@ static irqreturn_t vdpu383_irq_handler(struct rkv=
dec_ctx *ctx)
> >  	writel(FIELD_PREP_WM16(VDPU383_INT_EN_IRQ | VDPU383_INT_EN_LINE_IRQ, =
0),
> >  	       rkvdec->link + VDPU383_LINK_INT_EN);
> > =20
> > +	if (!ctx)
> > +		return IRQ_HANDLED;
>=20
> [Severity: High]
> Does returning early on !ctx in rk3399_irq_handler(), vdpu381_irq_handler=
(),
> and vdpu383_irq_handler() in drivers/media/platform/rockchip/rkvdec/rkvde=
c.c
> skip a required rkvdec_iommu_restore(rkvdec) call when a hardware error o=
r
> timeout races with rkvdec_watchdog_func()?
>=20
> When a decoding error or hardware timeout triggers a self-reset (setting
> RKVDEC_SOFTRESET_RDY in RKVDEC_REG_INTERRUPT on RK3399,
> VDPU381_STA_INT_SOFTRESET_RDY | VDPU381_STA_INT_TIMEOUT |
> VDPU381_STA_INT_ERROR in VDPU381_REG_STA_INT on VDPU381, or leaving
> VDPU383_STA_INT_DEC_RDY_STA clear in VDPU383_LINK_STA_INT on VDPU383) and
> rkvdec_watchdog_func() finishes the job before rkvdec_irq_handler() calls
> v4l2_m2m_get_curr_priv(), ctx is NULL:
>=20
> drivers/media/platform/rockchip/rkvdec/rkvdec.c:rk3399_irq_handler() {
> 	status =3D readl(rkvdec->regs + RKVDEC_REG_INTERRUPT);
> 	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
>=20
> 	if (!ctx)
> 		return IRQ_HANDLED;
>=20
> 	if (status & RKVDEC_RDY_STA) {
> 		state =3D VB2_BUF_STATE_DONE;
> 	} else {
> 		state =3D VB2_BUF_STATE_ERROR;
> 		if (status & RKVDEC_SOFTRESET_RDY)
> 			rkvdec_iommu_restore(rkvdec);
> 	}
>=20
> 	if (cancel_delayed_work(&rkvdec->watchdog_work))
> 		rkvdec_job_finish(ctx, state);
>=20
> 	return IRQ_HANDLED;
> }
>=20
> Because rkvdec_watchdog_func() does not restore the IOMMU and the interru=
pt
> handlers clear the status register before returning on !ctx, the IOMMU do=
main
> mappings are never restored, breaking subsequent decoding jobs.
>=20
> Since rkvdec_iommu_restore() only needs rkvdec, and ctx is only used by
> rkvdec_job_finish() when cancel_delayed_work(&rkvdec->watchdog_work) retu=
rns
> true, should the status check and rkvdec_iommu_restore(rkvdec) still run =
even
> when ctx is NULL?

This is plausible, but I don't think the following action in place in the
software watchdog is enough to cancel a stalled decoding:

	writel(RKVDEC_IRQ_DIS, rkvdec->regs + RKVDEC_REG_INTERRUPT);

It only prevents some late IRQ (but not all) from triggering. But next time=
 you
try and program the IP, it sill running in the background, and the request =
will
likely fail and timeout again. It will only recover once the IP have gone
through a power cycle. Its even a bit more worrying, since with
sw_dec_clkgate_e, some mmio may hit some gated portion of the IP, causing a=
 CPU
hang. Intuitively, sw_softrst_en_p should be used somehow, otherwise a hard
reset.

Bottom line, I think fixing what sashiko reports here should be handled
separately. The provided patch cleanly fix the ciritical aspect of the issu=
es,
which is a kernel oops. The fact that software watchdog recovery is weakly
implement seems like a separate issue.

Nicolas

>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026124808.64=
2373-1-a.kazinsky@ideco.ru?part=3D1
> _______________________________________________
> media-ci mailing list -- media-ci@linuxtv.org
> To unsubscribe send an email to media-ci-leave@linuxtv.org

--=-7/8y/MxC0rZQblNeEr6G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujXBAAKCRDZQZRRKWBy
9MskAQD3b7gS95y43eTYkWaXgC41xSrlUpJg5C8FGUwOKgM3JQD8Dp3EDO4MM3Ur
30iTd40oHKcGEJFmSsnCcYdEqWZwsAI=
=R8vE
-----END PGP SIGNATURE-----

--=-7/8y/MxC0rZQblNeEr6G--
