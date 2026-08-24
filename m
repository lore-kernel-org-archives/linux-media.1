Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84BB24DD17
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787559515; cv=pass; b=ljxeOkjD/kJ5rpsdhPOIRYuCu3e8F9Hxqdx81N1ecz+5hbW3J9jmaCJfulT31aN+V0Svhcbzw9WDbKP1bEPHUu8UhPyv0PNTMQPh7xQpc65i7dgHkHrKLUe3eYKaw5QhawbcnEGIIqCk9hCaxcZJGmAB6vm8AtevY8e8PC+71sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787559515; c=relaxed/simple;
	bh=zHGIrUOgMl9pvt1X5w7oh9xLH6I0tvnUhyf/Mdyv0dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D704PWuLMesnOyhUtBFpybNGOsfZeURfITVsV32X4OwYnYPOLVjUUZy/7juIUxgibENvgAWSnZ2tAUJPhXVl+OLCKxD76oLQWrSDvsOUBCUwNuzhL9jvs50Bi9vvVezqOSZRIdwis7VgX3W92gpxxnzHZ9qT+acraYT1ibHUQ+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LckdN2Jf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEFZOBf7; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LckdN2Jf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEFZOBf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787559512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WncDdF1jpdigsWE31OFBM1tI0y3SDgAOiTJstupRN0c=;
	b=LckdN2JfIdfnqzag5gza6RVxS6NVXkbXi/Wy9UhM2knhIhO957ZZtXSiGUty5sU6ggKLvu
	9Sog/1SjPiA8a6iYleUYvJW2G6X7KTeab7gbQEMK98vE+W7Kweu1SY8V8m5QAvf4UUNMDE
	5r6msCC+EM5CiuzOtD6NzYYbhk0dOeY=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-z79sWFuHOWeTfz4WYE3DUA-1; Mon, 24 Aug 2026 04:18:30 -0400
X-MC-Unique: z79sWFuHOWeTfz4WYE3DUA-1
X-Mimecast-MFC-AGG-ID: z79sWFuHOWeTfz4WYE3DUA_1787559510
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-458326d2d9aso6359081fac.2
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 01:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787559510; cv=none;
        d=google.com; s=arc-20260327;
        b=FiBJup+db479WM/4qqfOZK6Zx7TZEZfjC8Xf50DcAfn9W+WsSjkpccavPGydKKccvT
         /FMGmdZzJfjfIFxao8DzxQdnITubjtoB4QhKlPJFMWpMtDM5ugT13Ko8h26BntUF5XTH
         qhjPgbXBgZYwLO2jXaN7nX3Zndue4mUMnLHWVmixBj4y2EZ6IcdzrguG5D9koOrumq4L
         mKQ96tajnRi5Z5Z9hcw02lRtR8Zl4ydeIZyMAyJJjuwVKXE05vNevtoFCYaul0CbrTRG
         uSpfbEQUyNdB+9gHCEuGaQLm3DU/K8Sr5A0N4B2Xvz8z2VTWfi2bq463z5waVKB/32vy
         uBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WncDdF1jpdigsWE31OFBM1tI0y3SDgAOiTJstupRN0c=;
        fh=mv46L7sagTuVhWiVq6sjuhPMsdCGZg7nDrtDQvjLwQM=;
        b=J70+ULO1O+z9JYl9l1YPuIBLXNOm47SXY+jgBlnTmAdLhNS2IAM7MFWy3AlYyQQ10M
         asGHyrTEWXmcU3Y4W4zpsyi6HXmqX/dgF/8hElTaFA3alS7hhh/f3nw7NzhHHPZg2DPB
         N4zMMq9TukIgzcjmwjPQ0IKipU8sB8fYE7v48d7J6x/wvwt0fNeNKBoGQsZNJDY9b/t/
         HaHE2A9+5lDgGp2baLhwA/f/m8nRNFpV66NhNcLf2S3VVZiUaO7SgAQGukVbpPRWlzka
         4KhS6WtrqXrmxiSUkv7AQiGnxE5PAguBIYTjbDOBr94tNzKlawhfVMPobIqcF1jttKGa
         Y51w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787559510; x=1788164310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WncDdF1jpdigsWE31OFBM1tI0y3SDgAOiTJstupRN0c=;
        b=MEFZOBf7wetTpqdxVqevdHHESFuyVX8BSNx/F+bYx2JbHGrYNk+8x8Xue+3eYEgVQN
         F1XL0SQoMWRJInaDYPh8e6RKfERzh8R1U9Giwcg78M9YjSnwWMozYvTcpIQMAJ2D9EWZ
         F9KsTM+h2/LLPIoeXRAveY9up2SI5Su1QHclerseEX6um5lajEL/itmhEWPcy51YD/tV
         C2zlG5HD4d2uVXyFPMtW2XyOXrmjHycSyr4eTiFdYg0HOpcQuFzSBie9r7vH8LkMPFmT
         +5PWwdmxKXFO4vKrBhADnBevxaI7YWwuYjoDijyE4+tjjqD2dR3p8xiWGdbZvzDgXeqp
         cGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787559510; x=1788164310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WncDdF1jpdigsWE31OFBM1tI0y3SDgAOiTJstupRN0c=;
        b=i71yUYJjI9TovLAY40Q2r7j6h/wvn2yYAih/beRFvTOEtQXZGkhKiBy9kKBGfdEEXp
         4ge6slvFcSmlwVixxnueA63O+tVrt0w3YHrc9E28YmMX3569shUgQ1k/rEa3jUk7ZNGY
         ewptwH3YzxjOlnvCE1LthKqd1h2PAxFW8/pi+OyvLnjO78kiEEfFi3GlLyvHcLq2geDd
         wfQf99EjiY0qauUhs1+H7D4/VskhbfCniMiXaj0LVDKYr+C9KN9p0HzM6YDsLRinwHHA
         lM9hp0Owg8dtKjIOn4uhXxyaCsCXjEiYWQvSVhAi9AWTCHjhcp0bx2DIuH550VT6jTHG
         ttBA==
X-Gm-Message-State: AFuF++lMr4Vu8YNWA4TQgiFg8L4KuE7LFYpCHyaHmSxAMyrvTLzmWEsA
	WZ8HwjLTHwLXrRiTQJV7rexszXK2vVfZUpS5tf2X+R7W1mkGgnR5ivvxxveAjt9BHw/UG+mLZUn
	WXeVBBQl3U4NrPYpjdNJ3ZKo5J9XhqHRVLt1N1EL1NTblKpOu6/xxxl2XsdtUJgR/FgHXa8epQS
	wMJgE/Drv6iQJw31jZ+RqWoL6ctX6F2YAAAzi3YypxPWZXTBoEZw==
X-Gm-Gg: AR+sD10qxEKo3/JYN7FqFbrYj/uTbfjzMe1ofl6c9RFVzUV7yeFjs5PcKBXNB9+Bouj
	AD6WtqB2LKBP357tAf+YTk+a9aSW19vb/MEm+BNiXOhCnTRHP1RXPzbeqYfja3Z1KsM4pOUdt/h
	Im+sLvo9Vcb/+OWNOMl05VMaPQ/C3PGHuYHgAusaFda+JOyjM7Ab+o5lqd
X-Received: by 2002:a05:6870:c2a9:b0:455:9a0a:f40f with SMTP id 586e51a60fabf-463514213bcmr21805365fac.12.1787559509794;
        Mon, 24 Aug 2026 01:18:29 -0700 (PDT)
X-Received: by 2002:a05:6870:c2a9:b0:455:9a0a:f40f with SMTP id
 586e51a60fabf-463514213bcmr21805330fac.12.1787559509273; Mon, 24 Aug 2026
 01:18:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816194259.151947-1-john.cronin@opcenter.com> <20260822210311.165824-1-john.cronin@opcenter.com>
In-Reply-To: <20260822210311.165824-1-john.cronin@opcenter.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 24 Aug 2026 16:18:17 +0800
X-Gm-Features: AcwNN1UdbzV92ypwJkPEJJgsgLTXVWd-1N6SOdPkIwKUsMSju1vP93raBoDAj6k
Message-ID: <CAEth8oHoAyuCwHXVJNo3Z=JQB63fJ+LtnNsYFrwtnkjTu-CPkA@mail.gmail.com>
Subject: Re: [PATCH v4] media: i2c: imx471: return 0 from get_selection after
 filling crop
To: John Cronin <john@stromback.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	hansg@kernel.org, john.cronin@opcenter.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

Thank you for the update.

Please also run
 $ ./scripts/checkpatch.pl --strict --max-line-length=3D80
to check the patch style and format.

On Sun, Aug 23, 2026 at 5:03=E2=80=AFAM John Cronin <john@stromback.com> wr=
ote:
>
> libcamera issues VIDIOC_SUBDEV_G_SELECTION with target CROP (rectangle
> 0) during CameraSensorLegacy bring-up. imx471_get_selection filled the
> rectangle then fell out of the switch and returned -EINVAL.
>


> Fill every supported target, break, and return 0 after the switch
> (default: -EINVAL), as Kate Hsuan suggested.
This section can be moved to the changes description. We only put
descriptions of fixes or new features in the commit message.

>
> Compute analog crop in set_pad_format: 2x binning, centered in the
> native array, same idea as imx219. IMX471 2x2-binned 1928x1088 then
> reports CROP as 3856x2176 centered in 4672x3512.
>

> Rebased onto media-committers next (4900cad020c0). v2 was against the
> Fedora tree and did not apply here.
And, here can be dropped.

>
> Tested on ThinkPad X9-15 Gen 1 (SONY471A / IPU7), Fedora 44
> kernel 7.1.8-200.fc44.
You can test it against the upstream kernel :)

>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2454119
> Signed-off-by: John Cronin <john.cronin@opcenter.com>
> Signed-off-by: John Cronin <john@stromback.com>

> ---
> v4: add Signed-off-by for john@stromback.com (Gmail From) so
>     media-patchstyle matches the author Patchwork records

Describe the changes of the revisions here.

> v3: rebase on media-committers next
> v2: compute analog crop in set_pad_format; return 0 after switch
>
>  drivers/media/i2c/imx471.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 4053aed84..96d96256d 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -431,6 +431,21 @@ static int imx471_set_pad_format(struct v4l2_subdev =
*sd,
>
>         *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format=
;

>

> +       /* Analog crop: 2x bin, centered in the native array (same idea a=
s imx219). */
> +       {
Drop the brace

> +               struct v4l2_rect *crop;
> +               u8 bin_h, bin_v, binning;
and move the variable declaration to the beginning of the function and
sort them by line length.

> +
> +               crop =3D v4l2_subdev_state_get_crop(sd_state, fmt->pad);
> +               bin_h =3D min_t(u32, IMX471_PIXEL_ARRAY_WIDTH / fmt->form=
at.width, 2);
> +               bin_v =3D min_t(u32, IMX471_PIXEL_ARRAY_HEIGHT / fmt->for=
mat.height, 2);
> +               binning =3D min(bin_h, bin_v);
> +               crop->width =3D fmt->format.width * binning;
> +               crop->height =3D fmt->format.height * binning;
> +               crop->left =3D (IMX471_NATIVE_WIDTH - crop->width) / 2;
> +               crop->top =3D (IMX471_NATIVE_HEIGHT - crop->height) / 2;
> +       }
Drop the brace.

> +
>         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
>                 return 0;
>
> @@ -468,7 +483,7 @@ static int imx471_get_selection(struct v4l2_subdev *s=
d,
>                 sel->r.left =3D 0;
>                 sel->r.width =3D IMX471_NATIVE_WIDTH;
>                 sel->r.height =3D IMX471_NATIVE_HEIGHT;
> -               return 0;
> +               break;
>
>         case V4L2_SEL_TGT_CROP_DEFAULT:
>         case V4L2_SEL_TGT_CROP_BOUNDS:
> @@ -476,10 +491,13 @@ static int imx471_get_selection(struct v4l2_subdev =
*sd,
>                 sel->r.left =3D IMX471_PIXEL_ARRAY_LEFT;
>                 sel->r.width =3D IMX471_PIXEL_ARRAY_WIDTH;
>                 sel->r.height =3D IMX471_PIXEL_ARRAY_HEIGHT;
> -               return 0;
> +               break;
> +
> +       default:
> +               return -EINVAL;
>         }
>
> -       return -EINVAL;
> +       return 0;
>  }
>
>  static int imx471_init_state(struct v4l2_subdev *sd,
> --
> 2.55.0
>

One question. Do you send a new patch using the "git send-email" command?


--=20
BR,
Kate

