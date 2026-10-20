Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507213;
	b=nCKasXzpFYI71j+JTrVQkQaTHgrTk/egFWli/1Bx5pnbHuoWQjykMf8gxqU23+eSQnZq
	 +lDaPSdmOuEQtdUus//rJh36WLNkNOCPy/wHEIOvsOhMWHjzn47bivBZEFTpOgOqDV7qL
	 lvU0Eyd5pUrEbueJ5vFrnGDTF6LqFqWBu1MR7BhU4ULZYZn8z5NiOrdSzc3WHvM31kknS
	 3osHbo6bvwaJsdyMpwQBnCiJQR93MjZERVlFyuY+bv++xUqZaoPADXQMcFOkP0MjATPSr
	 YsnJ3tTZEhDA8NfiExkGTeYeRdRrjCbJWM3u080BvCk6kVHemlvjPFiqcBTBNyc3nPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
	b=mGpfQCuSAfjmc7G68GQsdSTmWxbrTsdq+cgI1NLAM9W/LIvH5YA+fNptW+6NXUeM7AQS
	 dE+oRU3KyjwXW66Mj645raBhbl5Dy4dD/a/bPOa8C/6zkxtRPrtLD9ZBY37koiHxuO5qf
	 rP2+p7tkUhob07rFVmCUff6rlhO9Y2wN6dEG/5Gww5liG08TsiwTjPPMBeTGnFKCYxGAt
	 NWe6rlX+XrnMgp85RR7LUaWD/sMwiFnAX/ZPhcALRXVRKjoW/wvrcMzudItsqQXPTHCeF
	 vknzS2fvZ1OYVwJKxWx+GPNYAMjEh5D+tki/sHI9HorqwUaACVpoBgVVuU9RpkBRnCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=WvwCbSdy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5564606A31F
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5564606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=WvwCbSdy
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6df0b02fe91so476782eaf.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 07:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792507211; cv=none;
        d=google.com; s=arc-20260327;
        b=TCzMYgvOXjFnN6uayczO43z9u9RmssYPUj6rcZoCd5xnDmFnqhmw564DuytZ4yYQfd
         750s/8wbXMKOBs3Yo+aKsvZJ9Q8Q5MoI/w2SdrcROaSnp6jjoSROuU0YLdsCgDW5MdpO
         4p3fu/7Esqf83Cza7VY+1vw8foj8dgJED+asiw69N54kbteOf8/YN3EEFS2PYbhxdmr5
         lW9STm/jYfsj9D50QrZEdRvKVSK2iLSnCIrTYN9CYAGjo7FgiLZEyGzxQzmKiLhoVS0y
         9gQQG9wL+Gmv5ze/pF9RznoFI4PmKnOofOgyCeVLuRbtmLJ1YCoRwTusY6ckhsz2j1kC
         YrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
        fh=bpal51SjzeLLft27ZhB47C2LXqVX3EyM6JvAmkb0JCU=;
        b=TZyrN2nm6Wkyn6/Oj4P02YgkMzX7m2PZ7cyQRtOIriEWrzgsXo8j5n6DG9Np7jVBSY
         g6fywq5SqM11XAMI+Uzroq+e4ZdV2Y4iV/ecV51TbCZakkRUxjkbgktQmJs8TOoWrifj
         VYbTx7jLS46QG+z6GrHRYp5GFWBBPnlDUKEas6CSZL69yhUccSoOB/2HJpuQIU4lJcAr
         7DKhH3ZA2yICJ7gz5nCN98g6LZblEaSWAsl/PZGoF7Ek74fyrUfwJG/74yV14loCUVZW
         FvgLIcAMrMx8x1IPHptJuf7TAWGDRHNGJtaQs+YJqyC/Z2KmTmqRuGfPQNcYdpsUhcSR
         Py+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792507211; x=1793112011; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
        b=WvwCbSdy4mFbRP0Z9mmRpjdi7P5JJ+kT64vHfsZXHc8len4YlB0M5WZVQl/djl4Mgc
         b7Ocm/5U2JANl1OMj8qO1Z2K6d9kMKVacAWWiA9qxH2Sd1kS4n8zzFhJCbvcUIAVhvVO
         npDLsm3kTDmIJ0JPk4wyDUUODCTY5XxQ5gF54b1xOpJzmrusp56Rf6QI2dNGlufbCSHn
         owbKJ6AKKX+6zCjo1EiO3kLIFiC1Msa289o+VrwQM1JJs32VsSvUTc3ksUVV2n8aYJsH
         mZ8jGcUgJ4WkeiHdNYL9ZD290/GDvriXk8MVzIMnOV3Kv/L3Wi8WtDqQq8BFi1fXOp9r
         UJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507211; x=1793112011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zAYhqF7UHNil85yBBTWI6ys7OAUDS3/xjzlE+sXIqIM=;
        b=xpY9Jil7auh0H8iaK7BASE+mfGvO4S4PriiPZAa4S83yb7++d+hIWoF7hQ5FKnJzN4
         cQGxZTnwdR3ZJogM+FP5kJX4ImKrONVfzwRMy+IfPqwnXh4eYfEtAj3oTaJs84piXArC
         KpB+9WBM4++hNwmSKcQ45LZI3wfIwgg+h/wI4e9Tzdez81FOSy6fjF0kpN/SAO+WlpgU
         K0z1qAn4dllZVj/T0eJbjkNmzrniFUc/7eK1Sv8wH5h+b2AI9pulp7wytplbmll3gj9q
         bdPgC5ih0hLhSpk1XYZcjD6Z8ZuufycD9P0CaJqPhBQamJSsz4wUsQH0OtWhdvGYLvyK
         SyIA==
X-Forwarded-Encrypted: i=1; AKwUvByOcEPGbDdVB1CnxJzcdAI11WumxFhJM9f7QdJHGarbog++FEFRo8CG7q7T0qPJw1wi6rE9wzdrCJajQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6tfloa2xFlJ+HleDPvPXsTEhluW5xZjSSJETVv8si1B1brsIa
	vGG96bjr3wh0Jy98M2I+8Wi6evJh1J09Uoppq3P+GKEpGIBUx6xeiasftRa+PZy4L2I2JvdkUYN
	N4Omaqaz5H8ZzDDSDsMtLe8hOb8AMzZ4u6ShFwN4+jg==
X-Gm-Gg: AYBFou2nTUkn5h9KzZ1Lp31ozf1dazoCikJmjDfIUbg3/dDFWtodhF0FcnICrfqVVIZ
	xG0WegYa4TDXUUhctcGK/7MhZsXaNzM1BL3BdBoxloMcXMZu/ucVrn01zHxgIPtR95+vBtInot9
	t0+eK3LNZsK2o8o6XIl58RjisJvsa9Id3T75HVuDSlBwbYwmYJB6LTLd8wiltLRJIvsm9avZiDn
	J5blFDMWjgr/MTAWaL1laExX5bAoocqWBn2QreIyKY1Kmvd+7lag8n+mqS3ELg/eiUufWfvBPJR
	ntB3B5W3kGE8WNc7bYUH4ZOurjQo9YGksA+o4w+XjXDzmMPtFGUYfXb9Gi2TpJPuePOhGU2p3Pq
	aEX+XsSv9snZqzn7nCauUgvoJZqRzA7MeZ2yOR2viMx/kdFbN7Wnw0bPPUO8/nxG+iwL3bY+D
X-Received: by 2002:a05:6820:2d03:b0:6c7:8dab:ca1a with SMTP id
 006d021491bc7-707bbe2cd66mr1550317eaf.17.1792507209625; Tue, 20 Oct 2026
 07:40:09 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-10-75fcdb4163f3@raspberrypi.com> <atc9Uxt_hsyYu2o5@kekkonen.localdomain>
In-Reply-To: <atc9Uxt_hsyYu2o5@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 20 Oct 2026 15:39:52 +0100
X-Gm-Features: AclHuK_b39VaTdZ3dmgtb-s5SV-tLyOzJVne1uRjIl6FFmaQNj3mm_E5Od-ztsk
Message-ID: <CAPY8ntD2C-7UTKX2Srusn_Tzx5KS3tnUtPP+piMYbUKZP91Rpg@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

Thanks for the review

On Tue, 20 Oct 2026 at 11:07, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Thu, Oct 15, 2026 at 04:57:36PM +0100, Dave Stevenson wrote:
> > There are multiple members of the Sony Starvis 2 image sensor family
> > that have the same hardware requirements as imx678.
> > Add them as options to the imx678 binding, rather than duplicating it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
> >  1 file changed, 32 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > index 098f72544216..027872a134f2 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > @@ -5,7 +5,7 @@
> >  $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Sony IMX678 Sensor
> > +title: Sony IMX678 and Starvis 2 Sensors
> >
> >  maintainers:
> >    - Jai Luthra <jai.luthra@ideasonboard.com>
> > @@ -13,21 +13,47 @@ maintainers:
> >  description:
> >    Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
> >    image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
>
> You could rewrap this while at it.
>
> > +  It is part of the Starvis 2 family of sensors.
> > +  Other members of the Starvis 2 have the same hardware requirements, and
> > +  therefore share this binding.
>
> This paragraph could be rewrapped, too -- the limit is 80 characters per
> line.

OK, I'll rephrase it so that it makes sense as one reflowed paragraph.

> >
> >  allOf:
> >    - $ref: /schemas/media/video-interface-devices.yaml#
> >
> >  properties:
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - sony,imx678-aamr
> > -          - sony,imx678-aaqr
> > -      - const: sony,imx678
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - sony,imx585-aamj
> > +              - sony,imx585-aaqj
> > +          - const: sony,imx585
> > +      - items:
> > +          - enum:
> > +              - sony,imx662-aamr
> > +              - sony,imx662-aaqr
> > +          - const: sony,imx662
> > +      - items:
> > +          - enum:
> > +              - sony,imx675-aamr
> > +              - sony,imx675-aaqr
> > +          - const: sony,imx675
> > +      - items:
> > +          - enum:
> > +              - sony,imx678-aamr
> > +              - sony,imx678-aaqr
> > +          - const: sony,imx678
> > +      - items:
> > +          - enum:
> > +              - sony,imx832-amr
> > +              - sony,imx832-aqr
> > +          - const: sony,imx832
>
> Should we also have a sony,starvis2 compatible? Just wondering.

I deliberately didn't based on the discussions Jai had with DT
maintainers when upstreaming the original binding [1], particularly
Conor's comment:
"Remember, having distinct multiple compatibles for the same hardware so
that you can induce different software behaviour is not something we
typically permit. While we do want to support all use cases, it isn't
always the case that devicetree is the right place to do it."

Sorry, but when time is limited, IMHO debating dtbindings just isn't
worth it. I've therefore taken the simple option.

I do have patches that implement that compatible and fully autodetect
the sensor[2], but I'll keep them downstream.
Doing so means that we have one common overlay for connecting any of
the supported Starvis2 sensors to a Pi.

[1] https://patchwork.linuxtv.org/project/linux-media/patch/20260520-imx678-v3-1-8b5f9676486e@ideasonboard.com/
[2] Currently the top 2 commits on
https://github.com/6by9/linux/tree/mainline_starvis2_v2, but that
branch will get rebased/reworked.

> The driver isn't generic still as it requires sensor specific information
> to be passed to it. CCS solves this with CCS static data (via firmware
> loading mechanism) so there are no driver changes even if the capability
> and limit information can't be obtained from device's registers or the
> device requires MSRs.

I'm assuming you're referring to the patchset as a whole as I don't
believe I've used the term generic in this patch. I'm happy to swap to
"common Starvis 2 driver" where appropriate within the patchset
instead.

IMHO Pushing the config to firmware files doesn't help, particularly
as these sensors don't have a common ID register and so identification
isn't trivial. It also makes life more involved for a distribution
maintainer to ensure they're picking up the relevant files, and that's
assuming that someone is curating them.

My aim with the series was to reuse as much common code as possible,
rather than submitting 5 separate drivers which are identical other
than constants and arrays of registers. Jai now has IMX676 working
with this driver, so that would make it 6 variants. Refactoring to use
a firmware file adds complexity for minimal gain, and you'd have to
special case IMX678 so it worked without a firmware file to avoid
regressions.

I guess the common core could be refactored to be a library, so that
you could minimise module size by having the sensor specific config in
a module that depends on the library. You're talking of saving a few
kB uncompressed though, so that would be quite extreme. I'd be more
tempted to have individual Kconfig entries and use #if
IS_ENABLED(CONFIG_IMXxxx) to conditionally compile in the config to a
common module.

  Dave

> > +
> >      description:
> >        The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
> >        variant (IMX678-AAMR). The variant-specific compatible describes the
> >        exact sensor variant, with the generic IMX678 compatible as a fallback.
> > +      The same applies for the other sensors in the family.
> >
> >    reg:
> >      maxItems: 1
> >
>
> --
> Regards,
>
> Sakari Ailus
