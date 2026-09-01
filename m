Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045D0485CC4
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788281540; cv=pass; b=JfsNg9LONTxfxHxdFo8cohJHMKzXJXze5Zqmj9pCftWCsbBpB+NYFNXjuZ0ociZDLa1ncjMS97UZUEGywK5qH6Zyo005DvlIN6eiOLURl6BTTrZgYJPS9w2tKTtToMd/l0LlkB+I5SSa11Z3CvRosDHIzlar4i8YAEWFJwpb1hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788281540; c=relaxed/simple;
	bh=oiIv0r3xE+TFP5bqM6ciSFhWFdf9hUIfYxHHCLdczNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuXeNa2JN2qcO3OfIYZwlCpjUgBHCJp3wxsKaiwH0WnIbWwDp7d7wRwygCuXiM18oIho4h9h3L79K2yNvHpb1Ug89asQSp1mWh4ZZv9kTF6bCzrNqjZL9UZiN/qySpbh00mHNdPL7tlPKyMq2j2d7jEUR5mEVdpMXPhdyUVX7ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=aGQMMX0o; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aGQMMX0o"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b1ab6d7239so30052eaf.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 09:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788281535; cv=none;
        d=google.com; s=arc-20260327;
        b=AC5VSwDnZYx1264SgJk1IHiRe8mUU25DGFCfSigEpQB1spaO1RnoF1qLxL8iqL63uB
         A3K/VLVLJfZLYYoVGFFHKK79xByJH2ZbVC8c30Rvw0iJ3tp3jzJR98GIGtfUr6iYWXG5
         CmPWyuUOyFw16+/shtvVj2wRiXliphnAVp3JQgb3rJnQwdjDyZOXwAoakh7RtKjAPX5A
         Cyf6Dsipx0cX3GCgi0+1MKTuqZqSDw3PVljgc+pTO2rAx/0Yq28Gv+ncp/Rv7Zm5URMo
         gEHBFgEzIXMONJmTkjZLyG9YXsWgwZvCfgjTCJNdlBWksJjbHBa4vPM2ugwcWqRXs2Dm
         xfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=euL/xYtykUYtPWLGN8VRQ8kl65n5FLCkcY3H4v1jlE8=;
        fh=8aI2GmFVKZ6Dr4V3UJ5nhFLdgF/We8t1rkqRaa1GGZ0=;
        b=oDLxScZ2Y/SWGrFLeLzkzvn16L0hDY9Ad3+g7Fto2QY5no9Ft/0n8NlTpPMGpR/CYV
         fI6meM6hgY5ET21+g+VrMGDys1ZTGDiA+8Z+Cm1QJ5MX7FwDjvWmdLbyJjOCzpk+D/kD
         FRcbg7sZK6ArSkN6+8vzcmB1cVrZjHRnh8mbvZLWAgJFj9dbtOGVWoQD0bHjdQcrYrxy
         6KUFOI8XZ1PoqIFxWT+x7Rqez9gPlFhskgsK/vH1vu6milGFKnXBjrj33v0OvUH/w/oS
         xzVEJeWsiZqzA89xF/d6kzOkw6YJTdbo7h15qs27ryp/JDyVknfwsT3V4IVBKwMlh5Gt
         +H/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1788281535; x=1788886335; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euL/xYtykUYtPWLGN8VRQ8kl65n5FLCkcY3H4v1jlE8=;
        b=aGQMMX0oAIi4UTeHxGnxpDhMy95ikzV2st0PRIHZe3mFxTDBhLLs5rLnuJqAPDnKxn
         vzGV9/kZJyzV77SHU4a2t/PDyOCqpGSa65abGYkhp1y9Ugs3lX6W8L2qagnG1FnDSOvP
         voeOO9mXlvGPgbZ9xgkjc43Fd0ptaXOMxCicipmIVoX6USzTVy1YcL5MpxBt0c9yTQjW
         S5yWf3rhfGUz/0u8Ov6xf3nUAhvvgYV8Ip89/omCV4ywTtb8wodWdFL0jhXNf2KAxs3M
         VmEEcET+ONi5d2ZX16U6N7FsWfznQI2A5Xev0p66VGUrQYfVnMF6PA8GeLHtlov4xyFl
         gwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788281535; x=1788886335;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=euL/xYtykUYtPWLGN8VRQ8kl65n5FLCkcY3H4v1jlE8=;
        b=mhNeBdFXUe/O+jO76iCAHLZ9h/CGuHleC6iTLMNZhR+HHVPuJx7yBM9urkc6emiG4w
         Ywr8X45iQS1POxJXvNRIrUjSDd7ikMdnTcr2UEnMnTxRkxyW+qMQMy/TO5mSQZwpNxqW
         b2b8dB6UOSzQSB4USvxLdunr2okmHeDl4c5vPxeQfBGyJiIP79H+/LNdHsv1HkoLgNOj
         qxSZ0dHvoh4kr7LTZKgmKgQw4VnBHXghJR9WItg3HVWNEIhsaBt55pS8NCtJ2eT/GAZk
         2QYPqkbHoaGb3/cCE8VTCQByAbWQMHlByy/2om38sw9CRkv2AW2E5I2IADMcyYo3m56L
         CHjw==
X-Forwarded-Encrypted: i=1; AHgh+RrBqVQ4vEC8A7vEL9zb3wDga59nARxmHQIp1TtcrFRgMrcmHaWu+SV7x9TlMAMum49BLVIYZbdMen12Pw==@vger.kernel.org
X-Gm-Message-State: AFuF++nNSN7fI/I96O42j4k3PnHFIEYKVa6DedB0Ji6cV6GtrrRvgBky
	58MMC2YdoLFYP64aN+lsOUm9TTXWJSdhrxJLbg//6V5jS+BGNl3dFw2lMb80Haap99Duc4xzzi4
	4C/pjYzQO1qnFmv8ql9m0yb8CPq8HCEjvMaYt5Atg1Q==
X-Gm-Gg: AR+sD13WW5NQ6J55/2txjhnCxsymSanHp7e4HV+h7DEz9vhABrOpKNKcQNdyGqufdoO
	hSCxPRrsucRXSVFBx3KOIdnZaZxjeFsX24aCg0kwlZ6LJAj/JdwbSPqt9N0KBwkzKvIZKo5VBVW
	4Ow3KtDVqGOdSuH50zvLcyS8IODMFSq0m4dI70/nCA+NzRRJXY5uWCjHTLRqsV9UbUOAKmcsZvI
	/qHQAXY8fAbK+TpIt1dVyv4/24Xpfynj++nxd+U2Ce6SAVq2oVxYGEe0R5Hpj0IQUEgyTiF0LGk
	2gMgyxF1aMaIhqNk+l62w3RqynvyTJXezDciIpqGVg+uOrYQZsBd7Mog5oeSKzuouuwRKrSM3Fa
	1TDK+CBWdYG4D87+XNdgECiZEkec7gPl4VuN7ejRfOqgE1yIAhytY2y0cN/cFhSZXngsCKKPY
X-Received: by 2002:a05:6820:e053:b0:6aa:e70f:301e with SMTP id
 006d021491bc7-6b1c6430419mr26708240eaf.8.1788281535383; Tue, 01 Sep 2026
 09:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz>
In-Reply-To: <20260827-imx355-ccsify-v2-1-3a97bc708315@ixit.cz>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 1 Sep 2026 17:51:59 +0100
X-Gm-Features: AcwNN1UyRrhkRo3vpz-3Dcmc2lSb4osssqDcngioM1tIid4NNPEtyPBD1aO9Mxc
Message-ID: <CAPY8ntAWavYQ184V4vGzUGoV0Cp74BFN0qyG4KGBY24iV8i-rg@mail.gmail.com>
Subject: Re: [PATCH v2] media: imx355: reuse existing CCS defines
To: david@ixit.cz
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 10:26, David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> The driver may not be MIPI CCS compliant, but does use same address and
> often set same values as compliant drivers. Do not redefine registers we
> already know and are standard.
>
> No functional changes.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> Changes in v2:
> - Replaced all occurences with CCS ones.
> - Link to v1: https://patch.msgid.link/20260819-imx355-ccsify-v1-1-0b6cef77e340@ixit.cz
> ---
>  drivers/media/i2c/imx355.c | 84 ++++++++++++++--------------------------------
>  1 file changed, 25 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 8eb8588cb71bb..2c845b7b3df4f 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -14,89 +14,55 @@
>  #include <linux/unaligned.h>
>
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
>
> -#define IMX355_REG_MODE_SELECT         CCI_REG8(0x0100)
> -#define IMX355_MODE_STANDBY            0x00
> -#define IMX355_MODE_STREAMING          0x01
> +#include "ccs/ccs-regs.h"
>
> -/* Chip ID */
> -#define IMX355_REG_CHIP_ID             CCI_REG16(0x0016)
>  #define IMX355_CHIP_ID                 0x0355
>
> -#define IMX355_REG_LANE_SEL            CCI_REG8(0x0114)
> -
>  /* PLL registers that depend on the external clock frequency */
> -#define IMX355_REG_EXTCLK_FREQ         CCI_REG16(0x0136)
>  #define IMX355_REG_PLL_OP_PREDIV       CCI_REG8(0x030d)
> -#define IMX355_REG_PLL_OP_MUL          CCI_REG16(0x030e)
>  #define IMX355_REG_PLL_IVT_PCK_DIV     CCI_REG8(0x0301)
>  #define IMX355_REG_PLL_IVT_SYSCK_DIV   CCI_REG8(0x0303)
>  #define IMX355_PLL_OP_PREDIV           2
>  #define IMX355_PLL_IVT_PCK_DIV         5
>
>  /* V_TIMING internal */
> -#define IMX355_REG_FLL                 CCI_REG16(0x0340)
>  #define IMX355_FLL_MAX                 0xffff
>  #define IMX355_VBLANK_MIN              20
>
> -#define IMX355_REG_LLP                 CCI_REG16(0x0342)
>  #define IMX355_LLP_MAX                 0xffff
>
> -#define IMX355_REG_X_ADD_START         CCI_REG16(0x0344)
> -#define IMX355_REG_Y_ADD_START         CCI_REG16(0x0346)
> -#define IMX355_REG_X_ADD_END           CCI_REG16(0x0348)
> -#define IMX355_REG_Y_ADD_END           CCI_REG16(0x034a)
> -#define IMX355_REG_X_OUT_SIZE          CCI_REG16(0x034c)
> -#define IMX355_REG_Y_OUT_SIZE          CCI_REG16(0x034e)
> -
>  /* Exposure control */
> -#define IMX355_REG_EXPOSURE            CCI_REG16(0x0202)
>  #define IMX355_EXPOSURE_MIN            1
>  #define IMX355_EXPOSURE_STEP           1
>  #define IMX355_EXPOSURE_DEFAULT                0x0282
>  #define IMX355_EXPOSURE_OFFSET         10
>
>  /* Analog gain control */
> -#define IMX355_REG_ANALOG_GAIN         CCI_REG16(0x0204)
>  #define IMX355_ANA_GAIN_MIN            0
>  #define IMX355_ANA_GAIN_MAX            960
>  #define IMX355_ANA_GAIN_STEP           1
>  #define IMX355_ANA_GAIN_DEFAULT                0
>
>  /* Digital gain control */
>  #define IMX355_REG_DPGA_USE_GLOBAL_GAIN        CCI_REG8(0x3070)
> -#define IMX355_REG_DIG_GAIN_GLOBAL     CCI_REG16(0x020e)
>  #define IMX355_DGTL_GAIN_MIN           256
>  #define IMX355_DGTL_GAIN_MAX           4095
>  #define IMX355_DGTL_GAIN_STEP          1
>  #define IMX355_DGTL_GAIN_DEFAULT       256
>
> -/* Test Pattern Control */
> -#define IMX355_REG_TEST_PATTERN                CCI_REG16(0x0600)
> -#define IMX355_TEST_PATTERN_DISABLED           0
> -#define IMX355_TEST_PATTERN_SOLID_COLOR                1
> -#define IMX355_TEST_PATTERN_COLOR_BARS         2
> -#define IMX355_TEST_PATTERN_GRAY_COLOR_BARS    3
> -#define IMX355_TEST_PATTERN_PN9                        4
> -
> +/* Link rate register: 16-bit wide, unlike the CCS 32-bit one */
>  #define IMX355_REG_REQ_LINK_BIT_RATE   CCI_REG16(0x0820)
>
> -#define IMX355_REG_BINNING_MODE                CCI_REG8(0x0900)
> -#define IMX355_REG_BINNING_TYPE                CCI_REG8(0x0901)
> -#define IMX355_REG_BINNING_WEIGHTING   CCI_REG8(0x0902)
> -
> -/* Flip Control */
> -#define IMX355_REG_ORIENTATION         CCI_REG8(0x0101)
> -
>  #define IMX355_PIXEL_ARRAY_TOP         0
>  #define IMX355_PIXEL_ARRAY_LEFT                0
>  #define IMX355_PIXEL_ARRAY_WIDTH       3280
>  #define IMX355_PIXEL_ARRAY_HEIGHT      2464
>
>  struct imx355_reg_list {
>         u32 num_of_regs;
>         const struct cci_reg_sequence *regs;
> @@ -616,39 +582,39 @@ static int imx355_set_ctrl(struct v4l2_ctrl *ctrl)
>          * when power is up for streaming
>          */
>         if (!pm_runtime_get_if_in_use(imx355->dev))
>                 return 0;
>
>         switch (ctrl->id) {
>         case V4L2_CID_ANALOGUE_GAIN:
>                 /* Analog gain = 1024/(1024 - ctrl->val) times */
> -               ret = cci_write(imx355->regmap, IMX355_REG_ANALOG_GAIN,
> +               ret = cci_write(imx355->regmap, CCS_R_ANALOG_GAIN_CODE_GLOBAL,
>                                 ctrl->val, NULL);
>                 break;
>         case V4L2_CID_DIGITAL_GAIN:
> -               ret = cci_write(imx355->regmap, IMX355_REG_DIG_GAIN_GLOBAL,
> +               ret = cci_write(imx355->regmap, CCS_R_DIGITAL_GAIN_GLOBAL,
>                                 ctrl->val, NULL);
>                 break;
>         case V4L2_CID_EXPOSURE:
> -               ret = cci_write(imx355->regmap, IMX355_REG_EXPOSURE,
> +               ret = cci_write(imx355->regmap, CCS_R_COARSE_INTEGRATION_TIME,
>                                 ctrl->val, NULL);
>                 break;
>         case V4L2_CID_VBLANK:
>                 /* Update FLL that meets expected vertical blanking */
> -               ret = cci_write(imx355->regmap, IMX355_REG_FLL,
> +               ret = cci_write(imx355->regmap, CCS_R_FRAME_LENGTH_LINES,
>                                 format->height + ctrl->val, NULL);
>                 break;
>         case V4L2_CID_TEST_PATTERN:
> -               ret = cci_write(imx355->regmap, IMX355_REG_TEST_PATTERN,
> +               ret = cci_write(imx355->regmap, CCS_R_TEST_PATTERN_MODE,
>                                 ctrl->val, NULL);
>                 break;
>         case V4L2_CID_HFLIP:
>         case V4L2_CID_VFLIP:
> -               ret = cci_write(imx355->regmap, IMX355_REG_ORIENTATION,
> +               ret = cci_write(imx355->regmap, CCS_R_IMAGE_ORIENTATION,
>                                 imx355->hflip->val | imx355->vflip->val << 1,
>                                 NULL);
>                 break;
>         default:
>                 ret = -EINVAL;
>                 dev_info(imx355->dev, "ctrl(id:0x%x,val:0x%x) is not handled",
>                          ctrl->id, ctrl->val);
>                 break;
> @@ -823,75 +789,75 @@ static int imx355_start_streaming(struct imx355 *imx355)
>         crop = v4l2_subdev_state_get_crop(state, 0);
>         mode = v4l2_find_nearest_size(supported_modes,
>                                       ARRAY_SIZE(supported_modes),
>                                       width, height, fmt->width, fmt->height);
>         cci_multi_reg_write(imx355->regmap, mode->reg_list.regs,
>                             mode->reg_list.num_of_regs, &ret);
>
>         /* Set readout crop and size registers  */
> -       cci_write(imx355->regmap, IMX355_REG_X_ADD_START, crop->left,
> +       cci_write(imx355->regmap, CCS_R_X_ADDR_START, crop->left,
>                   &ret);
> -       cci_write(imx355->regmap, IMX355_REG_Y_ADD_START, crop->top, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_X_ADD_END,
> +       cci_write(imx355->regmap, CCS_R_Y_ADDR_START, crop->top, &ret);
> +       cci_write(imx355->regmap, CCS_R_X_ADDR_END,
>                   crop->width + crop->left - 1, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_Y_ADD_END,
> +       cci_write(imx355->regmap, CCS_R_Y_ADDR_END,
>                   crop->height + crop->top - 1, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_X_OUT_SIZE, fmt->width, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_Y_OUT_SIZE, fmt->height, &ret);
> +       cci_write(imx355->regmap, CCS_R_X_OUTPUT_SIZE, fmt->width, &ret);
> +       cci_write(imx355->regmap, CCS_R_Y_OUTPUT_SIZE, fmt->height, &ret);
>
>         binning_mode = ((crop->width / fmt->width) << 4) |
>                         (crop->height / fmt->height);
> -       cci_write(imx355->regmap, IMX355_REG_BINNING_MODE,
> +       cci_write(imx355->regmap, CCS_R_BINNING_MODE,
>                   binning_mode == 0x11 ? 0x00 : 0x01, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_BINNING_TYPE, binning_mode, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_BINNING_WEIGHTING, 0x00, &ret);
> +       cci_write(imx355->regmap, CCS_R_BINNING_TYPE, binning_mode, &ret);
> +       cci_write(imx355->regmap, CCS_R_BINNING_WEIGHTING, 0x00, &ret);
>
>         /* Set PLL registers for the external clock frequency */
> -       cci_write(imx355->regmap, IMX355_REG_EXTCLK_FREQ,
> +       cci_write(imx355->regmap, CCS_R_EXTCLK_FREQUENCY_MHZ,
>                   imx355->clk_params->extclk_freq, &ret);
> -       cci_write(imx355->regmap, IMX355_REG_PLL_OP_MUL,
> +       cci_write(imx355->regmap, CCS_R_OP_PLL_MULTIPLIER,
>                   imx355->clk_params->pll_op_mpy[lane_idx], &ret);
>         cci_write(imx355->regmap, IMX355_REG_PLL_OP_PREDIV,
>                   imx355->clk_params->pll_op_prediv[lane_idx], &ret);
>         cci_write(imx355->regmap, IMX355_REG_PLL_IVT_SYSCK_DIV,
>                   lane_idx ? 2 : 1, &ret);
>
>         /* Set MIPI configuration */
> -       cci_write(imx355->regmap, IMX355_REG_LANE_SEL,
> +       cci_write(imx355->regmap, CCS_R_CSI_LANE_MODE,
>                   imx355->hwcfg->num_lanes - 1, &ret);
>
>         link_bitrate = imx355->link_freq->qmenu_int[imx355->link_freq->val] *
>                        imx355->hwcfg->num_lanes * 2;
>         do_div(link_bitrate, 1000000);
>         cci_write(imx355->regmap, IMX355_REG_REQ_LINK_BIT_RATE, link_bitrate,
>                   &ret);
>
>         /* set digital gain control to all color mode */
>         cci_write(imx355->regmap, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, &ret);
>
>         /* set line length */
> -       cci_write(imx355->regmap, IMX355_REG_LLP,
> +       cci_write(imx355->regmap, CCS_R_LINE_LENGTH_PCK,
>                   imx355->hblank->val + fmt->width, &ret);
>
>         /* Apply customized values from user */
>         if (!ret)
>                 ret = __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
>
> -       cci_write(imx355->regmap, IMX355_REG_MODE_SELECT, IMX355_MODE_STREAMING,
> +       cci_write(imx355->regmap, CCS_R_MODE_SELECT, CCS_MODE_SELECT_STREAMING,
>                   &ret);
>
>         return ret;
>  }
>
>  /* Stop streaming */
>  static int imx355_stop_streaming(struct imx355 *imx355)
>  {
> -       return cci_write(imx355->regmap, IMX355_REG_MODE_SELECT,
> -                        IMX355_MODE_STANDBY, NULL);
> +       return cci_write(imx355->regmap, CCS_R_MODE_SELECT,
> +                        CCS_MODE_SELECT_SOFTWARE_STANDBY, NULL);
>  }
>
>  static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct imx355 *imx355 = to_imx355(sd);
>         struct v4l2_subdev_state *state;
>         int ret = 0;
>
> @@ -931,17 +897,17 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
>  }
>
>  /* Verify chip ID */
>  static int imx355_identify_module(struct imx355 *imx355)
>  {
>         int ret;
>         u64 val;
>
> -       ret = cci_read(imx355->regmap, IMX355_REG_CHIP_ID, &val, NULL);
> +       ret = cci_read(imx355->regmap, CCS_R_SENSOR_MODEL_ID, &val, NULL);
>         if (ret)
>                 return ret;
>
>         if (val != IMX355_CHIP_ID) {
>                 dev_err(imx355->dev, "chip id mismatch: %x!=%llx",
>                         IMX355_CHIP_ID, val);
>                 return -EIO;
>         }
>
> ---
> base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
> change-id: 20260819-imx355-ccsify-856c850575f1
>
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
>
>
