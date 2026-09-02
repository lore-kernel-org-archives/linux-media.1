Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCD5409279
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341674; cv=none; b=s89cOb6gZt7bjmdVYSz/IcRTm0UzjuSAnUjzR1OfC2rl0NsInaGbwBe1wvOJD8APH9NU1yEm053iHYXDZ0FYZzTP9FnnaIJqCcVHx/udAKEkPfIzyLkNiG9cs3JCre52cPTbCbToZut/pz4vO3WbCXAkyqfFCILQkdV6Nyl5kBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341674; c=relaxed/simple;
	bh=Km9RJr7LCoWTV8rSZOKFaphqPtvKU6GfDusEMdCrPgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zu0ySEZcURTmWcCYbo/eaeXNobFryUJMbyi68HAnDwAxpGhRlwJF66PQeLMI6Cpbud0FcCrUwloZ5ew6KzPRjsRo0HQ43ibboP6Gcx8ZMsPxQxVlvO0/sz/YqMy2dbbch3qCAbi2ZLEW+W9e7J7vw7rwcRBgDKyofoJel1hCA9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvginRag; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvginRag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601531F00AC4
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341673;
	bh=czZ/KgcDjqid2x00fkoFTg0IHRzwqGS79Wt6tZDlWPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TvginRagWaWxMwiAKZhfpoan8lEzMiGwTm01pQEG7mdknxO6iLf+Ag+iT9RMz6E7T
	 VCaHvy4pVQw5Z69qThD+tZbY414SuL0vzBFA8noJNo/XTMglG88aplWhSKF3jX5G3n
	 QODAsA04fL0rkHKMLrvM/hSeOxJjsCHse7a0leRFPS81tVrHnj38jiHHxgVf5h1fq+
	 iJ7JVIf71HXnFGl9ThX72Wx8CdZP7YeRIz+bijhOtYCLPDQaxqVPWQ1fqyWUgKY5qP
	 RNeb9pe9MeNlgn5l3kPWT/Yk/xG4uqxsCuDDNi22q2UB6Y/MdiEJZwsINBqLMWXsbU
	 I8vqu8JP8ZmKw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so702203e87.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 02:34:33 -0700 (PDT)
X-Gm-Message-State: AFuF++mjKNUCNMaNpqx+3k+EbaLaPW7myX2i73cRR7aP+Nnbm+qJwuFM
	mqJ57R/UVakv78ixUgwz2Pm2Jzwy9ydZWhf8f/zpnqGtbRi7ftTNRjJF89fXDIGxojCuazsWhvz
	wBrFI2qr5EIpUXsdceEcBB6SgbiuvRUU=
X-Received: by 2002:ac2:51cc:0:b0:5b0:1516:8799 with SMTP id
 2adb3069b0e04-5b60869463bmr1237326e87.17.1788341672060; Wed, 02 Sep 2026
 02:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-16-sakari.ailus@linux.intel.com> <CAD++jLnQzEoo46orVAHtoTDxXmQqsVkD1B55GUuua6drePZUbQ@mail.gmail.com>
In-Reply-To: <CAD++jLnQzEoo46orVAHtoTDxXmQqsVkD1B55GUuua6drePZUbQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 2 Sep 2026 11:34:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLkaN01pneNKjhd5mxCqBJ3n8fYM7oYBwt_Ci94kM=3P4A@mail.gmail.com>
X-Gm-Features: AcwNN1VhvCXE61Sp0asTZVU1TuK-luQeSD3lBmKDQBEg4vETMGnB9brWlrW8yW4
Message-ID: <CAD++jLkaN01pneNKjhd5mxCqBJ3n8fYM7oYBwt_Ci94kM=3P4A@mail.gmail.com>
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

one more thing!

On Wed, Sep 2, 2026 at 7:44=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:

> > +       if (num_entries > V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> > +               fd->entry =3D kzalloc_objs(*fd->entry, num_entries, GFP=
_KERNEL);
>
> So if it's more entries than the preallocated ones we kzalloc_ new ones.

If we do allocate some more dynamic descriptors here, and do not
free them at err_free, where are they actually kfree():ed?

I just can't follow that part, maybe I'm just missing details in the
other parts of the patch series.

Yours,
Linus Walleij
