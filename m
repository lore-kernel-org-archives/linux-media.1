Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E70155757
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 05:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327888; cv=none; b=PLs58As/xGyX7C3Tnos+bsp5lfnYOxNkCLOBzeDxq8gTp8uBNfoJX5Iw9rwDaR9cdiBdEKKgeqZ3oXm5kEPoKQItNopCI3oWgOeN+0QgfIMuZCidyA256phjKmkZ8Y8uXhbEDEyV7RUMjs68Zoh8XMFsDwAKwSdwojHe0QfWioE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327888; c=relaxed/simple;
	bh=OYbGRByvH7VtPl2ilc7TiNyUJ0NMZgBKoi/Kk9r43fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=co8ietyBOivFpTwbvR7sfKR0vZ30UUP/41493slfWv8k2Q/Pl7huqDe168JbVtZK1Sk2AEG10Wny5DCUg1BLp8SW+8JUiHQxbfSk9y13/J3USNEJMqBt0+Mc0XqHR0yddS27eAbPQ2yfbDWGHzb5gAeRSCLutojL+r1QfkeSCQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wx2B2Fnc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wx2B2Fnc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A923B1F000E9
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 05:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788327886;
	bh=i5woAfz6igg7UznvDB65lhDYbgu9B2hyuAWFvgh4+Bs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Wx2B2Fnc616SB5AYKExFEf5Nqbk71JM2R8sJbqgz1CJQcs5I2kKxppne/vndJ8nK8
	 tz83/CmI/UJoKu/vfwXU4ny8fnoLk5tWoh/7wPtFGwzyS2fBonaMia5VvgSHZzWh3U
	 zsEW/HYO9CsKhJFjqxhLBIqE3zU4PkiABFtKXEKTp07US0v4d/HehU/5tTE7dncmup
	 l9JXsroR9VC6kjQWU4/bK1o/oD35ZZt2AsTIu3w0G9W7M3wskV14aia/4nnDdc6iiU
	 wBHXyFVGtHe5ujiRX2GMqdQZiy4a8mLtxxOnZz6BGsIui0DGeKy9CpJXHC6eBwinRJ
	 upDLOMUa48OPQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b159850b16so563786e87.3
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 22:44:46 -0700 (PDT)
X-Gm-Message-State: AFuF++lS0E76vGnEXK9ra2pj1k1yO52PoGNL9zQNPqYaacCNIOmIjKH0
	hGd2D6mAFwiAMrJRu8fqjNp3hjW54qPhAtzx0x6lS9nQDKUh/jrcVfurR6hNE2lMyo/MjHSMJDU
	geegxKL5uMEIHuHqniQaNSrAYEyxRtbw=
X-Received: by 2002:a05:6512:ba4:b0:5b4:7795:8abb with SMTP id
 2adb3069b0e04-5b608333515mr865955e87.7.1788327885334; Tue, 01 Sep 2026
 22:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-16-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-16-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 2 Sep 2026 07:44:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnQzEoo46orVAHtoTDxXmQqsVkD1B55GUuua6drePZUbQ@mail.gmail.com>
X-Gm-Features: AcwNN1WaGhFIPe_xPyJvNymhiDPD0WRe4Oyvmla0MxtepWIMFXjpHWpXtQv5Js0
Message-ID: <CAD++jLnQzEoo46orVAHtoTDxXmQqsVkD1B55GUuua6drePZUbQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/29] media: v4l2-subdev: Return dynamically allocated
 pass-through routes
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

On Mon, Aug 24, 2026 at 2:15=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Count the number of pass-through routes, allocate memory and then return
> the full table to the caller.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
(...)
> +       if (num_entries > V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> +               fd->entry =3D kzalloc_objs(*fd->entry, num_entries, GFP_K=
ERNEL);

So if it's more entries than the preallocated ones we kzalloc_ new ones.

And from this point in the code we want to clean up:

> +                                       goto err_free;
(...)
> +err_free:
> +       kfree(fd->entry);

But what happens if the preallocated descs are enough?

Then you just kfree():ed the preallocated entries, which are
stored in the same pointer.

Yours,
Linus Walleij
