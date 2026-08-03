Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD63426D0C
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785778687; cv=pass; b=Dy6O1BKXui70ybDRyWsTL9PfAr0aco38KRNSw9iiSTdv7/+Wkko/Q4RUg4Dh+3Le3zadQrJVuwNpURhmqNe6FpyoIppTI+wIy1nsl+YEDRZyNT31caUKR1qdFdpWPCLNddRobo9porP941jYihLrIzr9VJ0lTRmZcPGKK6Z+5Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785778687; c=relaxed/simple;
	bh=fED54AglBaOIWY4v1dlfH5+jBD/TkjG4+OlNhKcmKpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HY0WRixetEc5sv6tE9Y000h96jbC3tUbjZmo8UPY2KgzkG7JomU7Yy3LLgtHvTKirOBawqJ19ihmgBZiDI2K1ZPZwvpdHU8DkVpyfBB3Iag5YgJxYxlds28XW02QFY75P0/y+IkQwx6+1i37Z4cezqZTC61u+COg+ZRusFXBTLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MyjGPyhz; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MyjGPyhz"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-45837e52d8aso1363754fac.0
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 10:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785778684; cv=none;
        d=google.com; s=arc-20260327;
        b=TyvEg6OrAx4FdhHkxZoN4KVokGI6xg0t9mjhpAUntugXAHmJipuluPb/GfsWZRfIC4
         Di2l2GrX3gFWi92CBawQcKTRSGGU82sSz2sjVvV1xubE4wJaoK46IDA8ehB9/q2ZJMQs
         XaEW0G/43kNWbENxN9Oj7OhUDUssYBafsOyt9yRA5Ci+H1ekyJyAvmXeqMNp0YymFOWk
         S4paKnSqV76f5dWsMKrV/a6USL0Tk2gIgOVeNB0PdjlPC/0NHl9zxtN5t8l37QbqhMjj
         foQsN+CUgbmzeQvIW3IByVSLff7rwvn84IkaHJUvZ9+SnxbzIt2/F3xSOBf5TiHmD+Vx
         kVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VthlhOGQJXIygUP5DATqpLoeK2ok5Ycn3uncSQhsgaw=;
        fh=O+oqcSg2JieTKAnk0UY3sSQo4DPWdosOJlPZOYJVf6Q=;
        b=RzMvlpPQ52Nt680xydPCuFBVJJqRE4eHTswnTpoio4VRUdpsZlvffMOcYsPiGg8AbZ
         yQUCegl9RyFTyi9BRdS25RvQiWLFnCehJfTPmAUq7yot0/0NATKOOu7+hzvXW1OrUj/8
         oDLeLJaML+PsybcgnLsBD/ggJ47JcSFvouYFyk6whMNU924EBRVq2XW54Nt/eMcn9qI+
         rPDxDZKfJuA5ZlGkYEpClZYRRWRW6OAEKH/HK/r/ZqvYJB8Efx4lO5FdhqCytOCTBut+
         jdiGp4msSSSR8EiL15YoxV72YOYjYtaPEkDnTUlYUPltirdhfMlZkuGIi+UvhpY8qj/u
         qBsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1785778684; x=1786383484; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VthlhOGQJXIygUP5DATqpLoeK2ok5Ycn3uncSQhsgaw=;
        b=MyjGPyhz9IEQeeCZnfIqry2IA2geqLHoXnqyaFmyxXmO2KrrOD0GP2dS4zW2uxE06g
         kn6wt9kXAZuBc0uBJjRD/gd/0nkzpBSbxTOKjqcK4updFn6OujssRnrIL4+s2kgLh02X
         v2N09kZWhaeumFJUeBnhqn+EsgTC4osIyzg/yh32+VeKtmox9V1HJ8dOIPTtX55Zq6AN
         oXFyurATip1gZWEket9FPGnN3XxeLuZa+BWL2dI51Byc4sV/SmADvL13EKRFgxuTfZKu
         i+qtHnPQCcubdSOI7kXksmWKMDCe+nINc3z/Jpw1uy3vutYIvyC0xjnJVBxy28Z40+d8
         CVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785778684; x=1786383484;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VthlhOGQJXIygUP5DATqpLoeK2ok5Ycn3uncSQhsgaw=;
        b=hVUmXAZIxZDrbVi6kKMbcJRUGR0u0YPcyF2AEXEwK/M81f4NFn+sdblCYV9H6RNDS9
         /Hur9w1vXp+xyTwXBXJiLe01m2kesEd/bbhTGn6Pf5DgGEjVPYJ/EfKliHIWsQhBOvNO
         05K8qbByTG+BCksHVTG6J6q7kj32lqnbumxQJVqB/el81ZmxU+MrrKWGWKpAw37GTOOH
         T6OGiB1e4qSVniT/OYqrFu4Zw1VoyFBBaYaIOGgqOtEHg3Iqt2eYP2eGL1QU+d543XFs
         Wvv4pIO97mQqekVF1irt1hAbltcLtOFExgocilbSzxMZEX2/UFltRK+qqhsYispxVYho
         11Dw==
X-Forwarded-Encrypted: i=1; AHgh+RpaGWOTuPyIZrScVnYTuhTiWmcuSZ0HkVoxW7Yao8EW66EwJC1nDz30Bra/B2w86Fi2/ehItfpg++Jliw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsaGyvBbe0TLrMOMlfFvI6K3+bh8HO1vElmLxDMxfiCR7oyUln
	e6DJTpAho5NQZMaUARszJgq+plURqF+Zd5n44Zr4Q8AK0JUzZ/927ObfwiJWwS3i7etEJDvpb4g
	Bizq+01vLXiF6j12r9MtDVaaDf2cf+kd060nL6jPScg==
X-Gm-Gg: AR+sD13zejHKZN3Tf+6caAXCuLQ1C4mVV2MR8hHfZh1c0DDSazQlLfjMqLyo40u2T6E
	ePZ+eLZ/p0B0RUU/sQMXkzEeiPIipQN49K/C8zDi2fyh7BuEnUdTWCrSrKvCmcpJvg6PnTMZaf+
	q2/uAMW+JrYSjAc8nORqm9IGah+PsI5i9GqZTUY1X1/qK2JSNfCWexZZNrbpbB+WHvxybwcFm3E
	q3JA108aP99+mUpV7OujAo/gYKdQauNVRCU9PMTkLE2hqoSmlNqe4MPWOHHeYCcm5KxSKxp3OEr
	JG3nRDmj0L3BMS4QD5MFiWucyAdfj9BjhYNH32SvMaYSS5fXtp6GNNR2MHX/BuuOSif8V+SYk53
	TmVezx9yai3j0OAy57jM1eSnWOCktiABAfYfILmR81WVR/s1vt+63eBZ81pOm11tgGJEUDg==
X-Received: by 2002:a05:6870:a40b:b0:43d:38f1:854e with SMTP id
 586e51a60fabf-45905a60abamr15360483fac.16.1785778683768; Mon, 03 Aug 2026
 10:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-3-lachlan.michael@sony.com> <20260803005333.GE1927055@killaraus.ideasonboard.com>
In-Reply-To: <20260803005333.GE1927055@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 3 Aug 2026 18:37:47 +0100
X-Gm-Features: AUfX_mwaiSbRzqab_uNN2X92ncFvn27Hn8KT8HTw6Ek2_UImIpmFCT3Z9AQg1yc
Message-ID: <CAPY8ntC1T4_orgvxBRqpqux4V90d5XZ-3KZZKoqnCPkbf6wE0Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, 
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, 
	Tim.Bird@sony.com, Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lachlan and Laurent.

It's brilliant that Sony are getting involved in upstreaming drivers!

<snip>
>
> In his IMX678 driver, Jai hardcodes the pixel rate to 594MHz, which is
> 8 * 74.25MHz (IMX908_XHS_HZ). The rationale is that HMAX is expressed in
> units of the 74.25 MHz internal clock, so we assumed that the pixel
> array is not read out using the link clock but using a clock derived
> from the internal clock. The multiplier was chosen to ensure that the
> minimum HMAX value corresponds to a positive HBLANK, as negative HBLANK
> would confuse userspace (and developers). Having a fixed pixel rate
> greatly simplifies the driver, as you don't have to update the pixel
> rate control, and HMAX calculation from HBLANK becomes a division by 8.
>
> We're not sure how the pixel array of the IMX678 is clocked exactly, so
> I don't know if the above corresponds to reality, neither for the IMX678
> nor the IMX908. If you could provide more information about the pixel
> array readout, that would be greatly appreciated. Note that the pixel
> rate value does not have to match the physical readout clock, as it is
> only used by userspace to calculate timings (to convert between h/v
> blank and fps).
>
> Jai can provide more information if needed.

In case you'd missed it, I'm trying to convert Jai's IMX678 driver
into a generic Starvis 2 driver[1].

IMX662 that I'm interested in is streaming with a total of 7 changes
to defines or const structs in the current imx678 driver.
IMX675 (5MPix Starvis2) frames with a similar number of changes but
currently isn't giving me images (test patterns work).
IMX585 looks like it may fit the same pattern, but I'm waiting on a
module for that one.

I'm therefore looking to parameterise those diffs but otherwise keep
it all common. This avoids the hassle of having to convert potentially
4 (or more) drivers to the Common Raw Sensor Model once it is
finalised.

IMX908 here looks to very much follow the same pattern, so unless
there are additional diffs between Starvis 2 and Starvis 3 it would
potentially fit into the same framework.

I'm hoping to get an RFC out this week as I'm then on holiday for a
week. It'll be interesting to see if IMX908 will fit with the same
pattern.

Lachlan: Are there any particular people we should contact for details
of IMX908, or just go through our normal contact?

Thanks
  Dave

[1] https://lore.kernel.org/linux-media/20260312150437.1091195-1-eagle.alexander923@gmail.com/T/#m6072f85b03811932427597d8ffe5da008d33246a
