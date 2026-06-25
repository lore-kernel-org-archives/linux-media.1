Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5944D30276A
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 22:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782428040; cv=none; b=q6DYQUR23c5N8KHhId9Lw34QlzytuO6x9QglQ3Lr3EMdHWR8LSzqkpipFonVDRAN70ibpQWw+TIsvTB1T+2QKsT6Iq+G4BDzXHNiANoJVjxJR3loZafDzxnwf8bdk09MpQZZ/JjzsjBxUtHzoRvxvrOM6Gb8USCtMfn5WYBDuuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782428040; c=relaxed/simple;
	bh=7fiS12j7bQZNpCRzvLXyku/RBtw5uOONc9X0aLq5zwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThH4hdihubn8wUBYPIq2QlVMz5onFELp0VDX9YCsabPBmWUkZ5Vgzx0af2eG1Q9eATUfy5rXUdQ6V+PWN1qVdzSMxXIdxIC5KiNjjm7kPb5jsLyPLzqF8LQTs+LjcjrfK1+g4o8sUcBtrmjLZB7i6+pddKkKgh9kqeja+1XuwTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifIYZaur; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifIYZaur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F8F1F00ACA
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 22:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782428039;
	bh=5KhXRWCuK/XmrPYnJvjI3hgbQBxE2xU9age9q7hTaGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ifIYZaurK5ZvnNy2iuJ1LIGOFIlzI7u2NMxyAWpXuBpGu26tJ8Mq3fOAlot48sM2d
	 ui8qH4ZDUewUV6Xq6G4LU1LSCI5vRBeZ4x67MY941U8jzdNv3WL16CPxLQt0Tc5ih+
	 Jte6A1GPgl3Or0Z8b3m2OSQifZQmoM0bB+xrjHrB3cgWW40IuoR3Pi/pPM7vMiWUJE
	 0niufcgc3fOywHRFVcD/L0a82/DEtObH4SeNT/IGKZP6bgeapH0nCxlEOVtcjZTQla
	 BHv1c/uA4XCmoZLtaFeZ+hFN/7N1q+UBPjE7/GsInKtnOtR04s5/TeeTKf7rUcRWVM
	 IRlXBTGHRi7Uw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aea1776279so181013e87.2
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 15:53:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpKtQ2i4DsY4BKKef5JAQyeZ9YIFYkEqmsitmD9L2JyrN1rM4NRko3RKD4jUz1HjxqVuu86/6JuyZueoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4M8WYbhtvYS5o0wEx+cmA56wV8IdrQSG5HQPLS+2FNUuXzgP/
	ny0cpRJhnuOjDiip5Kn+LXivonACmPCtMKC6ylBb0MYW7wQhAyFgU1qRJl4dF3uHjENNWR9FW68
	APPqWJHCdFKXuj+P14oy89AmNL6UYEow=
X-Received: by 2002:ac2:4f16:0:b0:5aa:6c89:72d8 with SMTP id
 2adb3069b0e04-5aea1f48d09mr1100301e87.19.1782428037746; Thu, 25 Jun 2026
 15:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com> <20260616-mali-c55-ccm-gamma-v2-2-0f93e9a95d98@ideasonboard.com>
In-Reply-To: <20260616-mali-c55-ccm-gamma-v2-2-0f93e9a95d98@ideasonboard.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Jun 2026 00:53:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=RmN0HHYOSg68V5OQggN4uCdWdW2d+qA0GWgUv-51Rmg@mail.gmail.com>
X-Gm-Features: AVVi8Cda2v537Wyx65RtXGeXOXsAaoJeo0kB6jVVzXbzKIShEGxVEJAohZWZlLg
Message-ID: <CAD++jL=RmN0HHYOSg68V5OQggN4uCdWdW2d+qA0GWgUv-51Rmg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: arm: mali-c55: Add support for RGB Gamma
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nayden.Kanchev@arm.com, Konstantin Babin <Konstantin.Babin@arm.com>, 
	Anthony McGivern <anthony.mcgivern@arm.com>, vincenzo.frascino@arm.com, linus.walleij@arm.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

thanks for your patch!

On Tue, Jun 16, 2026 at 4:36=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:

> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> Add support for Gamma curve correction for the Mali C55 ISP.
>
> Define a new block in the uAPI using the extensible v4l2-isp format and
> implement support for configuring the RGB Gamma parameters in the
> mali-c55 parameters handler.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
(...)

> +static void mali_c55_params_gamma(struct mali_c55 *mali_c55,
> +                                 union mali_c55_params_block block,
> +                                 __u32 offset, __u32 lut_base)
> +{
> +       const struct mali_c55_params_gamma *params =3D block.gamma;
> +
> +       if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +               mali_c55_ctx_update_bits(mali_c55,
> +                                        MALI_C55_REG_GAMMA_RGB_ENABLE + =
offset,
> +                                        MALI_C55_GAMMA_ENABLE_MASK, 0x00=
);
> +               return;
> +       }
> +
> +       mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + o=
ffset,
> +                                MALI_C55_GAMMA_GAIN_R_MASK, params->gain=
s[0]);
> +       mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + o=
ffset,
> +                                MALI_C55_GAMMA_GAIN_G_MASK,
> +                                MALI_C55_GAMMA_GAIN_G(params->gains[1]))=
;

It is a bit of confusion for the head when GAINS_1 is indexed to
gains[0] and gains[1] because the register i split.

> +       /* We cannot apply parameters to DS if it is not fitted. */
> +       if (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED))
> +               return;

I suppose this is a HW synthesis thin? Whether DS is fitted or not?
(Just curious.)

> @@ -425,11 +425,13 @@ enum mali_c55_interrupts {
>  #define MALI_C55_REG_GAMMA_GAINS_1                     0x1c068
>  #define MALI_C55_GAMMA_GAIN_R_MASK                     GENMASK(11, 0)
>  #define MALI_C55_GAMMA_GAIN_G_MASK                     GENMASK(27, 16)

Because of my confusion I would rename *GAINS_1
to *GAINS_RG..

> +#define MALI_C55_GAMMA_GAIN_G(x)                       ((x) << 16)
>  #define MALI_C55_REG_GAMMA_GAINS_2                     0x1c06c
>  #define MALI_C55_GAMMA_GAIN_B_MASK                     GENMASK(11, 0)

.. and *GAINS_2 to GAINS_B.

This would make it clear what the registers are for.

>  #define MALI_C55_REG_GAMMA_OFFSETS_1                   0x1c070
>  #define MALI_C55_GAMMA_OFFSET_R_MASK                   GENMASK(11, 0)
>  #define MALI_C55_GAMMA_OFFSET_G_MASK                   GENMASK(27, 16)

Same here *GAMMA_OFFSETS_RG

> +#define MALI_C55_GAMMA_OFFSET_G(x)                             ((x) << 1=
6)
>  #define MALI_C55_REG_GAMMA_OFFSETS_2                   0x1c074
>  #define MALI_C55_GAMMA_OFFSET_B_MASK                   GENMASK(11, 0)

Etc.

You might have good reasons for this naming that I don't understand
(like they are named like that in some documentation, I checked the
register map document but it doesn't seem to name the individual registers
but call them as a group "fr gamma rgb".
Maybe I'm looking in the wrong place.
so either way:

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
