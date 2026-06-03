Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AA12652AF
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471136; cv=none; b=Y+ztW7Sl/NhG0YDMfSioew/01ncPtyciQFDRggmQNAdY7o5ZvTnTAvxMatP8r9DJ1WtlZU809KbB5jtPSs6rqN8x5f1sVj1G4DbxAClXe9he3pzrDZ1J779WJ2jpaGQ+k1qf/x+6ADbwRyRxWhyjwwVhg5SgjeH3kRB7xCw+F8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471136; c=relaxed/simple;
	bh=WvUqlsI0TntVJbYDnACbFjyiS1JVIAWaIFV578TdJsA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uKZSJ3qMiPoWQWMvO1mHPW9NgXA+VUCoOXTCEaH6UBvL9Qm7U8lXE3/MPfipHELaAF3WY1HHz1CKxubtFOj8I15Nq8ZO3ciMRL9H6ermIwSouDUT5eBJ2MHGSHz4UREuRWeIOg7v8noSde1OGLeZB77GsAMVc+mwQgpjRUGs5iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6P41ZMu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6P41ZMu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024971F00898;
	Wed,  3 Jun 2026 07:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471135;
	bh=2jCgiK+zC6hUdwZmbeVQl4r2cNMFCyzFpzUHyFDMCCM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D6P41ZMuMjPBeIfxPR8ydb39ZtmoKN2VaajX28kvxkn4k9LlYtEhXch6QhVDE/DGX
	 0yjV20gqhoPDzscJsdw7eCLZYjLo7t6pI0PqJbAkedxO59PT8+EHvbAJwuHaeP3eVA
	 adMXoLILiHGQBfY94oEXT6RznOIAQDGmXOLFYTqCHqjA6Jf8yfLA9XhRITWQSlAeMC
	 Cp99ajZTxY/ilwbobyQYgW0RW8f1cmGTU2AwazYcSQyoGCNg6gA6RgigAwCLGCDwf7
	 /ob4COlqmMP6JrCKxSsHARHXCcfbchEmkArL1yGskwd3p6CQEmNrVlE/GvDAHeLz6z
	 sA40aA9fDKfBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/12] media: microchip-isc: smooth AWB gains with
 EMA filter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balakrishnan Sambath" <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-microchip-isc-fixes-v6-11-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-11-8c3d7474a768@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:18:54 +0000
Message-Id: <20260603071855.024971F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The raw calculated `gain` is not clamped before being fed into the=
 exponential moving average (EMA) filter, causing severe and prolonged over=
exposure artifacts under degenerate conditions.
- [High] The unconditionally applied EMA filter breaks the 'Do White Balanc=
e' (ISC_WB_ONETIME) feature, requiring users to trigger it multiple times t=
o reach the correct balance.
- [Medium] The exponential moving average (EMA) filter introduces a truncat=
ion bias because integer division truncates towards zero.
--

commit 8392fdc05942f24c94ecfeddbdfc0822a7cde3b3
Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date:   Wed Jun 3 06:58:54 2026 +0000

media: microchip-isc: smooth AWB gains with EMA filter

This patch applies an exponential moving average (alpha=3D0.25) to the auto=
matic
white balance (AWB) gains in the microchip-isc driver. This aims to reduce
per-frame flicker caused by sensor noise.

> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driv=
ers/media/platform/microchip/microchip-isc-base.c
> index 6ebbb8adea452..621d90afe730c 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -1467,11 +1467,20 @@ static void isc_wb_update(struct isc_ctrls *ctrls)
>  		/* Combine stretch and grey-world gains; result stays in Q9. */
>  		gain =3D (s_gain * gw_gain) >> 9;
> =20
> -		ctrls->gain[c] =3D clamp_val(gain, 0, GENMASK(12, 0));
> +		/*
> +		 * Smooth gain updates with an exponential weighted average
> +		 * to suppress per-frame flicker:
> +		 *   gain =3D (3 * gain_old + gain_new) / 4   (alpha =3D 0.25)
> +		 * Clamp to the hardware register width to prevent unbounded
> +		 * accumulation under degenerate (near-empty histogram) inputs.
> +		 */
> +		ctrls->gain[c] =3D (3 * ctrls->gain[c] + gain) / 4;

[Severity: High]
Does feeding the unbounded raw gain into the EMA filter before clamping cau=
se
prolonged overexposure artifacts under degenerate conditions?

Under degenerate inputs (like a near-empty histogram where hist_max =3D=3D
hist_min), the raw calculated gain can reach up to 524,288. Because this
unbounded value is fed into the EMA filter before clamping, (3 * gain_old +
524288) / 4 evaluates to over 131,000, which is then clamped to the maximum
value 8,191.

When normal frames resume, the state is pinned at 8,191 and the EMA makes it
decay slowly, taking around 15 to 20 frames to return to normal values. Bef=
ore
this patch, the unbounded gain was directly clamped, causing only a 1-frame
flash.

[Severity: High]
Could unconditionally applying the EMA filter here break the 'Do White Bala=
nce'
(ISC_WB_ONETIME) feature?

The ISC_WB_ONETIME feature performs exactly one 4-channel Bayer histogram c=
ycle
to compute and apply white balance gains, then sets ctrls->awb =3D ISC_WB_N=
ONE
and stops requesting histograms:

drivers/media/platform/microchip/microchip-isc-base.c:isc_awb_work() {
    ...
    if (ctrls->awb =3D=3D ISC_WB_ONETIME) {
        dev_info(isc->dev,
                 "Completed one time white-balance adjustment.\n");
        /* update the v4l2 controls values */
        isc_update_v4l2_ctrls(isc);
        ctrls->awb =3D ISC_WB_NONE;
    }
    ...
}

By unconditionally applying the EMA filter here, this single adjustment cyc=
le
only updates the gains by 25% of the required delta towards the target.

The one-time AWB fails to converge to the correct values, requiring users to
trigger the V4L2_CID_DO_WHITE_BALANCE ioctl multiple times to asymptotically
approach the correct balance.

[Severity: Medium]
Will this integer division introduce a truncation bias?

Because integer division truncates towards zero, when the target gain is
slightly above the current value (by 1 to 3 units), the fractional addition=
 is
truncated and the value never increases. For example, if the current gain is
512 and the target is 515, (1536 + 515) / 4 =3D 512, so it never moves.

Conversely, downward trends track effortlessly. This creates a permanent
asymmetrical bias where the smoothed gain settles below the true mathematic=
al
average. Symmetric rounding (3 * ctrls->gain[c] + gain + 2) / 4 might resol=
ve
this.

> +		ctrls->gain[c] =3D min_t(u32, ctrls->gain[c], GENMASK(12, 0));
> =20
>  		dev_dbg(isc->dev,
> -			"isc wb: c=3D%u black=3D%u avg=3D%u s_gain=3D%u gw_gain=3D%u gain=3D%=
u",
> -			c, hist_min, channel_avg, s_gain, gw_gain, gain);
> +			"isc wb: c=3D%u black=3D%u avg=3D%u s_gain=3D%u gw_gain=3D%u gain=3D%=
u\n",
> +			c, hist_min, channel_avg, s_gain, gw_gain,
> +			ctrls->gain[c]);
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-microchip-=
isc-fixes-v6-0-8c3d7474a768@microchip.com?part=3D11
