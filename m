Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217006;
	b=zci0nZIP7cjlNf7OJk9E0VwsNkA3xZMxSWg+S716hL/gbH9OioaNn8TYeRB4589u8niz
	 7hKopwda2XUbodDA/AUspNDkPou6tdu/skTxzERM5VE+PjjN/QpqRzMwPYkaghfWyI8JR
	 +LmA6JW8MZAksm75t8dupBjbgbfe1urg5ol0n+o8vZeaA0QkfTUEBefYmJd/AZAGM0bNL
	 FXAcqAKY1hyGJeqyIOnS6G9gxTbIl0c8POtj2/teOad1BPxhmwV0uqgmvMBOF83SRvd5a
	 Xijmw519zHPB3DDQiO8BIT8dQ+s224KYiLWTFsUNNQuvmKfccVaT8JZPgjkCjyutFGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217006;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Q6CYFFodOjbdgRRXSXV6xGGC057sTM563L+scbws2jw=;
	b=Ppz/gkzByqYn1jaLcO/exyQpHS8WVbFPbvuO8LTmhdUw0TWsArgADdEsgpFM6mjdiPJn
	 Uw6X96gBJxdd0OaAER/jxH+2x8nudeSgFZWSc7FTlDxG58LHuW0evWkA+nD7LFbTmyYbw
	 GKzom+MUYrRPyc4ZToPVinIxWfxeKpDT8KWXkHBfYiv+XBifqgXxD2CEwCc52tyy67lAo
	 UGVWTBF4aC1N9lSkSqXW4zDOZsvaAhbs0teWsqfqdhjr+XqIW0cpZstZs4yqkBFv4HYML
	 iOzp+9AlcGVsfFtM7N21TJfX4WkwWOsl5S1VfhipPnvIHeuG2Afxw6QiU3u6qPwOL4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41D6606A6A3;
	Fri, 20 Nov 2026 23:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D41D6606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUXwq-000000002ZQ-437a;
	Fri, 20 Nov 2026 23:23:17 +0000
Date: Fri, 20 Nov 2026 23:23:08 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: rkvdec: hevc: bound the RPS reads by the
 control size
Message-ID: <awDWVpqEBcOGsCuu@makrotopia.org>
References: <cover.1794645268.git.daniel@makrotopia.org>
 <bb9c44d0f56221874b105394169e5c377ef21b42.1794645268.git.daniel@makrotopia.org>
 <6ae6d1101d3f7095d11462579a5a3313153533e6.camel@collabora.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6ae6d1101d3f7095d11462579a5a3313153533e6.camel@collabora.com>

Hi again,

I missed the part of your review which was inlined with the code.
See my reply below.

On Mon, Nov 16, 2026 at 08:49:44AM -0500, Nicolas Dufresne wrote:
> [...]
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
> > @@ -448,18 +448,18 @@ void rkvdec_hevc_run_preamble(struct rkvdec_ctx *=
ctx,
> >  			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
> >  	run->scaling_matrix =3D ctrl ? ctrl->p_cur.p : NULL;
> > =20
> > +	run->ext_sps_st_rps =3D NULL;
> >  	if (ctx->has_sps_st_rps) {
> >  		ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> >  				      V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS);
> > -		run->ext_sps_st_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> > -	} else {
> > -		run->ext_sps_st_rps =3D NULL;
> > +		if (ctrl && ctrl->elems >=3D run->sps->num_short_term_ref_pic_sets)
> > +			run->ext_sps_st_rps =3D ctrl->p_cur.p;
> >  	}
> > +	run->ext_sps_lt_rps =3D NULL;
> >  	if (ctx->has_sps_lt_rps) {
> >  		ctrl =3D v4l2_ctrl_find(&ctx->ctrl_hdl,
> >  				      V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS);
> > -		run->ext_sps_lt_rps =3D ctrl ? ctrl->p_cur.p : NULL;
> > -	} else {
> > -		run->ext_sps_lt_rps =3D NULL;
> > +		if (ctrl && ctrl->elems >=3D run->sps->num_long_term_ref_pics_sps)
> > +			run->ext_sps_lt_rps =3D ctrl->p_cur.p;
>=20
> So you are saying that if the passed array is too short, we should use an=
 older
> entry to none? That seems a little strange, what about up-front rejecting=
 bad
> entries?

That's what I do, but only after patch 5, before that the decoder would
still run with the previous table. I will reorder the series so the
refusal comes first.

Rejecting when the control is set does not work, as the count and the
array are separate controls which can be set in any order, also in
different requests. The first point where both are known is when the
request is applied in device_run.
