Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D693C2787
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 12:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180883; cv=none; b=TJUNrnL4XEi1YbWLoy5gaTN3G9fG3E74C63KL7yK5BKpdxERrBPeW9EJwHU8DfNorOJ7BuyRXyesqxmbN+hLJLT0gbWi50Lr748E44K3zbQPA10defxbIgvADEZL5j+5J0L61IkcJHErrdZeufgOPA8rt7czN/Ayvr55gIEZx6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180883; c=relaxed/simple;
	bh=MeheoHbzpuVixqahJ0orqtZQc6jp2nbrmcerAHTl5BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNNqjQOHdX7ODQncIOlQot/wINkqI2cdaGkkuzhlnOmXymWAEKAsS7L/Ovz7bnVs/NIsW3H5/BxdvNehJ+GA5PSN7w+CoUIiwkQjXf6JF/XsaQu6DA0mjCdKJCDId8bjYm8cY4yKrXcmAa0++LXv/F3xAl1sp5tfp1s6Ee0VzbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSatNN3N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSatNN3N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941931F00A3E
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788180882;
	bh=3t4DkvBbTHGO/5M4F9OgrJAsjQBWLFUDFMAHDCqeKr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BSatNN3NusSqYRoYyM7k+oqPCrlozr6nWHSciOoWi79KFt1f8XI1v4/LnvaUC9u+f
	 Lwqb5vN6Ow0JY7zsGHk/RPCmmViB5IHwkHDv8mXudMZJ+/PPrYbRJkkoPD0oN022/f
	 ejKm7XvRofjRyA5RdbkqchmQ2UW4cjYK+aycV7TzBsQFC9NT6dsjA1Gf1LZtkWEvFD
	 WXwOzrTiZNRGE6EjrK1DsPnvv2eARRMLWthNf3FGxsCPvJl+fhmfVemWN4HfGfweiF
	 0Lr4THnpEJf0u6C8OcA2MvcWdWGlVTVf3wn0sWAxKrylfRIQxvh01kGO8Cb/jhkN1Y
	 /CQ/EFex5Mztg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a33307ecd9so6554581fa.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 05:54:42 -0700 (PDT)
X-Gm-Message-State: AFuF++md1XyAex574TzhgN93TgQ7iGWhwZLPCYqGpF/i95v/Ng5hNlhC
	IU5hGFeYRAQnyQ28KOv8kKKz9yVdbn974ifHJCCcscvDJEzDE+PaP9GWNdIvdNfFkPVfwDnvSJY
	GEW4xcUD85Lj5Lejlo6GKjtWgkU+63BU=
X-Received: by 2002:a05:651c:3056:b0:3a3:a3:3560 with SMTP id
 38308e7fff4ca-3a301b1b926mr49356091fa.6.1788180881329; Mon, 31 Aug 2026
 05:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-5-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-5-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 14:54:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLm5FLD9DHzuThWZJRKi6_wj28_UUFqSbmpt1cO--tCyOA@mail.gmail.com>
X-Gm-Features: AcwNN1WhM8aZX0zgzbHtAWYKooHPawC7CFAt3x34zBAydVHMpQOVvsN-mn-hqVw
Message-ID: <CAD++jLm5FLD9DHzuThWZJRKi6_wj28_UUFqSbmpt1cO--tCyOA@mail.gmail.com>
Subject: Re: [PATCH v3 04/29] media: v4l2-subdev: Allow releasing frame
 descriptors on return
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

thanks for your patch!

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Use DEFINE_FREE() to allow using __free() to release frame descriptors
> using v4l2_subdev_free_frame_desc().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Clever with guards, I like it!

Should #include <linux/cleanup.h> be in this patch? I think I saw
it in some other patch, or was it there already?


> @@ -1798,6 +1798,11 @@ int v4l2_subdev_get_frame_desc_passthrough(struct =
v4l2_subdev *sd,
>   * for each frame descriptor obtained by calling this function using
>   * v4l2_subdev_free_frame_desc().
>   *
> + * Use __free() to release the frame descriptor automatically::
> + *
> + *    struct v4l2_mbus_frame_desc *desc __free(v4l2_subdev_free_frame_de=
sc) =3D
> + *            v4l2_subdev_get_frame_desc(sd, pad, desc);

the third argument to v4l2_subdev_get_frame_desc() from patch 3
is "type" , the desc is what you return right?

+/- these nitpicks (the code looks right):
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
