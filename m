Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6676850EBEB
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792418982; cv=pass; b=nrlapu7EhrQ35trWQJWxYobUEUgQB4xCAjSM9kV9LHEsTTDz9yKgaJVG5C1fKLn3mepYf0NnSHoK9tTGAwaN/RHoqoN6qMvYJ0RsxMBntt/Afpq+q19fEqAyPzVAIcfRkZ+66dvCZgisovfHpUmZjEM8jeocw41D9pFLd3PtBdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792418982; c=relaxed/simple;
	bh=69YmwAWS3dZ9In6kSWSUcs0wnTKNpoRN15/7jRzhzV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpEqaSbTG5+AKgMfm234eVm7FbtbbyP6ug58W5jho2KhMNfUqiGcUpoaKy18KzNZFCg6u2dCpm52pPvhjZDFDuRi8ZLWbf5eorO82crhtLVxjWvMMbzBwkASIduFXMw1ryEMouRRDT5F4m2BRjIa00z/bS1wm+KfJm+bYp8f2uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fm6varGy; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="fm6varGy"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53ec9237600so705210b6e.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792418978; cv=none;
        d=google.com; s=arc-20260327;
        b=LTH1kAwGesrL0ihmagYEoJqJ2Ci7Xyn/P+u5BdCvvmxoTIy+PzTW7rkqOys6l/wN7g
         0KhqH3dw4/sIdEipJc60J6IIUuTOc8mBOLabuk09DxAw60fG3fdchAsdRo0GrhDe+vqD
         ehoSBZSKabDs7LUptdElqONVfn48GKGcVrhNqUG3hSiezRcmI/sZOG55PkNvvZmMMha0
         n6dQPGd5lMq+X/LA/ebOIp/CNsfOUG7R2jQgmmJol4RmTBb56lsdC7lCo8LUWerwv1ar
         tl1UJeQ5sHS7zNyWxZh2zb7wgdinY+Za8M2H+Y0jiIVOCc4sOQB/zoUzDE4OMJ0vyWbn
         K2EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uzPbkn9TvysYoTYtHl26oKGkVeNYy29t/Y60wQicXoI=;
        fh=gOVbyv0EnCKe7X3C7lWut/qM8/Rcfjd9l1HiZhpGMVM=;
        b=cy+Szyfj+wUdfAja7rhcQBrAN6IcU1yYFvQhb/1xVBBO2tOZ4kYwAgH0YEYnHyMZ2e
         w/fzYFEz9hsBR1ACK8V8e9gZQxXsinLNJevSY+TK82usFECSeaKKAxPllHywvxZ/NBdc
         zw4Oi6aCzFpehSfqy2QIt8YgfYjYE9dd1v3JRkFMqzSFgKFvHN5GlnLo18iy0NTf4qPZ
         yxINbNIK2I8bfoRe0BqVq0NYRGwK8OQpTrAJL10YJ4cCKUjbDg21TOHf1buD7RNaEwQ0
         zxbITLF3n0BGEjkkZ2xW56ok12U5A3WKr0nWk7aGwwTKX8NStrjE15sOa1MHHxQvO1De
         2/eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792418978; x=1793023778; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uzPbkn9TvysYoTYtHl26oKGkVeNYy29t/Y60wQicXoI=;
        b=fm6varGyA+zT2gRAnnPW8nBLqEM9mlQESjmGewpD1Fh8C+PmkoilhpLwgfvz6a0/qL
         G8GopvG6J2QNaIcW4EFzCrLMKoaxMyslz9N9VlhDieKBuvcbt73Sku2JGle2tzi0JXmY
         cJJkLtUaUJTxxhfFORFkqleuo8JiqmbRo5hWkBelupeXOllbjb0azOCi283bEQWjXgMP
         jShb/ScA5HUnThFuQi5fv5mGGwHhmY13rhRTu/NgYIV3CPz8NVI/PpFYEpG2NuR0b5Nb
         oNjq+clLx6E/MSlFo4LpeemHWjlx0BT3VGhqAVGLWes/ICLfDFWaqYw16amMy6mMZwBH
         ymSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792418978; x=1793023778;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzPbkn9TvysYoTYtHl26oKGkVeNYy29t/Y60wQicXoI=;
        b=Va6DnG+bft1nsuX2/ymjE9vm/NeSe/Yxg7xmVLKGzrAnil8UiVKgOuEI9bSu3A16Ft
         DJnTWPamJP1PEbmDKjhGvzs0jVJo7keXGEUxpVQ4m9btMsDykhQRypKO6Do6SaS9kU/0
         N+9gOvpJJVY4efsRP9SosESSaNBArUDCtgqeMEY1ebgZ96KTCCF4y9HSgGvtKR8+yHHk
         l9SBfTCZj5hCI0LXaVB1aejdeh8cnQ7bqSCVtCCPhF3nPP5aWpRMNg09v/RaNWgk5pd7
         nczhhVbkfi/hX/v65elJG4ITB2hpeChgOsNQCiNl5iE9MX1jhK6Us6RrouU+OW6ajkRL
         XDGg==
X-Forwarded-Encrypted: i=1; AKwUvByQDrUzwJTEufO5s64ye0mQnSuWCxmV82kE4ZFlwx2tP4WPO2bz0GXDPfrpxZa9qvddF2g+ak2r91g2vw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI/vB41+eQx/V/khg9ce/tqFb57q9wiEK0lb86rLcqKK0NQzuA3
	tN48V3ob1ULvYpv95AiXNDwxNSqZPRICORJllldyJ6CqBik6dHdebdslshWLFjSr5AfXRM0sl+M
	Oknnv9BOiIN+0YXK1VlhNVUHYUgqAzLBJ+QGHaRex+g==
X-Gm-Gg: AYBFou2gaTs0wr9TNHHTDFmg6mRxVTc5JTCR5W7qJTi/IR6j0UqiUeyy3A3k1ZCoIuZ
	TlNLRZRL20tfFOzEXxQbHyaxCxIIrQan2+yxupq8/0T+Uz59jNsy/b1GlZI0+Ak0ASH9QYt/Fcx
	TOE7dsEF75Q4+CKdnkFvdU5hGOJuZUoI7b/AWLWrirD1gO386jdDu9MsE9vnMM7Xok7cY41sKCa
	veNWauQEA9jwklIc32rUcaOicN3YHeg+3uWw6FLkB6s5/t2D0izkJEwzrxCN5apGHbmp2AnMII4
	YddThmlYnl723VIACD9r/IaDsQlqzdvKeArPtJFD+UyImZNkwd/g7OSvqSwLu4ljP0cxGJ4pXjl
	WEa2yiffZkDTCwZ+TSDuXBnMQikWW378wfV9aRTTBEPQBym9ffVHsGYeZC964BFvG18qJRbeYjK
	zIyYfFQX8=
X-Received: by 2002:a05:6808:4897:10b0:549:572c:fd42 with SMTP id
 5614622812f47-549572cff69mr961942b6e.47.1792418977994; Mon, 19 Oct 2026
 07:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018-fix-imx415-vblank-exposure-sync-20261018-v1-1-920383f39185@gmail.com>
In-Reply-To: <20261018-fix-imx415-vblank-exposure-sync-20261018-v1-1-920383f39185@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:09:21 +0100
X-Gm-Features: AclHuK-AIGbRFr9yg6IaZgg6GA0B3HqMS5PH9s9AyZ2TVN_nbGVs-YRnZhIMIdg
Message-ID: <CAPY8ntCz3nhefn8EwF_Ezh=vKmTWWVLYOnuAFoW2aBq6Wjidiw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx415: Use target vblank to calculate vmax
 in s_ctrl
To: berringtoni36@gmail.com
Cc: Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Oct 2026 at 13:54, Wenqiang Zhao via B4 Relay
<devnull+berringtoni36.gmail.com@kernel.org> wrote:
>
> From: Wenqiang Zhao <berringtoni36@gmail.com>
>
> When setting V4L2_CID_VBLANK, imx415_s_ctrl() writes the new frame length
> (format->height + ctrl->val) to the IMX415_VMAX register, and then falls
> through to case V4L2_CID_EXPOSURE to update the electronic shutter register
> (IMX415_SHR0 = vmax - exposure) so that exposure is preserved across frame
> rate changes.
>
> However, in case V4L2_CID_EXPOSURE, vmax is calculated as:
>     vmax = format->height + sensor->vblank->cur.val;
>
> Within the V4L2 control framework, sensor->vblank->cur.val holds the
> committed old vertical blanking value, which is not updated to the new
> value until s_ctrl() returns 0. Consequently, when VBLANK changes, vmax
> is calculated from the stale vblank value:
> - If VBLANK increases, SHR0 is computed using the smaller old VMAX, causing
>   the actual hardware exposure (VMAX - SHR0) to jump by the blanking delta.
> - If VBLANK decreases, SHR0 is computed using the larger old VMAX, causing
>   the actual hardware exposure to drop by the blanking delta.
> - Additionally, ctrl->val is clamped against the stale vmax limit.
>
> Fix this by using sensor->vblank->val instead of sensor->vblank->cur.val,
> which holds the target vertical blanking value currently being applied.
> When setting V4L2_CID_EXPOSURE directly, sensor->vblank->val equals the
> current vblank, keeping behavior unchanged.
>
> Fixes: 3bcae55ab96a ("media: i2c: imx415: Add read/write control of VBLANK")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wenqiang Zhao <berringtoni36@gmail.com>

Thanks for the patch.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx415.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index c3b22b238..e5aa741fc 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -729,7 +729,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>                 fallthrough;
>         case V4L2_CID_EXPOSURE:
>                 /* clamp the exposure value to VMAX. */
> -               vmax = format->height + sensor->vblank->cur.val;
> +               vmax = format->height + sensor->vblank->val;
>                 ctrl->val = min_t(int, ctrl->val, vmax);
>                 ret = cci_write(sensor->regmap, IMX415_SHR0,
>                                 vmax - ctrl->val, NULL);
>
> ---
> base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
> change-id: 20261018-fix-imx415-vblank-exposure-sync-20261018-967b008cf3fb
>
> Best regards,
> --
> Wenqiang Zhao <berringtoni36@gmail.com>
>
>
