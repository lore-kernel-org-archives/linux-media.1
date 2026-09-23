Received: from mail-oa2-f35.google.com (mail-oa2-f35.google.com [74.125.231.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B1A53A386
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176185; cv=pass; b=ll5Xqi+pffBBpTcqDL4jSYJKOo7DWVz/om7b6E22ETQ/IqJkc0lIkWRYqA0xHtaGPSYNUmE79ssWWQM5s+uuAJa7TTorR4gdLLgiBVbheKBBhHV7ompVCs6gTR2iNihbpIGaveGAfh573/2iVI1ICVJJOoHdvaHeI5LUhRocV3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176185; c=relaxed/simple;
	bh=vBDDxkg/4u2xvKLK14IExq0ujAdn9caw6bDOuJLuOA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6St/kg/s/Y0hDDtl9mj03RUhdjbuNGFaQ4Pm2hfIVJ6/43/lHAYNQBCAqbZ/tpt5lTv6bqhjgXvDcf1iiqNBFzULgAaL3TomzppAipLgZ4xoOMIAiQovFAx5PRxa/mk/RkPrvfSV0fX579TT4vbyvAW+ocfyweH4ZWq551UvKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=e1X3Aqz/; arc=pass smtp.client-ip=74.125.231.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="e1X3Aqz/"
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-4881ca701a4so637772fac.2
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 08:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790176182; cv=none;
        d=google.com; s=arc-20260327;
        b=ACBnGtaZAlSvl+y2D/R3dcMOWKMrSkXSiqGAkJ1vLHEVXTU2SI7X+tPA7muIKOjG20
         i1FSERClij4JrHZbSYMPypO6lXuAYibOrGWTNNTw1/192o+6adWIYo1jIyQgA2YXhroa
         WsMze6b0CT8oreGHTwZxFjOomS50xjYjiYRJtd3/9oTQvQ+j0g56NXb0YvplLjvgeJQa
         9Qth8LsGn4JfmGYSARvQqGuHO1xaeLOC0NMyL4uMxqBRXrLbtbVhMI4SgkGkNiqqD4PB
         34Ou4nESmvzp0Xst2ikZ1Hd9QI8pUlHWVTEdnYVu+lX0bYubQznbrIeccfSosUK9lcTF
         FKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CwM5I/T1IGiVWnONvAr320V4SRpC4B1cuoZUTNeL2UU=;
        fh=dTMRj8nNFhobQUfxzVXukVoi/Pblk5Hr7lhOwzvqzi0=;
        b=aUtdPRtHSAXxenyDHx3BqCs1SGVJZYCTZLqj9v9t2xxAsOZGcYUIBgyYSHW0rOe6X5
         pfkC2BvOVIrMfm5bPqQWUBtAuI7SmWg2XvvCU+BLFgyExAVCJTmnIBOlTMrSKJo6QtzE
         KjE742iyh+SIttHlnOrSzK3jhoumbJVHyVesjZw2iI42Ixr+Mi/SW0DQHaD81JvPR5MH
         Qv09rbFR+a7bI+3gOxvFLSDnsNtPBP0KP53KuDGWhx+VXEQercCi3FUmfvqtY2vKGg3S
         dkpD2g/hSVWTVk/qnLa6umJzz2OEBuIrqkoU8JdtoX8FWGqgnAFuQOo3HGrSpi/r4kM+
         RfCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1790176182; x=1790780982; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwM5I/T1IGiVWnONvAr320V4SRpC4B1cuoZUTNeL2UU=;
        b=e1X3Aqz/hHRoClKqDLuoluA3yZWOd+GzH3ZWxoj/NBJ38on0aEl6uYYBkqPWbK544y
         yDl89Dj3AMW+Cy+XmZlQb9plNKDfIZ3EC9RggImo8bLvoVoQ+cFYZkRuTTmc54X98D66
         fftqbjFJL6keOyG00rKYcIKozYqGT0QNyUbQycz5Uc7J5uig1tQcqc14fz/MdJw9mtJL
         X9T1PQZ0kvXdXMwp5oDY+aDkassH8j4yDON+yIzwGu7GAYPse9pVHnoKdrF2jEdMlhrH
         ZgCNfDh2E83ext6JB1rSdCNDqAi7uTtnZt96sjFiZaZpDIVT/JzScpiKKJAn0IKxJZNs
         GMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176182; x=1790780982;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CwM5I/T1IGiVWnONvAr320V4SRpC4B1cuoZUTNeL2UU=;
        b=WPK08QFEq8MOIbjo4+YtMbxoiEzi0iOd+qaSVs+hv4RqhMpY49xFB6xot0mOJMLcgb
         +VhD0MTHMOuSwcEzLbQrtxMTCv6ZzQMgTeBqF/4uR8HyzQB7LUyJE8v4aG1cTl1EjNd4
         2tCx8laIaMmQ8MXBiH8BY/SqrXPr6AKAlwCpa/xLcXJl2ZLpaEoR1+pJUeeCZNjRFLyq
         JduocauETXFTXqvDATyO/hKgdqCf4COyri8aL7LhiGSbSktiM4P2uBrY1eebdUkXlFmo
         vl54pebdImTdGq4udwklYaJayZTzW3s4d3ZL2r2ij0vYZN1Sed6zV+oPYEPg37YbSBlw
         fw4A==
X-Forwarded-Encrypted: i=1; AKwUvBzWkU0KapG/562+eiA9I10yL71+u0qQzRyiZgSxakz26Ag9CAbj0kutsmy6f16HR2PK4KI6aYHdUgbR+w==@vger.kernel.org
X-Gm-Message-State: AFuF++k4HWT6YkSFSiQIOM99sqxVQj80jgWlCfAdBp6AZY02CJTMe3Y3
	Fh8bEfrkxTsCeQLClrChyCiDwB+CztOB3l1TASsiwk86UQafRE7c+uigMASec3J15QYR1hlFB+F
	YHk5mNIFkvgEGt9BkQaHOutFY3IFOfw6UqX6C53qe07u9aboXpqFGcjQ=
X-Gm-Gg: AYBFou3l7Dmj2Tl2x5B/QE1reU2Lv8yeLK5UC78YK19lecpfX1SPoyDd+lpJ0NmEp3O
	xd13tzKFval0Ph4ayRBOIYXoVl7H89y1CLk7KysNEIQZUEADQTBvd0ypH2xFBLQZtxGwLL8bJr3
	zaR2cb8+FjIimtJLwGHpos4o4AhK7HhnpppXazZVMbXn3XluCbECDvzFupGtzhn1W72/bNi5TBp
	U9dArppdbKs9Wf/6clvpR2j/lnU0exd5Jrl2L/otkmSXHsbBsK5vMdmixdqc492SDvpAkvssMSE
	Uam7ZWyG6NPhch7CCYrSLMqRHHUijj5oB9qhA5zMK5Cjob/DWt2N4HbrnRGLd2Hszm/h6bvFnBO
	LcVqYoNl2ezhdspbJnDrY33Xv1K8V0CmL5aJn0yndwZQtWI+rkZD0XWxfF7rWwfzRdICIliKC8+
	hkT7GtFg==
X-Received: by 2002:a05:6870:b2ec:b0:48f:e21c:cd72 with SMTP id
 586e51a60fabf-4908c3cc5f5mr2967283fac.57.1790176182078; Wed, 23 Sep 2026
 08:09:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-ov9282-fixes-v1-0-f520af59df1b@linux.dev> <20260914-ov9282-fixes-v1-6-f520af59df1b@linux.dev>
In-Reply-To: <20260914-ov9282-fixes-v1-6-f520af59df1b@linux.dev>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Sep 2026 16:09:25 +0100
X-Gm-Features: AclHuK8PSHi2moxp8iOY0QmIwCxXJthoUN8UYH9v0j8kmRsVHSJdFCXjqVWtIq4
Message-ID: <CAPY8ntCaRiA8MjVUU1V1KxGYRhA-oZsefM9rw0i5Us1ybVHWDQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] media: i2c: ov9282: refresh flash_duration range on
 an HBLANK write
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Gyula Kelemen <gyula.kelemen@advasolutions.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Mon, 14 Sept 2026 at 20:21, Richard Leitner
<richard.leitner@linux.dev> wrote:
>
> The strobe ceiling is the exposure time in microseconds, so it follows
> the line time, and the line length sets the line time. Writing HBLANK moves
> it and nothing recomputes the flash_duration ceiling.
>
> Therefore add the missing flash_duration range update when HBLANK is set.
>
> The exposure range is counted in lines, so it is unaffected and does not
> need refreshing here.
>
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/i2c/ov9282.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index e64d8343c18e9..632184e76b9bd 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -674,6 +674,19 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>                 if (ret)
>                         return ret;
>                 break;
> +       case V4L2_CID_HBLANK:
> +               /*
> +                * HBLANK affects the line time, which then affects the flash
> +                * duration. Therefore recalculate the flash duration range
> +                * here.
> +                */

Except for the comment, this clause is identical to that for
V4L2_CID_EXPOSURE that you added in patch 4. No need for the
duplication.

  Dave

> +               exposure = ov9282_exposure_to_us(ov9282, ov9282->exp_ctrl->val);
> +               ret = __v4l2_ctrl_modify_range(ov9282->flash_duration, 0,
> +                                              exposure, 1,
> +                                              OV9282_STROBE_FRAME_SPAN_DEFAULT);
> +               if (ret)
> +                       return ret;
> +               break;
>         }
>
>         /* Set controls only if sensor is in power on state */
>
> --
> 2.53.0
>
>
