Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA29221FBD
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 01:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538314; cv=none; b=pXaAbeRwmrIJtoe0nWI8Z84wgeYk+Qp2Dccm4eYU9KrRW0pEwsWOcp5pGwcwpO41tANYgXPHYr2jNw6OgjJxJ9A7AY1J5gAZRGr+Dd3RmVhgOKQckdrcLL0JWwc3KSwO+TbpbZ/BAi8dkatWvfcXyO3KL08MEPJ5kZDrXDnQtts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538314; c=relaxed/simple;
	bh=9TR28VCfZFaVChgmke1f/Jcl82snf9NAO7/4lHvRwng=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tnSzh7vVVFKTWD96MWniqGMpakuRf7qZ+QagGELVH8EePFrErUUfgwxy40gBFHAlwEDNugyN1h9U0IMHhd1IOrXu9V39UFwqDU2dI/7Le9IQQ7O0tphFIdo6GlyDRDLF4UMnCNsibqUvc5iqq8zpyelqHMsGoAcvVlvRyRJTnx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gG2hfZEb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gG2hfZEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264711F00893;
	Thu,  4 Jun 2026 01:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780538313;
	bh=+RTy1iZL0Yd7YYom1/VV0UprvTLdGpCsVfijVVj8TO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gG2hfZEbTT1xSbPKGY6Ixb3qWrdjxmPCs7TdvAsrbU1pBXNrj+w8x0P3nDk1Vq+lW
	 BRdcx8SIp/bofJEUhZvNTWtVO56Fdi0bKe96Si9L7+I0Eab2QcLRI1yfiz7MAM52au
	 mFH/Mlw1tXkk2348hBzySmBQzON+nmyswsA/y0q4X5UQgF6M9+Jw2lWhQm1sVwZDta
	 6+zcKdp/bsdjx9Gqg2ugim36FIESCfdTyL07/fTpOVbgV/rlsS8kJ+NHPFDLNFpFXS
	 DodeWuSmYZEMG6okrWbKIXCFoKux8+4WSaphKh2Ap7SgzliIlAddZ1gNdS6LB9xO9e
	 To9ATaeaMxXUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: usb: pvrusb2: fix slab-use-after-free in
 pvr2_v4l2_dev_init
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-media@vger.kernel.org
In-Reply-To: <tencent_B85DFB2210B877A85021C1BC064E70E61C09@qq.com>
References: <tencent_B85DFB2210B877A85021C1BC064E70E61C09@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 01:58:32 +0000
Message-Id: <20260604015833.264711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix: Use-After-Free on video_register_device error path.
- [Medium] Memory leak when video_register_device fails early.
--

commit e9309ec9cc3bd0c7e640b415aa2e2d4a14232789
Author: Pei Xiao <xiaopei01@kylinos.cn>

media: usb: pvrusb2: fix slab-use-after-free in pvr2_v4l2_dev_init

This commit removes a redundant second video_register_device() call to
prevent a slab-use-after-free when the first registration attempt fails.

Link: https://lore.kernel.org/lkml/6C2D160B-37DD-40F0-B8A2-089B8CAACB58@gma=
il.com/

> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb=
/pvrusb2/pvrusb2-v4l2.c
> index 101b2e9fbaab7..f9df813ca09b7 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
> @@ -1215,13 +1215,10 @@ static void pvr2_v4l2_dev_init(struct pvr2_v4l2_d=
ev *dip,
>  		mindevnum =3D nr_ptr[unit_number];
>  	}
>  	pvr2_hdw_set_v4l2_dev(hdw, &dip->devbase);
> -	if ((video_register_device(&dip->devbase,
> -				   dip->v4l_type, mindevnum) < 0) &&
> -	    (video_register_device(&dip->devbase,
> -				   dip->v4l_type, -1) < 0)) {
> +	if (video_register_device(&dip->devbase,
> +				   dip->v4l_type, mindevnum) < 0)
>  		pr_err(KBUILD_MODNAME
>  			": Failed to register pvrusb2 v4l device\n");

[Severity: High]
This is a pre-existing issue, but does execution fall through here if
video_register_device() fails?

If video_register_device() fails during device_register(), the V4L2 core
drops the device reference via put_device(). This triggers the driver's
pvr2_video_device_release() callback, freeing the dip structure.

Since there is no early return on error, execution continues and immediately
dereferences the freed dip object in the following pr_info() call and in
pvr2_hdw_v4l_store_minor_number().

Additionally, since pvr2_v4l2_dev_init() returns void, the caller
pvr2_v4l2_create() assumes success and retains the dangling pointer:

drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:pvr2_v4l2_create() {
    ...
    vp->dev_video =3D kzalloc_obj(*vp->dev_video);
    if (!vp->dev_video) goto fail;
    pvr2_v4l2_dev_init(vp->dev_video, vp, VFL_TYPE_VIDEO);
    ...
}

This leads to a secondary use-after-free when pvr2_v4l2_dev_destroy() acces=
ses
vp->dev_video during device teardown.

Could we add an early return after logging the error?

[Severity: Medium]
This is also a pre-existing issue, but what happens if
video_register_device() fails early before device_register() is called?

In an early failure case (such as if cdev_alloc fails), the V4L2 core retur=
ns
an error without calling put_device(), meaning the dip structure is not fre=
ed
by the core.

Because pvr2_v4l2_dev_init() lacks error handling and falls through, it does
not explicitly free dip, and vp->dev_video retains the valid but unregister=
ed
pointer.

During teardown, pvr2_v4l2_dev_destroy() passes this pointer to
video_unregister_device(), which checks if the device is registered:

drivers/media/v4l2-core/v4l2-dev.c:video_unregister_device() {
    ...
    /* Check if vdev was ever registered at all */
    if (!vdev || !video_is_registered(vdev))
        return;
    ...
}

Since the flag was never set, video_unregister_device() returns immediately
without unregistering or dropping the reference. Thus,
pvr2_video_device_release() is never invoked, permanently leaking the dip
memory allocation.

Would explicitly freeing the dip structure on early failure resolve this me=
mory
leak?

> =20
>  	pr_info("pvrusb2: registered device %s [%s]\n",
>  	       video_device_node_name(&dip->devbase),
>  	       pvr2_config_get_name(dip->config));
> =20
>  	pvr2_hdw_v4l_store_minor_number(hdw,
>  					dip->minor_type,dip->devbase.minor);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_B85DFB2210B=
877A85021C1BC064E70E61C09@qq.com?part=3D1
