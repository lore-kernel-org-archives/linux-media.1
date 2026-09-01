Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AA0275B03
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265849; cv=none; b=Z/6QmYFhBpL/Mm4Tj2TSbuC7/8H5CYYywFS3ojY4Ml1PL9GlAbMnFTAd5Iy2+ShD65UltIzz708Y/TJJzwHedAd7hiANn1JdBy//MGM64QS3QOk6vr3t67sVTwMV4keaaS3JXgZ0kzj4UVv3Si6XvLwAfkPJrq5lHjSdpVC+o48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265849; c=relaxed/simple;
	bh=ablFrbx3pWZLubOJHWZkjzJoyx+zs1jxd1DjapaVHeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fU6l29fwLje/tmo00LgeOUx9bw8kLDCZPlknwqVkxOSZtsVtRlJ92I5pw4G7GZ6sVxiNXFqt2ikbyBxLF+RYsbE1dJPxBQ/xc/FM/HEZoEoJk4jYwkG1WH5nUJZ8NWZyaioXc51PdjTUFfGHMmQiNI28wMP0Wd8DyE3fGlzDucg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eC+7I6zA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eC+7I6zA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2ABC1F00A3F
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788265847;
	bh=0JN41BhaJuCkBZSIQhxEqQn4TCT3m+0Gcon15aT8f1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eC+7I6zAJbOiPGq21XBolp11eF0TFEs1wBiSk2z88ecMFyNxRQFqPJmEnNzaAjJJ+
	 0AFg3bEbo7TqunNQAe1culmR+1xeTJFYvnmD0BmK8TC6pUVtU0jWW7EICk8hvh9FEs
	 BzzPIlWSWXVnmpR1g4+XDUztxVxuYtL49DgTl7pJvEoKF0mn0D8FANFpMJq/OfmtOs
	 wyQ1U3sq9SI2RP1EBH2mGda6zlIizslWu+w9X2jbVGoCK+9noFj2g/BEB+7HwU2oCL
	 PeBN6CDWjZFP3gbd2YpE+U6d8hDkabw/RuJunK5COexYOMyadIsZ6Yd3STpwR288l2
	 jiiOtF5/Cjf+w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so745750e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 05:30:47 -0700 (PDT)
X-Gm-Message-State: AFuF++lMlCnwxXC/I6CQqD+aPv+3PkvBGCV5GjWbBjEkFrfTm9Vyec0p
	8M1w01NctHMeBB3F8UMcqOC1292AkGmyIuy5rmwzPzAhzY070hN9BSmM4vVlXgloCXxHXd1FOte
	FBZIWDMavVoPhctwXkHiBt4kNdDH29zU=
X-Received: by 2002:a05:6512:3d09:b0:5b4:8658:a401 with SMTP id
 2adb3069b0e04-5b5e690c365mr10201963e87.19.1788265846337; Tue, 01 Sep 2026
 05:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-6-sakari.ailus@linux.intel.com> <CAD++jLnruxXqtgm2ckQQhKvuNQvawH0xZpq8ipYSjFLKDbpnyQ@mail.gmail.com>
In-Reply-To: <CAD++jLnruxXqtgm2ckQQhKvuNQvawH0xZpq8ipYSjFLKDbpnyQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 14:30:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLk_XRtBxf2tLk2Eat_yN5K=cdav5YL4yw8ukUW1AOw9Rg@mail.gmail.com>
X-Gm-Features: AcwNN1WwoGDmxROZGACbBzBQyWWZh6qoh63s00v1HqTaBPsEDaBzP2YXXk5HPII
Message-ID: <CAD++jLk_XRtBxf2tLk2Eat_yN5K=cdav5YL4yw8ukUW1AOw9Rg@mail.gmail.com>
Subject: Re: [PATCH v3 05/29] media: v4l2-subdev: Allow allocating frame
 descriptors based on the need
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 3:18=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

[In v4l2_subdev_get_frame_desc()]

> > +               if (desc->num_entries > desc->len_entries) {
> > +                       dev_dbg(sd->dev,
>
> When you get to this check, isn't that after this loop:
>
> for (i =3D 0; i < fd->num_entries; i++) { (...)
>
> so you should check num_entries agains len_entries before this
> loop?
>
> (I might be misreading the patch, maybe I should actually apply
> it and inspect the result.)

I applied the patches to a branch based off v7.3-rc1 and inspected the resu=
lt.

Forget the above confused comment, I was missing the fact that this is
in two different functions.

But! The resulting code looks like this:

if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
    unsigned int type =3D desc->type;

    ret =3D v4l2_subdev_call(sd, pad, get_frame_desc, pad, desc);
    if (ret < 0)
        goto err_free;

(...)

    if (desc->num_entries > desc->len_entries) {
        dev_dbg(sd->dev,
            "too many frame descriptors; got %u, expected at most %u\n",
            desc->num_entries, desc->len_entries);
        ret =3D -EINVAL;
        goto err_free;
    }

    return desc;
}

It seems dangerous to call v4l2_subdev_call() before you have done
the (desc->num_entries > desc->len_entries) check, so maybe move
the check up?

Yours,
Linus Walleij
