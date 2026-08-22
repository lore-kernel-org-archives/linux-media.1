Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A93264C2
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 07:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787384665; cv=pass; b=LoMSl0wLSP7Yuo84YVIkj3s4bJ41wLkNewdP5gw/BHHG66rAm0GqmD3Ckw9nrICxRw+oeTReGLBJUh1sPk3y7W7JR5p48B35TYLvlEOREcIxUYvlM2jH5dRl+XTjw+CV7dvg3b1uXTgyZljPg+TEqLMJZ4cMVqx/OK4c3sjQoFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787384665; c=relaxed/simple;
	bh=CdBP6Wojp9JlcP+aZx/uvuEZuB1wsUt2dvAwcNUbWb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edeQO3Oe9pnl50gB+Ymth11YEJFCNhW+cqAfJGhSk3D+prV1nyZyrrghukM8QzUGSstKtOhzQ9RNBGOw0ReRMr7VKsXeqsn8q5PZTDi/3ktE5JCOo6dPKXLuqGOmlJaZ3S4Lw40gRTxnWUBZBLl97UTdccJajR7epbbD/Uy++7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h/1v0MR6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQeIHqn0; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h/1v0MR6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQeIHqn0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787384662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgeNozE6lMJZBSQ9gu8YC3JomU0Fj0+kEH9so0HbiXw=;
	b=h/1v0MR6UzxM70/Tb30IkDpS6zmlJ8/PSm9nu1e4sSTHff+vjrvJlXXKnHWFC1uRBEFgEU
	98sYmI8+2T2XkHrGDd1juu9bUnZzYIAF7h5vyJ9UnOvEap+fkoX0AsD4fL3wYHghdU9iJZ
	FOulFElFXByRZK5kOA/jfWJDU2lIEFg=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-b6bSbrRyOjWMRmras9rfiw-1; Sat, 22 Aug 2026 03:44:21 -0400
X-MC-Unique: b6bSbrRyOjWMRmras9rfiw-1
X-Mimecast-MFC-AGG-ID: b6bSbrRyOjWMRmras9rfiw_1787384660
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45a07949855so3135429fac.2
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 00:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787384660; cv=none;
        d=google.com; s=arc-20260327;
        b=C0WNa5JcH7UGft4owspliKBZgJHy0ZCedeix1zHpaeJESlqJCScASpWauVBwtss+fE
         yZ9Isis21UMn2YOcApR2xQNdPrlX4qv9aF8X+B6BVkRh6vLRR1p1NfiX/r6aucn/TEpW
         Mn1vSguM3G+7OQRSkXXRdmFyDoA14UBYqw7DYSYiZPnUB8jaaWJctYyp+Af6DE1F2HkL
         K8P5VItPW8dj5F15WYOnUN62MOtzM/eAOP9bNMdIbKsfqvx279ZIhc7zvtwXtqoigWaj
         AANR/w6NXs+bt2bZP+ycakAEOR2JI9f4NMXPSwa52shpOS4GdXB5GN7lTTZIdlqa1UUc
         fXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kgeNozE6lMJZBSQ9gu8YC3JomU0Fj0+kEH9so0HbiXw=;
        fh=4QCx2uwWj3UycZYVuhRhJmWFUHNJTBQAhtQhzaJpotc=;
        b=SCDoXBEVmKFp/OI+rtbvBr4/YFl7m/x3aoLUJZyu+1T0r8NFYz1gvBiVLekvSyjWNu
         2X32Rs9e4YaL4lNN9ccdlBWXw9FQssZ2gqXUYBs9+H8IpcqW03ftOBgIlaTVBjPkr4Ru
         uJerfByunOVvMfZfIv4gTJWS9cE3rHmuzvZNvJ7uh4rSLoCInwErwn97BxZfjDv5R2T/
         9E3KjYyDuUCQcjS4rKdPAKEegMKc4aVXz/ADmorIzJ7IdJI9iSOa0ithAh8kpIgFkcvs
         xKtGooJV7OuxHWlufM3PbLB4Fdit/UYmrMbs4ZvGEi35HPjmVUprEsnr0ZLpId5MkwYz
         0jTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787384660; x=1787989460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgeNozE6lMJZBSQ9gu8YC3JomU0Fj0+kEH9so0HbiXw=;
        b=RQeIHqn0uS/uqBqkMumvGxW4o7d8sT3P5aO+kvdeuU1cq46JZQuq2juWjYDZi2uxKS
         6K8oSH/T2OjqUPdBfaqXTe6hWRk+hV2ncJp/bR+gYZ+g9QnOt2UNxeZ06/UvAyOwvpZD
         xnMjeCfc4wdqbEGG6UyS/uH4tEED0Cq0PZv7iFvw7Zg3EwjI6gik7Ys9ggYHwzD4o16C
         opQdnE6gHxdOMGxs1Lf53hDY8gn/sVPQafNF6iYG0yasoWqQ6GW+uuThjZph33+BtvqO
         ZzYxw6S+fvJ7ULu6g8z9x2CTZNWufq14wLvA/knr4iQiw/bgEb6m5HcZ0Scm/0AZtP7W
         9How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787384660; x=1787989460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgeNozE6lMJZBSQ9gu8YC3JomU0Fj0+kEH9so0HbiXw=;
        b=WoA2w01thB1HGpdf/8w0TYdZBFfmfIezBriK/lHH6PCasS4yoz5ofO4GXhke47oPgV
         wqQAKaE7Pgl62Z2V5jbN6xQRG2OjiZhabhkN2JmuNiTdheScoLf+lbBn5q2d2xsivsuO
         yxqFmAlCbOisB4dqT/3ucQKXEh3dcZtf67xGEf0vFl4OeHB/1OHpoeVpzfJhRXPNkbAg
         2ZaTnScV8pCW0+qRh6glejGyEAUAzm9vhHPg6Ej7b/HTXZbFPLMXfbcvmgJXrTAf9a2g
         0X6ImK0O9STll0xE/yE7hSvNmkV5WDgOZgntjcaEPPczK2X5HUTO4UPbgT4YGK7czIqF
         puJw==
X-Gm-Message-State: AFuF++mLna1wmwtOqlNFjge5rZaL2kYhrGMcD2LpPsHNUzo8s/Une1nF
	9ef0t4I/mm37fzZ7LIdA3vLbvb+A7cAUABhza7HkVHeXQDH57IJuGAcKWYlLBROyVTXQBKberta
	6efBXNW8JxtFK+W5hbDkKxHxRbAJ4Yeee/PFDRmLGqELTSF2EPilbwi2lQSm4zMrzilQGh2U2XA
	7scSnn7ta+o3xCp+BKvGMXjO5UcXnUzjz34W8AP2k=
X-Gm-Gg: AR+sD13K0kh+oKELDRZ/DbMhrsOFlHUjN5fyqzFfr7EQcl5zzF24m8ytckVLkjBnP2u
	dwaLfrm13f3BznYIhH54L7P7A/mZ/SCVDBtds6dLIFonGH09uP/aFlGL3s0UyNKtFmxUOOcdnuA
	Muhy6EwOZn8TkaszeraiYy7vKmxzlDhGmyLwCLEKVOJLHP73eauXp1j2T9
X-Received: by 2002:a05:6870:f28d:b0:459:f9c0:995a with SMTP id 586e51a60fabf-4638037888emr5038636fac.14.1787384660382;
        Sat, 22 Aug 2026 00:44:20 -0700 (PDT)
X-Received: by 2002:a05:6870:f28d:b0:459:f9c0:995a with SMTP id
 586e51a60fabf-4638037888emr5038619fac.14.1787384659872; Sat, 22 Aug 2026
 00:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816194259.151947-1-john.cronin@opcenter.com>
In-Reply-To: <20260816194259.151947-1-john.cronin@opcenter.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Sat, 22 Aug 2026 15:44:08 +0800
X-Gm-Features: AcwNN1UIYi3Swv5f9_UY8UthJPS1ScSuL1XIW1ch_YszFTQgdlHH_RdxOlTwTvM
Message-ID: <CAEth8oHv5r0xFfe_YZz8tO+6+DAaWvMQAf70ZCOZYbzvb-iUPw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx471: return 0 for V4L2_SEL_TGT_CROP
To: John Cronin <john@stromback.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	hansg@kernel.org, John Cronin <john.cronin@opcenter.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

Thank you for working on this.

On Mon, Aug 17, 2026 at 3:43=E2=80=AFAM John Cronin <john@stromback.com> wr=
ote:
>
> libcamera issues VIDIOC_SUBDEV_G_SELECTION with target CROP (rectangle
> 0) during CameraSensorLegacy bring-up. imx471_get_selection filled the
> rectangle then broke out of the switch and returned -EINVAL, so
> libcamera logged:
>
>   Unable to get rectangle 0 on pad 0/0: Invalid argument
>   Failed to retrieve the sensor crop rectangle
>
> Match imx219: return 0 after CROP. Also store the analog crop window
> from X/Y_ADD_STA/END in the subdev state when the mode is selected, so
> the CROP rectangle is not an uninitialized 0x0 box.
>
> Analog crop for the 1928x1088 2x2-binned mode is the programmed analog
> window 8,408 / 4640x2644 (native array coordinates).
>
> Tested on ThinkPad X9-15 Gen 1 (SONY471A / IPU7), Fedora 44
> kernel 7.1.8-200.fc44. After loading this module:
>
>   VIDIOC_SUBDEV_G_SELECTION CROP         =E2=86=92 8,408 4640x2644
>   VIDIOC_SUBDEV_G_SELECTION CROP_BOUNDS  =E2=86=92 8,8 4656x3496
>   VIDIOC_SUBDEV_G_SELECTION NATIVE_SIZE  =E2=86=92 0,0 4672x3512
>
> libcamera no longer logs "Unable to get rectangle 0 on pad 0/0".
>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2454119
> Signed-off-by: John Cronin <john.cronin@opcenter.com>
> ---
>  drivers/media/i2c/imx471.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index ae0e4d4..18b81aa 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -131,6 +131,9 @@ struct imx471_mode {
>         /* H-timing */
>         u32 llp;
>
> +       /* Analog crop window in native array coordinates */
> +       struct v4l2_rect crop;
The crop area can be dynamically calculated when setting the format so
this can be dropped.
and the reason is described below.

> +
>         const struct cci_reg_sequence *default_mode_regs;
>         unsigned int default_mode_regs_length;
>  };
> @@ -283,6 +286,13 @@ static const struct imx471_mode imx471_modes[] =3D {
>                 .fll_def =3D 1308,
>                 .fll_min =3D 1308,
>                 .llp =3D 2328,
> +               /* X/Y_ADD_STA/END: 8..4647 x 408..3051 */
> +               .crop =3D {
> +                       .left =3D 8,
> +                       .top =3D 408,
> +                       .width =3D 4640,
> +                       .height =3D 2644,
> +               },
If we want to calculate the crop dynamically, this can be dropped.

>                 .default_mode_regs =3D mode_1928x1088_regs,
>                 .default_mode_regs_length =3D ARRAY_SIZE(mode_1928x1088_r=
egs),
>         },
> @@ -430,6 +440,7 @@ static int imx471_set_pad_format(struct v4l2_subdev *=
sd,
>         imx471_update_pad_format(sensor, mode, fmt);
>
>         *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format=
;
> +       *v4l2_subdev_state_get_crop(sd_state, fmt->pad) =3D mode->crop;

We can calculate the crop here similar to how it was handled in the
IMX219. Since the IMX471 supports a binning mode with 2328x1748 (4:3)
and 2328x1304 (16:9) image sizes, the maximum scaling ratio for width
and height is 2, which should work for us.

u8 bin_h, bin_v, binning;
struct v4l2_rect *crop;
int h_blank, ret;

... skip

*v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format;
crop =3D v4l2_subdev_state_get_crop(sd_state, fmt->pad);

bin_h =3D min(IMX471_PIXEL_ARRAY_WIDTH / fmt->format.width, 2U);
bin_v =3D min(IMX471_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2U);
binning =3D min(bin_h, bin_v);
crop->width =3D fmt->format.width * binning;
crop->height =3D fmt->format.height * binning;
crop->left =3D (IMX471_NATIVE_WIDTH - crop->width) / 2;
crop->top =3D (IMX471_NATIVE_HEIGHT - crop->height) / 2;

>
>         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
>                 return 0;
> @@ -461,7 +472,7 @@ static int imx471_get_selection(struct v4l2_subdev *s=
d,
>         switch (sel->target) {
>         case V4L2_SEL_TGT_CROP:
>                 sel->r =3D *v4l2_subdev_state_get_crop(sd_state, sel->pad=
);
> -               break;
> +               return 0;
>
>         case V4L2_SEL_TGT_NATIVE_SIZE:
>                 sel->r.top =3D 0;

For the fix to the return value. It can be as follows:

static int imx471_get_selection(struct v4l2_subdev *sd,
                                struct v4l2_subdev_state *sd_state,
                                struct v4l2_subdev_selection *sel)
{
        switch (sel->target) {
        case V4L2_SEL_TGT_CROP:
                sel->r =3D *v4l2_subdev_state_get_crop(sd_state, sel->pad);
                break;

        case V4L2_SEL_TGT_NATIVE_SIZE:
                sel->r.top =3D 0;
                sel->r.left =3D 0;
                sel->r.width =3D IMX471_NATIVE_WIDTH;
                sel->r.height =3D IMX471_NATIVE_HEIGHT;
                break;

        case V4L2_SEL_TGT_CROP_DEFAULT:
        case V4L2_SEL_TGT_CROP_BOUNDS:
                sel->r.top =3D IMX471_PIXEL_ARRAY_TOP;
                sel->r.left =3D IMX471_PIXEL_ARRAY_LEFT;
                sel->r.width =3D IMX471_PIXEL_ARRAY_WIDTH;
                sel->r.height =3D IMX471_PIXEL_ARRAY_HEIGHT;
                break;

        default:
                return -EINVAL;
        }

        return 0;
}

> --
> 2.55.0
>


--=20
BR,
Kate

