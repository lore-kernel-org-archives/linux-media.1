Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F243F3FA5D8;
	Mon, 29 Jun 2026 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724747; cv=none; b=JkXNYqGbyzFC+QsP/kKdKRSc4AE4i5VM9zLFW8VqunuZOkMr1TTW+IiroOgSXhgwhADzHPTMLPFFoFfCEEHPAi8oIIQBfREG91UhSHSaaEf+a1S4kZdL0z+khmSKXVht63E+AOf5nOJIl/SYluAD3aXpqsSQpB1bHj5/lypLr9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724747; c=relaxed/simple;
	bh=2dTA1N46iNG5U38cfhu/wWEVHOUYjxE9hVNHRPrD1Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNmJWR6w+C3ta3J9zJuFCUdtOGNL5jpDGrxzwOnllrAb23F/v2GdxURv5HgRFypEfL7Urh3pFH8TJoDhkjYDGtfyUy2Ey+E9QeNj8ylZ/KY5l+oiufsK9+W2/3OhDzzfNo9Jy2VDjgcX1UjEpZyFwu1UmUNSYCbnXnpgvxRDOPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k6Ziixjt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k6Ziixjt"
Received: from ideasonboard.com (mob-109-113-0-8.net.vodafone.it [109.113.0.8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3A35324;
	Mon, 29 Jun 2026 11:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782724701;
	bh=2dTA1N46iNG5U38cfhu/wWEVHOUYjxE9hVNHRPrD1Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6ZiixjtsPshO9wENWJ65GYgAmHiEFsw2E5oME1hwgnQoNfHCt1u1T8rfnXTwt8Zw
	 FY3Z0SgfaSc8YfADJ6UFX4tn6teDoclfinJW97ckzGwpESGLEURgnPpdkMIOgHPBTH
	 6jqCwWnjFhxS7j95NJHAo5o+1QyY65WCC1lyJ7YI=
Date: Mon, 29 Jun 2026 11:19:00 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	linus.walleij@arm.com, laurent.pinchart@ideasonboard.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 4/4] media: mali-c55: Implement Gamma block validation
Message-ID: <akI3qTMs_P0aJpWU@zed>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-4-113584c05174@ideasonboard.com>
 <79a5548b-39a3-4e64-8c7b-81ed6166a2c5@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <79a5548b-39a3-4e64-8c7b-81ed6166a2c5@arm.com>

Hi Vincenzo

On Mon, Jun 29, 2026 at 09:10:39AM +0100, Vincenzo Frascino wrote:
> Hi Jacopo,
>
> thank you for your patch.
>
> On 27/06/2026 15:29, Jacopo Mondi wrote:
> > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
> > Implement validation of Gamma block parameters.
> >
> > Gamma gains are expressed as unsigned 12 bits Q4.8 format and their raw
> > value cannot be higher than 4095 (BIT(12) - 1).
> >
> > Gamma offsets are 12 bits unsigned integers and their value cannot be
> > higher than 4095 (BIT(12) - 1).
> >
> > The Gamma LUT table is expected to have 0 as first member and 0xfff
> > as last member.
> >
> > Validate the parameters provided by userspace using the .block_validate
> > callback of struct v4l2_isp_params_block_type_info.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
>
> Looks good overall. I have just one comment. With this:
>
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> > ---
> > v3:
> > - new patch
> > ---
> >  .../media/platform/arm/mali-c55/mali-c55-params.c  | 34 ++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > index 5857e9c2daf7..e9ab0e2dee15 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > @@ -581,6 +581,38 @@ static int mali_c55_ccm_validate(struct device *dev,
> >  	return 0;
> >  }
> >
> > +static int mali_c55_gamma_validate(struct device *dev,
> > +				   const struct v4l2_isp_block_header *block)
> > +{
> > +	const struct mali_c55_params_gamma *gamma =
> > +		(const struct mali_c55_params_gamma *)(block);
> > +
> > +	for (unsigned int i = 0; i < 3; i++) {
> > +		/* Gains are 12 bits unsigned Q4.8. */
> > +		if (gamma->gains[i] > 4095) {
> > +			dev_dbg(dev, "Invalid gain value %u\n",
> > +				gamma->gains[i]);
> > +			return -EINVAL;
> > +		}
> > +
> > +		/* Offsets are 12 bits unsigned integers. */
> > +		if (gamma->offs[i] > 4095) {
> > +			dev_dbg(dev, "Invalid offset value %u\n",
> > +				gamma->offs[i]);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	/* Check the first and last gamma lut entries match the expectations. */
> > +	if (gamma->lut[0] != 0 ||
> > +	    gamma->lut[MALI_C55_NUM_GAMMA_LUT_ELEMENTS - 1] != 0xfff) {
>
> I am still learning about these things and might be wrong. Should not we also
> validate that intermediate LUT entries are monotonic and non-decreasing?
>

Eh, good question.

This all new for everyone, as this would be the first user of
'block_validate()' in tree.

Here I checked only the first and last member because it seems like a
good compromise between performances and correctness. This function
might potentially run for every frame (where a CCM table is specified
by userspace), so I'm a bit unsure how far we should go with
validation.

I kept these two patches broken out from the ones that introduce the
uapi specifically to get feedback on this. Maybe I'm overconcerned
about the additional cost of validation ?

> > +		dev_dbg(dev, "Invalid Gamma LUT table\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct v4l2_isp_params_block_type_info
> >  mali_c55_params_block_types_info[] = {
> >  	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
> > @@ -622,9 +654,11 @@ mali_c55_params_block_types_info[] = {
> >  	},
> >  	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = {
> >  		.size = sizeof(struct mali_c55_params_gamma),
> > +		.block_validate = mali_c55_gamma_validate,
> >  	},
> >  	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = {
> >  		.size = sizeof(struct mali_c55_params_gamma),
> > +		.block_validate = mali_c55_gamma_validate,
> >  	},
> >  };
> >
> >
>
> --
> Regards,
> Vincenzo
>
