Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793290668;
	b=QiIuhx8geNAQj9XRznBbushJpfbH+Wua8zZTWh/R+riLKkoNGCu3aZnNK7t0PWjFtsU6
	 tzUDJwuj6eXLquJiTu+VZbj0Ox8cQO8of6e1IGF1hrR1BGZhjPjWLI2gaUaqYsoJZfsRx
	 cCq/Uka4MnLCiri5xvAki/RzmStzKmuJ2jFZMrmwsfeFlY4bVEfWHL8/Sf3ayuOornEea
	 7Q+3uqwgQLHgDv99YWW5jTOClb7sWqTrbt/GYx0NkyWZJp5x/RU0jhFrgTlmcdW/+K1wo
	 r+A7+E2FdWBxjs8SudOxwmcN3vbqd52X3MDpvssyQ+lWZO4boh8IxSe0JDPrkI7RFsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=tbiM1kSqrWfjQZmWbHN5MwVp2C6WI/0lQqYu/tg3TVI=;
	b=gMauw1nePwTIHc5GwzWLLi99l3CzVQqtGXKXOHxtJnTg+5OXJFr7TiKkzPUOmFyHbxrY
	 o7xqEvtusp1Uv/gOkb8asx1NqiXOSlZFPJUHVOXLNTqjT4l7XOaI15tWBPg1WHExQU5/h
	 waHHApJySUK3MfXMsXq9D5tP6leVvs9MMhs2O538mHGxcgN1yLmaJIXFvs3iAsjJWEk/Y
	 MZCCm/UMZcXABf3y47iv6ybSwgiZoW2Edw7FnXawE/ojwf2iWCxwVGAzBQjL6vz8SDBT/
	 FNhbujNoZuXvvGUAabQT6GyBlX8y1mO27rjDUp0isDPzXMO4TVY3drW5u84Zn6dklIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=lQwA6HCT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F9606A31C
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 190F9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=lQwA6HCT
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-49e1251674cso1011654fac.2
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793290666; cv=none;
        d=google.com; s=arc-20260327;
        b=QNUMqvhfX99jI0bmeqIJBrVyjgHh8biJi7t/KQwu67Y2N5YdL1EdCW3K0vi77ir5sv
         85HWJcBT9EIdNv+ODdYJpyRfjAM6H3ZjkWrt+PKmhW3usis0ArzM4HcbHlG3KTXju+fp
         3AU36PbIzYf4+ANL5UEfsYMJfv9DgfCfmhYEKz3V+eg/vjgX7OdjRUMCQQsd76TLAaj6
         AiZCUym3Wj4A+tWdp9CTEo8eNyuCavSHjMSib/wg+4c4c741liVIDjpYczqM+HxGbhLN
         Jah0elC+baoWxMLKpHVYIYsT/Tx0I98OyAMSPAveKNZ1Olw77byjjC7QlMBwJvx1NtFi
         5jVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tbiM1kSqrWfjQZmWbHN5MwVp2C6WI/0lQqYu/tg3TVI=;
        fh=NBznWYjyaDILHyI3qePvI2dARPEudXQh32emusRRSjI=;
        b=IDVdXv51qdcs/g+wPGtP5x8RTdPHhmRLMdY5hGFsxmPldxZT/Wp1pbsm65YpQwUZkG
         1Y0TbFE5dQ1amns/3sk9Av4krCU9FcHg1tVJwetbOq9GNnpQqdeYMXUCBr7aPCdV13iz
         VUaoFXdZ6kgaD4vG0vpGznU24mumr4ympgRET3Osuh1Bk57AVl1SyOeHKy7Iz1DVrm8P
         J5QH2/DRQvVjtF7pd7b7uPKfrhSIDGtsvHFS7/Z8/RoKnvZVMZ3RA5B6B9QkgM6Q6UIz
         pxQJccGznKol8DHgdKYOdhidszC/ewYW3qj6gEZA5ZY5y6yb2qAt4x4VHtNTdiw5vB0V
         qvVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793290666; x=1793895466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbiM1kSqrWfjQZmWbHN5MwVp2C6WI/0lQqYu/tg3TVI=;
        b=lQwA6HCTlJowMc3fUQb7f1jdQFm07tgAPzK91ILicAIBwml/CuxI55Rk+m5fu163EA
         yeN5Idq3BZZyKkkbK0q7S8RocwFypKDHO1LSSEMCppvokNQl5EmIBHOYjaaq2xP5Ejf9
         8b/07vyk/MkBNsXGFwyV2HBmszy/Tifv5Ri4vYuGBoUAL2EOclfvcnVZk+t0G7KyHpeW
         AjFNj8K721EsryPPCeWL42+iied00pDshoEoTcovNdqHEwkF18Kjdpa05hCFA0IJ0fx9
         tpaUOI6iU0DJb6mb2PQColERxTbhUucglLmyVULiZpKFULkkJ4pVRo0d+8ENn0Jr0Pnj
         KfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290666; x=1793895466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tbiM1kSqrWfjQZmWbHN5MwVp2C6WI/0lQqYu/tg3TVI=;
        b=n9z09ZwA/zqHLUtTtxM8gZEgYI7+/YVfcnAg1JYQvRIPe41FeCEAW42S71t3uz+sKs
         hM6x0iAQKfrH262Hu9kv7X9LM/F7NWslXGZMhQ/mQAXsEuBcU7n/8Vb3at4Exw01KPAk
         NwDR82JtxfmHUCv7IjeUL+Mngh/KBKoc2PQyAYbk5UtD8scN+qS9fNYH1AXEureHvZpE
         9N0Ibs6lHT03B2lbPaMALS7NtjyFXC+t71WscOhCH8/dr9v76Q5FK5T2DjaSN1Y2HWcg
         7Tm8NAb+S/nYDz5CcxOPyRB34p6xaxUdf0RtpB1yj2EzjQ33woTfLbgsmX70DfFWwcSH
         5RkQ==
X-Gm-Message-State: AFq9FYLpGvwikKtG8UzEZ/Ywgy1XhstF9PiOUFbl802IoitC8UU/prdE
	vvJFrdLGwTGNH9AL3Y7yhjAqDCbH4SKCecRbzL+/0c9bHJhStsw88EcWDafk3YRWFuLxpAX0KjX
	XZLQ3jg3pGQul0K66zUtlGbq25YhgoABr87holWVObw==
X-Gm-Gg: AYBFou07x3J8kt1aK8z22isZxvBlMZZibmJ1Qg9nKE0hkcne+WbZRGJv82BezLqpFWN
	iAvAV0QBnVbhHXaxNvPbyMSOS3VjAI5gaTZ65uiJ/VdK8NtpEQ1E9un8xZtlTiorDJG+K14DmLy
	VTZNCJ0KgSr50ryT9D6IKQv5aTFJ0+yV6BIqaYzFwW231QPD+8B25/gilPrgg2/TzWUx1PbAd+U
	RzLX2hWGeKEFedUfS7Zv9JIUFGOwZzapAMAI01+XmvgwoRNT70sth5d8hcQMgvZOb7kumPOSOOp
	ik9rxlAM2iUmipxfDXNrBQn92zbOaniyvCjPTPLl51tSTRvcK2MnCcvCJpFIoRdcSfKZ6lJ2zWI
	AcckUCEzCK6uZdOAL/X+Sto34izpWIc8fLaFosrSrO65gDCxcC15JZmSwv7/kNliiYL2pFm80Bo
	aF0+LxzlopeCyv/iDwb+Oh3Jc8ILbqCKjeDm7e0SLZt/A3oXxGUzVoVQ==
X-Received: by 2002:a05:6870:322c:b0:494:888b:33e8 with SMTP id
 586e51a60fabf-4a8bb9635f6mr4642047fac.20.1793290666459; Thu, 29 Oct 2026
 09:17:46 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026111032.88355-1-antoine.pichot@gmail.com> <20261026111032.88355-6-antoine.pichot@gmail.com>
In-Reply-To: <20261026111032.88355-6-antoine.pichot@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 16:17:29 +0000
X-Gm-Features: AclHuK92Pqhgpz4CY3r4Mn98MdOq_5fPo7ARJt1Ycmz9acusfVL0tHSkEH0sYpM
Message-ID: <CAPY8ntAzJ=jA-c9LoLW5tQS=bpQZ3SfepcGVuvhq4cRzXvRK=A@mail.gmail.com>
Subject: Re: [PATCH 5/7] media: i2c: ov7251: Move the strobe registers out of
 the mode tables
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	mchehab@kernel.org, djrscally@gmail.com, dan.scally@ideasonboard.com, 
	hansg@kernel.org, andriy.shevchenko@linux.intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Antoine

On Mon, 26 Oct 2026 at 11:15, Antoine Pichot <antoine.pichot@gmail.com> wrote:
>
> The three mode tables write the same values to the STROBE pad output
> enable bit (0x3005) and to the strobe control block (0x3b80-0x3b96).
> Move these writes to a separate register array written right after the
> mode table at stream start, and name the registers a following patch
> needs: SC_REG5 (0x3005, whose bit 3 enables the STROBE pad output), the
> strobe frame pattern (0x3b81) and the 32-bit strobe frame span (0x3b8c).
>
> The values written are unchanged, only the order of the writes within
> the stream start sequence changes. No functional change intended.
>
> Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
> ---
>  drivers/media/i2c/ov7251.c | 93 ++++++++++++++------------------------
>  1 file changed, 33 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index b6579a56a5..ad66422d9e 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -53,6 +53,9 @@
>  #define OV7251_PLL2_DIVIDER_REG                0x309d
>  #define OV7251_PLL2_SYS_DIV_REG                0x309a
>  #define OV7251_PLL2_ADC_DIV_REG                0x309b
> +#define OV7251_SC_REG5                 0x3005
> +#define OV7251_STROBE_FRAME_PATTERN    0x3b81
> +#define OV7251_STROBE_FRAME_SPAN       0x3b8c
>
>  #define OV7251_NATIVE_WIDTH            656
>  #define OV7251_NATIVE_HEIGHT           496
> @@ -240,8 +243,31 @@ static const struct reg_value ov7251_global_init_setting[] = {
>         { 0x303b, 0x02 },
>  };
>
> +/* Strobe output settings, the same for all modes */
> +static const struct reg_value ov7251_strobe_regs[] = {

Is there a real need to add a new array of registers for these, or can
they be added to ov7251_global_init_setting? As long as it's after the
{0x0103, 0x01} reset, then order shouldn't matter.

Seeing as there obviously are others using this sensor, I'm looking at
upstreaming a few of the obvious clean ups, and I have a couple of
patches in the downstream Pi kernel.
One of the first steps is to pull all the common registers out of the
ov7251_setting_vga_* arrays into ov7251_global_init_setting, and this
change is partly going in the opposite direction.

Thanks
  Dave

> +       { OV7251_SC_REG5, 0x00 },
> +       { 0x3b80, 0x00 },
> +       { OV7251_STROBE_FRAME_PATTERN, 0xa5 },
> +       { 0x3b82, 0x10 },
> +       { 0x3b83, 0x00 },
> +       { 0x3b84, 0x08 },
> +       { 0x3b85, 0x00 },
> +       { 0x3b86, 0x01 },
> +       { 0x3b87, 0x00 },
> +       { 0x3b88, 0x00 },
> +       { 0x3b89, 0x00 },
> +       { 0x3b8a, 0x00 },
> +       { 0x3b8b, 0x05 },
> +       { OV7251_STROBE_FRAME_SPAN, 0x00 },
> +       { 0x3b8d, 0x00 },
> +       { 0x3b8e, 0x00 },
> +       { 0x3b8f, 0x1a },
> +       { 0x3b94, 0x05 },
> +       { 0x3b95, 0xf2 },
> +       { 0x3b96, 0x40 },
> +};
> +
>  static const struct reg_value ov7251_setting_vga_30fps[] = {
> -       { 0x3005, 0x00 },
>         { 0x3012, 0xc0 },
>         { 0x3013, 0xd2 },
>         { 0x3014, 0x04 },
> @@ -314,25 +340,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
>         { 0x3834, 0x00 },
>         { 0x3835, 0x0c },
>         { 0x3837, 0x00 },
> -       { 0x3b80, 0x00 },
> -       { 0x3b81, 0xa5 },
> -       { 0x3b82, 0x10 },
> -       { 0x3b83, 0x00 },
> -       { 0x3b84, 0x08 },
> -       { 0x3b85, 0x00 },
> -       { 0x3b86, 0x01 },
> -       { 0x3b87, 0x00 },
> -       { 0x3b88, 0x00 },
> -       { 0x3b89, 0x00 },
> -       { 0x3b8a, 0x00 },
> -       { 0x3b8b, 0x05 },
> -       { 0x3b8c, 0x00 },
> -       { 0x3b8d, 0x00 },
> -       { 0x3b8e, 0x00 },
> -       { 0x3b8f, 0x1a },
> -       { 0x3b94, 0x05 },
> -       { 0x3b95, 0xf2 },
> -       { 0x3b96, 0x40 },
>         { 0x3c00, 0x89 },
>         { 0x3c01, 0x63 },
>         { 0x3c02, 0x01 },
> @@ -369,7 +376,6 @@ static const struct reg_value ov7251_setting_vga_30fps[] = {
>  };
>
>  static const struct reg_value ov7251_setting_vga_60fps[] = {
> -       { 0x3005, 0x00 },
>         { 0x3012, 0xc0 },
>         { 0x3013, 0xd2 },
>         { 0x3014, 0x04 },
> @@ -442,25 +448,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
>         { 0x3834, 0x00 },
>         { 0x3835, 0x0c },
>         { 0x3837, 0x00 },
> -       { 0x3b80, 0x00 },
> -       { 0x3b81, 0xa5 },
> -       { 0x3b82, 0x10 },
> -       { 0x3b83, 0x00 },
> -       { 0x3b84, 0x08 },
> -       { 0x3b85, 0x00 },
> -       { 0x3b86, 0x01 },
> -       { 0x3b87, 0x00 },
> -       { 0x3b88, 0x00 },
> -       { 0x3b89, 0x00 },
> -       { 0x3b8a, 0x00 },
> -       { 0x3b8b, 0x05 },
> -       { 0x3b8c, 0x00 },
> -       { 0x3b8d, 0x00 },
> -       { 0x3b8e, 0x00 },
> -       { 0x3b8f, 0x1a },
> -       { 0x3b94, 0x05 },
> -       { 0x3b95, 0xf2 },
> -       { 0x3b96, 0x40 },
>         { 0x3c00, 0x89 },
>         { 0x3c01, 0x63 },
>         { 0x3c02, 0x01 },
> @@ -497,7 +484,6 @@ static const struct reg_value ov7251_setting_vga_60fps[] = {
>  };
>
>  static const struct reg_value ov7251_setting_vga_90fps[] = {
> -       { 0x3005, 0x00 },
>         { 0x3012, 0xc0 },
>         { 0x3013, 0xd2 },
>         { 0x3014, 0x04 },
> @@ -570,25 +556,6 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
>         { 0x3834, 0x00 },
>         { 0x3835, 0x0c },
>         { 0x3837, 0x00 },
> -       { 0x3b80, 0x00 },
> -       { 0x3b81, 0xa5 },
> -       { 0x3b82, 0x10 },
> -       { 0x3b83, 0x00 },
> -       { 0x3b84, 0x08 },
> -       { 0x3b85, 0x00 },
> -       { 0x3b86, 0x01 },
> -       { 0x3b87, 0x00 },
> -       { 0x3b88, 0x00 },
> -       { 0x3b89, 0x00 },
> -       { 0x3b8a, 0x00 },
> -       { 0x3b8b, 0x05 },
> -       { 0x3b8c, 0x00 },
> -       { 0x3b8d, 0x00 },
> -       { 0x3b8e, 0x00 },
> -       { 0x3b8f, 0x1a },
> -       { 0x3b94, 0x05 },
> -       { 0x3b95, 0xf2 },
> -       { 0x3b96, 0x40 },
>         { 0x3c00, 0x89 },
>         { 0x3c01, 0x63 },
>         { 0x3c02, 0x01 },
> @@ -1369,6 +1336,12 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
>                                 ov7251->current_mode->height);
>                         goto err_power_down;
>                 }
> +               ret = ov7251_set_register_array(ov7251, ov7251_strobe_regs,
> +                                               ARRAY_SIZE(ov7251_strobe_regs));
> +               if (ret < 0) {
> +                       dev_err(ov7251->dev, "could not set strobe defaults\n");
> +                       goto err_power_down;
> +               }
>                 ret = __v4l2_ctrl_handler_setup(&ov7251->ctrls);
>                 if (ret < 0) {
>                         dev_err(ov7251->dev, "could not sync v4l2 controls\n");
> --
> 2.53.0
>
>
